FROM php:5.6-apache

RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/archive.debian.org\/debian/g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/security.debian.org\/debian-security/http:\/\/archive.debian.org\/debian-security/g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update --allow-unauthenticated

RUN apt-get install -y --allow-unauthenticated \
    libzip-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    zlib1g-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    \
    curl \
    # libpng-dev \
    # libjpeg-dev \
    # libfreetype6-dev \
    # libjpeg62-turbo-dev \
    # libmcrypt-dev \
    # libgd-dev \
    # jpegoptim optipng pngquant gifsicle \
    # libonig-dev \
    # libxml2-dev \
    zip \
    unzip

    
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) mysql pdo_mysql opcache zip curl mbstring gd


RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick
RUN docker-php-ext-enable imagick


RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "ServerName localhost" > /etc/apache2/conf-available/00-servername.conf && a2enconf 00-servername


RUN a2enmod rewrite

#RUN ln -sf /var/www/html/logs/access.log /var/log/apache2/access.log && ln -sf /var/www/html/logs/error.log /var/log/apache2/error.log


CMD ["apache2-foreground"]