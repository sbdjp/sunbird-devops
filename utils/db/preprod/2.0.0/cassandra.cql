CREATE TABLE IF NOT EXISTS preprod_device_db.device_profile_temp (     device_id text,     first_access timestamp,     last_access timestamp,     total_ts double,     total_launches bigint,     avg_ts double,     device_spec Map<text,text>,     updated_date timestamp,     state text,     state_code text,     country text,     country_code text,     state_custom text,     state_code_custom text,     district_custom text,     city text,     uaspec Map<text,text>,     PRIMARY KEY (device_id) );
 
COPY preprod_device_db.device_profile(device_id,channel,first_access,last_access,total_ts,total_launches,avg_ts,device_spec,updated_date,state,state_code,country,country_code,city,uaspec,state_code_custom,district_custom,state_custom) TO '/tmp/device_profile_backup.csv';

CREATE TABLE IF NOT EXISTS preprod_device_db.device_profile_backup (     device_id text, channel text ,   first_access timestamp,     last_access timestamp,     total_ts double,     total_launches bigint,     avg_ts double,     device_spec Map<text,text>,     updated_date timestamp,     state text,     state_code text,     country text,     country_code text,     state_custom text,     state_code_custom text,     district_custom text,     city text,     uaspec Map<text,text>,     PRIMARY KEY (device_id,channel) );

COPY preprod_device_db.device_profile_backup(device_id,channel,first_access,last_access,total_ts,total_launches,avg_ts,device_spec,updated_date,state,state_code,country,country_code,city,uaspec,state_code_custom,district_custom,state_custom) FROM '/tmp/device_profile_backup.csv';

DROP TABLE preprod_device_db.device_profile;

COPY preprod_device_db.device_profile_temp(device_id,first_access,last_access,total_ts,total_launches,avg_ts,device_spec,updated_date,state,state_code,country,country_code,city,uaspec,state_code_custom,district_custom,state_custom) TO '/tmp/device_profile_temp.csv';

CREATE TABLE IF NOT EXISTS preprod_device_db.device_profile (     device_id text ,  first_access timestamp,     last_access timestamp,     total_ts double,     total_launches bigint,     avg_ts double,     device_spec Map<text,text>,     updated_date timestamp,     state text,     state_code text,     country text,     country_code text,     state_custom text,     state_code_custom text,     district_custom text,     city text,     uaspec Map<text,text>,     PRIMARY KEY (device_id) );

COPY preprod_device_db.device_profile(device_id,first_access,last_access,total_ts,total_launches,aGvg_ts,device_spec,updated_date,state,state_code,country,country_code,city,uaspec,state_code_custom,district_custom,state_custom) FROM '/tmp/device_profile_temp.csv';
