#!/bin/bash
# Title: Configuring  Create Managed User form api
# Description: Technical document on configuring Create Managed User form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"


### Set The Create Managed User form api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/update \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"user","subType":"manageduser","action":"create","component":"app","rootOrgId":"*","data":{"templateName":"manageduser","action":"create","fields":[{"code":"name","type":"input","templateOptions":{"label":"FULL_NAME","placeholder":"ENTER_USER_NAME"},"validations":[{"type":"required","value":true,"message":"NAME_IS_REQUIRED"}]},{"code":"updatePreference","type":"label","templateOptions":{"label":"PREFERENCES_CAN_BE_UPDATED"}}]}}}' 

# Check the status of Create Managed User form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "user",
    "subType": "manageduser",
    "action": "create",
    "component": "app"
  }
}'
