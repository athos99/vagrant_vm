#!/usr/bin/env bash


PROVISIONED="$HOME/provisioned/composer";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for composer'
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi
sudo touch $PROVISIONED