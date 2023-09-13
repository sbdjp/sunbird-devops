from pyspark.sql.types import *
from pyspark.sql import functions as F
import configparser
import os
import csv
import json
import pandas as pd
import requests
import glob
import gspread
from oauth2client.service_account import ServiceAccountCredentials
from pyspark.sql import SparkSession
from datetime import timedelta, date





configuartion_path = os.getcwd() + "/config/config.ini"
print(configuartion_path)
config = configparser.ConfigParser()
config.read(configuartion_path);

today = date.today()
Date = today.strftime("%Y-%m-%d");

yesterday = today - timedelta(days=1)
print(yesterday)

start_date = f"{yesterday}"
end_date = f"{date.today()}"
start_date = start_date + " 00:00:00"
end_date = end_date + " 00:00:00"

# Adding quotes to dates to make it query usable stuff

quoted_start_date = f"'{start_date}'"
quoted_end_date = f"'{end_date}'"

print(quoted_start_date)


uniq_tele_bucket_path = config['Bucket_Path']['unique_bucket'] + "{}-*".format(yesterday)
denorm_tele_bucket_path = config['Bucket_Path']['denorm_bucket'] + "{}-*".format(yesterday)
uniq_summary = config['Bucket_Path']['unique_summary'] + "{}-*".format(yesterday)
denorm_summary = config['Bucket_Path']['denorm_summary'] + "{}-*".format(yesterday)
raw_tele_bucket_path = config['Bucket_Path']['raw_bucket'] + "{}-*".format(yesterday)
ingestion_tele_bucket = config['Bucket_Path']['ingestion_bucket'] + "{}-*".format(yesterday)

spark = SparkSession.builder.appName("flink_audit").master("local[*]").getOrCreate();
spark.conf.set("fs.azure.sas.telemetry-data-store.dikshaprodprivate.blob.core.windows.net",
               "{{SAS_TOKEN_TO_REPLACE}}");

# Schema for summary and raw data

ingestion_schema = StructType().add("params", StructType().add("msgid", StringType())) \
    .add("events", ArrayType(StructType().add("mid", StringType()).add("eid", StringType())))

raw_schema = StructType().add('eid', StringType()).add('mid', StringType())


def telemetry_events_syncts(df_denorm):
    # Header details for POST request
    headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer {{JWT_TOKEN}}'
    }
    # Number of devices who reached on onboarding
    query_str = '''SELECT COUNT(DISTINCT "mid")  AS "Output" FROM "druid"."telemetry-events-syncts" WHERE  "__time">=''' + quoted_start_date + '''AND "__time"<''' + quoted_end_date;
    data = {"query": query_str}
    jsondata = json.dumps(data);

    # Fetching data from Druid using POST request
    try:
        response = requests.post('http://11.4.3.41:8082/druid/v2/sql', headers=headers, data=jsondata)
        x = response.json();
        if (len(x) != 0):
            df_pandas = pd.DataFrame(x);
            df_pandas['Date'] = yesterday;
            df_denorm = df_denorm[['Date', 'Output']];
            df_denorm.columns = ['Date', 'Input']
            df_join = df_pandas.merge(df_denorm, on=['Date'], how='inner');
            df_join['Metric'] = 'RAW DRUID'
            return df_join
    except Exception as e:
        print(e);


def summary_events(df_denorm):
    # Header details for POST request
    headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer {{JWT_TOKEN}}'
    }
    # Number of devices who reached on onboarding
    query_str = '''SELECT COUNT(DISTINCT "mid")  AS "Output" FROM "druid"."summary-events" WHERE  "__time">=''' + quoted_start_date + '''AND "__time"<''' + quoted_end_date;
    data = {"query": query_str}
    jsondata = json.dumps(data);

    # Fetching data from Druid using POST request
    try:
        response = requests.post('http://11.4.3.41:8082/druid/v2/sql', headers=headers, data=jsondata)
        x = response.json();
        if (len(x) != 0):
            df_pandas = pd.DataFrame(x);
            df_pandas['Date'] = yesterday;
            df_denorm = df_denorm[['Date', 'Output']];
            df_denorm.columns = ['Date', 'Input']
            df_join = df_pandas.merge(df_denorm, on=['Date'], how='inner');
            df_join['Metric'] = 'SUMMARY DRUID'
            return df_join
    except Exception as e:
        print(e);


def adhoc_analysis():
    ############################## EXTRACTOR ######################################################

    df_ingestion = spark.read.json(ingestion_tele_bucket, schema=ingestion_schema)
    df_ingestion = df_ingestion.withColumn('Date', F.lit(yesterday))
    df_ingestion = df_ingestion.filter(df_ingestion['params']['msgid'].isNotNull()).distinct();
    df_ingestion = df_ingestion.withColumn('explod_event', F.explode(F.col('events')))
    df_ingestion = df_ingestion.filter(df_ingestion['explod_event']['eid'] != 'LOG');

    df_raw = spark.read.json(raw_tele_bucket_path, schema=raw_schema).select("mid", "eid")
    df_raw = df_raw.filter(df_raw['eid'] != 'LOG').select('mid').distinct()
    df_raw = df_raw.withColumn('Date', F.lit(yesterday));

    df_ingestion_agg = df_ingestion.groupBy('Date').agg(F.count("explod_event.mid").alias("Input")).toPandas();
    df_raw_agg = df_raw.groupBy('Date').agg(F.count("mid").alias("Output")).toPandas();

    df_extractor_merge = df_raw_agg.merge(df_ingestion_agg, on=['Date'], how='inner');
    df_extractor_merge['Metric'] = 'EXTRACTOR';
    df_extractor_merge = df_extractor_merge[['Date', 'Input', 'Output', 'Metric']]

    print(df_extractor_merge)
    ##########################################  PREPROCESSOR  ##################################################################

    df_uniq_raw = spark.read.json(path=uniq_tele_bucket_path, schema=raw_schema).select("mid", "eid")
    df_uniq_raw = df_uniq_raw.filter(df_uniq_raw['eid'] != 'SHARE_ITEM').select('mid').distinct()
    df_uniq_raw = df_uniq_raw.withColumn('Date', F.lit(yesterday));

    df_raw2_agg = df_raw.groupBy('Date').agg(F.count("mid").alias("Input")).toPandas();
    df_uniq_raw_agg = df_uniq_raw.groupBy('Date').agg(F.count("mid").alias("Output")).toPandas();

    df_preprocessor_merge = df_raw2_agg.merge(df_uniq_raw_agg, on=['Date'], how='inner');
    df_preprocessor_merge['Metric'] = 'PREPROCESSOR';
    df_preprocessor_merge = df_preprocessor_merge[['Date', 'Input', 'Output', 'Metric']]

    print(df_preprocessor_merge)

    ##########################################    RAW DENORM	 #############################################################

    df_uniq2_raw = spark.read.json(path=uniq_tele_bucket_path, schema=raw_schema).select("mid").distinct()
    df_uniq2_raw = df_uniq2_raw.withColumn('Date', F.lit(yesterday));

    df_denorm = spark.read.json(path=denorm_tele_bucket_path, schema=raw_schema).select("mid").distinct();
    df_denorm = df_denorm.withColumn('Date', F.lit(yesterday));

    df_uniq2_raw_agg = df_uniq2_raw.groupBy('Date').agg(F.count("mid").alias("Input")).toPandas();
    df_denorm_agg = df_denorm.groupBy('Date').agg(F.count("mid").alias("Output")).toPandas();

    df_raw_denorm = df_uniq2_raw_agg.merge(df_denorm_agg, on=['Date'], how='inner');
    df_raw_denorm['Metric'] = 'RAW DENORM';
    df_raw_denorm = df_raw_denorm[['Date', 'Input', 'Output', 'Metric']]

    print(df_raw_denorm)
    ############################################  SUMMARY DENORM  ##################################################

    df_raw_summary = spark.read.json(path=uniq_summary).select("mid").distinct();
    df_raw_summary = df_raw_summary.withColumn('Date', F.lit(yesterday));

    df_denorm_summary = spark.read.json(path=denorm_summary).select("mid").distinct();
    df_denorm_summary = df_denorm_summary.withColumn('Date', F.lit(yesterday));

    df_raw_summary_agg = df_raw_summary.groupBy('Date').agg(F.count("mid").alias("Input")).toPandas();
    df_denorm_summary_agg = df_denorm_summary.groupBy('Date').agg(F.count("mid").alias("Output")).toPandas();

    df_summary_denorm = df_raw_summary_agg.merge(df_denorm_summary_agg, on=['Date'], how='inner');
    df_summary_denorm['Metric'] = 'SUMMARY DENORM';
    df_summary_denorm = df_summary_denorm[['Date', 'Input', 'Output', 'Metric']]

    print(df_summary_denorm)
    #############################################   RAW DRUID   ########################################################

    df_raw_druid = telemetry_events_syncts(df_denorm_agg);
    df_raw_druid = df_raw_druid[['Date', 'Input', 'Output', 'Metric']]

    df_summary_druid = summary_events(df_denorm_summary_agg)
    df_summary_druid = df_summary_druid[['Date', 'Input', 'Output', 'Metric']]

    print(df_extractor_merge)
    print(df_preprocessor_merge)
    print(df_raw_denorm)
    print(df_summary_denorm)
    print(df_raw_druid)
    print(df_summary_druid)

    li = [df_extractor_merge, df_preprocessor_merge, df_raw_denorm, df_summary_denorm, df_raw_druid, df_summary_druid];
    frame = pd.concat(li, axis=0, ignore_index=True);

    print(frame)

    frame.to_csv('/mount/data/analytics/scripts/flink_audit/flink_audit_'+Date+'.csv', index=0)


    my_list = frame.values.tolist()
    columns_list = frame.columns.tolist()
    print(my_list)
    print(columns_list)

    base_dir = '/mount/data/analytics/scripts/flink_audit/flink_audit_'+Date+'.csv'
    path = glob.glob(base_dir)
    tab_name = "Result-"+Date

    try:
        SCOPES = ['https://www.googleapis.com/auth/spreadsheets', 'https://www.googleapis.com/auth/drive',
                  'https://spreadsheets.google.com/feeds']

        creds = ServiceAccountCredentials.from_json_keyfile_name('/mount/data/analytics/scripts/flink_audit/client_secrete.json', SCOPES)
        client = gspread.authorize(creds)
        spreadsheetId = '1r22kWoqxMhL5Fy-lmRutuw1I4fG8J4cxZqqRuA4MrOM'  # Please set spreadsheet ID.
        # spreadhseetId = '1Udu74Y5i05ZDnftkWV1D-o1n87_usZRIZzYRlYy1Aco'
        sheetName = tab_name  # Please set sheet name you want to put the CSV data.
        csvFile = path[0]  # Please set the filename and path of csv file.
        print('::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::', path[0])

        sh = client.open_by_key(spreadsheetId)
        sh.values_update(
            sheetName,
            params={'valueInputOption': 'USER_ENTERED'},
            body={'values': list(csv.reader(open(csvFile)))}
        )

    except Exception as e:
        print(e)


adhoc_analysis()
