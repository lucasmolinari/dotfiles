#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/laravel/project"
  exit 1
fi

cd "$1" || { echo "Directory not found: $1"; exit 1; }

sudo chown -R "$USER":www-data .

sudo find . -type f -exec chmod 664 {} \;
sudo find . -type d -exec chmod 775 {} \;

sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

sudo setfacl -R -m u:www-data:rwX -m u:"$USER":rwX storage bootstrap/cache
sudo setfacl -dR -m u:www-data:rwX -m u:"$USER":rwX storage bootstrap/cache
