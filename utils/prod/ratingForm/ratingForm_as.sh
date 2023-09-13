#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Asami language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The  rating form for Asami language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"as","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"সমল ভুল"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"সমল ভালদৰে প্ৰদৰ্শিত হোৱা নাই"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"সমল প্ৰাসংগিক নহয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"মোক ধাৰণা  বুজি পোৱাত সহায় কৰা নাই"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"এটা কাৰিকৰী সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"সমল অপৰ্যাপ্ত বা তাত নাই"},{"key":"OTHER","idx":8,"value":"অন্য"}],"ratingText":"খুবেই বেয়া","question":"আপুনি আমাক অলপ বেছিকৈ জনাবলৈ বিচাৰেনে?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"সমল ভুল"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"সমল ভালদৰে প্ৰদৰ্শিত হোৱা নাই"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"সমল প্ৰাসংগিক নহয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"মোক ধাৰণা  বুজি পোৱাত সহায় কৰা নাই"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"এটা কাৰিকৰী সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"সমল অপৰ্যাপ্ত বা তাত নাই"},{"key":"OTHER","idx":8,"value":"অন্য"}],"ratingText":"বেয়া","question":"আপুনি আমাক অলপ বেছিকৈ জনাবলৈ বিচাৰেনে?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"সমল ভুল"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"সমল ভালদৰে প্ৰদৰ্শিত হোৱা নাই"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"সমল প্ৰাসংগিক নহয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"মোক ধাৰণা  বুজি পোৱাত সহায় কৰা নাই"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"এটা কাৰিকৰী সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"সমল অপৰ্যাপ্ত বা তাত নাই"},{"key":"OTHER","idx":8,"value":"অন্য"}],"ratingText":"গড়","question":"আপুনি আমাক অলপ বেছিকৈ জনাবলৈ বিচাৰেনে?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"সমল ভুল"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"সমল ভালদৰে প্ৰদৰ্শিত হোৱা নাই"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"সমল প্ৰাসংগিক নহয়"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"মোক ধাৰণা  বুজি পোৱাত সহায় কৰা নাই"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"এটা কাৰিকৰী সমস্যা আছে"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"সমল অপৰ্যাপ্ত বা তাত নাই"},{"key":"OTHER","idx":8,"value":"অন্য"}],"ratingText":"ভাল","question":"আপুনি আমাক অলপ বেছিকৈ জনাবলৈ বিচাৰেনে?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"ধাৰণাটো ভালদৰে বুজি লোৱা"},{"key":"HELPED_IN_EXAM","idx":2,"value":"মোক মোৰ পৰীক্ষাৰ প্ৰস্তুতিত সহায় কৰিছে "},{"key":"LEARNT_SOMETHING","idx":3,"value":"কিছু নতুন শিকা"},{"key":"HELPED_IN_CLASS","idx":4,"value":"মোৰ শ্ৰেণীত  পঢ়োৱাত মোক  সহায় কৰিছে"},{"key":"CONTENT_INTERESTING","idx":6,"value":"সমল আকৰ্ষণীয় আৰু আমোদজনক"},{"key":"OTHER","idx":7,"value":"অন্য"}],"ratingText":"অতি উত্তম","question":"আপুনি আমাক অলপ বেছিকৈ জনাবলৈ বিচাৰেনে?"}}]}}}'

# Check the status of  rating form for Asami language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "as",
    "action": "get"
  }
}'
