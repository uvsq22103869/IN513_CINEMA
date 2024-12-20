
-- Variation du prix en fonction de la catégorie du billet, du format de la séance et de la zone du siège
CREATE OR REPLACE TRIGGER trg_calcul_prix_billet
BEFORE INSERT OR UPDATE ON BILLET
FOR EACH ROW
DECLARE
    prix_de_base DECIMAL(8, 2) := 10.0; -- Exemple de prix de base
    coefficient_format DECIMAL(8, 2) := 1.0;
    coefficient_categorie DECIMAL(8, 2);
    coefficient_vip DECIMAL(8, 2) := 1.0;
    zone_siege VARCHAR(50);
    nom_format VARCHAR(50);
BEGIN
    IF :NEW.Catégorie = 'Enfant' THEN
        coefficient_categorie := 0.5;
    ELSIF :NEW.Catégorie = 'Étudiant' THEN
        coefficient_categorie := 0.8;
    ELSIF :NEW.Catégorie = 'Adulte' THEN
        coefficient_categorie := 1.0;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Catégorie invalide.');
    END IF;

    SELECT Zone
    INTO zone_siege
    FROM SIEGE
    WHERE id_Siege = :NEW.id_Siege;

    IF zone_siege = 'VIP' THEN
        coefficient_vip := 1.2; -- 20% de plus pour les sièges VIP
    END IF;

    SELECT F.Nom_Format
    INTO nom_format
    FROM SEANCE S
    JOIN FORMAT F ON S.id_Format = F.id_Format
    WHERE S.id_Seance = :NEW.id_Seance;

    coefficient_format := CASE nom_format
                              WHEN '4DX' THEN 2.5
                              WHEN 'IMAX' THEN 2.0
                              WHEN 'Dolby Atmos' THEN 1.75
                              WHEN '3D' THEN 1.5
                              ELSE 1.0
                          END;

    -- Calcul final du prix
    :NEW.Prix := prix_de_base * coefficient_format * coefficient_categorie * coefficient_vip;
END;
/

-- Vérification de la date de la séance
CREATE OR REPLACE TRIGGER trg_verifier_planification_seance
BEFORE INSERT OR UPDATE ON SEANCE
FOR EACH ROW
DECLARE
    date_actuelle DATE := SYSDATE;
BEGIN
    IF :NEW.Date_Seance < date_actuelle + 1 THEN
        RAISE_APPLICATION_ERROR(-20004, 'La séance doit être planifiée au moins un jour à l''avance.');
    ELSIF :NEW.Date_Seance > date_actuelle + 7 THEN
        RAISE_APPLICATION_ERROR(-20005, 'La séance doit être planifiée dans un délai maximum de 7 jours.');
    END IF;
END;
/

-- Vérification du chevauchement des horaires des séances 
CREATE OR REPLACE TRIGGER trg_verifier_horaires_seance
BEFORE INSERT OR UPDATE ON SEANCE
FOR EACH ROW
DECLARE
    conflit_count NUMBER;
    delai_min NUMBER := 15; 
BEGIN
    SELECT COUNT(*)
    INTO conflit_count
    FROM SEANCE
    WHERE id_Salle = :NEW.id_Salle
      AND Date_Seance = :NEW.Date_Seance
      AND (   (:NEW.Heure_Début BETWEEN Heure_Début - INTERVAL '15' MINUTE AND Heure_Fin + INTERVAL '15' MINUTE)
           OR (:NEW.Heure_Fin BETWEEN Heure_Début - INTERVAL '15' MINUTE AND Heure_Fin + INTERVAL '15' MINUTE)
           OR (:NEW.Heure_Début <= Heure_Début AND :NEW.Heure_Fin >= Heure_Fin));

    IF conflit_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Conflit d’horaires : une autre séance est prévue trop proche dans cette salle à cette date.');
    END IF;
END;
/

