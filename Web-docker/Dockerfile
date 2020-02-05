FROM ubuntu:latest

RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y apache2 php php-mysql nano 
RUN a2enmod ssl
RUN a2enmod rewrite

COPY WEB/audd.conf /etc/apache2/sites-available

RUN ln -s /etc/apache2/sites-available/audd.conf /etc/apache2/sites-enabled



EXPOSE 80 443

CMD apachectl -DFOREGROUND
