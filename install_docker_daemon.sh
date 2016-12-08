#!/bin/bash
sudo su && curl -fSsL https://get.docker.com/ | sh &&
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose &&
chmod +x ./docker-compose && sudo cp docker-compose /usr/local/bin/ &&
sudo usermod -aG docker $(whoami)
 
exit 0
