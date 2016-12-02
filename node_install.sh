#!/bin/bash
cd ~
wget https://nodejs.org/dist/v6.9.1/node-v6.9.1.tar.gz
tar xvf node-v6.9.1.tar.gz
cd ~/node-v6.9.1/
sudo ./configure &&
sudo make &&
sudo make install

exit 0
