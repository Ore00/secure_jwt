FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd curl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy the current directory into the container
COPY . .

# Set permissions for the app
RUN chown -R www-data:www-data /var/www

# Install dependencies 
RUN composer install

# Copy additional scripts
COPY bin/wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY bin/laravel-setup.sh /usr/local/bin/laravel-setup.sh

# Make the scripts executable
RUN chmod +x /usr/local/bin/laravel-setup.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Run the Laravel setup script
RUN /usr/local/bin/setup-laravel.sh

# Expose the port for the application
EXPOSE 9000

# Start server
CMD ["php-fpm"]