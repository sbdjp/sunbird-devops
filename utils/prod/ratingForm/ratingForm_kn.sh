#!/bin/bash
# Title: Configuring Rating form in hi
# Description: Technical document on configuring rating form for Kanada language
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://diksha.gov.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

echo -e "The Auth Token is $authToken\n"

### Set The rating form for Kanada language

curl -s -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"contentfeedback","subType":"kn","action":"get","component":"*","framework":"*","rootOrgId":"*","data":{"templateName":"contentfeedback","action":"get","fields":[{"1":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ಪಠ್ಯಾಂಶವು ನಿಖರವಾಗಿಲ್ಲ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ಪಠ್ಯಾಂಶವು ಸರಿಯಾಗಿ ಡಿಸ್ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ಪಠ್ಯಾಂಶ ಪ್ರಸ್ತುತವಾಗಿಲ್ಲ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ಪರಿಕಲ್ಪನೆಯನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಲು ನನಗೆ  ಸಹಾಯವಾಗಲಿಲ್ಲ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ತಾಂತ್ರಿಕ ಸಮಸ್ಯೆ ಇದೆ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ಪಠ್ಯಾಂಶ ಸಾಕಷ್ಟಿಲ್ಲ ಅಥವಾ ಇಲ್ಲ"},{"key":"OTHER","idx":8,"value":"ಇತರೆ"}],"ratingText":"ತುಂಬಾ ಕೆಟ್ಟದಾಗಿದೆ","question":"ನೀವು ಈ ಬಗ್ಗೆ ಇನ್ನೂ ಹೆಚ್ಚು ಹೇಳಲು ಬಯಸುವಿರಾ? "},"2":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ಪಠ್ಯಾಂಶವು ನಿಖರವಾಗಿಲ್ಲ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ಪಠ್ಯಾಂಶವು ಸರಿಯಾಗಿ ಡಿಸ್ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ಪಠ್ಯಾಂಶ ಪ್ರಸ್ತುತವಾಗಿಲ್ಲ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ಪರಿಕಲ್ಪನೆಯನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಲು ನನಗೆ  ಸಹಾಯವಾಗಲಿಲ್ಲ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ತಾಂತ್ರಿಕ ಸಮಸ್ಯೆ ಇದೆ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ಪಠ್ಯಾಂಶ ಸಾಕಷ್ಟಿಲ್ಲ ಅಥವಾ ಇಲ್ಲ"},{"key":"OTHER","idx":8,"value":"ಇತರೆ"}],"ratingText":" ಕೆಟ್ಟದಾಗಿದೆ","question":"ನೀವು ಈ ಬಗ್ಗೆ ಇನ್ನೂ ಹೆಚ್ಚು ಹೇಳಲು ಬಯಸುವಿರಾ? "},"3":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ಪಠ್ಯಾಂಶವು ನಿಖರವಾಗಿಲ್ಲ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ಪಠ್ಯಾಂಶವು ಸರಿಯಾಗಿ ಡಿಸ್ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ಪಠ್ಯಾಂಶ ಪ್ರಸ್ತುತವಾಗಿಲ್ಲ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ಪರಿಕಲ್ಪನೆಯನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಲು ನನಗೆ  ಸಹಾಯವಾಗಲಿಲ್ಲ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ತಾಂತ್ರಿಕ ಸಮಸ್ಯೆ ಇದೆ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ಪಠ್ಯಾಂಶ ಸಾಕಷ್ಟಿಲ್ಲ ಅಥವಾ ಇಲ್ಲ"},{"key":"OTHER","idx":8,"value":"ಇತರೆ"}],"ratingText":"ಸಾಧಾರಣ","question":"ನೀವು ಈ ಬಗ್ಗೆ ಇನ್ನೂ ಹೆಚ್ಚು ಹೇಳಲು ಬಯಸುವಿರಾ? "},"4":{"options":[{"key":"CONTENT_INACCURATE","idx":1,"value":"ಪಠ್ಯಾಂಶವು ನಿಖರವಾಗಿಲ್ಲ"},{"key":"CONTENT_NOT_DISPLAYED","idx":2,"value":"ಪಠ್ಯಾಂಶವು ಸರಿಯಾಗಿ ಡಿಸ್ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ"},{"key":"CONTENT_NOT_RELEVANT","idx":3,"value":"ಪಠ್ಯಾಂಶ ಪ್ರಸ್ತುತವಾಗಿಲ್ಲ"},{"key":"DIDNT_UNDERSTAND_CONCEPT","idx":4,"value":"ಪರಿಕಲ್ಪನೆಯನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳಲು ನನಗೆ  ಸಹಾಯವಾಗಲಿಲ್ಲ"},{"key":"TECHNICAL_PROBLEM","idx":6,"value":"ತಾಂತ್ರಿಕ ಸಮಸ್ಯೆ ಇದೆ"},{"key":"INSUFFICIENT_CONTENT","idx":6,"value":"ಪಠ್ಯಾಂಶ ಸಾಕಷ್ಟಿಲ್ಲ ಅಥವಾ ಇಲ್ಲ"},{"key":"OTHER","idx":8,"value":"ಇತರೆ"}],"ratingText":"ಚೆನ್ನಾಗಿದೆ","question":"ನೀವು ಈ ಬಗ್ಗೆ ಇನ್ನೂ ಹೆಚ್ಚು ಹೇಳಲು ಬಯಸುವಿರಾ? "},"5":{"options":[{"key":"UNDERSTOOD_CONCEPT","idx":1,"value":"ಪರಿಕಲ್ಪನೆಯು ಚೆನ್ನಾಗಿ ಅರ್ಥವಾಯಿತು"},{"key":"HELPED_IN_EXAM","idx":2,"value":"ನನಗೆ ಪರೀಕ್ಷೆ ಸಿದ್ಧತೆ ಮಾಡಿಕೊಳ್ಳಲು ಸಹಾಯವಾಯಿತು"},{"key":"LEARNT_SOMETHING","idx":3,"value":"ಹೊಸದಾಗಿ ಏನನ್ನೋ ಕಲಿತೆ"},{"key":"HELPED_IN_CLASS","idx":4,"value":"ನನಗೆ ತರಗತಿಯಲ್ಲಿ ಕಲಿಸಲು ಸಹಾಯವಾಯಿತು"},{"key":"CONTENT_INTERESTING","idx":6,"value":"ಪಠ್ಯಾಂಶವು ಆಸಕ್ತಿದಾಯಕವಾಗಿ, ಖುಷಿಯಾಗುವಂತೆ ಇದೆ. "},{"key":"OTHER","idx":7,"value":"ಇತರೆ"}],"ratingText":"ಅತ್ಯುತ್ತಮವಾಗಿದೆ","question":"ನೀವು ಈ ಬಗ್ಗೆ ಇನ್ನೂ ಹೆಚ್ಚು ಹೇಳಲು ಬಯಸುವಿರಾ? "}}]}}}'

# Check the status of rating form for Kanada language

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "contentfeedback",
    "subType": "kn",
    "action": "get"
  }
}'
