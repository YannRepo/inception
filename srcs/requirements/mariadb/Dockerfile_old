FROM debian:buster

RUN echo "lancement dockerfile mariadb"
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/set_mariadb.sh /tmp/set_mariadb.sh

RUN chmod +x /tmp/set_mariadb.sh

EXPOSE 3306

#CMD ["/tmp/set_mariadb.sh"]
