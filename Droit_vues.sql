-- Listes des vues à tester 

------------------------------------------------------- VUE ADMINISTRATEUR --------------------------------------------------------
CREATE OR REPLACE VIEW Vue_Métadonnées AS
SELECT 
    c.CONSTRAINT_NAME AS Nom_Contrainte,
    c.CONSTRAINT_TYPE AS Type_Contrainte,
    c.TABLE_NAME AS Table_Associée,
    c.STATUS AS Statut_Contrainte,
    t.TRIGGER_NAME AS Nom_Trigger,
    t.STATUS AS Statut_Trigger,
    t.TABLE_NAME AS Table_Trigger
FROM USER_CONSTRAINTS c
LEFT JOIN USER_TRIGGERS t ON c.TABLE_NAME = t.TABLE_NAME
ORDER BY c.TABLE_NAME, c.CONSTRAINT_NAME, t.TRIGGER_NAME;


CREATE OR REPLACE VIEW Vue_Structure_Base AS
SELECT 
    t.TABLE_NAME AS Nom_Table,
    c.COLUMN_NAME AS Nom_Colonne,
    c.DATA_TYPE AS Type_Donnée,
    c.NULLABLE AS Accepte_Null,
    c.DATA_LENGTH AS Taille,
    i.INDEX_NAME AS Nom_Index,
    i.UNIQUENESS AS Contrainte_Unique
FROM 
    USER_TABLES t
LEFT JOIN 
    USER_TAB_COLUMNS c ON t.TABLE_NAME = c.TABLE_NAME
LEFT JOIN 
    USER_INDEXES i ON t.TABLE_NAME = i.TABLE_NAME
ORDER BY 
    t.TABLE_NAME, c.COLUMN_ID;

-------------------------------------------------------- VUE DU GESTIONNAIRE ----------------------------------------------------
CREATE OR REPLACE VIEW Vue_Recettes_Films AS
SELECT 
    f.id_Film,
    f.Titre AS Film,
    s.id_Seance,
    s.Date_Seance,
    s.Heure_Début,
    SUM(b.Prix) AS Recettes_Seance,
    COUNT(b.id_Billet) AS Nombre_Billets,
    (SELECT SUM(b2.Prix)
     FROM SEANCE s2
     JOIN BILLET b2 ON s2.id_Seance = b2.id_Seance
     WHERE s2.id_Film = f.id_Film) AS Recettes_Film
FROM FILM f
LEFT JOIN SEANCE s ON f.id_Film = s.id_Film
LEFT JOIN BILLET b ON s.id_Seance = b.id_Seance
GROUP BY f.id_Film, f.Titre, s.id_Seance, s.Date_Seance, s.Heure_Début
ORDER BY f.Titre, s.Date_Seance, s.Heure_Début;


CREATE OR REPLACE VIEW Vue_Frequentation_Salles AS
SELECT 
    sa.id_Salle,
    sa.numero_Salle,
    COUNT(b.id_Billet) AS Total_Billets,
    (SELECT COUNT(*) FROM SIEGE sg WHERE sg.id_Salle = sa.id_Salle) AS Capacite,
    ROUND((COUNT(b.id_Billet) * 100.0) / 
          (SELECT COUNT(*) FROM SIEGE sg WHERE sg.id_Salle = sa.id_Salle), 2) AS Taux_Frequentation
FROM SALLE sa
LEFT JOIN SEANCE s ON sa.id_Salle = s.id_Salle
LEFT JOIN BILLET b ON s.id_Seance = b.id_Seance
GROUP BY sa.id_Salle, sa.numero_Salle;


CREATE OR REPLACE VIEW Vue_Performance_Films AS
SELECT 
    f.id_Film,
    f.Titre AS Film,
    COUNT(b.id_Billet) AS Total_Billets_Vendus,
    SUM(b.Prix) AS Total_Recettes,
    ROUND(AVG(b.Prix), 2) AS Prix_Moyen
FROM FILM f
LEFT JOIN SEANCE s ON f.id_Film = s.id_Film
LEFT JOIN BILLET b ON s.id_Seance = b.id_Seance
GROUP BY f.id_Film, f.Titre
ORDER BY Total_Recettes DESC;


-------------------------------------------------------- VUE DU PROJECTIONNISTE -------------------------------------------------

CREATE OR REPLACE VIEW Vue_Seances_En_Cours AS
SELECT 
    s.id_Seance,
    f.Titre AS Film,
    sa.numero_Salle AS Salle,
    fm.Nom_Format AS Format,
    s.Date_Seance,
    s.Heure_Début,
    s.Heure_Fin
FROM SEANCE s
JOIN FILM f ON s.id_Film = f.id_Film
JOIN SALLE sa ON s.id_Salle = sa.id_Salle
JOIN FORMAT fm ON s.id_Format = fm.id_Format
WHERE s.Date_Seance = TRUNC(SYSDATE) 
    AND SYSDATE BETWEEN s.Heure_Début AND s.Heure_Fin 
ORDER BY s.Heure_Début;

-------------------------------------------------------- VUE DU CLIENT ----------------------------------------------------------
CREATE OR REPLACE VIEW Vue_Seances_Futures AS
SELECT 
    s.id_Seance,
    f.Titre AS Film,
    sa.numero_Salle AS Salle,
    fm.Nom_Format AS Format,
    s.Date_Seance,
    s.Heure_Début,
    s.Heure_Fin
FROM SEANCE s
JOIN FILM f ON s.id_Film = f.id_Film
JOIN SALLE sa ON s.id_Salle = sa.id_Salle
JOIN FORMAT fm ON s.id_Format = fm.id_Format
WHERE s.Date_Seance > TRUNC(SYSDATE) 
ORDER BY s.Date_Seance, s.Heure_Début;

-------------------------------------------------------- VUE DU CAISSIER --------------------------------------------------------
-- Vue des séances disponibles
CREATE OR REPLACE VIEW Vue_Seances_Disponibles AS
SELECT 
    s.id_Seance,
    f.Titre AS Film,
    s.Date_Seance,
    s.Heure_Début,
    s.Heure_Fin,
    sa.numero_Salle AS Salle,
    fm.Nom_Format AS Format,
    s.Version_Film AS Version
FROM SEANCE s
JOIN FILM f ON s.id_Film = f.id_Film
JOIN SALLE sa ON s.id_Salle = sa.id_Salle
JOIN FORMAT fm ON s.id_Format = fm.id_Format
WHERE s.Date_Seance >= TRUNC(SYSDATE) -- Inclut les séances à venir
ORDER BY s.Date_Seance, s.Heure_Début;


-- Vue des Sièges disponibles
CREATE OR REPLACE VIEW Vue_Disponibilite_Sieges AS
SELECT 
    s.id_Seance,
    sa.numero_Salle AS Salle,
    sg.numero_Siege AS Siege,
    sg.Zone,
    CASE 
        WHEN b.id_Billet IS NULL THEN 'Disponible'
        ELSE 'Réservé'
    END AS Etat_Siege
FROM SEANCE s
JOIN SALLE sa ON s.id_Salle = sa.id_Salle
JOIN SIEGE sg ON sa.id_Salle = sg.id_Salle
LEFT JOIN BILLET b ON s.id_Seance = b.id_Seance AND sg.id_Siege = b.id_Siege
WHERE s.Date_Seance >= TRUNC(SYSDATE) -- Inclut uniquement les séances futures ou en cours
ORDER BY s.id_Seance, sg.Zone, sg.numero_Siege;


-- Vue des Tarifs des Billets
CREATE OR REPLACE VIEW Vue_Tarifs_Billets AS
SELECT 
    b.id_Billet,
    f.Titre AS Film,
    s.Date_Seance,
    s.Heure_Début,
    sg.Zone AS Zone_Siege,
    b.Catégorie AS Categorie_Billet,
    fm.Nom_Format AS Format_Projection,
    10.0 AS Prix_Base, -- Prix de base
    CASE b.Catégorie
        WHEN '-12' THEN 0.5
        WHEN 'Etudiant' THEN 0.8
        WHEN 'Normal' THEN 1.0
        ELSE NULL
    END AS Coefficient_Categorie,
    CASE sg.Zone
        WHEN 'VIP' THEN 1.2
        ELSE 1.0
    END AS Coefficient_Zone,
    CASE fm.Nom_Format
        WHEN '4DX' THEN 2.5
        WHEN 'IMAX' THEN 2.0
        WHEN 'Dolby Atmos' THEN 1.75
        WHEN '3D' THEN 1.5
        ELSE 1.0
    END AS Coefficient_Format,
    -- Calcul final du prix
    10.0 * 
    CASE b.Catégorie
        WHEN '-12' THEN 0.5
        WHEN 'Etudiant' THEN 0.8
        WHEN 'Normal' THEN 1.0
        ELSE NULL
    END *
    CASE sg.Zone
        WHEN 'VIP' THEN 1.2
        ELSE 1.0
    END *
    CASE fm.Nom_Format
        WHEN '4DX' THEN 2.5
        WHEN 'IMAX' THEN 2.0
        WHEN 'Dolby Atmos' THEN 1.75
        WHEN '3D' THEN 1.5
        ELSE 1.0
    END AS Tarif_Final
FROM BILLET b
JOIN SIEGE sg ON b.id_Siege = sg.id_Siege
JOIN SEANCE s ON b.id_Seance = s.id_Seance
JOIN FORMAT fm ON s.id_Format = fm.id_Format
JOIN FILM f ON s.id_Film = f.id_Film;

