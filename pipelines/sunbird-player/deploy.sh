#!/bin/sh
# Build script
# set -o errexit

#!/bin/sh
# Build script
# set -o errexit
set -e
e () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}
m=$(cat $METADATA_FILE)

# org=$(e "${m}" "org")
# name=$(e "${m}" "name")
# version=$(e "${m}" "version")

org=ntphub.azurecr.io
name=sunbird_player
version=1.14.0-silver-0.1

artifactLabel=${ARTIFACT_LABEL:-gold}
env=${ENV:-null}

#echo "artifactLabel:  ${artifactLabel}"
echo "env:            ${env}"
echo "org:            ${org}"
echo "name:           ${name}"
echo "version:        ${version}"
echo "ANSIBLE_PATH:   $ANSIBLE_PATH"
 
ansible-playbook --version
ansible-playbook -i ansible/inventories/$ENV ansible/dockerpull.yml  --extra-vars "hub_org=${org}" --vault-password-file /run/secrets/vault-pass
ansible-playbook -i ansible/inventories/$ENV sunbird-devops/ansible/deploy.yml --tags "stack-sunbird" --extra-vars "hub_org=${org} image_name=${name} image_tag=${version} service_name=player deploy_stack=True" --vault-password-file /run/secrets/vault-pass
