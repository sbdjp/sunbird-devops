#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Bengali language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for Bengali language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"bn","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"বিষয়বস্তু সঠিক নয়"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"বিষয়বস্তু সঠিকভাবে প্রদর্শন করা হয় না"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"বিষয়বস্তু প্রাসঙ্গিক নয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ধারণাটি বুঝতে আমাকে সহায়তা করেনি"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"একটি প্রযুক্তিগত সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"বিষয়বস্তু অপর্যাপ্ত বা সেখানে না"},{"key":"OTHER","idx":8,"value":"অন্যান্য"}],"ratingText":"খুব খারাপ","question":"আপনি কি আমাদের আরো কিছু বলতে চান?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"বিষয়বস্তু সঠিক নয়"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"বিষয়বস্তু সঠিকভাবে প্রদর্শন করা হয় না"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"বিষয়বস্তু প্রাসঙ্গিক নয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ধারণাটি বুঝতে আমাকে সহায়তা করেনি"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"একটি প্রযুক্তিগত সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"বিষয়বস্তু অপর্যাপ্ত বা সেখানে না"},{"key":"OTHER","idx":8,"value":"অন্যান্য"}],"ratingText":"খারাপ","question":"আপনি কি আমাদের আরো কিছু বলতে চান?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"বিষয়বস্তু সঠিক নয়"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"বিষয়বস্তু সঠিকভাবে প্রদর্শন করা হয় না"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"বিষয়বস্তু প্রাসঙ্গিক নয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ধারণাটি বুঝতে আমাকে সহায়তা করেনি"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"একটি প্রযুক্তিগত সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"বিষয়বস্তু অপর্যাপ্ত বা সেখানে না"},{"key":"OTHER","idx":8,"value":"অন্যান্য"}],"ratingText":"গড়পড়তা","question":"আপনি কি আমাদের আরো কিছু বলতে চান?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"বিষয়বস্তু সঠিক নয়"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"বিষয়বস্তু সঠিকভাবে প্রদর্শন করা হয় না"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"বিষয়বস্তু প্রাসঙ্গিক নয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ধারণাটি বুঝতে আমাকে সহায়তা করেনি"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"একটি প্রযুক্তিগত সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"বিষয়বস্তু অপর্যাপ্ত বা সেখানে না"},{"key":"OTHER","idx":8,"value":"অন্যান্য"}],"ratingText":"ভাল","question":"আপনি কি আমাদের আরো কিছু বলতে চান?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"ধারণাটি ভালভাবে বুঝতে পেরেছি"},{"key":"HELPED_IN_EXAM","idx":2,"value":"আমাকে আমার পরীক্ষার জন্য প্রস্তুত করতে সহায়তা করেছে"},{"key":"LEARNT_SOMETHING","idx":3,"value":"নতুন কিছু শিখছি"},{"key":"HELPED_IN_CLASS","idx":4,"value":"আমার ক্লাসটি শেখাতে আমাকে সহায়তা করেছিল"},{"key":"CONTENT_INTERESTING","idx":6,"value":"বিষয়বস্তু আকর্ষণীয় এবং মজাদার"},{"key":"OTHER","idx":7,"value":"অন্যান্য"}],"ratingText":"উৎকৃষ্ট","question":"আপনি কি আমাদের আরো কিছু বলতে চান?"}}]}}}'

# Check the status of rating form for Bengali language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "bn",
    "action": "get"
  }
}'
