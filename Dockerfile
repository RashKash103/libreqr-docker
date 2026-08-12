FROM composer:2.10.2 AS builder

# Copy the source to the builder container
COPY /libreqr /app

# Install the dependencies
RUN composer install --no-dev --optimize-autoloader

FROM php:8.5-apache

# Install the PHP extensions we need
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd mbstring iconv

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copy the Apache configuration file to the container
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Copy the source from the builder container to the production container
COPY --from=builder /app /var/www/html
