#!/bin/bash
# Title: Configuring  dialcode regex form api
# Description: Technical document on configuring dialcode regex form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"
ssoUser="ntp-preprod-new-admin"
ssoPassword="yw$9(G$R9_"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')
rootOrgIds=(0127469621537996806 01269936129926758441 01272421522269798431 0127573825163673601004 01275678925675724817 0126978705345576967 01271856129372979239 01272213541996953625 0127236218321879040 01272427865906380841 0126796199493140480 0126986399813058564 0126980631714447366 01269935257059328038 01270160554776985670 01272279163654963224 01272422036819148832 0126980532287815682 01269789193823027212 01269878797503692810 01269934121990553633 0127141451042979842 01271863522811084850 0127517983514460164 0127469586926632965 01276175508980531215 01272777697873100812 01268904781886259221 0126825293972439041 0126924036044308487 01269935045061017636 01271787172220928028 01271864647019724853 01272212366453964824 01272362140525363213 0127609885220044801085)

echo -e "The Auth Token is $authToken\n"

### Set The dialcode regex form api

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