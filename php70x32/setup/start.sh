#!/bin/bash
echo '$$$ php70x32 START'

sudo service apache2 stop
sudo service apache2 start
if [[ -f "/etc/mysql/conf.d/mysql.cnf"  ]]; then
sudo rm /etc/mysql/conf.d/mysql.cnf
fi
sudo cp /vagrant/mysql.cnf  /etc/mysql/conf.d/
sudo chmod 644 /etc/mysql/conf.d/mysql.cnf
sudo service mysql stop
sudo service mysql start



