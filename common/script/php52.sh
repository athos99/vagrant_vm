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
sudo apt-get install -y php52-cli libapache2-mod-php52 php52-mod-curl php52-mod-gettext php52-mod-json php52-mod-ldap php52-mod-mbstring php52-mod-mcrypt php52-mod-mysql php52-mod-soap php52-mod-simplexml
sudo apt-get install -y php52-dev php52-pear php52-pecl
sudo apt-get install -y php52-mod-xdebug
sudo ln -s /etc/php52/conf.d/xdebug.ini /etc/php52/apache2/conf.d/xdebug.ini
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod headers
sudo a2enmod php52
sudo rm -f /var/www/index.html
sudo ln -s /vagrant/php.ini  /etc/php52/apache2/conf.d/90-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php52/cli/conf.d/90-vagrant-php.ini
fi
sudo touch $PROVISIONED
