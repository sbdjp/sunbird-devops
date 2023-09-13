#!/bin/bash
# Build script
# set -o errexit
env=$1
apk add --no-cache git python make g++
cd landingpage/dial-code-page
pwd
npm install

if [[ $1 == "staging" ]]; then
npm run staging-build 
else
npm run prod-build
fi
#npm run dev-build # uncomment this line for sunbird dev build
# uncomment this line for ntp staging build
#npm run prod-build # uncomment this line for diksha prod build