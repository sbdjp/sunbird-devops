#!/bin/bash
# Title: Configuring  login form api
# Description: Technical document on configuring login form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"
ssoUser="ntp-preprod-new-admin"
ssoPassword="yw$9(G$R9_"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')
rootOrgIds=(0127469621537996806 01269936129926758441 01272421522269798431 0127573825163673601004 01275678925675724817 0126978705345576967 01271856129372979239 01272213541996953625 0127236218321879040 01272427865906380841 0126796199493140480 0126986399813058564 0126980631714447366 01269935257059328038 01270160554776985670 01272279163654963224 01272422036819148832 0126980532287815682 01269789193823027212 01269878797503692810 01269934121990553633 0127141451042979842 01271863522811084850 0127517983514460164 0127469586926632965 01276175508980531215 01272777697873100812 01268904781886259221 0126825293972439041 0126924036044308487 01269935045061017636 01271787172220928028 01271864647019724853 01272212366453964824 01272362140525363213 0127609885220044801085)

echo -e "The Auth Token is $authToken\n"

### Set The login form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/update \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
  -d '{"request":{"type":"config","subType":"login","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"login","action":"get","fields":[{"context":"login","target":{"host":"https://preprod.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://preprod.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"}]},"return":[{"type":"state-error","when":{"host":"https://preprod.ntp.net.in","path":"/sso/sign-in/error","params":[{"key":"error_message","resolveTo":"error_message"}]}},{"type":"password-reset-success","when":{"host":"https://preprod.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"client_id","resolveTo":"client_id"}]}},{"type":"password","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"state","when":{"host":"https://preprod.ntp.net.in","path":"/sso/sign-in/success","params":[{"key":"id","resolveTo":"id"}]}},{"type":"migrate","when":{"host":"https://preprod.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"automerge","resolveTo":"automerge"},{"key":"payload","resolveTo":"payload"},{"key":"state","resolveTo":"state"},{"key":"userId","resolveTo":"userId"},{"key":"identifierType","resolveTo":"identifierType"},{"key":"identifierValue","resolveTo":"identifierValue"},{"key":"goBackUrl","resolveTo":"goBackUrl"}]}}]},{"context":"merge","target":{"host":"https://merge.preprod.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://preprod.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"},{"key":"merge_account_process","value":"1"},{"key":"mergeaccountprocess","value":"1"},{"key":"goBackUrl","value":"https://merge.preprod.ntp.net.in/?exit=1"}]},"return":[{"type":"password","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"exit","when":{"host":"https://merge.preprod.ntp.net.in","path":"/","params":[{"key":"exit","resolveTo":"exit"}]}}]},{"context":"migrate","target":{"host":"https://preprod.ntp.net.in","path":"/auth/realms/sunbird/protocol/openid-connect/auth","params":[{"key":"redirect_uri","value":"https://preprod.ntp.net.in/oauth2callback"},{"key":"response_type","value":"code"},{"key":"scope","value":"offline_access"},{"key":"client_id","value":"android"},{"key":"version","value":"4"},{"key":"automerge","value":"1"}]},"return":[{"type":"password","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"code","resolveTo":"code"}]}},{"type":"google","when":{"host":"https://preprod.ntp.net.in","path":"/oauth2callback","params":[{"key":"googleRedirectUrl","resolveTo":"googleRedirectUrl"}]}},{"type":"state","when":{"host":"https://preprod.ntp.net.in","path":"/sso/sign-in/success","params":[{"key":"id","resolveTo":"id"}]}}]}]}}}' 

# Check the status of login form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "config",
    "subType": "login",
    "action": "get",
    "rootOrgId": "null",
    "framework": "null"
  }
}'
