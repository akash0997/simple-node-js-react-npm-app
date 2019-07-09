#!/usr/bin/env sh

echo 'The following "npm" command builds your Node.js/React application for'
echo 'production in the local "build" directory (i.e. within the'
echo '"/var/jenkins_home/workspace/simple-node-js-react-app" directory),'
echo 'correctly bundles React in production mode and optimizes the build for'
echo 'the best performance.'
set -x
npm run build
set +x

echo 'Deploying'
#for file in build/*
#do
#  curl -u admin:admin -T ${file} http://18.191.215.188:8080/manager/deploy?path=/Akash_webApp
#done
ssh user@18.191.215.188:8080 <<EOF
 cd ~/Akash-app
 git pull
 npm install — production
 pm2 restart all
 exit
EOF
