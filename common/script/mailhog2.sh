#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/mailhog.0.1.8";
if [[ ! -f $PROVISIONED  ]]; then
echo '$$$ PROVISION for mailhog'
if [[ -f "/usr/local/bin/mailhog"  ]]; then
sudo rm /usr/local/bin/mailhog
fi
sudo wget -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v0.1.8/MailHog_linux_386
sudo chmod 755 /usr/local/bin/mailhog
sudo rm /usr/sbin/sendmail
sudo rm /usr/lib/sendmail
sudo cp /home/vagrant/common/ruby/sendmail2 /usr/sbin
sudo mv /usr/sbin/sendmail2 /usr/sbin/sendmail
sudo cp /home/vagrant/common/ruby/sendmail2 /usr/lib
sudo mv /usr/lib/sendmail2 /usr/lib/sendmail
sudo chmod 755 /usr/sbin/sendmail
sudo chmod 755 /usr/lib/sendmail
fi
sudo touch $PROVISIONED
