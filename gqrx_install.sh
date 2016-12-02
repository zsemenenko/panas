#!/bin/bash
cd ~/sdr
git clone https://github.com/csete/gqrx.git
cd gqrx
mkdir build && cd build
qmake ../ &&
make &&
sudo cp ~PWD/gqrx /bin/gqrx

exit 0
