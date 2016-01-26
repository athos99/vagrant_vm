#!/bin/bash
PROVISIONED="$HOME/provisioned/php70";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for  PHP'
echo '$$$$$$ set apt repository'
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
echo '$$$$$$ add php'
sudo apt-get install -y php7.0 php7.0-cli php7.0-mysql php7.0-intl php7.0-curl php7.0-dev php7.0-gd php7.0-mcrypt php7.0-odbc php7.0-xmlrpc php7.0-xsl php7.0-ldap
sudo apt-get install -y php-mongodb php-imagick php-memcached php-redis php-pear php-xdebug
sudo rm -f /var/www/html/index.html
sudo ln -s /vagrant/php.ini  /etc/php/7.0/apache2/conf.d/90-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php/7.0/cli/conf.d/90-vagrant-php.ini
fi
sudo touch $PROVISIONED
