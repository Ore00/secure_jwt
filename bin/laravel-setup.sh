#!/bin/bash

echo "Create a new Laravel project in a temporary directory"
composer create-project --prefer-dist laravel/laravel temp-laravel-app

echo "Modify .env to use MySql"
sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=mysql/' temp-laravel-app/.env
sed -i 's/DB_HOST=.*/DB_HOST=laravel_db/' temp-laravel-app/.env
sed -i 's/DB_PORT=.*/DB_PORT=3306/' temp-laravel-app/.env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel/' temp-laravel-app/.env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=root/' temp-laravel-app/.env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=root/' temp-laravel-app/.env

echo "Rename redundant files"
mv temp-laravel-app/composer.json temp-laravel-app/composer-laravel.json
mv temp-laravel-app/composer.lock temp-laravel-app/composer-laravel.lock
mv temp-laravel-app/.env temp-laravel-app/.env.laravel
mv temp-laravel-app/.env.example temp-laravel-app/.env.example.laravel

echo "Remove Laravel ReadMe.md"
rm temp-laravel-app/README.md

echo "Copy Laravel files to the root project directory"
cp -r temp-laravel-app/* temp-laravel-app/.[!.]* ./

echo "Remove the temporary files and directories"
rm -rf temp-laravel-app

echo "Laravel project successfully copied and cleaned up."
