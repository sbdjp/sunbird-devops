#!/bin/sh
env=${ENV:-null}

echo "env:            ${env}"

ansible-playbook --version
ansible-playbook -i ansible/inventories/$ENV ansible/downtime-proxy.yml --extra-vars --vault-password-file /run/secrets/vault-pass -e "env=ntp-staging"

# Custom Redirect config for dialpage
#ansible-playbook -i ansible/inventories/$ENV ansible/nginx-custom.yml --vault-password-file /run/secrets/vault-pass
