#!/bin/bash
echo '$$$ PROVISION'
sudo mkdir -p "$HOME/provisioned"

PROVISIONED="$HOME/provisioned/php";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for Apache and PHP'
echo '$$$$$$ set apt repository'
sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties curl
#### https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo add-apt-repository -y ppa:ondrej/php5-5.6
sudo apt-get update
echo '$$$$$$ add apache2'
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod alias
sudo a2enmod headers

sudo chmod 777 /etc/apache2/apache2.conf
echo "Include /vagrant/apache2.conf" >> /etc/apache2/apache2.conf
sudo chmod 777 /etc/apache2/apache2.conf

echo '$$$$$$ add php'
sudo apt-get install -y php5 php5-cli php5-mysql php5-xdebug php5-intl php5-curl php5-dev php5-gd php5-mcrypt php5-odbc php5-xmlrpc php5-xsl php5-ldap
sudo apt-get install -y php5-mongo php5-memcache php5-imagick php5-redis
sudo rm -f /var/www/html/index.html
sudo ln -s /vagrant/php.ini  /etc/php5/apache2/conf.d/90-vagrant-php.ini
sudo ln -s /vagrant/php.ini  /etc/php5/cli/conf.d/90-vagrant-php.ini
echo '$$$$$$ make oci8 module'
sudo apt-get install libaio1 libaio-dev unzip
sudo unzip -o /home/vagrant/common/oracle/instantclient-basic-linux-12.1.0.2.0.zip -d /usr/local/
sudo unzip -o /home/vagrant/common/oracle/instantclient-sdk-linux-12.1.0.2.0.zip -d /usr/local/
sudo echo LD_LIBRARY_PATH=/usr/local/instantclient_12_1:$LD_LIBRARY_PATH >> /etc/environment
export LD_LIBRARY_PATH=/usr/local/instantclient_12_1:$LD_LIBRARY_PATH
sudo echo ORACLE_HOME=/usr/local/instantclient_12_1 >> /etc/environment
export ORACLE_HOME=/usr/local/instantclient_12_1
ln -s /usr/local/instantclient_12_1 /usr/local/instantclient
ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient/libocci.so.12.1 /usr/local/instantclient/libocci.so
wget https://pecl.php.net/get/oci8-2.0.10.tgz
tar -xzvf oci8-2.0.10.tgz
sudo rm oci8-2.0.10.tgz
cd oci8-2.0.10
sudo phpize
sudo ./configure --with-oci8=shared,instantclient,/usr/local/instantclient
sudo make
sudo make install
cd ..
sudo rm -R oci8-2.0.10
echo '$$$$$$ add oci extension to php'
sudo touch /etc/php5/mods-available/oci8.ini
sudo chmod 777 /etc/php5/mods-available/oci8.ini
sudo echo 'extension=oci8.so' > /etc/php5/mods-available/oci8.ini
sudo chmod 777 /etc/php5/mods-available/oci8.ini
sudo ln -s /etc/php5/mods-available/oci8.ini  /etc/php5/apache2/conf.d/30-oci8.ini
sudo ln -s /etc/php5/mods-available/oci8.ini  /etc/php5/cli/conf.d/30-oci8.ini
sudo service apache2 restart
echo '$$$$$$ add env oracle'
sudo echo TNS_ADMIN=/usr/local/instantclient_12_1/network/admin >> /etc/environment
export TNS_ADMIN=/usr/local/instantclient_12_1/network/admin
sudo chmod 777 /etc/apache2/envvars
sudo echo 'export ORACLE_HOME='$ORACLE_HOME >> /etc/apache2/envvars
sudo echo 'export TNS_ADMIN='$TNS_ADMIN  >> /etc/apache2/envvars
sudo echo 'export LD_LIBRARY_PATH='$LD_LIBRARY_PATH >> /etc/apache2/envvars
sudo chmod 777 /etc/apache2/envvars
fi
sudo touch $PROVISIONED

sudo mkdir -p /usr/local/instantclient_12_1/network/admin
sudo cp /home/vagrant/common/tns-admin/* /usr/local/instantclient_12_1/network/admin
sudo chmod 777 -R /usr/local/instantclient_12_1/network/admin




PROVISIONED="$HOME/provisioned/mysql";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for mySql server'
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
fi
sudo touch $PROVISIONED

PROVISIONED="$HOME/provisioned/composer";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for composer'
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi
sudo touch $PROVISIONED

PROVISIONED="$HOME/provisioned/adminer";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for adminer'
if [[ ! -f "/var/www/html/adminer.php"  ]]; then
echo '$$$$$$ add adminer.php'
sudo wget -O /var/www/html/adminer.php https://www.adminer.org/static/download/4.2.3/adminer-4.2.3.php
fi
fi
sudo touch $PROVISIONED

