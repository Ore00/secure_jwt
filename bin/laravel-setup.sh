#!/bin/bash

# 1. Create a new Laravel project in a temporary directory
composer create-project --prefer-dist laravel/laravel temp-laravel-app

# 2. Rename redundant files
mv temp-laravel-app/composer.json temp-laravel-app/composer-laravel.json
mv temp-laravel-app/composer.lock temp-laravel-app/composer-laravel.lock
mv temp-laravel-app/.env.example temp-laravel-app/.env.example.laravel

# 3. Copy Laravel files to the root project directory
cp -r temp-laravel-app/* temp-laravel-app/.[!.]* ./

# 4. Remove the temporary files and directories
rm composer-laravel.json
rm composer-laravel.lock
rm .env.example.laravel
rm -rf temp-laravel-app

echo "Laravel project successfully copied and cleaned up."
