# Mise en place du service Mail

**NB**: Veillez tout d'abord mettre en place le serveur de base de données en suivant les instructions décrites [ici](https://github.com/melvinmajor/AuDD/tree/master/DB/DB%20Mail).

Tout d'abord, vous devez créer l'image de notre serveur Mail à travers la commande:
```bash
docker build -t mail_image .
```
Une fois le processus terminé, veillez démarrer le containeur à travers la commande:
```bash
docker run --name mail_container --hostname mail.funndeh.com --dns dns_server --dns-search domain.com -it -d \
           -p 25:25/tcp -p 465:465/tcp -p 110:100/tcp -p 143:143/tcp -p 995:995/tcp -p 993:993/tcp -p 23:23 \
           -p 587:587/tcp mail_image /bin/bash 
```
Ici nous créeons le containeur avec comme nom d'hôte et 
Assurez vous de remplacer **dns_server** par l'adresse IP du NS serveur de votre domaine ainsi que **domain.com** par le nom de domaine.
Executez le conteneur:
```bash
docker exec -it mail_container bash
```
Puis démarrer les services dans le conteneur:
```bash
 service postfix start
 service mysql start
 service dovecot start
 service spamassassin start
 service opendkim start
 service postfix reload
```
