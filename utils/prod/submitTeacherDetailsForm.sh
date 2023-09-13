#!/bin/bash
# Title: Configuring  Submit Teacher detail form api
# Description: Technical document on configuring Submit Teacher detail form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiY2U4ZWI2OTA3Yjg0NmRjOTY5ZDM5YjczNDczYzVjMSJ9.rkb7wYQYd_5mXtSoJvc_0p4MXjpOZOeO-rP51k_DIg0"

### Set The Submit Teacher detail form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"user","subType":"teacherDetails","action":"submit","component":"app","rootOrgId":"*","data":{"templateName":"teacherDetails","action":"submit","fields":[{"code":"state","type":"select","templateOptions":{"label":"STATE","placeHolder":"STATE_OPTION_TEXT","multiple":false,"options":[]},"validations":[{"type":"required","value":true,"message":""}]},{"code":"district","type":"select","templateOptions":{"label":"DISTRICT","placeHolder":"DISTRICT_OPTION_TEXT","multiple":false,"prefill":[{"code":"state"}],"options":[]},"validations":[{"type":"required","value":true,"message":""}]},{"code":"declared-school-name","type":"input","templateOptions":{"label":"SCHOOL_OR_ORG_NAME","placeHolder":"ENTER_SCHOOL_NAME"}},{"code":"declared-school-udise-code","type":"input","templateOptions":{"label":"SCHOOL_UDISE_ID_OR_ORG_ID","placeHolder":"ENTER_UDISE_ID"},"validations":[{"type":"minLength","value":11,"message":"VALIDATION_MINIMUM_LENGTH"},{"type":"maxLength","value":11,"message":"VALIDATION_MAXIMUM_LENGTH"},{"type":"pattern","value":"^[0-9]*$","message":"ONLY_DIGIT_NUMBER_IS_ALLOWED"}]},{"code":"declared-ext-id","type":"input","templateOptions":{"label":"ENTER_ID_AS_REQUESTED_BY_STATE_BOARD_ORG","placeHolder":"ENTER_ID"},"validations":[{"type":"required","value":true,"message":"ID_IS_REQUIRED"}]}]}}}' 

# Check the status of Submit Teacher detail form api

curl -i -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "user",
    "subType": "teacherDetails",
    "action": "submit",
    "component": "app"
  }
}'
