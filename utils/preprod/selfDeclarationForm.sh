#!/bin/bash
# Title: Configuring  selfDeclaration  form api
# Description: Technical document on configuring selfDeclaration form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

### Set The selfDeclaration form api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"user","subType":"selfDeclaration","action":"submit","component":"app","rootOrgId":"*","data":{"templateName":"selfDeclaration","action":"submit","fields":[{"code":"name","type":"label","templateOptions":{"labelHtml":{"contents":"<p>$0:&nbsp;$1</p>","values":{"$0":"NAME","$1":""}}}},{"code":"state","type":"label","templateOptions":{"labelHtml":{"contents":"<p>$0:&nbsp;$1</p>","values":{"$0":"STATE","$1":""}}}},{"code":"district","type":"label","templateOptions":{"labelHtml":{"contents":"<p>$0:&nbsp;$1</p>","values":{"$0":"DISTRICT","$1":""}}}},{"code":"externalIds","type":"nested_group","children":[{"code":"declared-phone","fieldName":"Mobile Number","type":"input","templateOptions":{"labelHtml":{"contents":"<span>$0&nbsp;<span class=\"required-asterisk\">*</span></span>","values":{"$0":"PHONE_PLACEHOLDER"}},"placeHolder":"ENTER_PHONE_POPUP_TITLE","prefix":"+91 -"},"validations":[{"type":"required","value":true,"message":"ERROR_PHONE_REQUIRED"},{"type":"pattern","value":"^[6-9*][0-9*]{9}$","message":"ERROR_PHONE_INVALID"}],"asyncValidation":{"marker":"MOBILE_OTP_VALIDATION","message":"PLEASE_VALIDATE_YOUR_MOBILE_NUMBER","trigger":"validate"}},{"code":"declared-email","fieldName":"Email Address","type":"input","templateOptions":{"placeHolder":"EMAIL_PLACEHOLDER","label":"EMAIL_ID_PLACEHOLDER"},"validations":[{"type":"pattern","value":"^[A-Za-z0-9._*%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,}$","message":"ERROR_EMAIL_INVALID"}],"asyncValidation":{"marker":"EMAIL_OTP_VALIDATION","message":"PLEASE_VALIDATE_YOUR_EMAIL_ADDRESS","trigger":"validate"}},{"code":"declared-school-name","fieldName":"School/Organization name","type":"input","templateOptions":{"label":"SCHOOL_OR_ORG_NAME","placeHolder":"ENTER_SCHOOL_NAME"}},{"code":"declared-school-udise-code","fieldName":"School UDISE ID/Org ID","type":"input","templateOptions":{"label":"SCHOOL_UDISE_ID_OR_ORG_ID","placeHolder":"ENTER_UDISE_ID"}},{"code":"declared-ext-id","fieldName":"Your ID from State/Board/Org","type":"input","templateOptions":{"labelHtml":{"contents":"<span>$0&nbsp;<span class=\"required-asterisk\">*</span></span>","values":{"$0":"ENTER_ID_AS_REQUESTED_BY_STATE_BOARD_ORG"}},"placeHolder":"ENTER_ID"},"validations":[{"type":"required","value":true,"message":"ID_IS_REQUIRED"}]}],"templateOptions":{}},{"code":"tnc","type":"checkbox","templateOptions":{"labelHtml":{"contents":"<span>$tnc <u><a href=\"$url\">$0</a></u></span>","values":{"$tnc":"SELF_DECLARE_TEACHER_TNC","$url":"url","$0":"PRIVACY_POLICY"}}},"validations":[{"type":"required","value":true,"message":""}]}]}}}' 

# Check the status of selfDeclaration form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "user",
    "subType": "selfDeclaration",
    "action": "submit",
    "component": "app"
  }
}'
