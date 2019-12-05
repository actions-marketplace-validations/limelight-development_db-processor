FROM clockwise/php7-mysql-unit

ADD db-processor /db-processor
ADD docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
