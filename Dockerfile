FROM alpine:3.11

RUN apk --update --no-cache add bash php7 php7-pdo php7-pdo_mysql
RUN rm -rf /var/cache/apk/*

ADD db-processor /db-processor
ADD docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
