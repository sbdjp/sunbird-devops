#!/bin/bash
# Title: Configuring  Submit teacher form v2
# Description: Technical document on configuring Support dynamic form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"


### Set The Submit teacher details v2 form  api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"user","subType":"teacherDetails_v2","action":"submit","component":"app","rootOrgId":"*","data":{"templateName":"teacherDetails_v2","action":"submit","fields":[{"code":"externalIds","type":"nested_group","children":[{"code":"declared-state","type":"select","templateOptions":{"label":"STATE","placeHolder":"STATE_OPTION_TEXT","multiple":false,"dataSrc":{"marker":"LOCATION_LIST","params":{"id":"state"}}},"validations":[{"type":"required","value":true,"message":""}]},{"code":"declared-district","type":"select","context":"declared-state","templateOptions":{"label":"DISTRICT","placeHolder":"DISTRICT_OPTION_TEXT","multiple":false,"dataSrc":{"marker":"LOCATION_LIST","params":{"id":"district"}}},"validations":[{"type":"required","value":true,"message":""}]},{"code":"declared-phone","type":"input","templateOptions":{"label":"PHONE_PLACEHOLDER","placeHolder":"ENTER_PHONE_POPUP_TITLE","prefix":"+91 -"},"validations":[{"type":"required","value":true,"message":"ERROR_PHONE_REQUIRED"},{"type":"pattern","value":"^[6-9*][0-9*]{9}$","message":"ERROR_PHONE_INVALID"}],"asyncValidation":{"marker":"MOBILE_OTP_VALIDATION","message":"PLEASE_VALIDATE_YOUR_MOBILE_NUMBER","trigger":"validate"}},{"code":"declared-email","type":"input","templateOptions":{"label":"EMAIL_ID_PLACEHOLDER","placeHolder":"EMAIL_PLACEHOLDER"},"validations":[{"type":"pattern","value":"^[A-Za-z0-9._*%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,}$","message":"ERROR_EMAIL_INVALID"}],"asyncValidation":{"marker":"EMAIL_OTP_VALIDATION","message":"PLEASE_VALIDATE_YOUR_EMAIL_ADDRESS","trigger":"validate"}},{"code":"declared-school-name","type":"input","templateOptions":{"label":"SCHOOL_OR_ORG_NAME","placeHolder":"ENTER_SCHOOL_NAME"}},{"code":"declared-school-udise-code","type":"input","templateOptions":{"label":"SCHOOL_UDISE_ID_OR_ORG_ID","placeHolder":"ENTER_UDISE_ID"}},{"code":"declared-ext-id","type":"input","templateOptions":{"label":"ENTER_ID_AS_REQUESTED_BY_STATE_BOARD_ORG","placeHolder":"ENTER_ID"},"validations":[{"type":"required","value":true,"message":"ID_IS_REQUIRED"},{"type":"pattern","value":"^[A-Za-z0-9]*$","message":"SPECIAL_CHARACTERS_NOT_SUPPORTED"}]}],"templateOptions":{}},{"code":"tnc","type":"checkbox","templateOptions":{"labelHtml":{"contents":"<span>$0$appName$1 <u><a href=\"$url\">$2</a></u></span>","values":{"$0":"SELF_DECLARE_TEACHER_TNC","$1":"AS_PER_THE","$2":"PRIVACY_POLICY"}}},"validations":[{"type":"required","value":true,"message":""}]}]}}}' 

# Check the status of Submit teacher details v2  form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "user",
    "subType": "teacherDetails_v2",
    "action": "submit",
    "component": "app"
  }
}'
