#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Marathi language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for Marathi language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"mr","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"मजकूर चुकीचा आहे "},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"मजकूर व्यवस्थित दिसत नाही "},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"मजकूर विषयाशी सुसंगत नाही "},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मला संकल्पना समजण्यास मदत झाली नाही "},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तांत्रिक अडचण आहे "},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"मजकूर अपुरा आहे, किंवा अस्तित्वात नाही "},{"key":"OTHER","idx":8,"value":"इतर काही "}],"ratingText":"अतिशय वाईट ","question":"तुम्ही आम्हाला आणखी सांगू इच्छिता का? "},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"मजकूर चुकीचा आहे "},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"मजकूर व्यवस्थित दिसत नाही "},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"मजकूर विषयाशी सुसंगत नाही "},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मला संकल्पना समजण्यास मदत झाली नाही "},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तांत्रिक अडचण आहे "},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"मजकूर अपुरा आहे, किंवा अस्तित्वात नाही "},{"key":"OTHER","idx":8,"value":"इतर काही "}],"ratingText":"वाईट ","question":"तुम्ही आम्हाला आणखी सांगू इच्छिता का? "},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"मजकूर चुकीचा आहे "},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"मजकूर व्यवस्थित दिसत नाही "},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"मजकूर विषयाशी सुसंगत नाही "},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मला संकल्पना समजण्यास मदत झाली नाही "},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तांत्रिक अडचण आहे "},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"मजकूर अपुरा आहे, किंवा अस्तित्वात नाही "},{"key":"OTHER","idx":8,"value":"इतर काही "}],"ratingText":"सर्वसामान्य ","question":"तुम्ही आम्हाला आणखी सांगू इच्छिता का? "},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"मजकूर चुकीचा आहे "},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"मजकूर व्यवस्थित दिसत नाही "},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"मजकूर विषयाशी सुसंगत नाही "},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"मला संकल्पना समजण्यास मदत झाली नाही "},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"तांत्रिक अडचण आहे "},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"मजकूर अपुरा आहे, किंवा अस्तित्वात नाही "},{"key":"OTHER","idx":8,"value":"इतर काही "}],"ratingText":"चांगले ","question":"तुम्ही आम्हाला आणखी सांगू इच्छिता का? "},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"संकल्पना व्यवस्थित समजली "},{"key":"HELPED_IN_EXAM","idx":2,"value":"मला परीक्षेची तयारी करण्यास मदत करा "},{"key":"LEARNT_SOMETHING","idx":3,"value":"काहीतरी नवीन शिकलो "},{"key":"HELPED_IN_CLASS","idx":4,"value":"मला माझ्या वर्गाला शिकवण्यास मदत झाली "},{"key":"CONTENT_INTERESTING","idx":6,"value":"मजकूर मनोरंजक व मजेदार आहे "},{"key":"OTHER","idx":7,"value":"इतर काही "}],"ratingText":"उत्कृष्ट ","question":"तुम्ही आम्हाला आणखी सांगू इच्छिता का? "}}]}}}'

# Check the status of rating form for Marathi language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "mr",
    "action": "get"
  }
}'
