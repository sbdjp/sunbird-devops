#!/bin/bash
# Title: Configuring  dialcode regex form api
# Description: Technical document on configuring dialcode regex form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiY2U4ZWI2OTA3Yjg0NmRjOTY5ZDM5YjczNDczYzVjMSJ9.rkb7wYQYd_5mXtSoJvc_0p4MXjpOZOeO-rP51k_DIg0"
ssoUser="ntp-prod-new-admin"
ssoPassword="fcV[2fQUJ'"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')

echo -e "The Auth Token is $authToken\n"

### Set The Consumption FAQ

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
  -d '{"request":{"type":"config","subType":"dialcode","action":"get","data":{"templateName":"defaultTemplate","action":"get","fields":[{"name":"Dialcode parser","code":"dialcode","values":"(\\/dial\\/(?<sunbird>[a-zA-Z0-9]+)|(\\/QR\\/\\?id=(?<epathshala>[a-zA-Z0-9]+)))"}]}}}' 

# Check the status of dialcode regex form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json'
  -d '{
  "request": {
    "type": "config",
    "subType": "dialcode",
    "action": "get",
    "rootOrgId": "null",
    "framework": "null"
  }
}'