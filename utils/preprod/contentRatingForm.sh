#!/bin/bash
# Title: Configuring  content rating form api
# Description: Technical document on configuring dialcode regex form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"
ssoUser="ntp-preprod-new-admin"
ssoPassword="yw$9(G$R9_"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')
rootOrgIds=(0127469621537996806 01269936129926758441 01272421522269798431 0127573825163673601004 01275678925675724817 0126978705345576967 01271856129372979239 01272213541996953625 0127236218321879040 01272427865906380841 0126796199493140480 0126986399813058564 0126980631714447366 01269935257059328038 01270160554776985670 01272279163654963224 01272422036819148832 0126980532287815682 01269789193823027212 01269878797503692810 01269934121990553633 0127141451042979842 01271863522811084850 0127517983514460164 0127469586926632965 01276175508980531215 01272777697873100812 01268904781886259221 0126825293972439041 0126924036044308487 01269935045061017636 01271787172220928028 01271864647019724853 01272212366453964824 01272362140525363213 0127609885220044801085)

echo -e "The Auth Token is $authToken\n"

### Set The content rating form api

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -H "X-Authenticated-User-Token: $authToken" \
  -d '{"request":{"type":"contentfeedback","subType":"en","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"Content is inaccurate"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"Content is not displayed properly"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"Content is not relevant"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"Did not help me understand the concept"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"There is a technical problem"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"Content is insufficient or not there"},{"key":"OTHER","idx":8,"value":"Other"}],"ratingText":"Very Bad","question":"Would you like to tell us more?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"Content is inaccurate"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"Content is not displayed properly"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"Content is not relevant"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"Did not help me understand the concept"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"There is a technical problem"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"Content is insufficient or not there"},{"key":"OTHER","idx":8,"value":"Other"}],"ratingText":"Bad","question":"Would you like to tell us more?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"Content is inaccurate"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"Content is not displayed properly"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"Content is not relevant"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"Did not help me understand the concept"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"There is a technical problem"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"Content is insufficient or not there"},{"key":"OTHER","idx":8,"value":"Other"}],"ratingText":"Average","question":"Would you like to tell us more?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"Content is inaccurate"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"Content is not displayed properly"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"Content is not relevant"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"Did not help me understand the concept"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"There is a technical problem"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"Content is insufficient or not there"},{"key":"OTHER","idx":8,"value":"Other"}],"ratingText":"Good","question":"Would you like to tell us more?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"Understood the concept well"},{"key":"HELPED_IN_EXAM","idx":2,"value":"Helped me prepare for my exam"},{"key":"LEARNT_SOMETHING","idx":3,"value":"Learnt something new"},{"key":"HELPED_IN_CLASS","idx":4,"value":"Helped me teach my class"},{"key":"CONTENT_INTERESTING","idx":6,"value":"Content is interesting and fun"},{"key":"OTHER","idx":7,"value":"Other"}],"ratingText":"Excellent","question":"Would you like to tell us more?"}}]}}}' 

# Check the status of content rating form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "en",
    "action": "get",
    "rootOrgId": "null",
    "framework": "null"
  }
}'