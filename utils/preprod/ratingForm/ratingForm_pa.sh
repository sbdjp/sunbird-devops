#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for punjab language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for punjab language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"pa","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ਕੰਟੇਂਟ ਗ਼ਲਤ ਹੈ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ਕੰਟੇਂਟ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਪ੍ਰਦਰਸ਼ਤ ਨਹੀਂ ਕੀਤਾ ਗਿਆ ਹੈ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ਕੰਟੇਂਟ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ਕਨਸੈਪਟ ਨੂੰ ਸਮਝਣ ਵਿਚ ਮੇਰੀ ਸਹਾਇਤਾ ਨਹੀਂ ਕੀਤੀ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ਇੱਕ ਤਕਨੀਕੀ ਸਮੱਸਿਆ ਹੈ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ਕੰਟੇਂਟ ਨਾਕਾਫ਼ੀ ਹੈ ਜਾਂ ਨਹੀਂ"},{"key":"OTHER","idx":8,"value":"ਹੋਰ"}],"ratingText":"ਬਹੁਤ ਬੁਰਾ","question":"ਕੀ ਤੁਸੀਂ ਸਾਨੂੰ ਹੋਰ ਦੱਸਣਾ ਚਾਹੋਗੇ?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ਕੰਟੇਂਟ ਗ਼ਲਤ ਹੈ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ਕੰਟੇਂਟ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਪ੍ਰਦਰਸ਼ਤ ਨਹੀਂ ਕੀਤਾ ਗਿਆ ਹੈ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ਕੰਟੇਂਟ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ਕਨਸੈਪਟ ਨੂੰ ਸਮਝਣ ਵਿਚ ਮੇਰੀ ਸਹਾਇਤਾ ਨਹੀਂ ਕੀਤੀ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ਇੱਕ ਤਕਨੀਕੀ ਸਮੱਸਿਆ ਹੈ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ਕੰਟੇਂਟ ਨਾਕਾਫ਼ੀ ਹੈ ਜਾਂ ਨਹੀਂ"},{"key":"OTHER","idx":8,"value":"ਹੋਰ"}],"ratingText":"ਮਾੜਾ","question":"ਕੀ ਤੁਸੀਂ ਸਾਨੂੰ ਹੋਰ ਦੱਸਣਾ ਚਾਹੋਗੇ?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ਕੰਟੇਂਟ ਗ਼ਲਤ ਹੈ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ਕੰਟੇਂਟ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਪ੍ਰਦਰਸ਼ਤ ਨਹੀਂ ਕੀਤਾ ਗਿਆ ਹੈ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ਕੰਟੇਂਟ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ਕਨਸੈਪਟ ਨੂੰ ਸਮਝਣ ਵਿਚ ਮੇਰੀ ਸਹਾਇਤਾ ਨਹੀਂ ਕੀਤੀ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ਇੱਕ ਤਕਨੀਕੀ ਸਮੱਸਿਆ ਹੈ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ਕੰਟੇਂਟ ਨਾਕਾਫ਼ੀ ਹੈ ਜਾਂ ਨਹੀਂ"},{"key":"OTHER","idx":8,"value":"ਹੋਰ"}],"ratingText":"ਔਸਤ","question":"ਕੀ ਤੁਸੀਂ ਸਾਨੂੰ ਹੋਰ ਦੱਸਣਾ ਚਾਹੋਗੇ?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ਕੰਟੇਂਟ ਗ਼ਲਤ ਹੈ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ਕੰਟੇਂਟ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਪ੍ਰਦਰਸ਼ਤ ਨਹੀਂ ਕੀਤਾ ਗਿਆ ਹੈ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ਕੰਟੇਂਟ ਸੰਬੰਧਿਤ ਨਹੀਂ ਹੈ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ਕਨਸੈਪਟ ਨੂੰ ਸਮਝਣ ਵਿਚ ਮੇਰੀ ਸਹਾਇਤਾ ਨਹੀਂ ਕੀਤੀ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ਇੱਕ ਤਕਨੀਕੀ ਸਮੱਸਿਆ ਹੈ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ਕੰਟੇਂਟ ਨਾਕਾਫ਼ੀ ਹੈ ਜਾਂ ਨਹੀਂ"},{"key":"OTHER","idx":8,"value":"ਹੋਰ"}],"ratingText":"ਚੰਗਾ","question":"ਕੀ ਤੁਸੀਂ ਸਾਨੂੰ ਹੋਰ ਦੱਸਣਾ ਚਾਹੋਗੇ?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"ਸੰਕਲਪ ਨੂੰ ਚੰਗੀ ਤਰ੍ਹਾਂ ਸਮਝਿਆ"},{"key":"HELPED_IN_EXAM","idx":2,"value":"ਮੇਰੀ ਪ੍ਰੀਖਿਆ ਦੀ ਤਿਆਰੀ ਵਿਚ ਮੇਰੀ ਮਦਦ ਕੀਤੀ"},{"key":"LEARNT_SOMETHING","idx":3,"value":"ਕੁਝ ਨਵਾਂ ਸਿੱਖ ਲਿਆ"},{"key":"HELPED_IN_CLASS","idx":4,"value":"ਮੇਰੀ ਕਲਾਸ ਨੂੰ ਪੜਾਉਣ ਵਿਚ ਮੇਰੀ ਮਦਦ ਕੀਤੀ"},{"key":"CONTENT_INTERESTING","idx":6,"value":"ਕੰਟੇਂਟ ਦਿਲਚਸਪ ਅਤੇ ਮਜ਼ੇਦਾਰ ਹੈ"},{"key":"OTHER","idx":7,"value":"ਹੋਰ"}],"ratingText":"ਸ਼ਾਨਦਾਰ","question":"ਕੀ ਤੁਸੀਂ ਸਾਨੂੰ ਹੋਰ ਦੱਸਣਾ ਚਾਹੋਗੇ?"}}]}}}'

# Check the status of rating form for punjab language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "pa",
    "action": "get"
  }
}'
