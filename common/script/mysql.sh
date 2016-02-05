#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/mysql";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for mySql server'
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server

echo 'CREATE USER "user"@"%"; ' | mysql -u root
echo 'SET password FOR "user"@"%" = password("user")'| mysql -u root;
echo 'GRANT ALL ON *.* TO "user"@"%"' | mysql -u root;

fi
sudo touch $PROVISIONED
