FROM alpine:3.17

RUN apk update && apk add mariadb-client php81 php81-fpm php81-curl php81-mysqli

COPY tools/wordpress.sh /

CMD ["/wordpress.sh"]
