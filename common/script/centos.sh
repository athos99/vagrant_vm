#!/bin/bash
echo '$$$ PROVISION'
sudo mkdir -p "$HOME/provisioned"
sudo yum update -y
#!/bin/bash
PROVISIONED="$HOME/provisioned/centos";
if [ ! -f $PROVISIONED  ]; then
#sudo adduser vagrant www-data
fi
sudo touch $PROVISIONED
