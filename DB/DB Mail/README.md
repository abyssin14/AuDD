# Mise en place du serveur DB

Pour démarrer le service, vous devez créer votre image à travers la commande:
```bash
docker build -t db .
```
Une fois le processus terminé, veillez démarrer le containeur à travers la commande:
```bash
docker run -it -d --name db --hostname db -p 3306:3306/tcp bash
```
Executez le conteneur:
```bash
docker exec -it mail bash
```
