#!/bin/bash
PROVISIONED="$HOME/provisioned/php";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for Apache2'
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod headers
sudo chmod 777 /etc/apache2/apache2.conf
echo "Include /vagrant/apache2.conf" >> /etc/apache2/apache2.conf
sudo chmod 777 /etc/apache2/apache2.conf
fi
sudo touch $PROVISIONED
