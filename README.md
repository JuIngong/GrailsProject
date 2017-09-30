# GrailsProject

## Présentation du projet

Nous allons créer une plateforme de gestion de points d’intérêts.
Ces points d’intérêts pourraient être des lieux, personnes, objets.
Le but étant de regrouper les POIs dans un groupe et de pouvoir les
afficher sur une carte.

## Fonctionnalités

### Les permissions
Les utilisateurs auront chacun un rôle qui 
définiront leur niveau d’accès (administrateur / modérateur
/ utilisateur).  
* Administrateur
    * Creer / Modifier / Supprimer n'importe quel utilisateur
    * Creer / Modifier / Supprimer des POIs
    * Creer / Modifier / Supprimer des groupes de POIs
* Moderateur
    * Modifier / Supprimer des utilisateurs de niveau "Utilisateur"
    * Creer / Modifier / Supprimer des POIs
    * Creer / Modifier / Supprimer des groupes de POIs
* Utilisateur
    * Consulter / Modifier ses informations personnelles
    * Consulter les POIs et groupes de POIs

### Les utilisateurs

##### Consultation
Les administrateurs et moderateurs peuvent consulter la liste des
utilisateur via le menu de gauche. Les moderateurs ne peuvent voir
que les utilisateurs dont le role est "utilisateur".  

##### Modification et Suppression
En cliquant sur un utilisateur dans la liste des utilisateurs, on
accède à une page pour modifier ou supprimer l'utilisateur selectionné.
Le moderateur ne peut pas modifier le rang d'un utilisateur.

##### Création
Seul un administrateur peut créer un utilisateur en passant par le menu de
gauche, il peut y définir toutes les propriétés et son rang.

##### Page personnelle
On peut acceder à celle-ci en passant par le menu en haut à droite.
Elle permet de modifier son nom d'utilisateur ainsi que son mot de passe.
 
### Les POIs

### Les groupes de POIs

         
  
    




