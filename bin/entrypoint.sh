#!/bin/sh

echo "Check if Composer dependencies are installed"
if [ ! -d "vendor" ]; then
  echo "Running laravel-setup"
  ./bin/laravel-setup.sh
  echo "Running composer install..."
  composer install
else
  echo "Dependencies already installed."
fi

echo "Check if migrations need to run"
if php artisan migrate:status | grep "No migrations found"; then
  echo "Running migrations..."
  php artisan migrate --force
else
  echo "Migrations are up to date."
fi

echo "Starting PHP-FPM"
exec php-fpm
