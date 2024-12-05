# IN513_CINEMA

Ce projet a pour objectif de créer une application de gestion pour un cinéma, nécessitant la modélisation d'une base de données. L'application permettra de gérer efficacement les films, les séances, les salles, les formats, les versions et les billets. Elle permettra également aux différents utilisateurs d’obtenir des renseignements spécifiques liés à leur rôle 
Description des Besoins 
Gestion des Films : Titre du film, Durée du film en minutes, Date à laquelle le film est sorti, un identifiant, le public visé (tout public, interdit au -12 ans, …) et le temps d’exploitation (par défaut il est de 15 jours)
Gestion des Séances :  Date de la séance, Heure de la séance (début et fin), Identifiant de la salle dans laquelle se déroule la séance, Format de projection (Classique, Imax, Dolby), Version du film (VF, VO)
Gestion des Formats : Avec un identifiant et un nom pour chaque format (Classique, Imax, Dolby).
Gestion des Salles : chaque salle à un numéro unique ainsi qu’une capacité en termes de siège.
Gestion des Sièges : Identifiant unique du siège, le numéro et la zone où il se trouve dans la salle (standard, premium, …).
Gestion des Billets : Salle où la séance a lieu, Siège spécifique réservé pour le spectateur, prix du billet ainsi que la catégorie du titulaire du billet (enfant, étudiant, adulte).
Pour enrichir les informations liées aux films, la base de données doit stocker des informations sur les acteurs participant aux films projetés : Nom, prénom, nationalité, âge et un identifiant unique pour bien les distinguer
