#!/bin/bash
sudo ip route del default via 192.168.20.1 dev enp0s25
sudo ip route del 192.168.20.0/22 dev enp0s25

exit 0
