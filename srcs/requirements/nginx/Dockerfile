FROM debian:buster

# Installation
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl

# Copy conf file
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN chmod -R 755 /etc/nginx/conf.d/nginx.conf

# certificat generation
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl_certif.crt -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=ybellot.42.fr"

# Volume mount
RUN mkdir -p /var/www/html
RUN chmod -R 755 /var/www/html #for root
RUN chown -R www-data:www-data /var/www/html #for main user

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

#Explication generation certificat
#RUN: C'est une directive dans un Dockerfile qui permet d'exécuter une commande pendant la construction de l'image Docker.
#openssl req: C'est la commande OpenSSL pour générer une requête de certificat.
#-x509: Cette option indique à OpenSSL de générer un certificat auto-signé plutôt qu'une demande de signature de certificat (CSR).
#-nodes: Cette option indique à OpenSSL de ne pas chiffrer la clé privée générée.
#-out /etc/nginx/ssl/ssl_certif.crt: Spécifie le chemin de sortie où le certificat SSL auto-signé sera enregistré. Dans ce cas, le certificat sera enregistré sous /etc/nginx/ssl/ssl_certif.crt.
#-keyout /etc/nginx/ssl/ssl_key.key: Spécifie le chemin de sortie où la clé privée correspondante au certificat sera enregistrée. Dans ce cas, la clé sera enregistrée sous /etc/nginx/ssl/ssl_key.key.
#-subj "/C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=cwybellotwdebotte.42.fr": Spécifie les informations du sujet du certificat, telles que le pays (C), l'État (ST), la ville (L), l'organisation (O), l'unité organisationnelle (OU) et le nom commun (CN). Dans cet exemple, le certificat sera émis pour le domaine ybellot.42.fr avec d'autres informations d'identification spécifiées.
