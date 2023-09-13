#!/bin/sh

set -ex

build_hash=$(jq '.commitHash' metadata.json | sed 's/\"//g')
commit_ref=${1:-release-1.12}
player_dir=sunbird-portal
#if [ ! -d $player_dir ]; then
#    git clone https://github.com/project-sunbird/sunbird-portal.git
#  
#fi
git -C sunbird-portal fetch --all --tags || git clone https://github.com/project-sunbird/sunbird-portal.git -b ${commit_ref}
cd sunbird-portal
git checkout -f "$build_hash" .
#git checkout release-1.10