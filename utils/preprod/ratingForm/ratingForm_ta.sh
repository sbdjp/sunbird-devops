#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for tamil language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for tamil language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"ta","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"உள்ளடக்கம் சரியானது அல்ல"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"உள்ளடக்கம் சரியாக வரவில்லை"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"உள்ளடக்கம் பாடத்திற்குப் பொருத்தமானதாக இல்லை"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"பாடக் கருத்தைப் புரிந்து கொள்ள எனக்கு உதவவில்லை"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"தொழில்நுட்ப சிக்கல் உள்ளது"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"உள்ளடக்கம் போதுமானதாக இல்லை அல்லது இல்லை "},{"key":"OTHER","idx":8,"value":"வேறு காரணம்"}],"ratingText":"நன்றாக இல்லை","question":"நீங்கள் இன்னும் சொல்ல விரும்புகிறீர்களா?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"உள்ளடக்கம் சரியானது அல்ல"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"உள்ளடக்கம் சரியாக வரவில்லை"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"உள்ளடக்கம் பாடத்திற்குப் பொருத்தமானதாக இல்லை"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"பாடக் கருத்தைப் புரிந்து கொள்ள எனக்கு உதவவில்லை"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"தொழில்நுட்ப சிக்கல் உள்ளது"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"உள்ளடக்கம் போதுமானதாக இல்லை அல்லது இல்லை "},{"key":"OTHER","idx":8,"value":"வேறு காரணம்"}],"ratingText":"நன்றாக இல்லை","question":"நீங்கள் இன்னும் சொல்ல விரும்புகிறீர்களா?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"உள்ளடக்கம் சரியானது அல்ல"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"உள்ளடக்கம் சரியாக வரவில்லை"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"உள்ளடக்கம் பாடத்திற்குப் பொருத்தமானதாக இல்லை"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"பாடக் கருத்தைப் புரிந்து கொள்ள எனக்கு உதவவில்லை"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"தொழில்நுட்ப சிக்கல் உள்ளது"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"உள்ளடக்கம் போதுமானதாக இல்லை அல்லது இல்லை "},{"key":"OTHER","idx":8,"value":"வேறு காரணம்"}],"ratingText":"சராசரி","question":"நீங்கள் இன்னும் சொல்ல விரும்புகிறீர்களா?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"உள்ளடக்கம் சரியானது அல்ல"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"உள்ளடக்கம் சரியாக வரவில்லை"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"உள்ளடக்கம் பாடத்திற்குப் பொருத்தமானதாக இல்லை"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"பாடக் கருத்தைப் புரிந்து கொள்ள எனக்கு உதவவில்லை"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"தொழில்நுட்ப சிக்கல் உள்ளது"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"உள்ளடக்கம் போதுமானதாக இல்லை அல்லது இல்லை "},{"key":"OTHER","idx":8,"value":"வேறு காரணம்"}],"ratingText":"நன்று","question":"நீங்கள் இன்னும் சொல்ல விரும்புகிறீர்களா?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"பாடக் கருத்து நன்றாகப் புரிந்தது"},{"key":"HELPED_IN_EXAM","idx":2,"value":"தேர்வுக்குத் தயாராவதற்கு  உதவியது "},{"key":"LEARNT_SOMETHING","idx":3,"value":"புதிதாக சிலவற்றை கற்றோம் "},{"key":"HELPED_IN_CLASS","idx":4,"value":"பாடம் கற்றுத்தர உதவியாக இருந்தது"},{"key":"CONTENT_INTERESTING","idx":6,"value":"உள்ளடக்கம் சுவாரஸ்யமானதாக இருந்தது"},{"key":"OTHER","idx":7,"value":"வேறு காரணம்"}],"ratingText":"அருமை","question":"நீங்கள் இன்னும் சொல்ல விரும்புகிறீர்களா?"}}]}}}'

# Check the status of rating form for tamil language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "ta",
    "action": "get"
  }
}'
