FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y mariadb-server mariadb-client procps

# Copy our config file and our script to configure and init mysql database
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/set_mariadb.sh /tmp

# Avoir mysqld problems
RUN mkdir /run/mysqld && chown -R mysql:root /run/mysqld

# Make sure that we can execute the script
RUN chmod +x /tmp/set_mariadb.sh

EXPOSE 3306

CMD ["/tmp/set_mariadb.sh"]
