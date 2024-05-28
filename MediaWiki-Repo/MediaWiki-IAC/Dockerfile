# Use the official PHP image as a base
FROM php:7.4-apache

# Install required PHP extensions and tools
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    wget \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli

# Download and extract MediaWiki
RUN wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.1.tar.gz \
    && tar -xvzf mediawiki-1.36.1.tar.gz -C /var/www/html --strip-components=1 \
    && rm mediawiki-1.36.1.tar.gz

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy LocalSettings.php if exists
COPY LocalSettings.php /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
