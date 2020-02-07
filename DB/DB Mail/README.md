# Mise en place du serveur DB

Pour démarrer le service, vous devez créer votre image à travers la commande:
```bash
docker build -t mail_image .
```
Une fois le processus terminé, veillez démarrer le containeur à travers la commande:
```bash
docker run -it -d --name mail --hostname mail -p 3306:3306/tcp
```
Ici nous créeons le containeur avec comme nom d'hôte et 
Assurez vous de remplacer **dns_server** par l'adresse IP du NS serveur de votre domaine ainsi que **domain.com** par le nom de domaine.
Executez le conteneur:
```bash
docker exec -it mail
```
