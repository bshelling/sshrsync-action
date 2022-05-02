#!/bin/sh -l

eval $(ssh-agent -s)
ssh-keygen -t rsa -f cicdrsa -N ""
echo "${1}" > .ssh/cicdrsa
chmod 400 .ssh/cicdrsa
ssh-add .ssh/cicdrsa
ssh-keyscan -H $2 >> .ssh/known_hosts
ssh -i .ssh/cicdrsa -o StrictHostKeyChecking=no $3@$4 -p 22
rsync -avzrPuO -e "ssh -i .ssh/cicdrsa" --exclude=.git --exclude=node_modules --exclude=.git* --exclude=Dockfile --exclude=action.yml --exclude=entrypoint.sh --exclude=src/.sass-cache . $3@$4:$5
