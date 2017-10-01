# GrailsProject

## Présentation du projet

Nous allons créer une plateforme de gestion de points d’intérêts.
Ces points d’intérêts pourraient être des lieux, personnes, objets.
Le but étant de regrouper les POIs dans un groupe et de pouvoir les
afficher sur une carte.

## Fonctionnalités

### Images
Les images sont stockés sur serveur apache sur un disponnible dans le application yml.  
grails:  
&nbsp;&nbsp;&nbsp;&nbsp; guides:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cdnFolder: C:\wamp64\www\images\grailsProject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cdnRootUrl: http://localhost:8081/images/grailsProject

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
##### Creation
Selection des groupes de poi depuis une liste multiple permettant la recherche des élement la comprenant.  
Selection de la localisation via un click sur la carte.  
Selection de multiple image possible via control click dans la fenetre de selection.  

##### Edition
Possibilité de supprimé une image.

### Les groupes de POIs
##### Creation
Selection des pois depuis une liste multiple permettant la recherche des élements la comprenant.  
 
##### Visualisation
Affichage des pois sur la carte.  
Les marqueurs des pois affichent, si on click dessus un lien vers celui ci ainsi que la description.

         
  
    




