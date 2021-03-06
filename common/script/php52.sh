#!/bin/bash
PROVISIONED="$HOME/provisioned/php52";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for  PHP 52'
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~sergey-dryabzhinsky/+archive/ubuntu/php52?field.series_filter=trusty
sudo add-apt-repository -y ppa:sergey-dryabzhinsky/php52
sudo add-apt-repository -y ppa:sergey-dryabzhinsky/php52-modules
sudo apt-get update
echo '$$$ install apache2'
sudo apt-get install -y apache2 apache2-mpm-prefork
echo '$$$ install php 5.2'
sudo apt-get install -y php52-cli libapache2-mod-php52 php52-mod-curl php52-mod-gettext php52-mod-json php52-mod-ldap
sudo apt-get install -y php52-mod-mbstring php52-mod-mcrypt php52-mod-mysql php52-mod-soap php52-mod-simplexml
sudo apt-get install -y php52-dev php52-pear php52-pecl php52-mod-xcache php52-mod-gd php52-mod-zip php52-mod-xml
sudo apt-get install -y php52-mod-xmlwriter php52-mod-xmlreader php52-mod-xmlrpc
sudo apt-get install -y php52-mod-xdebug
sudo ln -s /etc/php52/conf.d/50-xcache.ini /etc/php52/apache2/conf.d/50-xcache.ini
sudo ln -s /etc/php52/conf.d/50-xcache.ini /etc/php52/cli/conf.d/50-xcache.ini
sudo ln -s /etc/php52/conf.d/xdebug.ini /etc/php52/apache2/conf.d/xdebug.ini
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod headers
sudo a2enmod php52
sudo rm -f /var/www/index.html
sudo ln -s /vagrant/php.ini  /etc/php52/apache2/conf.d/zzzzzz01-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php52/cli/conf.d/zzzzzz01-vagrant-php.ini
fi
sudo touch $PROVISIONED

PROVISIONED="$HOME/provisioned/php52ssl";
if [ ! -f $PROVISIONED  ]; then
wget http://packages.rusoft.ru/ppa/rusoft/php-libs/pool/ubuntu-precise/i386/openssl098r/libssl098r_0.9.8o-7ubuntu4rusoft7~precise1_i386.deb
sudo dpkg -i libssl098r_0.9.8o-7ubuntu4rusoft7~precise1_i386.deb
sudo apt-get install -y php52-mod-openssl
fi
sudo touch $PROVISIONED
