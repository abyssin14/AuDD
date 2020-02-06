FROM ubuntu:18.04

MAINTAINER Manuelle Ndamtang <m.ndamtang@students.ephec.be>

RUN apt-get update &&\
	DEBIAN_FRONTEND=noninteractive apt-get -y -q install postfix postfix-mysql dovecot-core dovecot-pop3d dovecot-imapd dovecot-lmtpd dovecot-mysql mailutils mysql-server binutils net-tools telnet spamassassin spamc opendkim opendkim-tools --no-install-recommends

ADD config.sh ./postfix/mysql-virtual-mailbox-maps.cf ./postfix/mysql-virtual-mailbox-domains.cf ./postfix/mysql-virtual-alias-maps.cf /tmp/
RUN chmod +x /tmp/config.sh 

WORKDIR /etc/postfix
VOLUME /etc/postfix

COPY ./postfix/main.cf .
COPY ./postfix/master.cf .    

#RUN /tmp/config.sh

WORKDIR /etc/dovecot
VOLUME /etc/dovecot

COPY ./dovecot/dovecot.conf . 
COPY ./dovecot/dovecot-sql.conf.ext .

WORKDIR /etc/dovecot/conf.d
VOLUME /etc/dovecot/conf.d

COPY ./dovecot/auth-sql.conf.ext .
COPY ./dovecot/10-mail.conf .
COPY ./dovecot/10-master.conf .
COPY ./dovecot/10-auth.conf .
COPY ./dovecot/10-mail.conf .
COPY ./dovecot/10-ssl.conf .

ADD ./postfix/mysql-virtual-mailbox-domains.cf /etc/postfix

#Pour s'assurer que Postfix trouve le domaine
RUN postmap -q funndeh.com mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf

ADD ./postfix/mysql-virtual-mailbox-maps.cf /etc/postfix

#Pour le moment , nous allons nous assurer que Postfix trouve votre première adresse e-mail avec la cette commande
RUN postmap -q compta@funndeh.com mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf

ADD ./postfix/mysql-virtual-alias-maps.cf /etc/postfix

RUN postmap -q noreply@funndeh.com mysql:/etc/postfix/mysql-virtual-alias-maps.cf

RUN mkdir -p /etc/opendkim/ &&\
        mv /etc/opendkim.conf /etc/opendkim/ &&\
        ln -s /etc/opendkim/opendkim.conf /etc/opendkim.conf    
                                                               
RUN /tmp/config.sh

EXPOSE 25 143 465 993 110 995 3306

RUN adduser spamd --disabled-login
COPY ./spamassassin/local.cf /etc/spamassassin/
COPY ./spamassassin/spamassassin /etc/default/spamassassin

COPY ./opendkim /etc/default
ADD ./KeyTable /etc/opendkim
ADD ./SigningTable /etc/opendkim
ADD ./TrustedHosts /etc/opendkim
ADD ./opendkim.conf /etc/opendkim
