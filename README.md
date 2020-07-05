# LesNumeriquesFeed
# README 🔥

Exécuter le fichier NumeriquesNewsFeed.xcworkspace afin de lancer le projet

L'architecture est divisée en plusieurs concepts 🏋️‍♀️: 
* `AppCoordinator`
* `Delegate`
* `MVVM`
* `Repositories`
* `Network`
* `Tests`

## Intro

Ce projet a été réalisé afin de garder la main sur les .

## Architecture

#### Coordinator:

L'AppCoordinator est une entité séparée, responsable de la navigation et de la transmission des données à travers les vues. 

Il crée les vues à travers la classse Screens, les initialise, et les présente à l'écran.

#### Repository:

Le Repository est responsable d'effectuer l'appel réseau au travers de la classe Network, et de parser les données récupérées dans le modèle, afin de présenter des données propres et compréhensibles par le ViewModel
Le protocol RepositoryType, permet d'effectuer des tests sur la classe Repository, indépendamment de tout appel réseau.

#### ViewModel:

Le ViewModel est responsable de la logique de l'application et de la commande de l'actualisation des vues. 
Il est divisé en deux parties:
#### ViewModel:
* **Inputs**: Tous les événements utilisateur du ViewController doivent être implémenté dans le ViewModel. 
Le premier et principal évenement est "ViewDidAppear", l'apparition de la vue
* **Outputs**: 
En se "bindant" (abonner) au ViewModel, le ViewController, est à l'écoute des actualisations du viewModel (variables réactives).

Le ViewModel, ne peut importer que le framework "Foundation", car il ne s'occupe pas de l'UI, mais de la logique et des commandes d'actualisation. Il ne fait transférer que des données brutes.

Le ViewModel a un repository, de type RepositoryType, afin de pouvoir injecter un Mock pour effectuer les tests unitaires.🏋️‍♀️

#### ViewController:

En MVVM, le ViewController ne s'occupe que de son rôle premier et principal: Controller les Vues et leur actualisation!
Pour le tester, il faudra procéder au UI Test.

# Difficultés 
Les Feed RSS m'étaient absolument inconnus, premier projet réalisé avec ce type de données. 
La seule difficulté a donc été de s'adapter à ces données, de comprendre qu'il s'agit d'ATOM et de les parser correctement. 

J'ai utilisé le framework FeedKit afin de faciliter la récupération des données. 

Améliorations à apporter: effectuer les tests unitaires, présenter plus proprement les autres données récupérées du feed. 

👊👊👊



![Alt text](IMG_5623.png?raw=true "Optional Title")
![Alt text](IMG_5624.png?raw=true "Optional Title")
