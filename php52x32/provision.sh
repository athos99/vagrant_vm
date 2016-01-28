echo '$$$ PROVISION $$$$$$$$$'


sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties
echo '$$$ add repository pour PHP 5.2'
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
#sudo a2dismod mpm_event
#sudo a2enmod mpm_prefork
sudo a2enmod php52
sudo rm -f /var/www/index.html
echo '$$$ start web service'
sudo service apache2 restart
echo '$$$ make install oci8'
sudo apt-get install libaio1 libaio-dev unzip
sudo unzip -o /vagrant/instantclient-basic-linux-12.1.0.2.0.zip -d /usr/local/
sudo unzip -o /vagrant/instantclient-sdk-linux-12.1.0.2.0.zip -d /usr/local/
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
echo '$$$ add oci extension to php'
sudo touch /etc/php52/conf.d/oci8.ini
sudo chmod 777 /etc/php52/conf.d/oci8.ini
sudo echo 'extension=oci8.so' > /etc/php52/conf.d/oci8.ini
sudo chmod 777 /etc/php52/conf.d/oci8.ini
sudo ln -s /etc/php52/conf.d/oci8.ini  /etc/php52/apache2/conf.d/30-oci8.ini
sudo ln -s /etc/php52/conf.d/oci8.ini  /etc/php52/cli/conf.d/30-oci8.ini
sudo service apache2 restart
echo '$$$ set oracle environment variable'
sudo mkdir -p /usr/local/instantclient_12_1/network/admin
sudo cp /vagrant/admin/* /usr/local/instantclient_12_1/network/admin
sudo chmod 777 -R /usr/local/instantclient_12_1/network/admin
sudo echo TNS_ADMIN=/usr/local/instantclient_12_1/network/admin >> /etc/environment
export TNS_ADMIN=/usr/local/instantclient_12_1/network/admin
sudo chmod 777 /etc/apache2/envvars
sudo echo 'export ORACLE_HOME='$ORACLE_HOME >> /etc/apache2/envvars
sudo echo 'export TNS_ADMIN='$TNS_ADMIN  >> /etc/apache2/envvars
sudo echo 'export LD_LIBRARY_PATH='$LD_LIBRARY_PATH >> /etc/apache2/envvars
sudo chmod 777 /etc/apache2/envvars
sudo service apache2 restart
echo '$$$$ install apc'
sudo apt-get install libpcre3-dev
wget https://pecl.php.net/get/APC-3.1.13.tgz
tar -xzvf APC-3.1.13.tgz
sudo rm APC-3.1.13.tgz
cd APC-3.1.13
sudo phpize
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm -R APC-3.1.13
sudo touch /etc/php52/conf.d/apc.ini
sudo chmod 777 /etc/php52/conf.d/apc.ini
sudo echo 'extension=apc.so' > /etc/php52/conf.d/apc.ini
sudo chmod 777 /etc/php52/conf.d/apc.ini
sudo ln -s /etc/php52/conf.d/apc.ini  /etc/php52/apache2/conf.d/30-apc.ini
sudo ln -s /etc/php52/conf.d/apc.ini  /etc/php52/cli/conf.d/30-apc.ini
sudo service apache2 restart
echo '$$$ setup finish'
