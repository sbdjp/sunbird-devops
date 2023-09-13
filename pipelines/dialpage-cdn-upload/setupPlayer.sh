#!/bin/sh

set -ex

commit_ref=$1
player_dir=landingpage
if [ ! -d $player_dir ]; then
    git clone https://harshavardhanc:"$2"@github.com/DIKSHA-NCTE/landingpage.git
    git checkout $1
    exit 0
fi
cd $player_dir
git reset --hard
git clean -fd
git fetch
git checkout "$commit_ref"
git pull -X theirs
