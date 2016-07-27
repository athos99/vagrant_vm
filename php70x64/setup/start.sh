#!/bin/bash
echo '$$$ php70x64 START'
sudo mkdir -p /var/www/html/logs
if [[ ! -f "/var/www/html/logs/test_log.php" ]]; then
sudo echo '<?php $a=$b[1]; ' > /var/www/html/logs/test_log.php
fi

sudo mkdir -p /var/www/html/mails
if [[ ! -f "/var/www/html/mails/test_mail.php" ]]; then
sudo echo '<?php echo mail("no-reply@etat.ge.ch", "le sujet", "le message", "From: webmaster@example.com");' > /var/www/html/mails/test_mail.php
fi

sudo service apache2 stop
sudo service apache2 start
if [[ -f "/etc/mysql/conf.d/mysql.cnf"  ]]; then
sudo rm /etc/mysql/conf.d/mysql.cnf
fi
sudo cp /vagrant/mysql.cnf  /etc/mysql/conf.d/
sudo chmod 644 /etc/mysql/conf.d/mysql.cnf
sudo service mysql stop
sudo service mysql start



