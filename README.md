## Caisse du jour

Interface pour l'opération d'une caisse de jour qui enregistre des encaissements en billets, pièces et centimes et en fait le récapitulatif.

### Prérequis pour l'exécution du projet

Pour l'exécution de ce projet il est nécessaire de suivre la démarche suivante:

- Installer l'environnement [Xampp Server]()
- Installer l'outil [Git]()
- Cloner le projet en exécutant la commande [git clone https://github.com/gaelfokou/caisse-du-jour.git](https://github.com/gaelfokou/caisse-du-jour.git) dans le dossier public [www]() de l'environnement [Xampp Server]()
- Démarrez les serveurs Apache et PhpMyAdmin de l'environnement [Xampp Server]()
- Lancer PhpMyAdmin sur votre navigateur, ensuite connectez vous et créez une base de données [laravel]()
- Importez le fichier [caisse-du-jour.sql]() contenu à la racine du projet [caisse-du-jour]() dans votre base de données nouvellement créée
- Modifiez le fichier [.env]() contenu à la racine du projet [caisse-du-jour]() par vos informations
  - DB_CONNECTION=mysql
  - DB_HOST=127.0.0.1
  - DB_PORT=3306
  - DB_DATABASE=laravel
  - DB_USERNAME=root
  - DB_PASSWORD=password
