FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl

COPY conf/inception.conf /etc/nginx/conf.d/inception.conf
RUN chmod -R 755 /etc/nginx/conf.d/inception.conf

RUN mkdir -p /etc/nginx/ssl
# Create the key and the certifcate for TSL protocol
# -x509 refers to the certificate's type
# -out and -keyout parameters refers to where the certificate will be saved
# -subj refers to the command response (Country, STate, Locality, Organization name, Organizational Unit name, Common Name (we can use our name))
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl_certif.crt -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=ybellot.42.fr"

RUN mkdir -p /var/www/html && chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
