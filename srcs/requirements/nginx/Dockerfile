FROM debian:buster

RUN echo "salut"
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y nginx openssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
