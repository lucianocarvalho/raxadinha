FROM php:7.4-fpm-alpine

RUN apk --update add --no-cache \
    $PHPIZE_DEPS \
    bash \
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
    \
    && rm -rf /var/cache/apk/*

RUN pecl install xdebug \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=api.raxadinha.dev" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && docker-php-ext-enable xdebug

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