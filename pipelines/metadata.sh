#!/bin/sh
if [ $# -lt 1 ]
then
        echo "***********************************"
        echo "Usage :Invalid number of arguements"
        echo "***********************************"
        exit
fi
export name=$1
cat ./pipelines/metadata.json | jq -c  "$name"