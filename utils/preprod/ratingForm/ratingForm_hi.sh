#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Hindi language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for Hindi language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"hi","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"कंटेन्ट गलत हैं"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"कंटेन्ट ठीक से प्रदर्शित नहीं हो रहा है"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"कंटेन्ट प्रासंगिक नहीं है"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मुझे अवधारणा को समझने में मदद नहीं मिली"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तकनीकी त्रुटि"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"कंटेन्ट अपर्याप्त है या नहीं हैं "},{"key":"OTHER","idx":8,"value":"अन्य"}],"ratingText":"बहुत ख़राब","question":"क्या आप हमें और बताना चाहेंगे?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"कंटेन्ट गलत हैं"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"कंटेन्ट ठीक से प्रदर्शित नहीं हो रहा है"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"कंटेन्ट प्रासंगिक नहीं है"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मुझे अवधारणा को समझने में मदद नहीं मिली"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तकनीकी त्रुटि"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"कंटेन्ट अपर्याप्त है या नहीं हैं "},{"key":"OTHER","idx":8,"value":"अन्य"}],"ratingText":"ख़राब","question":"क्या आप हमें और बताना चाहेंगे?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"कंटेन्ट गलत हैं"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"कंटेन्ट ठीक से प्रदर्शित नहीं हो रहा है"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"कंटेन्ट प्रासंगिक नहीं है"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मुझे अवधारणा को समझने में मदद नहीं मिली"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तकनीकी त्रुटि"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"कंटेन्ट अपर्याप्त है या नहीं हैं "},{"key":"OTHER","idx":8,"value":"अन्य"}],"ratingText":"औसत","question":"क्या आप हमें और बताना चाहेंगे?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"कंटेन्ट गलत हैं"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"कंटेन्ट ठीक से प्रदर्शित नहीं हो रहा है"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"कंटेन्ट प्रासंगिक नहीं है"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मुझे अवधारणा को समझने में मदद नहीं मिली"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तकनीकी त्रुटि"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"कंटेन्ट अपर्याप्त है या नहीं हैं "},{"key":"OTHER","idx":8,"value":"अन्य"}],"ratingText":"अच्छा","question":"क्या आप हमें और बताना चाहेंगे?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"विषय अच्छी तरह समझ लिया"},{"key":"HELPED_IN_EXAM","idx":2,"value":"मुझे परीक्षा की तैयारी में मदद मिली"},{"key":"LEARNT_SOMETHING","idx":3,"value":"कुछ नया सीखा"},{"key":"HELPED_IN_CLASS","idx":4,"value":"मेरी मेरी कक्षा को पढ़ाने में मदद मिली"},{"key":"CONTENT_INTERESTING","idx":6,"value":"कंटेन्ट दिलचस्प और मजेदार है"},{"key":"OTHER","idx":7,"value":"अन्य"}],"ratingText":"उत्कृष्ट","question":"क्या आप हमें और बताना चाहेंगे?"}}]}}}'

# Check the status of rating form for Hindi language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "hi",
    "action": "get"
  }
}'
