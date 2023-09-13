#!/bin/bash

#Export the data from existing cassandra keyspace to /home/ops/<name>.csv as ops is readily available
cqlsh -e "COPY sunbird.course_batch (courseid,id,createdby,createddate,createdfor,description,enddate,enrollmentenddate,enrollmenttype,mentors,name,startdate,status,updateddate) TO '/home/ops/sunbird_courses_course_batch.csv' WITH HEADER = TRUE;"

cqlsh -e "COPY sunbird.user_courses (batchid,userid,courseid,active,addedby,completedon,datetime,delta,enrolleddate,grade,lastreadcontentid,lastreadcontentstatus,status,progress) TO '/home/ops/sunbird_courses_user_courses.csv' WITH HEADER = TRUE;"

cqlsh -e "COPY sunbird.content_consumption (contentid,userid,contentversion,batchid,courseid,completedcount,datetime,grade,lastaccesstime,lastcompletedtime,lastupdatedtime,progress,result,score,status,viewcount) TO '/home/ops/sunbird_courses_content_consumption.csv' WITH HEADER = TRUE;"


#Import the data from csv to sunbird_courses keyspace
cqlsh -e "COPY sunbird_courses.course_batch (courseid,batchid,createdby,createddate,createdfor,description,enddate,enrollmentenddate,enrollmenttype,mentors,name,startdate,status,updateddate) FROM '/home/ops/sunbird_courses_course_batch.csv' WITH HEADER = TRUE;"

cqlsh -e "COPY sunbird_courses.user_courses (batchid,userid,courseid,active,addedby,completedon,datetime,delta,enrolleddate,grade,lastreadcontentid,lastreadcontentstatus,status,progress) FROM '/home/ops/sunbird_courses_user_courses.csv' WITH HEADER = TRUE;"

cqlsh -e "COPY sunbird_courses.content_consumption (contentid,userid,contentversion,batchid,courseid,completedcount,datetime,grade,lastaccesstime,lastcompletedtime,lastupdatedtime,progress,result,score,status,viewcount) FROM '/home/ops/sunbird_courses_content_consumption.csv' WITH HEADER = TRUE;"


# Remove the back up files
rm /home/ops/sunbird_courses_course_batch.csv /home/ops/sunbird_courses_user_courses.csv /home/ops/sunbird_courses_content_consumption.csv
