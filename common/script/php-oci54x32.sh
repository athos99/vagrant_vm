#!/bin/bash
PROVISIONED="$HOME/provisioned/php-oci54x32";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for OCI php54 32bits'
sudo apt-get install -y libaio1 libaio-dev unzip make
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
sudo ln -s /etc/php5/mods-available/oci8.ini  /etc/php5/conf.d/30-oci8.ini
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
