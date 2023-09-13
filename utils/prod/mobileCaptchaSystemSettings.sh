#!/bin/bash
# Title: appGoogleReCaptcha system settings key
# Description: Technical document on configuring  appGoogleReCaptcha system settings key
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiY2U4ZWI2OTA3Yjg0NmRjOTY5ZDM5YjczNDczYzVjMSJ9.rkb7wYQYd_5mXtSoJvc_0p4MXjpOZOeO-rP51k_DIg0"
ssoUser="ntp-prod-new-admin"
ssoPassword="fcV[2fQUJ'"
deploymentKey=""
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')

echo -e "The Auth Token is $authToken\n"

### Set The  appGoogleReCaptcha

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/system/settings/set \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
  -d '{
  "request": {
    "id": "appGoogleReCaptcha",
    "field": "appGoogleReCaptcha",
    "value": "{\"key\":\"\" , \"isEnabled\":true}"
  }
}' 

# Check the status of  appGoogleReCaptcha system settings

curl -s -X GET \
  $sunbirdBaseURL/api/data/v1/system/settings/get/appGoogleReCaptcha \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json'
