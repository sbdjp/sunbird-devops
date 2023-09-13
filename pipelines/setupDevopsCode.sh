#!/bin/sh

set -ex

rm -rf sunbird-devops
git -C sunbird-devops pull || git clone  https://github.com/project-sunbird/sunbird-devops.git -b release-1.14 sunbird-devops
