#!/bin/bash
sudo rm -rf /home/devops/plastun &&
cd /home/devops/ && git clone https://github.com/wartechrnd/plastun.git
cd /home/devops/plastun &&
npm install &&
/home/devops/clear_db.sh &&
npm run build

exit 0
