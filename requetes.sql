
-- Sélectionner les films sortis dans les 30 derniers jours
SELECT Titre, Date_Sortie 
FROM FILM
WHERE Date_Sortie >= SYSDATE - 30
ORDER BY Date_Sortie DESC;


-- Sélectionner toutes les séances avec le titre du film
SELECT s.id_Seance, s.Date_Seance, s.Heure_Début, f.Titre 
FROM SEANCE s, FILM f 
WHERE s.id_Film = f.id_Film
ORDER BY s.Date_Seance, s.Heure_Début;


-- Calculer le nombre total de films par genre
SELECT g.Genre, COUNT(f.id_Film) AS Nombre_Films
FROM FILM f, FILM_GENRE fg, GENRE g
WHERE f.id_Film = fg.id_Film 
    AND fg.id_Genre = g.id_Genre
GROUP BY g.Genre
ORDER BY Nombre_Films DESC;


-- Trouver les heures où le cinéma est le plus fréquenté
SELECT TO_CHAR(s.Heure_Début, 'HH24') AS Heure, COUNT(b.id_Billet) AS Nombre_Billets
FROM SEANCE s, BILLET b
WHERE s.id_Seance = b.id_Seance
GROUP BY TO_CHAR(s.Heure_Début, 'HH24')
ORDER BY Nombre_Billets DESC;

SELECT f.Titre, SUM(b.Prix) AS Revenus_Total
FROM FILM f, FILM_GENRE fg, GENRE g, SEANCE s, BILLET b
WHERE f.id_Film = fg.id_Film 
    AND fg.id_Genre = g.id_Genre 
    AND g.Genre = 'Action' 
    AND s.id_Film = f.id_Film 
    AND b.id_Seance = s.id_Seance 
    AND s.Date_Seance >= ADD_MONTHS(SYSDATE, -2)
GROUP BY f.Titre
ORDER BY Revenus_Total DESC;


SELECT f.Titre, COUNT(DISTINCT s.Date_Seance) AS Nombre_Jours_Affiche
FROM FILM f, SEANCE s
WHERE f.id_Film = s.id_Film
GROUP BY f.Titre
HAVING COUNT(DISTINCT s.Date_Seance) > 80
ORDER BY Nombre_Jours_Affiche DESC;


SELECT f.Titre, COUNT(DISTINCT s.id_Format) AS Nombre_Formats
FROM FILM f, SEANCE s
WHERE f.id_Film = s.id_Film
GROUP BY f.Titre
HAVING COUNT(DISTINCT s.id_Format) > 1
ORDER BY Nombre_Formats DESC;

