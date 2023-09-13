#!/bin/sh

set -ex

commit_ref=${1}
player_dir=sunbird-portal
if [ -d diksha-tenant ]; then
    rm -rf diksha-tenant
fi
	git clone https://harshavardhanc:"$2"@github.com/DIKSHA-NCTE/diksha-tenant.git
#else
#    cd diksha-tenant
#    git pull
#fi
#cd ..
#
if [ ! -d $player_dir ]; then
    git clone https://github.com/project-sunbird/sunbird-portal.git
fi
cd $player_dir
git reset --hard
git clean -fd
git fetch
#git checkout -b release-1.11.0 v1.11
git checkout release-1.12
#git pull -X theirs