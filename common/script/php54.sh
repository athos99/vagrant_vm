#!/bin/bash
PROVISIONED="$HOME/provisioned/php54";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for  PHP 54'
echo '$$$$$$ set apt repository'
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo add-apt-repository -y ppa:ondrej/php5-oldstable
sudo add-apt-repository -y ppa:ondrej/apache2
sudo apt-get update
echo '$$$ PROVISION for Apache2'
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod headers
sudo chmod 777 /etc/apache2/apache2.conf
echo "Include /vagrant/apache2.conf" >> /etc/apache2/apache2.conf
sudo chmod 777 /etc/apache2/apache2.conf
echo '$$$$$$ add php'
sudo apt-get install -y php5 php5-cli php5-mysql php5-xdebug php5-intl php5-curl php5-dev php5-gd php5-mcrypt php5-odbc php5-xmlrpc php5-xsl php5-ldap
sudo apt-get install -y php5-memcache php5-imagick php-apc
sudo rm -f /var/www/index.html
sudo ln -s /vagrant/php.ini  /etc/php5/conf.d/90-vagrant-php.ini
fi
sudo touch $PROVISIONED

