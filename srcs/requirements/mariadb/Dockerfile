FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y mariadb-server mariadb-client

# Copy configuration files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/set_mariadb.sh /tmp

# Mariadb restart without
RUN mkdir /run/mysqld && chown -R mysql:root /run/mysqld

# Give the script rights
RUN chmod +x /tmp/set_mariadb.sh

EXPOSE 3306

CMD ["/tmp/set_mariadb.sh"]
