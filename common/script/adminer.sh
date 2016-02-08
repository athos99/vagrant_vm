#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/adminer.4.2.4";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for adminer'
if [[ -f "/var/www/html/adminer.php"  ]]; then
sudo rm /var/www/html/adminer.php
fi
echo '$$$$$$ add adminer.php'
sudo wget -O /var/www/html/adminer.php https://www.adminer.org/static/download/4.2.4/adminer-4.2.4.php
fi
sudo touch $PROVISIONED
