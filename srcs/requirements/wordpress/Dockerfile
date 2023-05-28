FROM debian:buster

# Update and installations
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php7.3-common
RUN apt-get install -y mariadb-client wget

# Installation wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Create the folder of the website and give www-data access to it, www-data is the user under wich the web server process run
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Copy of the wordpress configuration file
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Copy of the configuration script
COPY tools/set_wordpress.sh /var/www/set_wordpress.sh
RUN chmod +x /var/www/set_wordpress.sh

WORKDIR /var/www/html
EXPOSE 9000

CMD ["/var/www/set_wordpress.sh"]
