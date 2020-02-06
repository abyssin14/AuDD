openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=BE/ST=Ottignies/L=Louvain-la-Neuve/O=Audd/CN=www.funndeh.com" \
    -keyout "/etc/ssl/private/dovecot.pem"  -out "/etc/ssl/certs/dovecot.pem"

mkdir -p /var/mail/vhosts/funndeh.com
groupadd -g 5000 vmail 
useradd -g vmail -u 5000 vmail -d /var/mail
chown -R vmail:vmail /var/mail

chown -R vmail:dovecot /etc/dovecot
chmod -R o-rwx /etc/dovecot 

service mysql start
/etc/init.d/mysql start

openssl genrsa -out /etc/opendkim/opendkim.key 1024
openssl rsa -in /etc/opendkim/opendkim.key -pubout -out /etc/opendkim/opendkim.pub.key
chmod "u=rw,o=,g=" /etc/opendkim/opendkim.key
chown opendkim:opendkim /etc/opendkim/opendkim.key
chmod 600 /etc/opendkim/opendkim.key

