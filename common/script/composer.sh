#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/composer";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for composer'
sudo apt-get -y install git
sudo chmod 0755 /root
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo chmod -R 0755 /root/.composer
echo PATH=\$PATH:$HOME/.composer/vendor/bin >> /home/vagrant/.profile
fi
sudo touch $PROVISIONED
