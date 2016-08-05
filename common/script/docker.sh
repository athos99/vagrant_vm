#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/docker";
if [[ ! -f $PROVISIONED  ]]; then
  echo '$$$ PROVISION for appli docker'
  sudo apt-get install curl
  curl -fsSL https://get.docker.com/ | sh
  sudo groupadd docker
  sudo usermod -aG docker vagrant
fi
sudo touch $PROVISIONED
