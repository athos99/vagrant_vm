#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/docker";
if [[ ! -f $PROVISIONED  ]]; then
  echo '$$$ PROVISION for appli docker'
  sudo apt-get install curl
  curl -fsSL https://get.docker.com/ | sh
  sudo groupadd docker
  sudo usermod -aG docker vagrant
  sudo chmod 777 /etc/default/docker
  echo "setup default config /etc/default/docker"
  sudo echo 'DOCKER_OPTS="-s devicemapper"' >> /etc/default/docker
  sudo modprobe aufs
  sudo service docker stop
  sudo service docker start
fi
sudo touch $PROVISIONED
