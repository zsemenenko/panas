#!/bin/bash

getinfo()
{
  read -p "Enter the ip address for your server: (looks like 192.168.22.17)  " staticip
}

writeinterfacefile()
{ 
cat << EOF > $1 
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
# The loopback network interface
auto lo
iface lo inet loopback

#Your static network configuration  
iface enp0s3 inet static
	address $staticip
	netmask 255.255.252.0
	gateway 192.168.20.1
	dns-nameservers 192.168.20.1
EOF
#don't use any space before of after 'EOF' in the previous line

  echo ""
  echo "Your informatons was saved in '$1' file."
  echo ""
  exit 0
}

file="/etc/network/interfaces"
if [ ! -f $file ]; then
  echo ""
  echo "The file '$file' doesn't exist!"
  echo ""
  exit 1
fi

clear
echo "Let's set up a static ip address for your site"
echo ""

getinfo
echo ""
echo "So your settings are:"
echo "Your decided Server IP is:   $staticip"
echo ""

while true; do
  read -p "Are these informations correct? [y/n]: " yn 
  case $yn in
    [Yy]* ) writeinterfacefile $file;;
    [Nn]* ) getinfo;;
        * ) echo "Pleas enter y or n!";;
  esac
done 

