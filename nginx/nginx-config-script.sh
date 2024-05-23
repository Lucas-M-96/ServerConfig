#!/bin/bash
file_name="all_apps_https"

source_path="~/actions-runner/_work/ServerConfig/ServerConfig/nginx/sites-available/${file_name}"
available_path="/etc/nginx/sites-available/${file_name}"
enabled_path="/etc/nginx/sites-enabled/${file_name}"

if [ -f "$enabled_path" ]
then
    echo "NGINX Configuration file already exists, renewing file..."
    rm "$enabled_path"
else
    echo "NGINX Configuration file doesn't exist, creating file..."
fi

cp "$source_path" "$available_path"

# chcon unconfined_u:object_r:httpd_config_t:s0 "$available_path"
# chown root:root "$available_path"

ln -s "$available_path" "$enabled_path"

sudo nginx -t
sudo systemctl reload nginx
