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

CREATE TABLE ACTEUR (
    id_Acteur INT PRIMARY KEY,      
    Nom VARCHAR(255) NOT NULL,        
    Prénom VARCHAR(255) NOT NULL,     
    Nationalité VARCHAR(50),          
    Age INT                       
);

CREATE TABLE FILM_ACTEUR (
    id_Film INT NOT NULL,
    id_Acteur INT NOT NULL,
    PRIMARY KEY (id_Film, id_Acteur),
    FOREIGN KEY (id_Film) REFERENCES FILM(id_Film) ON DELETE CASCADE,
    FOREIGN KEY (id_Acteur) REFERENCES ACTEUR(id_Acteur) ON DELETE CASCADE
);

CREATE TABLE FORMAT (
    id_Format INT PRIMARY KEY,      
    Nom_Format VARCHAR(50) NOT NULL  -- Nom du format (IMAX, 3D, etc.)
);

CREATE TABLE SALLE (
    id_Salle NUMBER PRIMARY KEY,          
    Numero_Salle VARCHAR(50) NOT NULL,   
    id_Format INT NOT NULL,
    FOREIGN KEY (id_Format) REFERENCES FORMAT(id_Format) ON DELETE CASCADE
);
