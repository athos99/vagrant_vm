#!/bin/bash
PROVISIONED="$HOME/provisioned/php56";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for  PHP 56'
echo '$$$$$$ set apt repository'
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
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
sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-cli php5.6-mysql php5.6-intl php5.6-dev php-xdebug
sudo apt-get install -y php5.6-curl php5.6-gd php5.6-odbc php5.6-xml php5.6-xmlrpc php5.6-xsl php5.6-ldap  php5.6-soap php5.6-mbstring
sudo apt-get install -y php5.6-opcache php5.6-bz php5.6-sqlite3 php5.6-zip php5.6-mcrypt
sudo apt-get install -y php-mongo php-memcache php-imagick php-redis php-memcached openssl
# ne pas utiliser php-apcu car il force le php7 en mode cli !!!
sudo rm -f /var/www/html/index.html
sudo ln -s /vagrant/php.ini  /etc/php/5.6/apache2/conf.d/90-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php/5.6/cli/conf.d/90-vagrant-php.ini
fi
sudo touch $PROVISIONED


