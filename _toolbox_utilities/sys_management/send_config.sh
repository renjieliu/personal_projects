#!/bin/bash

set -e

cd /home/pi/Share/mail_config
touch 1.zip
rm /home/pi/Share/mail_config/*.zip
zip -P xxxxxxxxx config_prod.zip  /home/pi/.config/rclone/rclone.conf /home/pi/.bashrc /home/pi/.nanorc
echo "" | mail -A /home/pi/Share/mail_config/config_prod.zip -s "$(hostname): Message from $(hostname), Here's my config file on $(hostname)" xxxxx@xxxxxxx.com


