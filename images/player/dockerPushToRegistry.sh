#!/bin/sh
# Build script
# set -o errexit
e () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}
m=$(./themes/metadata.sh)

org=$(e "${m}" "org")
hubuser=$(e "${m}" "hubuser")
name=$(e "${m}" "name")
version=$(e "${m}" "version")

artifactLabel=${ARTIFACT_LABEL:-gold}
sunbird_version=`head -1 ./devops/images/player/Dockerfile | cut -d ":" -f2`
docker login  ntphub.azurecr.io -u "${hubuser}" -p`cat /home/ops/.ntp_vault_pass`
docker push ${org}/${name}:${sunbird_version}-${version}
docker logout

