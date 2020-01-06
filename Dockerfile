FROM php:7.1-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

ADD db-processor /db-processor
ADD docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
