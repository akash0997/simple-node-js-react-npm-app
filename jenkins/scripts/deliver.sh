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
find build -type f -exec curl -u admin:admin --ftp-create-dirs -T {} http://18.191.215.188:8080/manager/text/deploy?path=/Akash
