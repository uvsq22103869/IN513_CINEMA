# IN513_CINEMA

Ce projet a pour objectif de créer une application de gestion pour un cinéma, nécessitant la modélisation d'une base de données. L'application permettra de gérer efficacement les films, les séances, les salles, les formats, les versions et les billets. Elle permettra également aux différents utilisateurs d’obtenir des renseignements spécifiques liés à leur rôle.

Description des Besoins :
Gestion des Films : Titre du film, Durée du film en minutes, Date à laquelle le film est sorti, un identifiant, le public visé (tout public, interdit au -12 ans, …) et le temps d’exploitation (par défaut il est de 15 jours)

Gestion des Séances :  Date de la séance, Heure de la séance (début et fin), Identifiant de la salle dans laquelle se déroule la séance, Format de projection (Classique, Imax, Dolby), Version du film (VF, VO)

Gestion des Formats : Avec un identifiant et un nom pour chaque format (Classique, Imax, Dolby).

Gestion des Salles : chaque salle à un numéro unique ainsi qu’une capacité en termes de siège.

Gestion des Sièges : Identifiant unique du siège, le numéro et la zone où il se trouve dans la salle (standard, premium, …).

Gestion des Billets : Salle où la séance a lieu, Siège spécifique réservé pour le spectateur, prix du billet ainsi que la catégorie du titulaire du billet (enfant, étudiant, adulte).

Pour enrichir les informations liées aux films, la base de données doit stocker des informations sur les acteurs participant aux films projetés : Nom, prénom, nationalité, âge et un identifiant unique pour bien les distinguer

# MODELISATION 

![Screenshot_20241205_115546_Canva](https://github.com/user-attachments/assets/a506e69b-d35e-4c53-8d86-e2b6ca81fe5a)

# LES CONTRAINTES D'INTEGRITE 

Contraintes d'intégrité de Cardinalité :
Les relations entre les tables doivent respecter des règles spécifiques concernant le nombre d'occurrences. Par exemple, un film peut avoir plusieurs séances, mais chaque séance ne peut être associée qu'à un seul film.

Contrainte d'intégrité de Temps :
Les réservations de billets ne peuvent pas être faites pour des séances qui ont déjà eu lieu, et les séances ne peuvent pas être programmées en dehors des heures d'ouverture du cinéma (10H-00H30).

Autres contraintes :
- Le prix des billets varient en fonction du format (3D, IMAX,...) et de la catégorie (tarif enfant, étudiant, normale…)
- Une salle ne peut projeter deux films en même temps. Il faut un délai de plusieurs minutes entre deux séances se déroulant dans la même salle.
- Une version peut être diffusé seulement si cette version du film existe.
- Un format pour un film peut être projeté seulement si ce format existe pour ce film spécifique. 
- Une séance ne peut pas apparaître « trop tôt » ou « trop tard ». Elle doit être planifié au moins un jour avant et maximum une semaine avant.
- Impossible de réserver des billets pour des séances passées. Une séance est considérée comme "passée" quelques minutes avant son démarrage (10-15 minutes).
- Blocage des billets pour une séance si tous les sièges de la salle sont occupés. 
- Tout film reste au minimum 15 jours à l’affiche (temps d’exploitation). En fonction de son taux de spectateurs (succès commercial), il peut rester beaucoup plus longtemps (le maximum étant de 90 jours), ou au contraire être retiré dès la fin des 15 premiers jours.
- Certains films sont interdit à un certain type de public, donc certaines catégories de billets ne sont pas disponibles pour certaines séances. 
- Un film très populaire (succès commercial conséquent) ne peut représenter plus de 40 % des séances programmées dans un cinéma sur une semaine donnée pour laisser de la place à d’autres films.
- Les films d’un même genre (par exemple, "Action") ne peuvent pas représenter plus de 50 % des séances en prime time (18h-22h) sur une journée donnée pour favoriser la diversité de l’offre.
- Un film ne peut pas être projeté plus de deux fois dans une salle spécifique si cette salle a eu un taux de remplissage inférieur à 50 % lors des deux précédentes projections de ce même film.
- Lorsqu’une salle est presque pleine (95 % des places réservées) et que la séance se situe en heure de pointe (18h-22h), une salle supplémentaire peut être automatiquement ouverte pour diffuser le même film à une heure proche (+10 à +30 minutes). Cette règle ne s’applique que si le film est populaire (plus de 70 % de taux de remplissage moyen sur les 3 derniers jours).

# DROITS ET VUES 

Nous avons défini les différents utilisateurs de la base de données ainsi que les droits (et vues) auxquels ils ont accès sur cette base de données. Voici les utilisateurs : L’administrateur, le gestionnaire, le caissier, le projectionniste et le client.

Description des droits de chaque utilisateur : 

- L’Administrateur : Il a accès à tout sur la base de données. Il peut créer, modifier et supprimer des tables, des vues, des utilisateurs, ainsi que gérer les droits d’accès des autres utilisateurs.
Vue_Métadonnées : Liste toutes les contraintes d’intégrité, triggers, et autres règles de gestion de la base.
Vue_Utilisateurs : Affiche les informations sur les utilisateurs de la base et leurs permissions respectives.
Vue_Structure_Base : Donne un aperçu de la structure des tables, des index, et des relations entre les entités.

- Le Gestionnaire : Il dispose de droits en lecture et en écriture sur les données liées aux films, séances, billets, et salles. Il n'a pas accès à la gestion technique du système, mais il peut suivre et analyser les performances commerciales du cinéma (ex : recettes, fréquentation). Il peut également ajuster les séances, gérer les programmations et analyser les ventes de billets.
Vue_Recettes_Films : Affiche les recettes générées par chaque film, avec un suivi global et par séance.
Vue_Frequentation_Salles : Affiche le taux de fréquentation de chaque salle, en calculant le pourcentage d’occupation moyen.
Vue_Seances_Futures : Liste les séances à venir avec leurs horaires, formats de projection, et salles associées.
Vue_Performance_Films : Il s’agit d’un aperçu des performances des films, incluant les statistiques de ventes, le nombre de billets vendus, et les recettes par film. 

