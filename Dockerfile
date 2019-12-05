FROM clockwise/php7-mysql-unit

COPY db-processor /db-processor
COPY docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
