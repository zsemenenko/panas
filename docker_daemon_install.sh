#!/bin/bash
sudo su && curl -fSsL https://get.docker.com/ | sh &&
curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64 > ./docker-compose &&
chmod +x ./docker-compose && sudo cp docker-compose /usr/local/bin/ &&
sudo usermod -aG docker $(whoami)
 
exit 0
