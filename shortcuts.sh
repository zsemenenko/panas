#!/bin/bash
echo -e "\e[96mCreating desktop shortcuts"
echo "[Desktop Entry]
Name=plastunStart
Comment=
GenericName=
Keywords=
Exec=sh /usr/bin/plastunStart.sh
Terminal=false
Type=Application
Icon= /home/devops/Pictures/start.jpg
Path=
Categories=
NoDisplay=false" > $PWD/plastunStart.desktop
sudo mv $PWD/plastunStart.desktop /usr/share/applications/plastunStart.desktop

echo -e "Created /usr/share/applications/plastunStart.desktop is\e[97m"
sudo cat /usr/share/applications/plastunStart.desktop

echo "[Desktop Entry]
Name=plastunStop
Comment=
GenericName=
Keywords=
Exec=sh /usr/bin/plastunStop.sh
Terminal=false
Type=Application
Icon= /home/devops/Pictures/stop.jpg
Path=
Categories=
NoDisplay=false" > $PWD/plastunStop.desktop
sudo mv $PWD/plastunStop.desktop /usr/share/applications/plastunStop.desktop

echo -e "\e[96m\nCreated /usr/share/applications/plastunStop.desktop is\e[97m"
sudo cat /usr/share/applications/plastunStop.desktop

echo -e "\e[96m\nCreating shell scripts"
echo "#!/bin/bash
notify-send -t 1 "Plastun" "STARTED"
pkill node
cd /home/devops/plastun &&
npm start -- --hw-host 192.168.21.132 2> ~/plastun.log &
sleep 2 &&
/opt/google/chrome/chrome --start-fullscreen
exit 0" > $PWD/plastunStart.sh
sudo mv $PWD/plastunStart.sh /usr/bin/plastunStart.sh

echo -e "Created /usr/bin/plastunStart.sh is\e[97m"
sudo cat /usr/bin/plastunStart.sh

echo "#!/bin/bash
notify-send -t 1 "Plastun" "STOPPED"
pkill chrome
pkill node
exit 0" > $PWD/plastunStop.sh
sudo mv $PWD/plastunStop.sh /usr/bin/plastunStop.sh

echo -e "\e[96m\nCreated /usr/bin/plastunStop.sh is\e[97m"
sudo cat /usr/bin/plastunStop.sh

sudo chmod +rx /usr/bin/plastunSt*

echo -e "\e[96m\nPermissions must be eXecutable\e[97m"
sudo ls -lha /usr/bin | grep plastun | awk '{print $1 "\t" $9}'


echo -e "\e[96m\nPictures copied\e[97m"
sudo cp *.jpg /home/devops/Pictures
sudo ls -lha /home/devops/Pictures/*.jpg

exit 0 
