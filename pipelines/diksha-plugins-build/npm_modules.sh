#!/bin/bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install bower -g
sudo npm install gulp -g
sudo npm install gulp-zip -g
sudo npm install gulp-clean -g
sudo npm install git-rev -g
if [ ! -f /usr/bin/node ];
then
sudo ln -s /usr/bin/nodejs /usr/bin/node
else
echo $(which node)
fi