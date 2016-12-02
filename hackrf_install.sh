#!/bin/bash
mkdir ~/sdr && cd ~/sdr
git clone https://github.com/mossmann/hackrf.git
cd hackrf/host
mkdir build && cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make &&
sudo make install &&
sudo ldconfig

exit 0
