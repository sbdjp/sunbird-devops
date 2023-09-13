#!/bin/bash
# Title: Configuring  Group Activities form
# Description: Technical document on configuring  Group Activities form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"


### Set The Group Activities form  api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"group","subType":"activities","action":"list","component":"app","framework":"*","rootOrgId":"*","data":{"templateName":"activities","action":"list","fields":[{"index":0,"title":"ACTIVITY_COURSE_TITLE","desc":"ACTIVITY_COURSE_DESC","activityType":"Content","isEnabled":true,"filters":{"contentTypes":["Course"]}},{"index":1,"title":"ACTIVITY_TEXTBOOK_TITLE","desc":"ACTIVITY_TEXTBOOK_DESC","activityType":"Content","isEnabled":false,"filters":{"contentTypes":["TextBook"]}}]}}}' 

# Check the status of Group Activities form  form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "group",
    "subType": "activities",
    "action": "list",
    "component": "app"
  }
}'
