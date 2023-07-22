# Unikin_package

## Projet d'équipe dans le cadre du cours de Calculateur

Ce script bash est conçu pour simplifier l'installation de paquets .deb à partir d'un dépôt git. Il
propose deux options : installer tous les paquets disponibles ou sélectionner des paquets
spécifiques à installer. Le script gère également les dépendances des paquets si nécessaire.

## Utilisation

1. Assurez-vous d'avoir les privilèges sudo pour exécuter certaines commandes nécessitant des
autorisations élevées.
2. Assurez vous d'avoir git installé sur votre machine
3. Exécutez le script en utilisant la commande suivante :

    ```bash
    ./UnikinPackage.bash
    ```

4. Suivez les instructions affichées à l'écran pour choisir une option dans le menu.

## Fonctionnalités

- Le script affiche un menu avec trois options :

1. Installer tous les paquets : Cette option permet de cloner un dépôt git contenant des
paquets .deb, d'afficher la liste des paquets disponibles et d'installer le paquet choisi par
l'utilisateur. Il gère également les dépendances si nécessaire.
2. Sélectionner les paquets à installer : Cette option effectue les mêmes opérations que l'option
1, mais permet à l'utilisateur de sélectionner plusieurs paquets à installer.
3. Quitter le programme : Cette option permet de sortir du script.

- Le script utilise des fonctions pour faciliter la gestion des dépendances et la vérification des
saisies utilisateur.
- Une vérification a été ajoutée pour s'assurer que l'utilisateur a accès à la commande `root`
avant de l'exécuter.
- Le script tente d'installer les paquets dans le répertoire "/home/`users`/Téléchargements". Assurez-vous que ce répertoire existe et que vous avez les permissions nécessaires pour yécrire.

## Avertissement

Ce script est fourni tel quel et peut nécessiter des modifications pour s'adapter à votre
environnement spécifique. Assurez-vous de bien comprendre le code avant de l'exécuter et
effectuez des tests dans un environnement contrôlé avant de l'utiliser dans un contexte de
production. L'auteur du script n'est pas responsable des éventuels dommages causés par
l'utilisation de ce script.

## Licence

Vous êtes libre de le modifier et de le distribuer !
