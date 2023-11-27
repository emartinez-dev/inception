FROM alpine:3.17

RUN apk update && apk add mariadb-client php81 php81-fpm php81-curl php81-mysqli php81-phar

COPY tools/wordpress.sh /
COPY conf/php-fpm.conf /etc/php/8.1/fpm/php-fpm.conf

RUN addgroup -S nginx && adduser -S nginx -G nginx

CMD ["/wordpress.sh"]
