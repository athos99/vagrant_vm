#!/bin/bash
PROVISIONED="$HOME/provisioned/php-apc52";
if [ ! -f $PROVISIONED  ]; then
echo '$$$ PROVISION for APC php52'
sudo apt-get install -y libpcre3-dev
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
fi
sudo touch $PROVISIONED
