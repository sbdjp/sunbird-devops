#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Gujurati language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for Gujurati language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"gu","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"કન્ટેન્ટ અચોક્કસ છે"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"કન્ટેન્ટ યોગ્ય રીતે પ્રદર્શિત થયો નથી"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"કન્ટેન્ટ સંબંધિત નથી"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"મને કન્સેપટ સમજવામાં મદદ કરી નથી"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"તકનીકી સમસ્યા છે"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"કન્ટેન્ટ અપૂરતો  છે અથવા નથી"},{"key":"OTHER","idx":8,"value":"અન્ય"}],"ratingText":"ખૂબ જ ખરાબ","question":"તમે અમને વધુ કહેવા માંગો છો?"},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"કન્ટેન્ટ અચોક્કસ છે"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"કન્ટેન્ટ યોગ્ય રીતે પ્રદર્શિત થયો નથી"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"કન્ટેન્ટ સંબંધિત નથી"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"મને કન્સેપટ સમજવામાં મદદ કરી નથી"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"તકનીકી સમસ્યા છે"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"કન્ટેન્ટ અપૂરતો  છે અથવા નથી"},{"key":"OTHER","idx":8,"value":"અન્ય"}],"ratingText":"ખરાબ","question":"તમે અમને વધુ કહેવા માંગો છો?"},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"કન્ટેન્ટ અચોક્કસ છે"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"કન્ટેન્ટ યોગ્ય રીતે પ્રદર્શિત થયો નથી"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"કન્ટેન્ટ સંબંધિત નથી"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"મને કન્સેપટ સમજવામાં મદદ કરી નથી"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"તકનીકી સમસ્યા છે"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"કન્ટેન્ટ અપૂરતો  છે અથવા નથી"},{"key":"OTHER","idx":8,"value":"અન્ય"}],"ratingText":"સરેરાશ","question":"તમે અમને વધુ કહેવા માંગો છો?"},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"કન્ટેન્ટ અચોક્કસ છે"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"કન્ટેન્ટ યોગ્ય રીતે પ્રદર્શિત થયો નથી"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"કન્ટેન્ટ સંબંધિત નથી"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"મને કન્સેપટ સમજવામાં મદદ કરી નથી"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"તકનીકી સમસ્યા છે"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"કન્ટેન્ટ અપૂરતો  છે અથવા નથી"},{"key":"OTHER","idx":8,"value":"અન્ય"}],"ratingText":"સારું","question":"તમે અમને વધુ કહેવા માંગો છો?"},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"કન્સેપટ સારી રીતે સમજ્યો"},{"key":"HELPED_IN_EXAM","idx":2,"value":"મારી પરીક્ષાની તૈયારીમાં મને મદદ કરી"},{"key":"LEARNT_SOMETHING","idx":3,"value":"કંઈક નવું શીખ્યું"},{"key":"HELPED_IN_CLASS","idx":4,"value":"મારો વર્ગ શીખવવામાં મને મદદ કરી"},{"key":"CONTENT_INTERESTING","idx":6,"value":"કન્ટેન્ટ રસપ્રદ અને મનોરંજક છે"},{"key":"OTHER","idx":7,"value":"અન્ય"}],"ratingText":"ઉત્તમ","question":"તમે અમને વધુ કહેવા માંગો છો?"}}]}}}'

# Check the status of rating form for Gujurati language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "gu",
    "action": "get"
  }
}'
