#!/bin/bash
# Title: Configuring  content rating form api
# Description: Technical document on configuring dialcode regex form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiY2U4ZWI2OTA3Yjg0NmRjOTY5ZDM5YjczNDczYzVjMSJ9.rkb7wYQYd_5mXtSoJvc_0p4MXjpOZOeO-rP51k_DIg0"
ssoUser="ntp-prod-new-admin"
ssoPassword="fcV[2fQUJ'"
authToken=$(curl -s -X POST $sunbirdBaseURL/auth/realms/sunbird/protocol/openid-connect/token -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' -H 'postman-token: 15d3852b-de08-ea78-3342-bfaf5d4d4f09' --data "client_id=admin-cli&username=$ssoUser&password=$ssoPassword&grant_type=password" | jq -r '.access_token')

echo -e "The Auth Token is $authToken\n"

### Set content rating form api

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
  -H 'Content-Type: application/json'
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "en",
    "action": "get",
    "rootOrgId": "null",
    "framework": "null"
  }
}'