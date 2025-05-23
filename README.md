# Guide web Watizat (Backend)

## Informations

Le Backend complet se lance avec docker compose. C'est le fichier docker-compose.yml qui se charge de lancé les conteneurs docker qui assure le service.


# Pre-requis 

- docker
- docker compose

# Installation 

Pour lancer le backend complet, il faut executer ceci :
```bash
docker compose --file '<project_url>/docker-compose-rootless.yml' --project-name 'directus' up
```
Note: Il y a un fichier docker-compose.yaml pour un environnement docker avec une daemon root et un docker-compose-rootless.yaml pour un environnement docker rootless.

Initialiser la structure de la base de donnée avec la commande suivante :
```bash
npx directus-sync push
```
note: Aucune donnée ou utilisateur (sauf le compte admin de base) n'est configuré.

# Directus Sync

La configuration de la base de données directus est sauvegardé grâce à l'outil `directus-sync`.
Lorsque la structure de la base de données est modifiée, une nouvelle synchronisation est requise.

## Manipuler la structure de la base de donnée

Pour sauvegarder la structure dans le dossier directus-config/ :
`npx directus-sync pull`

Pour rétablir la structure :
`npx directus-sync push`

Pour voir si la structure de l'instance est différente de la structure versionné:
`npx directus-sync diff`

## Configuration de l'outil

L'outil se configure à partir du fichier directus-sync.config.js.

Il est nécessaire de renommer le fichier directus-sync.config.untracked.js.example en directus-sync.config.untracked.js et de completer les champs.

# Initialisation de la base 

un script typescript est prévu pour charger les données essentiel et/ou initiales dans la base de données. 
Pour l'executer il faut ouvrir un shell dans le container directus.
Le script se trouve dans le dossier /database-init/

Il faut d'abord compiler le script avec la commandes suivantes:
```
$ npx tsc
```

pour lancer l'initialisation de la base :
```
$ node load-init-data.js
```
note: attention à l'extension