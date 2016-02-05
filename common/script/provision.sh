#!/bin/bash
echo '$$$ PROVISION'
sudo mkdir -p "$HOME/provisioned"
sudo apt-get update
#!/bin/bash
PROVISIONED="$HOME/provisioned/provision";
if [ ! -f $PROVISIONED  ]; then
sudo adduser vagrant www-data
fi
sudo touch $PROVISIONED
