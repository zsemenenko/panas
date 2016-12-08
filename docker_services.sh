#!/bin/bash
SYSTEMD=/etc/systemd/system

/usr/bin/docker pull wartech/api-gis:standalone &&
/usr/bin/docker pull wartech/postgres-plastun:latest &&

echo -e "\n\e[96mCreating working directory"
echo -e "Created /var/postgres is\e[97m"
sudo mkdir -p /var/postgres
sudo ls -lha /var/postgres

echo -e "\e[96m\nCreated /home/devops/mapUpdates is\e[97m"
mkdir -p $HOME/mapUpdates
ls -lha $HOME/mapUpdates

echo -e "\e[96m\nCreated /home/devops/tilecache/g.h is\e[97m"
mkdir -p $HOME/tilecache/g.h
ls -lha $HOME/tilecache/g.h

echo -e "\n\e[96mCreating systemd services files"
echo "[Unit]
Description=api-gis Docker Container
After=docker.service
Requires=postgres.service docker.service
[Service]
TimeoutStartSec=0
Restart=always
ExecStart=/usr/bin/docker run --rm --name api-gis -p 8081:8081 -v /home/devops/tilecache/:/usr/src/app/cache/ -v /home/vess/services/mapUpdates/:/usr/src/app/mapUpdates wartech/api-gis:standalone
ExecStop=/usr/bin/docker rm -f api-gis
[Install]
WantedBy=multi-user.target" > $PWD/api-gis.service
sudo mv $PWD/api-gis.service $SYSTEMD/api-gis.service

echo -e "Created $SYSTEMD/api-gis.service is\e[97m"
sudo cat $SYSTEMD/api-gis.service

echo "[Unit]
Description=postgres Docker Container
After=docker.service
Requires=docker.service
[Service]
TimeoutStartSec=0
Restart=always
ExecStart=/usr/bin/docker run --rm --name postgres -p 5432:5432 -v /var/postgres/:/var/lib/postgresql/data -e "POSTGRES_PASSWORD=postgres" wartech/postgres-plastun:latest
ExecStop=/usr/bin/docker rm -f postgres
[Install]
WantedBy=multi-user.target" > $PWD/postgres.service
sudo mv $PWD/postgres.service $SYSTEMD/postgres.service

echo -e "\e[96m\nCreated $SYSTEMD/postgres.service is\e[97m"
sudo cat $SYSTEMD/postgres.service

sudo systemctl daemon-reload
sudo systemctl enable postgres.service
sudo systemctl enable api-gis.service

echo -e "\e[96m\nUsage\nPostgres service:\n\e[97msudo service postgres start|stop|restart|status\n\n\e[96mApi-gis service:\n\e[97msudo service postgres start|stop|restart|status"

exit 0 
