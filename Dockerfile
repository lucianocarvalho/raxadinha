FROM php:7.4-fpm-alpine

RUN apk --update add --no-cache \
    $PHPIZE_DEPS \
    bash \
    oniguruma-dev \
    libpng-dev \
    openssl-dev \
    gd \
    nano \
    libxml2-dev \
    postgresql-dev \
    git \
    \
    && rm -rf /var/cache/apk/*

RUN if [ "$APP_STAGE" = "dev" ]; then \
    pecl install xdebug \
        && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.idekey=api.raxadinha.dev" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && docker-php-ext-enable xdebug; \
fi

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

COPY ./docker/php-fpm/php-fpm.conf /usr/local/etc
COPY ./docker/php-fpm/www.conf /usr/local/etc/php-fpm.d

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer;

COPY ./src /app

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR /app

RUN if [ "$APP_STAGE" = "dev" ] ; then \
    composer install --no-autoloader; \
else \
    composer install --no-autoloader --prefer-dist --no-dev --no-interaction --optimize-autoloader ; \
fi

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm", "-F", "-O"]