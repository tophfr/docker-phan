FROM php:7.3-alpine

MAINTAINER toph <toph@toph.fr>

ENV COMPOSER_VERSION=1.8.0
RUN export COMPOSER_HOME=/tmp/composer \
    && cd /usr/local/bin \
    && EXPECTED_SIGNATURE=$(curl -sSL https://composer.github.io/installer.sig) \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');") \
    && if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then >&2 echo 'ERROR: Invalid installer signature'; exit 1; fi \
    && php composer-setup.php --version=$COMPOSER_VERSION \
    && php -r "unlink('composer-setup.php');" \
    && ln -s composer.phar composer \
    && rm -Rf $COMPOSER_HOME

ENV COMPOSER_HOME /usr/local/lib/composer
ENV COMPOSER_BIN_DIR /usr/local/bin

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install ast \
    && docker-php-ext-enable ast \
    && rm -rf /tmp/pear \
    && apk del .build-deps

RUN composer global require phan/phan \
    && composer global clear-cache

COPY config.php /
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
