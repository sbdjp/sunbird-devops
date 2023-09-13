#!/bin/bash
# Title: Configuring  Board contact info form api
# Description: Technical document on configuring Board contact info form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"


### Set The Board contact info form api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"form","subType":"boardContactInfo","action":"get","rootOrgId":"*","component":"app","data":{"templateName":"boardContactInfo","action":"get","fields":[{"id":"up_k-12","code":"board","name":"Uttar Pradesh","message":"(between 9 AM to 6 PM from Monday to Friday)","contactinfo":{"number":"18001800666","email":null}},{"id":"mp_k-12","code":"board","name":"Madhya Pradesh","message":"(between 11 AM to 5 PM from Monday to Friday)","contactinfo":{"number":"18005728585","email":null}},{"id":"igot_health","code":"board","name":"IGOT-Health","contactinfo":{"email": "support@i-got.freshdesk.com"}}]}}}' 

# Check the status of Support dynamic  form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "form",
    "subType": "boardContactInfo",
    "action": "get",
    "component": "app"
  }
}'
