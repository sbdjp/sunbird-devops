#!/bin/bash
# Title: Configuring  external userid verification form api
# Description: Technical document on configuring external userid verification form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiY2U4ZWI2OTA3Yjg0NmRjOTY5ZDM5YjczNDczYzVjMSJ9.rkb7wYQYd_5mXtSoJvc_0p4MXjpOZOeO-rP51k_DIg0"
ssoUser="ntp-prod-new-admin"
ssoPassword="fcV[2fQUJ'"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')

echo -e "The Auth Token is $authToken\n"

### Set  external userid verification form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
 -d '{"request":{"type":"user","subType":"externalidverification","action":"onboarding","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"defaultTemplate","action":"onboarding","fields":[{"code":"externalIdVerificationLabels","name":"externalIdVerification","range":[{"popupHeaderLabel":"User Verification","headerLabel":"Are you a government school teacher ?","fieldLabel":"Enter your teacher ID for verification","incorrectIDLabel":"The ID entered is incorrect. Enter the ID again","verficationFailureLabel":"Could not verify teacher profile as the ID entered is incorrect","verificationSuccessfulLabel":"Teacher profile verified successfully"}]}]}}}' 

# Check the status of external userid verification form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json'
  -d '{
  "request": {
    "type": "user",
    "subType": "externalIdVerification",
    "action": "onboarding",
    "rootOrgId": "null",
    "framework": "null"
  }
}'