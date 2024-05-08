# Use the official PHP image as the base image
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mbstring exif pcntl bcmath opcache

# Copy Laravel application files
COPY ./src .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install

# Generate Laravel key
RUN php artisan key:generate

# Run laravel migration
RUN php artisan migrate

# Expose port 80
EXPOSE 9000

# Copy entrypoint script into container
COPY entrypoint.sh /usr/bin/entrypoint.sh

# Set permissions for entrypoint script
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["php-fpm"]
