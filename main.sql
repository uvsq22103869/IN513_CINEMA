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

CREATE TABLE SIEGE (
    id_Siege INT PRIMARY KEY,          
    numero_Siege VARCHAR(10) NOT NULL, -- Numéro unique du siège dans la salle
    Zone VARCHAR(50) NOT NULL,         -- Zone (VIP, standard, etc.)
    id_Salle INT NOT NULL,              
    FOREIGN KEY (id_Salle) REFERENCES SALLE(id_Salle) ON DELETE CASCADE
);

CREATE TABLE SEANCE (
    id_Seance INT PRIMARY KEY,           
    Date_Seance DATE NOT NULL,              
    Heure_Début TIMESTAMP NOT NULL,         
    Heure_Fin TIMESTAMP NOT NULL,           
    Version_Film VARCHAR(50) NOT NULL,    
    id_Salle INT NOT NULL,               
    id_Film INT NOT NULL,                
    id_Format INT NOT NULL,              
    FOREIGN KEY (id_Salle) REFERENCES SALLE(id_Salle) ON DELETE CASCADE,
    FOREIGN KEY (id_Film) REFERENCES FILM(id_Film) ON DELETE CASCADE,
    FOREIGN KEY (id_Format) REFERENCES FORMAT(id_Format) ON DELETE CASCADE
);

CREATE TABLE BILLET (
    id_Billet INT PRIMARY KEY,           
    Prix DECIMAL(8, 2) NOT NULL,           
    Catégorie VARCHAR(50) NOT NULL,       
    id_Seance INT NOT NULL,              
    id_Siege INT NOT NULL,               
    FOREIGN KEY (id_Seance) REFERENCES SEANCE(id_Seance) ON DELETE CASCADE,
    FOREIGN KEY (id_Siege) REFERENCES SIEGE(id_Siege) ON DELETE CASCADE
);

-- INSERTION POUR LA TABLE FORMAT 
INSERT INTO FORMAT (id_Format, Nom_Format) VALUES(1, 'Classique');
INSERT INTO FORMAT (id_Format, Nom_Format) VALUES(2, 'IMAX'); 
INSERT INTO FORMAT (id_Format, Nom_Format) VALUES(3, 'Dolby Atmos'); 
INSERT INTO FORMAT (id_Format, Nom_Format) VALUES(4, '3D');
INSERT INTO FORMAT (id_Format, Nom_Format) VALUES(5, '4DX');

-- INSERTION DES 10 SALLES DU CINEMA
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (101, 'Salle 1', 1); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (102, 'Salle 2', 4);
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (103, 'Salle 3', 1); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (104, 'Salle IMAX', 2); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (105, 'Salle 5', 3); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (106, 'Salle 6', 3); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (107, 'Salle 4DX', 5);
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (108, 'Salle 8', 1); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (109, 'Salle 9', 1); 
INSERT INTO SALLE (id_Salle, Numero_Salle, id_Format) VALUES (110, 'Salle 10', 4);
