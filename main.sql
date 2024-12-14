CREATE TABLE FILM (
    id_Film INT PRIMARY KEY,          
    Titre VARCHAR(255) NOT NULL,     
    Date_sortie DATE NOT NULL,        
    Durée INT NOT NULL,                -- en minutes
    Audience VARCHAR(50) NOT NULL,    -- Public visé
    Temps_exploitation INT DEFAULT 15  -- Temps par défaut en jours
);

CREATE TABLE GENRE (
    id_Genre INT PRIMARY KEY,  
    Genre VARCHAR(50) NOT NULL   
);

CREATE TABLE FILM_GENRE (
    id_Film INT NOT NULL,
    id_Genre INT NOT NULL,
    PRIMARY KEY (id_Film, id_Genre),
    FOREIGN KEY (id_Film) REFERENCES FILM(id_Film) ON DELETE CASCADE,
    FOREIGN KEY (id_Genre) REFERENCES GENRE(id_Genre) ON DELETE CASCADE
);
