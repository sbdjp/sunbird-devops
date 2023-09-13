#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for urdu language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for urdu language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"ur","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"مواد غلط ہے"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"مواد مناسب طریقے سے دکھائ نہیں دے رہا"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"مواد متعلقہ نہیں ہے"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"مجھے اس تصور کو سمجھنے میں مدد نہیں ملی"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ایک تکنیکی مسئلہ ہے"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"مواد کافی نہیں ہے یا موجود نہیں ہے"},{"key":"OTHER","idx":8,"value":"دیگر"}],"ratingText":"بہت برا","question":"کیا آپ ہمیں مزید بتانا پسند کریں گے؟"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"مواد غلط ہے"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"مواد مناسب طریقے سے دکھائ نہیں دے رہا"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"مواد متعلقہ نہیں ہے"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"مجھے اس تصور کو سمجھنے میں مدد نہیں ملی"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ایک تکنیکی مسئلہ ہے"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"مواد کافی نہیں ہے یا موجود نہیں ہے"},{"key":"OTHER","idx":8,"value":"دیگر"}],"ratingText":"خراب","question":"کیا آپ ہمیں مزید بتانا پسند کریں گے؟"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"مواد غلط ہے"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"مواد مناسب طریقے سے دکھائ نہیں دے رہا"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"مواد متعلقہ نہیں ہے"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"مجھے اس تصور کو سمجھنے میں مدد نہیں ملی"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ایک تکنیکی مسئلہ ہے"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"مواد کافی نہیں ہے یا موجود نہیں ہے"},{"key":"OTHER","idx":8,"value":"دیگر"}],"ratingText":"اوسط","question":"کیا آپ ہمیں مزید بتانا پسند کریں گے؟"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"مواد غلط ہے"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"مواد مناسب طریقے سے دکھائ نہیں دے رہا"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"مواد متعلقہ نہیں ہے"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"مجھے اس تصور کو سمجھنے میں مدد نہیں ملی"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ایک تکنیکی مسئلہ ہے"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"مواد کافی نہیں ہے یا موجود نہیں ہے"},{"key":"OTHER","idx":8,"value":"دیگر"}],"ratingText":"اچھا","question":"کیا آپ ہمیں مزید بتانا پسند کریں گے؟"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"تصور اچھی طرح سے سمجھ میں آیا"},{"key":"HELPED_IN_EXAM","idx":2,"value":"مجھے اپنے امتحان کی تیاری میں مدد ملی"},{"key":"LEARNT_SOMETHING","idx":3,"value":"کچھ نیا سیکھا"},{"key":"HELPED_IN_CLASS","idx":4,"value":"اپنی کلاس سکھانے میں میری مدد ہوئ"},{"key":"CONTENT_INTERESTING","idx":6,"value":"مواد دلچسپ اور تفریح ہے"},{"key":"OTHER","idx":7,"value":"دیگر"}],"ratingText":"عمدہ","question":"کیا آپ ہمیں مزید بتانا پسند کریں گے؟"}}]}}}'

# Check the status of rating form for urdu language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "ur",
    "action": "get"
  }
}'
