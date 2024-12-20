
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
