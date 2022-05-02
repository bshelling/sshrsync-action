#!/bin/sh -l

eval $(ssh-agent -s)
mkdir .ssh
ssh-keygen -t rsa -f cicdrsa -N ""
echo "${1}" > .ssh/cicdrsa
chmod 400 .ssh/cicdrsa
ssh-add .ssh/cicdrsa
ssh-keyscan -H $2 >> .ssh/known_hosts
ssh -i .ssh/cicdrsa -o StrictHostKeyChecking=no $3@$4 -p 22
rsync -avzrPuO -e "ssh -i .ssh/cicdrsa" $5 . $3@$4:$6
