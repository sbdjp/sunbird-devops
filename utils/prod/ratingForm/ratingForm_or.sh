#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuringrating form for odiya language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set Therating form for odiya language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"or","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"କଣ୍ଟେଣ୍ଟ୍ ଭୁଲ ଅଟେ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"କଣ୍ଟେଣ୍ଟ୍ ଠିକ୍ ଭାବରେ ଦୃଶ୍ୟମାନ ହେଉନାହିଁ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"କଣ୍ଟେଣ୍ଟ୍ ପ୍ରାସଙ୍ଗିକ ନୁହେଁ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ବିଷୟବସ୍ତୁ ବୁଝିବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା ନାହିଁ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ଏକ ବୈଷୟିକ ସମସ୍ୟା ଅଛି"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"କଣ୍ଟେଣ୍ଟ୍ ଯଥେଷ୍ଟ ନୁହେଁ କିମ୍ବା ଏହା ନାହିଁ"},{"key":"OTHER","idx":8,"value":"ଅନ୍ୟ"}],"ratingText":"ବହୁତ ଖରାପ","question":"ଆପଣ ଆମକୁ ଅଧିକ କିଛି କହିବାକୁ ଚାହୁଁଛନ୍ତି କି ?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"କଣ୍ଟେଣ୍ଟ୍ ଭୁଲ ଅଟେ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"କଣ୍ଟେଣ୍ଟ୍ ଠିକ୍ ଭାବରେ ଦୃଶ୍ୟମାନ ହେଉନାହିଁ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"କଣ୍ଟେଣ୍ଟ୍ ପ୍ରାସଙ୍ଗିକ ନୁହେଁ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ବିଷୟବସ୍ତୁ ବୁଝିବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା ନାହିଁ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ଏକ ବୈଷୟିକ ସମସ୍ୟା ଅଛି"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"କଣ୍ଟେଣ୍ଟ୍ ଯଥେଷ୍ଟ ନୁହେଁ କିମ୍ବା ଏହା ନାହିଁ"},{"key":"OTHER","idx":8,"value":"ଅନ୍ୟ"}],"ratingText":"ଖରାପ","question":"ଆପଣ ଆମକୁ ଅଧିକ କିଛି କହିବାକୁ ଚାହୁଁଛନ୍ତି କି ?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"କଣ୍ଟେଣ୍ଟ୍ ଭୁଲ ଅଟେ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"କଣ୍ଟେଣ୍ଟ୍ ଠିକ୍ ଭାବରେ ଦୃଶ୍ୟମାନ ହେଉନାହିଁ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"କଣ୍ଟେଣ୍ଟ୍ ପ୍ରାସଙ୍ଗିକ ନୁହେଁ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ବିଷୟବସ୍ତୁ ବୁଝିବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା ନାହିଁ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ଏକ ବୈଷୟିକ ସମସ୍ୟା ଅଛି"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"କଣ୍ଟେଣ୍ଟ୍ ଯଥେଷ୍ଟ ନୁହେଁ କିମ୍ବା ଏହା ନାହିଁ"},{"key":"OTHER","idx":8,"value":"ଅନ୍ୟ"}],"ratingText":"ପ୍ରାୟ ଭଲ","question":"ଆପଣ ଆମକୁ ଅଧିକ କିଛି କହିବାକୁ ଚାହୁଁଛନ୍ତି କି ?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"କଣ୍ଟେଣ୍ଟ୍ ଭୁଲ ଅଟେ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"କଣ୍ଟେଣ୍ଟ୍ ଠିକ୍ ଭାବରେ ଦୃଶ୍ୟମାନ ହେଉନାହିଁ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"କଣ୍ଟେଣ୍ଟ୍ ପ୍ରାସଙ୍ଗିକ ନୁହେଁ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ବିଷୟବସ୍ତୁ ବୁଝିବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା ନାହିଁ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ଏକ ବୈଷୟିକ ସମସ୍ୟା ଅଛି"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"କଣ୍ଟେଣ୍ଟ୍ ଯଥେଷ୍ଟ ନୁହେଁ କିମ୍ବା ଏହା ନାହିଁ"},{"key":"OTHER","idx":8,"value":"ଅନ୍ୟ"}],"ratingText":"ଭଲ","question":"ଆପଣ ଆମକୁ ଅଧିକ କିଛି କହିବାକୁ ଚାହୁଁଛନ୍ତି କି ?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"ବିଷୟବସ୍ତୁ ଭଲଭାବରେ ବୁଝିପାରିଲି"},{"key":"HELPED_IN_EXAM","idx":2,"value":"ମୋ ପରୀକ୍ଷା ପାଇଁ ପ୍ରସ୍ତୁତି କରିବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା"},{"key":"LEARNT_SOMETHING","idx":3,"value":"କିଛି ନୂଆ ଶିଖିଲି"},{"key":"HELPED_IN_CLASS","idx":4,"value":"ମୋ ଶ୍ରେଣୀରେ ପଢ଼ାଇବାରେ ମୋତେ ସାହାଯ୍ୟ କଲା"},{"key":"CONTENT_INTERESTING","idx":6,"value":"କଣ୍ଟେଣ୍ଟ୍ ରୋଚକ ଓ ମଜାଦାର ଅଟେ"},{"key":"OTHER","idx":7,"value":"ଅନ୍ୟ"}],"ratingText":"ଅତି ଉତ୍ତମ","question":"ଆପଣ ଆମକୁ ଅଧିକ କିଛି କହିବାକୁ ଚାହୁଁଛନ୍ତି କି ?"}}]}}}'

# Check the status of rating form for odiya language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "or",
    "action": "get"
  }
}'
