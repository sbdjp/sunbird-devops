#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for telegu language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for telegu language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"te","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"కంటెంట్ సరికాదు"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"కంటెంట్ సరిగా ప్రదర్శించబడదు"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"కంటెంట్ సంబంధితంగా లేదు"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"భావనను అర్థం చేసుకోవడానికి నాకు సహాయం చేయలేదు"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"సాంకేతిక సమస్య ఉంది"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"కంటెంట్ సరిపోదు లేదా లేదు"},{"key":"OTHER","idx":8,"value":"ఇతర"}],"ratingText":"ఏమి బాగోలేదు","question":"మీరు మాకు మరింత చెప్పాలనుకుంటున్నారా?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"కంటెంట్ సరికాదు"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"కంటెంట్ సరిగా ప్రదర్శించబడదు"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"కంటెంట్ సంబంధితంగా లేదు"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"భావనను అర్థం చేసుకోవడానికి నాకు సహాయం చేయలేదు"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"సాంకేతిక సమస్య ఉంది"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"కంటెంట్ సరిపోదు లేదా లేదు"},{"key":"OTHER","idx":8,"value":"ఇతర"}],"ratingText":"చెడ్డ","question":"మీరు మాకు మరింత చెప్పాలనుకుంటున్నారా?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"కంటెంట్ సరికాదు"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"కంటెంట్ సరిగా ప్రదర్శించబడదు"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"కంటెంట్ సంబంధితంగా లేదు"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"భావనను అర్థం చేసుకోవడానికి నాకు సహాయం చేయలేదు"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"సాంకేతిక సమస్య ఉంది"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"కంటెంట్ సరిపోదు లేదా లేదు"},{"key":"OTHER","idx":8,"value":"ఇతర"}],"ratingText":"సగటు","question":"మీరు మాకు మరింత చెప్పాలనుకుంటున్నారా?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"కంటెంట్ సరికాదు"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"కంటెంట్ సరిగా ప్రదర్శించబడదు"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"కంటెంట్ సంబంధితంగా లేదు"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"భావనను అర్థం చేసుకోవడానికి నాకు సహాయం చేయలేదు"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"సాంకేతిక సమస్య ఉంది"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"కంటెంట్ సరిపోదు లేదా లేదు"},{"key":"OTHER","idx":8,"value":"ఇతర"}],"ratingText":"మంచిది","question":"మీరు మాకు మరింత చెప్పాలనుకుంటున్నారా?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"కాన్సెప్ట్‌ను బాగా అర్థం చేసుకున్నారు"},{"key":"HELPED_IN_EXAM","idx":2,"value":"నా పరీక్షకు సిద్ధం కావడానికి నాకు సహాయపడింది"},{"key":"LEARNT_SOMETHING","idx":3,"value":"క్రొత్తదాన్ని నేర్చుకున్నాను"},{"key":"HELPED_IN_CLASS","idx":4,"value":"నా తరగతి నేర్పడానికి నాకు సహాయపడింది"},{"key":"CONTENT_INTERESTING","idx":6,"value":"కంటెంట్ ఆసక్తికరంగా మరియు సరదాగా ఉంటుంది"},{"key":"OTHER","idx":7,"value":"ఇతర"}],"ratingText":"అద్భుతమైన","question":"మీరు మాకు మరింత చెప్పాలనుకుంటున్నారా?"}}]}}}'

# Check the status of rating form for telegu language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "te",
    "action": "get"
  }
}'
