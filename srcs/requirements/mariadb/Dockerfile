FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /

# por algún motivo, no se puede arrancar mariadb aqui y lo tengo que hacer en el script
# RUN service mariadb start

# si corro el daemon de mysql aqui, el script no me pilla las variables de entorno
# y si llamo al script desde CMD no funciona el daemon xd

CMD ["/mariadb.sh"]
