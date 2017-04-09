#!/bin/bash       
STR="Hello World!"
echo $STR
:: script test.txt  < --- Why doesnt this work?

cd ..
sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install npm

sudo apt-get install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev

npm i -g gulp

git clone https://github.com/joemccann/dillinger.git dillinger
cd dillinger
npm i -d
mkdir -p downloads/files/{md,html,pdf}
gulp build --prod
NODE_ENV=production node app


