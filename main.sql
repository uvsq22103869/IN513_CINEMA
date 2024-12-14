CREATE TABLE FILM (
    id_Film INT PRIMARY KEY,          
    Titre VARCHAR(255) NOT NULL,     
    Date_sortie DATE NOT NULL,        
    Durée INT NOT NULL,                -- en minutes
    Audience VARCHAR(50) NOT NULL,    -- Public visé
    Temps_exploitation INT DEFAULT 15  -- Temps par défaut en jours
);
