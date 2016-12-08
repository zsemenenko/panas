#!/bin/bash
$PWD/install_env.sh &&
$PWD/docker_daemon_install.sh &&
$PWD/node_install.sh &&
$PWD/chrome_install.sh &&
$PWD/hackrf_install.sh &&
$PWD/osmosdr_install.sh &&
$PWD/gqrx_install.sh &&
$PWD/docker_services.sh &&
$PWD/shortcuts.sh

exit 0
