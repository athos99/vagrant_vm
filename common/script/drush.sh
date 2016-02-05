#!/usr/bin/env bash
PROVISIONED="$HOME/provisioned/drush";
if [[ ! -f $PROVISIONED  ]]; then
sudo composer global require drush/drush:7.1.0
fi
sudo touch $PROVISIONED

