#!/bin/bash
PROVISIONED="$HOME/provisioned/php70";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for  PHP'
echo '$$$$$$ set apt repository'
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~ondrej/+archive/ubuntu/php
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
sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-mysql php7.0-intl php7.0-curl php7.0-bz2
sudo apt-get install -y php7.0-dev php7.0-gd php7.0-mcrypt
sudo apt-get install -y php7.0-odbc php7.0-ldap php7.0-zip php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-imap
sudo apt-get install -y php7.0-mbstring php7.0-opcache php7.0-soap php7.0-sqlite3
sudo apt-get install -y php-mongo php-imagick php-memcached php-redis php-pear php-xdebug
sudo apt-get install -y php-apcu php-uploadprogress sudo openssl
sudo rm -f /var/www/html/index.html
sudo ln -s /vagrant/php.ini  /etc/php/7.0/apache2/conf.d/90-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php/7.0/cli/conf.d/90-vagrant-php.ini
fi
sudo touch $PROVISIONED

