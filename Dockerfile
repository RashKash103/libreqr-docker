FROM php:8.3-apache

# Install the PHP extensions we need
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd mbstring iconv

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copy the source to the container
COPY /libreqr /var/www/html

# Make the /css directory writable by the web server
RUN chown -R www-data:www-data /var/www/html/css
