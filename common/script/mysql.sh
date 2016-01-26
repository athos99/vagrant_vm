#!/usr/bin/env bash

PROVISIONED="$HOME/provisioned/mysql";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for mySql server'
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
fi
sudo touch $PROVISIONED
