
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

