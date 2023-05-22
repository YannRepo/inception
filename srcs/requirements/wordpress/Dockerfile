FROM debian:buster

RUN echo "lancement dockerfile wordpress"
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y php7.3-common
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

EXPOSE 9000

COPY tools/set_wordpress.sh /tmp/set_wordpress.sh
RUN chmod +x /tmp/set_wordpress.sh
CMD ["/tmp/set_wordpress.sh"]


