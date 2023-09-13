#!/bin/bash
# Title: Configuring  login form api
# Description: Technical document on configuring login form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://staging.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjNDkyM2Y1Mjg1ZmY0NDdjYmYxMzgwNTQyM2ExZTk4YSJ9.hwQiG6OIFoIJ2O9ec6kau09ltJ-5xA5fWi6aM6NoLEU"
ssoUser="ntp-staging-new-admin"
ssoPassword="yw$9(G$R9_"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')

echo -e "The Auth Token is $authToken\n"

### Set The Log FAQ

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/update \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
  -d '{"request":{"type":"config","subType":"login","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"login","action":"get","fields":[{"context":"login","target":{"host":"https://staging.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://staging.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"}]},"return":[{"type":"password-reset-success","when":{"host":"https://staging.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"client_id","resolveTo":"client_id"}]}},{"type":"password","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"state","when":{"host":"https://staging.ntp.net.in","path":"/sso/sign-in/success","params":[{"key":"id","resolveTo":"id"}]}},{"type":"migrate","when":{"host":"https://staging.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"automerge","resolveTo":"automerge"},{"key":"payload","resolveTo":"payload"},{"key":"state","resolveTo":"state"},{"key":"userId","resolveTo":"userId"},{"key":"identifierType","resolveTo":"identifierType"},{"key":"identifierValue","resolveTo":"identifierValue"},{"key":"goBackUrl","resolveTo":"goBackUrl"}]}}]},{"context":"merge","target":{"host":"https://merge.staging.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://staging.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"},{"key":"merge_account_process","value":"1"},{"key":"mergeaccountprocess","value":"1"},{"key":"goBackUrl","value":"https://merge.staging.ntp.net.in/?exit=1"}]},"return":[{"type":"password","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"exit","when":{"host":"https://merge.staging.ntp.net.in","path":"/","params":[{"key":"exit","resolveTo":"exit"}]}}]},{"context":"migrate","target":{"host":"https://staging.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://staging.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"},{"key":"automerge","value":"1"}]},"return":[{"type":"password","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://staging.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"state","when":{"host":"https://staging.ntp.net.in","path":"/sso/sign-in/success","params":[{"key":"id","resolveTo":"id"}]}}]}]}}}' 

# Check the status of Consumption Faq Setting

curl -s -X GET \
  $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json'
  -d '{
  "request": {
    "type": "config",
    "subType": "login",
    "action": "get",
    "rootOrgId": "null",
    "framework": "null"
  }
}'
