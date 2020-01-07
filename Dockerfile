FROM burnett0/alpine-php7-cli-pdo-mysql

COPY db-processor /
COPY docker/entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
