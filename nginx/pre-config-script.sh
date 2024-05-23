#!/bin/bash

# this script must be manualy executed as root to correctly define permissions for nginx configuration related file
# if this script is not executed (manualy) at least once before turning on Github action, there is a risk that the github action workflow will fail due to permission related issues

cd /etc/nginx

# To rm the link in sites-enabled

sudo chmod 775 sites-enabled
sudo chgrp nginx-configurer sites-enabled/

# To cp the config file from the github repo to nginx

sudo chmod 775 sites-available/
sudo chgrp nginx-configurer sites-available/
