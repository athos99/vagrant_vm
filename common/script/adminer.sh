#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/adminer";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for adminer'
if [[ ! -f "/var/www/html/adminer.php"  ]]; then
echo '$$$$$$ add adminer.php'
sudo wget -O /var/www/html/adminer.php https://www.adminer.org/static/download/4.2.3/adminer-4.2.3.php
fi
fi
sudo touch $PROVISIONED
