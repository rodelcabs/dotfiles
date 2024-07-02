#!/bin/bash
echo "VERSION: " $1 

# build
echo "BUILD SDK"
npm run build

# move work dir
echo "MOVE WORK DIR"
mv microui/{.,}* source/
mv build/microui/* microui/

# link package
echo "LINK SDK"
npm link

# go to work dir
echo "LINK AND BUILD STORYBOOK"
cd source
echo "CURRENT DIR: " $(pwd)
npm link @backoffice/fast-payments-client-js-sdk
STORYBOOK_SPA_ENVIRONMENT=dev STORYBOOK_MUI_VERSION=$1 npm run build-storybook

#make sure you have already have a valid aws sso
# delete dev
echo "EMPTY BUCKET"
aws s3 rm s3://fast-pay-n-ue1-microui-spa-s3/dev/ --recursive

# sync e
echo "SYNC BUCKET"
aws s3 sync ./storybook-static/. s3://fast-pay-n-ue1-microui-spa-s3/dev/

# revert work dir
echo "REVERTING WORK DIR"
cd ../
mv microui/* build/microui/
mv source/{.,}* microui/
