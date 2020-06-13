FROM php:7.4-fpm-alpine

RUN apk --update add --no-cache \
    oniguruma-dev \
    libpng-dev \
    openssl-dev \
    nginx \
    supervisor \
    gd \
    nano \
    libxml2-dev \
    postgresql-dev \
    git \
    && rm -rf /var/cache/apk/*

RUN docker-php-ext-install \
        pdo \
        pdo_pgsql \
        mbstring \
        gd \
        soap \
        xml \
        posix \
        tokenizer \
        ctype \
        pcntl \
        opcache

RUN mkdir -p /run/nginx

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer;

RUN chown -R www-data:www-data /var/lib/nginx;

WORKDIR /app

COPY --chown=www-data:www-data ./src /app
COPY --chown=www-data:www-data ./docker/nginx/ /etc/nginx
COPY --chown=www-data:www-data ./docker/supervisord.conf /etc

COPY ./docker/php-fpm/php-fpm.conf /usr/local/etc
COPY ./docker/php-fpm/www.conf /usr/local/etc/php-fpm.d

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]