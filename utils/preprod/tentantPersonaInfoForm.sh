#!/bin/bash
# Title: Configuring  Tenant PersonaInfo form api
# Description: Technical document on configuring Tenant PersonaInfo form api
# Note: Dependencies Install jq before running this script

sunbirdBaseURL="https://preprod.ntp.net.in"
Bearer="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2N2I5NTQ1Y2I2YzY0NTViOTE5NDcyMzhjYWZmMGRiNyJ9.ICzasPpPeu5-PGcRWBKtJ4TYXubKlbyMzdLgVBLD0GE"

### Set The Tenant PersonaInfo form api

curl -i -X POST \
  $sunbirdBaseURL/api/data/v1/form/create \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{"request":{"type":"user","subType":"tenantPersonaInfo","action":"get","component":"app","framework":"*","rootOrgId":"*","data":{"templateName":"tenantPersonaInfo","action":"get","fields":[{"code":"persona","type":"select","templateOptions":{"label":"I am a","placeHolder":"Select persona","options":[{"label":"Teacher","value":"teacher"},{"label":"Other","value":"other"}]},"validations":[{"type":"required","value":true,"message":"Persona is required"}]},{"code":"tenant","type":"select","templateOptions":{"label":"with","placeHolder":"Select tenants","options":[{"label":"Andaman and Nicobar Islands","value":"12765997661519872117"},{"label":"Andhra Pradesh","value":"1269934121990553633"},{"label":"Arunachal Pradesh","value":"13058967422648320980"},{"label":"Assam","value":"1276175508980531215"},{"label":"Bihar","value":"12796327887290368392"},{"label":"CBSE","value":"128325322816552960"},{"label":"Chandigarh","value":"127659971454320640"},{"label":"Chhattisgarh","value":"127660481998602240"},{"label":"Delhi","value":"13055452754804736888"},{"label":"Goa","value":"129026407780433923"},{"label":"Gujarat","value":"126986399813058564"},{"label":"Haryana State","value":"127674553846579203"},{"label":"iGOT","value":"129902071599595522"},{"label":"jharkhand","value":"12811889750941696475"},{"label":"Karnataka State Org","value":"127236218321879040"},{"label":"Kerala","value":"13051342708842496208"},{"label":"Maharashtra","value":"1269935045061017636"},{"label":"Manipur","value":"126924036044308487"},{"label":"MHRD","value":"1285079663956787264"},{"label":"Nagaland","value":"1272279163654963224"},{"label":"NCERT","value":"1283607456185548825093"},{"label":"NTP","value":"1268904781886259221"},{"label":"Odisha","value":"126980532287815682"},{"label":"Pondicherry","value":"130738509538344969"},{"label":"Punjab","value":"12775810960252928563"},{"label":"Rajasthan","value":"1269935257059328038"},{"label":"Sikkim","value":"1287132368975462452"},{"label":"Tamil Nadu","value":"1269878797503692810"},{"label":"Telangana","value":"12802162366611456420"},{"label":"Uttar Pradesh","value":"1269936129926758441"}],"validations":[{"type":"required","value":true,"message":"Persona is required"}]}}]}}}' 

# Check the status of Tenant PersonaInfo form api

curl -s -X POST \
   $sunbirdBaseURL/api/data/v1/form/read \
  -H "Authorization: Bearer $Bearer" \
  -H 'Content-Type: application/json' \
  -d '{
  "request": {
    "type": "user",
    "subType": "tenantPersonaInfo",
    "action": "get",
    "component": "app"
  }
}'
