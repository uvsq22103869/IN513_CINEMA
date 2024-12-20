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

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

-- INSERTION DES FILMS 
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (845781, 'Red One', '12-12-2024', 124, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (912649, 'Venom : The Last Dance', '30-10-2024', 109, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1241982, 'Vaiana 2', '27-11-2024', 100, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1035048, 'Elevation', '07-11-2024', 91, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (974453, 'Absolution', '31-10-2024', 122, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (762509, 'Mufasa : Le Roi Lion', '18-12-2024', 118, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1138194, 'Heretic', '27-11-2024', 110, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1184918, 'Le Robot sauvage', '09-10-2024', 102, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (939243, 'Sonic 3, le film', '25-12-2024', 100, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (539972, 'Kraven the Hunter', '18-12-2024', 127, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1182387, 'Armor', '30-10-2024', 89, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1167271, 'Week-end à Taipei', '25-09-2024', 98, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (558449, 'Gladiator II', '13-11-2024', 148, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (645757, 'Ce Noël-là', '04-12-2024', 95, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1299652, 'Watchmen: Chapter II', '25-11-2024', 86, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1147416, 'Miraculous World : Londres, la course contre le temps', '05-10-2024', 50, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (933260, 'The Substance', '06-11-2024', 141, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1000075, 'Largo Winch : Le prix de l''argent', '31-07-2024', 100, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (533535, 'Deadpool & Wolverine', '24-07-2024', 128, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1034541, 'Terrifier 3', '09-10-2024', 125, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (402431, 'Wicked', '04-12-2024', 160, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1100782, 'Smile 2', '16-10-2024', 127, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1118031, 'Apocalypse Z : le début de la fin', '04-10-2024', 119, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1022789, 'Vice-versa 2', '19-06-2024', 97, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (945961, 'Alien : Romulus', '14-08-2024', 119, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (698687, 'Transformers : Le Commencement', '23-10-2024', 104, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (957119, 'Sidelined: The QB and Me', '29-11-2024', 99, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (519182, 'Moi, moche et méchant 4', '10-07-2024', 95, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1005331, 'Carry-On', '13-12-2024', 119, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (791042, 'Levels', '01-11-2024', 92, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1252470, 'La Destinée de Sikandar', '29-11-2024', 143, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1171640, 'GTMAX', '20-11-2024', 98, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (995803, 'Arena Wars', '25-06-2024', 96, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1155095, 'The Moor', '14-06-2024', 120, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1357633, 'Solo Leveling -ReAwakening-', '07-12-2024', 116, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1154223, 'Tigres et Hyènes', '22-11-2024', 109, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1124641, 'Classified', '22-10-2024', 105, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1196470, 'Survivre', '19-06-2024', 90, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (592983, 'Ellian et le sortilège', '22-11-2024', 110, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1051896, 'Arcadian', '12-04-2024', 92, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (573435, 'Bad Boys: Ride or Die', '05-06-2024', 115, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1029235, 'Azrael', '27-09-2024', 85, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1165466, 'Wake Up', '08-05-2024', 81, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1252309, 'Pídeme lo que quieras', '29-11-2024', 0, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1326059, 'Pimpinero : De Pétrole et de Sang', '10-10-2024', 122, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1100099, 'L''Amour au présent', '07-11-2024', 108, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (823219, 'Flow, le chat qui n''avait plus peur de l''eau', '30-10-2024', 85, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1084736, 'Le Comte de Monte-Cristo', '28-06-2024', 178, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1097870, 'Dear Santa', '24-11-2024', 108, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1156593, 'À contre-sens 2', '27-12-2024', 0, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1296753, 'Remnant', '30-06-2024', 112, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (839033, 'Le Seigneur des Anneaux : La Guerre des Rohirrim', '11-12-2024', 134, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1084863, 'Le Mangeur d''âmes', '24-04-2024', 110, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1100856, 'Заклятье. Шепот ведьм', '13-06-2024', 90, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (889737, 'Joker : Folie à deux', '02-10-2024', 138, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (693134, 'Dune : Deuxième partie', '28-02-2024', 165, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1038263, 'Maria', '05-02-2025', 123, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1064028, 'Subservience', '15-08-2024', 105, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1287717, 'Do Not Enter', '15-05-2024', 80, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (748783, 'Garfield : Héros malgré lui', '31-07-2024', 101, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1389147, 'SDI: Secret Department of Intervention', '28-11-2024', 120, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (972614, 'Knox Goes Away', '09-08-2024', 114, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1014505, 'Overlord : The Sacred Kingdom', '20-09-2024', 134, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1125510, 'La Plateforme 2', '04-10-2024', 100, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1116490, 'Cash Out', '10-09-2024', 90, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1011985, 'Kung Fu Panda 4', '27-03-2024', 94, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (978796, 'Bagman', '20-09-2024', 92, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1043905, 'Dirty Angels', '13-12-2024', 104, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (823464, 'Godzilla x Kong : Le Nouvel Empire', '03-04-2024', 115, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1243381, 'Marie', '06-12-2024', 110, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1038263, 'Maria', '05-02-2025', 123, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1371727, 'Tous en scène : Thriller', '16-10-2024', 11, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1064213, 'Anora', '30-10-2024', 139, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1206617, 'Les Pires Enfants de l''histoire du monde', '07-11-2024', 99, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (957452, 'The Crow', '21-08-2024', 111, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (653346, 'La Planète des singes : Le Nouveau Royaume', '08-05-2024', 145, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1208808, 'Turno nocturno', '31-10-2024', 107, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (726139, 'Project Silence', '21-08-2024', 101, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (639720, 'Blue & Compagnie', '08-05-2024', 104, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1232449, 'Young Hearts', '19-02-2025', 97, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (762441, 'Sans un bruit : Jour 1', '26-06-2024', 99, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1106739, 'Juré n°2', '30-10-2024', 114, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1340602, 'Las tías', '28-08-2024', 87, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1159311, 'My Hero Academia: You’re Next', '09-10-2024', 110, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1354627, 'Kamp Frayeur', '10-10-2024', 45, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (976734, 'Canary Black', '24-10-2024', 103, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1191611, 'En colo avec ma mère', '06-12-2024', 95, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (786892, 'Furiosa : Une saga Mad Max', '22-05-2024', 149, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (718821, 'Twisters', '17-07-2024', 123, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (917496, 'Beetlejuice Beetlejuice', '11-09-2024', 105, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (857598, 'Pushpa: The Rule - Part 2', '05-12-2024', 198, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1355755, 'Un conte de Noël, ou presque', '15-11-2024', 24, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1063877, 'Don''t Move', '25-10-2024', 92, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1203236, 'Nutcrackers', '29-11-2024', 105, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1154215, 'Elyas', '03-07-2024', 99, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (974576, 'Conclave', '04-12-2024', 120, 'Tout public', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (616446, 'Brothers', '17-10-2024', 88, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (929590, 'Civil War', '17-04-2024', 109, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1104844, 'BLUE LOCK LE FILM -ÉPISODE NAGI-', '03-07-2024', 91, '-12 ans', 15);
INSERT INTO FILM (id_Film, Titre, Date_sortie, Durée, Audience, Temps_exploitation) VALUES (1079091, 'Jamais plus - It Ends with Us', '14-08-2024', 131, 'Tout public', 15);

-- INSERION DES GENRES
INSERT INTO GENRE (id_Genre, Genre) VALUES (28, 'Action');
INSERT INTO GENRE (id_Genre, Genre) VALUES (12, 'Aventure');
INSERT INTO GENRE (id_Genre, Genre) VALUES (16, 'Animation');
INSERT INTO GENRE (id_Genre, Genre) VALUES (35, 'Comédie');
INSERT INTO GENRE (id_Genre, Genre) VALUES (80, 'Crime');
INSERT INTO GENRE (id_Genre, Genre) VALUES (99, 'Documentaire');
INSERT INTO GENRE (id_Genre, Genre) VALUES (18, 'Drame');
INSERT INTO GENRE (id_Genre, Genre) VALUES (10751, 'Familial');
INSERT INTO GENRE (id_Genre, Genre) VALUES (14, 'Fantastique');
INSERT INTO GENRE (id_Genre, Genre) VALUES (36, 'Histoire');
INSERT INTO GENRE (id_Genre, Genre) VALUES (27, 'Horreur');
INSERT INTO GENRE (id_Genre, Genre) VALUES (10402, 'Musique');
INSERT INTO GENRE (id_Genre, Genre) VALUES (9648, 'Mystère');
INSERT INTO GENRE (id_Genre, Genre) VALUES (10749, 'Romance');
INSERT INTO GENRE (id_Genre, Genre) VALUES (878, 'Science-Fiction');
INSERT INTO GENRE (id_Genre, Genre) VALUES (10770, 'Téléfilm');
INSERT INTO GENRE (id_Genre, Genre) VALUES (53, 'Thriller');
INSERT INTO GENRE (id_Genre, Genre) VALUES (10752, 'Guerre');
INSERT INTO GENRE (id_Genre, Genre) VALUES (37, 'Western');

-- INSERTION FILM_GENRE 
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (845781, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (845781, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (845781, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (912649, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (912649, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (912649, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (912649, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1241982, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1241982, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1241982, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1241982, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1035048, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1035048, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1035048, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (974453, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (974453, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (974453, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762509, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762509, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762509, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762509, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762509, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1138194, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1138194, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1184918, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1184918, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1184918, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1184918, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (939243, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (939243, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (939243, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (939243, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (539972, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (539972, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (539972, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1182387, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1182387, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1182387, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1167271, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1167271, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1167271, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (558449, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (558449, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (558449, 36);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (645757, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (645757, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (645757, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (645757, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (645757, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1299652, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1299652, 9648);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1299652, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1299652, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1147416, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1147416, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1147416, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1147416, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (933260, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (933260, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (533535, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (533535, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (533535, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1034541, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1034541, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (402431, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (402431, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (402431, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1100782, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1100782, 9648);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1118031, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1118031, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1118031, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1022789, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1022789, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1022789, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1022789, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1022789, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (945961, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (945961, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (698687, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (698687, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (698687, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (698687, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957119, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957119, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957119, 10770);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (519182, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (519182, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (519182, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (519182, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1005331, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1005331, 9648);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1005331, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (791042, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (791042, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (791042, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252470, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252470, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252470, 9648);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252470, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1171640, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1171640, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1171640, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (995803, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (995803, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (995803, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (995803, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (995803, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1155095, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1155095, 9648);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1155095, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1357633, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1357633, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1357633, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1357633, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1154223, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1154223, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1124641, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1124641, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1196470, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1196470, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1196470, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1196470, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (592983, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (592983, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (592983, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (592983, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (592983, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1051896, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1051896, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1051896, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1051896, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (573435, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (573435, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (573435, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (573435, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (573435, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1029235, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1029235, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1029235, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1165466, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1165466, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1165466, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252309, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1252309, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1326059, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1326059, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1326059, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1084736, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1084736, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1084736, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1097870, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1097870, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1156593, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1156593, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1296753, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1296753, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1296753, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (839033, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (839033, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1100856, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1100856, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (889737, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (889737, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (889737, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (693134, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (693134, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1038263, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1038263, 10402);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064028, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064028, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064028, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1287717, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (748783, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (748783, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (748783, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (748783, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (748783, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1389147, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (972614, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (972614, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (972614, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1014505, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1014505, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1014505, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1014505, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1125510, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1125510, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1116490, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1116490, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1011985, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1011985, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1011985, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1011985, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (978796, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (978796, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1043905, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1043905, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1043905, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (823464, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (823464, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (823464, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1243381, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1243381, 36);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1243381, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1038263, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1038263, 10402);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1371727, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1371727, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1371727, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064213, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064213, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1064213, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957452, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957452, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (957452, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (653346, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (653346, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (653346, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1208808, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (726139, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (726139, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (726139, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (726139, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (639720, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (639720, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (639720, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1232449, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1232449, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762441, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762441, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (762441, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1106739, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1106739, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1340602, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1159311, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1159311, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1159311, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1159311, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1354627, 10770);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1354627, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1354627, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1354627, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1354627, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (976734, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (976734, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (976734, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1191611, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1191611, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (786892, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (786892, 878);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (786892, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (718821, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (718821, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (917496, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (917496, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (917496, 27);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (857598, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (857598, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (857598, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1355755, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1355755, 12);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1355755, 14);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1355755, 10751);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1203236, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1203236, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1154215, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1154215, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (974576, 53);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (974576, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (616446, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (616446, 35);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (616446, 80);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (929590, 10752);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (929590, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (929590, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1104844, 16);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1104844, 28);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1104844, 18);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1079091, 10749);
INSERT INTO FILM_GENRE (id_Film, id_Genre) VALUES (1079091, 18);

INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1, 'S001', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (2, 'S002', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (3, 'S003', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (4, 'S004', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (5, 'S005', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (6, 'S006', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (7, 'S007', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (8, 'S008', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (9, 'S009', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (10, 'S010', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (11, 'S011', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (12, 'S012', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (13, 'S013', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (14, 'S014', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (15, 'S015', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (16, 'S016', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (17, 'S017', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (18, 'S018', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (19, 'S019', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (20, 'S020', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (21, 'S021', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (22, 'S022', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (23, 'S023', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (24, 'S024', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (25, 'S025', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (26, 'S026', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (27, 'S027', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (28, 'S028', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (29, 'S029', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (30, 'S030', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (31, 'S031', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (32, 'S032', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (33, 'S033', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (34, 'S034', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (35, 'S035', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (36, 'S036', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (37, 'S037', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (38, 'S038', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (39, 'S039', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (40, 'S040', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (41, 'S041', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (42, 'S042', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (43, 'S043', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (44, 'S044', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (45, 'S045', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (46, 'S046', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (47, 'S047', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (48, 'S048', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (49, 'S049', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (50, 'S050', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (51, 'S051', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (52, 'S052', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (53, 'S053', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (54, 'S054', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (55, 'S055', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (56, 'S056', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (57, 'S057', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (58, 'S058', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (59, 'S059', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (60, 'S060', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (61, 'S061', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (62, 'S062', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (63, 'S063', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (64, 'S064', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (65, 'S065', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (66, 'S066', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (67, 'S067', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (68, 'S068', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (69, 'S069', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (70, 'S070', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (71, 'S071', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (72, 'S072', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (73, 'S073', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (74, 'S074', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (75, 'S075', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (76, 'S076', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (77, 'S077', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (78, 'S078', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (79, 'S079', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (80, 'S080', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (81, 'S081', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (82, 'S082', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (83, 'S083', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (84, 'S084', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (85, 'S085', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (86, 'S086', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (87, 'S087', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (88, 'S088', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (89, 'S089', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (90, 'S090', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (91, 'S091', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (92, 'S092', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (93, 'S093', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (94, 'S094', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (95, 'S095', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (96, 'S096', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (97, 'S097', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (98, 'S098', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (99, 'S099', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (100, 'S100', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (101, 'S101', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (102, 'S102', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (103, 'S103', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (104, 'S104', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (105, 'S105', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (106, 'S106', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (107, 'S107', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (108, 'S108', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (109, 'S109', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (110, 'S110', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (111, 'S111', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (112, 'S112', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (113, 'S113', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (114, 'S114', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (115, 'S115', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (116, 'S116', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (117, 'S117', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (118, 'S118', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (119, 'S119', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (120, 'S120', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (121, 'S121', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (122, 'S122', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (123, 'S123', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (124, 'S124', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (125, 'S125', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (126, 'S126', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (127, 'S127', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (128, 'S128', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (129, 'S129', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (130, 'S130', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (131, 'S131', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (132, 'S132', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (133, 'S133', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (134, 'S134', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (135, 'S135', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (136, 'S136', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (137, 'S137', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (138, 'S138', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (139, 'S139', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (140, 'S140', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (141, 'S141', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (142, 'S142', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (143, 'S143', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (144, 'S144', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (145, 'S145', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (146, 'S146', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (147, 'S147', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (148, 'S148', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (149, 'S149', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (150, 'S150', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (151, 'S151', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (152, 'S152', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (153, 'S153', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (154, 'S154', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (155, 'S155', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (156, 'S156', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (157, 'S157', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (158, 'S158', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (159, 'S159', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (160, 'S160', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (161, 'S161', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (162, 'S162', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (163, 'S163', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (164, 'S164', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (165, 'S165', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (166, 'S166', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (167, 'S167', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (168, 'S168', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (169, 'S169', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (170, 'S170', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (171, 'S171', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (172, 'S172', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (173, 'S173', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (174, 'S174', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (175, 'S175', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (176, 'S176', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (177, 'S177', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (178, 'S178', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (179, 'S179', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (180, 'S180', 'Standard', 101);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (181, 'S001', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (182, 'S002', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (183, 'S003', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (184, 'S004', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (185, 'S005', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (186, 'S006', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (187, 'S007', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (188, 'S008', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (189, 'S009', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (190, 'S010', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (191, 'S011', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (192, 'S012', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (193, 'S013', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (194, 'S014', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (195, 'S015', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (196, 'S016', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (197, 'S017', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (198, 'S018', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (199, 'S019', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (200, 'S020', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (201, 'S021', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (202, 'S022', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (203, 'S023', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (204, 'S024', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (205, 'S025', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (206, 'S026', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (207, 'S027', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (208, 'S028', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (209, 'S029', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (210, 'S030', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (211, 'S031', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (212, 'S032', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (213, 'S033', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (214, 'S034', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (215, 'S035', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (216, 'S036', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (217, 'S037', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (218, 'S038', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (219, 'S039', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (220, 'S040', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (221, 'S041', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (222, 'S042', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (223, 'S043', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (224, 'S044', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (225, 'S045', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (226, 'S046', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (227, 'S047', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (228, 'S048', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (229, 'S049', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (230, 'S050', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (231, 'S051', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (232, 'S052', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (233, 'S053', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (234, 'S054', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (235, 'S055', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (236, 'S056', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (237, 'S057', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (238, 'S058', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (239, 'S059', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (240, 'S060', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (241, 'S061', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (242, 'S062', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (243, 'S063', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (244, 'S064', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (245, 'S065', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (246, 'S066', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (247, 'S067', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (248, 'S068', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (249, 'S069', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (250, 'S070', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (251, 'S071', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (252, 'S072', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (253, 'S073', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (254, 'S074', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (255, 'S075', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (256, 'S076', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (257, 'S077', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (258, 'S078', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (259, 'S079', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (260, 'S080', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (261, 'S081', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (262, 'S082', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (263, 'S083', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (264, 'S084', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (265, 'S085', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (266, 'S086', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (267, 'S087', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (268, 'S088', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (269, 'S089', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (270, 'S090', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (271, 'S091', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (272, 'S092', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (273, 'S093', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (274, 'S094', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (275, 'S095', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (276, 'S096', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (277, 'S097', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (278, 'S098', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (279, 'S099', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (280, 'S100', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (281, 'S101', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (282, 'S102', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (283, 'S103', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (284, 'S104', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (285, 'S105', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (286, 'S106', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (287, 'S107', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (288, 'S108', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (289, 'S109', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (290, 'S110', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (291, 'S111', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (292, 'S112', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (293, 'S113', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (294, 'S114', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (295, 'S115', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (296, 'S116', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (297, 'S117', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (298, 'S118', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (299, 'S119', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (300, 'S120', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (301, 'S121', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (302, 'S122', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (303, 'S123', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (304, 'S124', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (305, 'S125', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (306, 'S126', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (307, 'S127', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (308, 'S128', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (309, 'S129', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (310, 'S130', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (311, 'S131', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (312, 'S132', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (313, 'S133', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (314, 'S134', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (315, 'S135', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (316, 'S136', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (317, 'S137', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (318, 'S138', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (319, 'S139', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (320, 'S140', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (321, 'S141', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (322, 'S142', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (323, 'S143', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (324, 'S144', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (325, 'S145', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (326, 'S146', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (327, 'S147', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (328, 'S148', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (329, 'S149', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (330, 'S150', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (331, 'S151', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (332, 'S152', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (333, 'S153', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (334, 'S154', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (335, 'S155', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (336, 'S156', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (337, 'S157', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (338, 'S158', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (339, 'S159', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (340, 'S160', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (341, 'S161', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (342, 'S162', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (343, 'S163', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (344, 'S164', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (345, 'S165', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (346, 'S166', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (347, 'S167', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (348, 'S168', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (349, 'S169', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (350, 'S170', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (351, 'S171', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (352, 'S172', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (353, 'S173', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (354, 'S174', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (355, 'S175', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (356, 'S176', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (357, 'S177', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (358, 'S178', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (359, 'S179', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (360, 'S180', 'Standard', 102);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (361, 'S001', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (362, 'S002', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (363, 'S003', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (364, 'S004', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (365, 'S005', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (366, 'S006', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (367, 'S007', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (368, 'S008', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (369, 'S009', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (370, 'S010', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (371, 'S011', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (372, 'S012', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (373, 'S013', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (374, 'S014', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (375, 'S015', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (376, 'S016', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (377, 'S017', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (378, 'S018', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (379, 'S019', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (380, 'S020', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (381, 'S021', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (382, 'S022', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (383, 'S023', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (384, 'S024', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (385, 'S025', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (386, 'S026', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (387, 'S027', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (388, 'S028', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (389, 'S029', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (390, 'S030', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (391, 'S031', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (392, 'S032', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (393, 'S033', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (394, 'S034', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (395, 'S035', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (396, 'S036', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (397, 'S037', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (398, 'S038', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (399, 'S039', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (400, 'S040', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (401, 'S041', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (402, 'S042', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (403, 'S043', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (404, 'S044', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (405, 'S045', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (406, 'S046', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (407, 'S047', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (408, 'S048', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (409, 'S049', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (410, 'S050', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (411, 'S051', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (412, 'S052', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (413, 'S053', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (414, 'S054', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (415, 'S055', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (416, 'S056', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (417, 'S057', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (418, 'S058', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (419, 'S059', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (420, 'S060', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (421, 'S061', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (422, 'S062', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (423, 'S063', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (424, 'S064', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (425, 'S065', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (426, 'S066', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (427, 'S067', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (428, 'S068', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (429, 'S069', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (430, 'S070', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (431, 'S071', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (432, 'S072', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (433, 'S073', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (434, 'S074', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (435, 'S075', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (436, 'S076', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (437, 'S077', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (438, 'S078', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (439, 'S079', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (440, 'S080', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (441, 'S081', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (442, 'S082', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (443, 'S083', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (444, 'S084', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (445, 'S085', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (446, 'S086', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (447, 'S087', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (448, 'S088', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (449, 'S089', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (450, 'S090', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (451, 'S091', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (452, 'S092', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (453, 'S093', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (454, 'S094', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (455, 'S095', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (456, 'S096', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (457, 'S097', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (458, 'S098', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (459, 'S099', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (460, 'S100', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (461, 'S101', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (462, 'S102', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (463, 'S103', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (464, 'S104', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (465, 'S105', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (466, 'S106', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (467, 'S107', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (468, 'S108', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (469, 'S109', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (470, 'S110', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (471, 'S111', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (472, 'S112', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (473, 'S113', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (474, 'S114', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (475, 'S115', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (476, 'S116', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (477, 'S117', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (478, 'S118', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (479, 'S119', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (480, 'S120', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (481, 'S121', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (482, 'S122', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (483, 'S123', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (484, 'S124', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (485, 'S125', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (486, 'S126', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (487, 'S127', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (488, 'S128', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (489, 'S129', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (490, 'S130', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (491, 'S131', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (492, 'S132', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (493, 'S133', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (494, 'S134', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (495, 'S135', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (496, 'S136', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (497, 'S137', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (498, 'S138', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (499, 'S139', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (500, 'S140', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (501, 'S141', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (502, 'S142', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (503, 'S143', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (504, 'S144', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (505, 'S145', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (506, 'S146', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (507, 'S147', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (508, 'S148', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (509, 'S149', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (510, 'S150', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (511, 'S151', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (512, 'S152', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (513, 'S153', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (514, 'S154', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (515, 'S155', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (516, 'S156', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (517, 'S157', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (518, 'S158', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (519, 'S159', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (520, 'S160', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (521, 'S161', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (522, 'S162', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (523, 'S163', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (524, 'S164', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (525, 'S165', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (526, 'S166', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (527, 'S167', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (528, 'S168', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (529, 'S169', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (530, 'S170', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (531, 'S171', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (532, 'S172', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (533, 'S173', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (534, 'S174', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (535, 'S175', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (536, 'S176', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (537, 'S177', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (538, 'S178', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (539, 'S179', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (540, 'S180', 'Standard', 103);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (541, 'S001', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (542, 'S002', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (543, 'S003', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (544, 'S004', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (545, 'S005', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (546, 'S006', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (547, 'S007', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (548, 'S008', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (549, 'S009', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (550, 'S010', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (551, 'S011', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (552, 'S012', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (553, 'S013', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (554, 'S014', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (555, 'S015', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (556, 'S016', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (557, 'S017', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (558, 'S018', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (559, 'S019', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (560, 'S020', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (561, 'S021', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (562, 'S022', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (563, 'S023', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (564, 'S024', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (565, 'S025', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (566, 'S026', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (567, 'S027', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (568, 'S028', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (569, 'S029', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (570, 'S030', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (571, 'S031', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (572, 'S032', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (573, 'S033', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (574, 'S034', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (575, 'S035', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (576, 'S036', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (577, 'S037', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (578, 'S038', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (579, 'S039', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (580, 'S040', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (581, 'S041', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (582, 'S042', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (583, 'S043', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (584, 'S044', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (585, 'S045', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (586, 'S046', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (587, 'S047', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (588, 'S048', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (589, 'S049', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (590, 'S050', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (591, 'S051', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (592, 'S052', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (593, 'S053', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (594, 'S054', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (595, 'S055', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (596, 'S056', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (597, 'S057', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (598, 'S058', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (599, 'S059', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (600, 'S060', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (601, 'S061', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (602, 'S062', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (603, 'S063', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (604, 'S064', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (605, 'S065', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (606, 'S066', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (607, 'S067', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (608, 'S068', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (609, 'S069', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (610, 'S070', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (611, 'S071', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (612, 'S072', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (613, 'S073', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (614, 'S074', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (615, 'S075', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (616, 'S076', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (617, 'S077', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (618, 'S078', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (619, 'S079', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (620, 'S080', 'VIP', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (621, 'S081', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (622, 'S082', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (623, 'S083', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (624, 'S084', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (625, 'S085', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (626, 'S086', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (627, 'S087', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (628, 'S088', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (629, 'S089', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (630, 'S090', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (631, 'S091', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (632, 'S092', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (633, 'S093', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (634, 'S094', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (635, 'S095', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (636, 'S096', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (637, 'S097', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (638, 'S098', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (639, 'S099', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (640, 'S100', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (641, 'S101', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (642, 'S102', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (643, 'S103', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (644, 'S104', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (645, 'S105', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (646, 'S106', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (647, 'S107', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (648, 'S108', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (649, 'S109', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (650, 'S110', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (651, 'S111', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (652, 'S112', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (653, 'S113', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (654, 'S114', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (655, 'S115', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (656, 'S116', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (657, 'S117', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (658, 'S118', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (659, 'S119', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (660, 'S120', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (661, 'S121', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (662, 'S122', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (663, 'S123', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (664, 'S124', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (665, 'S125', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (666, 'S126', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (667, 'S127', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (668, 'S128', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (669, 'S129', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (670, 'S130', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (671, 'S131', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (672, 'S132', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (673, 'S133', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (674, 'S134', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (675, 'S135', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (676, 'S136', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (677, 'S137', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (678, 'S138', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (679, 'S139', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (680, 'S140', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (681, 'S141', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (682, 'S142', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (683, 'S143', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (684, 'S144', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (685, 'S145', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (686, 'S146', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (687, 'S147', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (688, 'S148', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (689, 'S149', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (690, 'S150', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (691, 'S151', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (692, 'S152', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (693, 'S153', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (694, 'S154', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (695, 'S155', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (696, 'S156', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (697, 'S157', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (698, 'S158', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (699, 'S159', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (700, 'S160', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (701, 'S161', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (702, 'S162', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (703, 'S163', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (704, 'S164', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (705, 'S165', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (706, 'S166', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (707, 'S167', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (708, 'S168', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (709, 'S169', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (710, 'S170', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (711, 'S171', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (712, 'S172', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (713, 'S173', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (714, 'S174', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (715, 'S175', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (716, 'S176', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (717, 'S177', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (718, 'S178', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (719, 'S179', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (720, 'S180', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (721, 'S181', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (722, 'S182', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (723, 'S183', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (724, 'S184', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (725, 'S185', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (726, 'S186', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (727, 'S187', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (728, 'S188', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (729, 'S189', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (730, 'S190', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (731, 'S191', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (732, 'S192', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (733, 'S193', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (734, 'S194', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (735, 'S195', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (736, 'S196', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (737, 'S197', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (738, 'S198', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (739, 'S199', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (740, 'S200', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (741, 'S201', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (742, 'S202', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (743, 'S203', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (744, 'S204', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (745, 'S205', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (746, 'S206', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (747, 'S207', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (748, 'S208', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (749, 'S209', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (750, 'S210', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (751, 'S211', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (752, 'S212', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (753, 'S213', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (754, 'S214', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (755, 'S215', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (756, 'S216', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (757, 'S217', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (758, 'S218', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (759, 'S219', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (760, 'S220', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (761, 'S221', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (762, 'S222', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (763, 'S223', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (764, 'S224', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (765, 'S225', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (766, 'S226', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (767, 'S227', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (768, 'S228', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (769, 'S229', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (770, 'S230', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (771, 'S231', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (772, 'S232', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (773, 'S233', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (774, 'S234', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (775, 'S235', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (776, 'S236', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (777, 'S237', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (778, 'S238', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (779, 'S239', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (780, 'S240', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (781, 'S241', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (782, 'S242', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (783, 'S243', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (784, 'S244', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (785, 'S245', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (786, 'S246', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (787, 'S247', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (788, 'S248', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (789, 'S249', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (790, 'S250', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (791, 'S251', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (792, 'S252', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (793, 'S253', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (794, 'S254', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (795, 'S255', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (796, 'S256', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (797, 'S257', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (798, 'S258', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (799, 'S259', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (800, 'S260', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (801, 'S261', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (802, 'S262', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (803, 'S263', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (804, 'S264', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (805, 'S265', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (806, 'S266', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (807, 'S267', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (808, 'S268', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (809, 'S269', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (810, 'S270', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (811, 'S271', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (812, 'S272', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (813, 'S273', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (814, 'S274', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (815, 'S275', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (816, 'S276', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (817, 'S277', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (818, 'S278', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (819, 'S279', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (820, 'S280', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (821, 'S281', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (822, 'S282', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (823, 'S283', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (824, 'S284', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (825, 'S285', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (826, 'S286', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (827, 'S287', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (828, 'S288', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (829, 'S289', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (830, 'S290', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (831, 'S291', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (832, 'S292', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (833, 'S293', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (834, 'S294', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (835, 'S295', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (836, 'S296', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (837, 'S297', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (838, 'S298', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (839, 'S299', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (840, 'S300', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (841, 'S301', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (842, 'S302', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (843, 'S303', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (844, 'S304', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (845, 'S305', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (846, 'S306', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (847, 'S307', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (848, 'S308', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (849, 'S309', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (850, 'S310', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (851, 'S311', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (852, 'S312', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (853, 'S313', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (854, 'S314', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (855, 'S315', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (856, 'S316', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (857, 'S317', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (858, 'S318', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (859, 'S319', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (860, 'S320', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (861, 'S321', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (862, 'S322', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (863, 'S323', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (864, 'S324', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (865, 'S325', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (866, 'S326', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (867, 'S327', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (868, 'S328', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (869, 'S329', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (870, 'S330', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (871, 'S331', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (872, 'S332', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (873, 'S333', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (874, 'S334', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (875, 'S335', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (876, 'S336', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (877, 'S337', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (878, 'S338', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (879, 'S339', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (880, 'S340', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (881, 'S341', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (882, 'S342', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (883, 'S343', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (884, 'S344', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (885, 'S345', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (886, 'S346', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (887, 'S347', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (888, 'S348', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (889, 'S349', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (890, 'S350', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (891, 'S351', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (892, 'S352', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (893, 'S353', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (894, 'S354', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (895, 'S355', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (896, 'S356', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (897, 'S357', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (898, 'S358', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (899, 'S359', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (900, 'S360', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (901, 'S361', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (902, 'S362', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (903, 'S363', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (904, 'S364', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (905, 'S365', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (906, 'S366', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (907, 'S367', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (908, 'S368', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (909, 'S369', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (910, 'S370', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (911, 'S371', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (912, 'S372', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (913, 'S373', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (914, 'S374', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (915, 'S375', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (916, 'S376', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (917, 'S377', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (918, 'S378', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (919, 'S379', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (920, 'S380', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (921, 'S381', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (922, 'S382', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (923, 'S383', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (924, 'S384', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (925, 'S385', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (926, 'S386', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (927, 'S387', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (928, 'S388', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (929, 'S389', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (930, 'S390', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (931, 'S391', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (932, 'S392', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (933, 'S393', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (934, 'S394', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (935, 'S395', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (936, 'S396', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (937, 'S397', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (938, 'S398', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (939, 'S399', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (940, 'S400', 'Standard', 104);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (941, 'S001', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (942, 'S002', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (943, 'S003', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (944, 'S004', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (945, 'S005', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (946, 'S006', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (947, 'S007', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (948, 'S008', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (949, 'S009', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (950, 'S010', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (951, 'S011', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (952, 'S012', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (953, 'S013', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (954, 'S014', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (955, 'S015', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (956, 'S016', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (957, 'S017', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (958, 'S018', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (959, 'S019', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (960, 'S020', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (961, 'S021', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (962, 'S022', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (963, 'S023', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (964, 'S024', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (965, 'S025', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (966, 'S026', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (967, 'S027', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (968, 'S028', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (969, 'S029', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (970, 'S030', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (971, 'S031', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (972, 'S032', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (973, 'S033', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (974, 'S034', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (975, 'S035', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (976, 'S036', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (977, 'S037', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (978, 'S038', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (979, 'S039', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (980, 'S040', 'VIP', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (981, 'S041', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (982, 'S042', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (983, 'S043', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (984, 'S044', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (985, 'S045', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (986, 'S046', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (987, 'S047', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (988, 'S048', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (989, 'S049', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (990, 'S050', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (991, 'S051', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (992, 'S052', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (993, 'S053', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (994, 'S054', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (995, 'S055', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (996, 'S056', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (997, 'S057', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (998, 'S058', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (999, 'S059', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1000, 'S060', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1001, 'S061', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1002, 'S062', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1003, 'S063', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1004, 'S064', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1005, 'S065', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1006, 'S066', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1007, 'S067', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1008, 'S068', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1009, 'S069', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1010, 'S070', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1011, 'S071', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1012, 'S072', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1013, 'S073', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1014, 'S074', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1015, 'S075', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1016, 'S076', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1017, 'S077', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1018, 'S078', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1019, 'S079', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1020, 'S080', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1021, 'S081', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1022, 'S082', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1023, 'S083', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1024, 'S084', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1025, 'S085', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1026, 'S086', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1027, 'S087', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1028, 'S088', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1029, 'S089', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1030, 'S090', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1031, 'S091', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1032, 'S092', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1033, 'S093', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1034, 'S094', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1035, 'S095', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1036, 'S096', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1037, 'S097', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1038, 'S098', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1039, 'S099', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1040, 'S100', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1041, 'S101', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1042, 'S102', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1043, 'S103', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1044, 'S104', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1045, 'S105', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1046, 'S106', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1047, 'S107', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1048, 'S108', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1049, 'S109', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1050, 'S110', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1051, 'S111', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1052, 'S112', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1053, 'S113', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1054, 'S114', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1055, 'S115', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1056, 'S116', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1057, 'S117', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1058, 'S118', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1059, 'S119', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1060, 'S120', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1061, 'S121', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1062, 'S122', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1063, 'S123', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1064, 'S124', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1065, 'S125', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1066, 'S126', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1067, 'S127', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1068, 'S128', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1069, 'S129', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1070, 'S130', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1071, 'S131', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1072, 'S132', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1073, 'S133', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1074, 'S134', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1075, 'S135', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1076, 'S136', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1077, 'S137', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1078, 'S138', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1079, 'S139', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1080, 'S140', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1081, 'S141', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1082, 'S142', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1083, 'S143', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1084, 'S144', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1085, 'S145', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1086, 'S146', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1087, 'S147', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1088, 'S148', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1089, 'S149', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1090, 'S150', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1091, 'S151', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1092, 'S152', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1093, 'S153', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1094, 'S154', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1095, 'S155', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1096, 'S156', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1097, 'S157', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1098, 'S158', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1099, 'S159', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1100, 'S160', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1101, 'S161', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1102, 'S162', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1103, 'S163', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1104, 'S164', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1105, 'S165', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1106, 'S166', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1107, 'S167', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1108, 'S168', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1109, 'S169', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1110, 'S170', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1111, 'S171', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1112, 'S172', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1113, 'S173', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1114, 'S174', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1115, 'S175', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1116, 'S176', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1117, 'S177', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1118, 'S178', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1119, 'S179', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1120, 'S180', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1121, 'S181', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1122, 'S182', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1123, 'S183', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1124, 'S184', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1125, 'S185', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1126, 'S186', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1127, 'S187', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1128, 'S188', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1129, 'S189', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1130, 'S190', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1131, 'S191', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1132, 'S192', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1133, 'S193', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1134, 'S194', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1135, 'S195', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1136, 'S196', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1137, 'S197', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1138, 'S198', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1139, 'S199', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1140, 'S200', 'Standard', 105);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1141, 'S001', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1142, 'S002', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1143, 'S003', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1144, 'S004', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1145, 'S005', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1146, 'S006', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1147, 'S007', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1148, 'S008', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1149, 'S009', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1150, 'S010', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1151, 'S011', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1152, 'S012', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1153, 'S013', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1154, 'S014', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1155, 'S015', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1156, 'S016', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1157, 'S017', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1158, 'S018', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1159, 'S019', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1160, 'S020', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1161, 'S021', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1162, 'S022', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1163, 'S023', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1164, 'S024', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1165, 'S025', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1166, 'S026', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1167, 'S027', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1168, 'S028', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1169, 'S029', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1170, 'S030', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1171, 'S031', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1172, 'S032', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1173, 'S033', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1174, 'S034', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1175, 'S035', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1176, 'S036', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1177, 'S037', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1178, 'S038', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1179, 'S039', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1180, 'S040', 'VIP', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1181, 'S041', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1182, 'S042', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1183, 'S043', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1184, 'S044', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1185, 'S045', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1186, 'S046', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1187, 'S047', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1188, 'S048', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1189, 'S049', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1190, 'S050', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1191, 'S051', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1192, 'S052', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1193, 'S053', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1194, 'S054', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1195, 'S055', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1196, 'S056', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1197, 'S057', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1198, 'S058', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1199, 'S059', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1200, 'S060', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1201, 'S061', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1202, 'S062', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1203, 'S063', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1204, 'S064', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1205, 'S065', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1206, 'S066', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1207, 'S067', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1208, 'S068', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1209, 'S069', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1210, 'S070', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1211, 'S071', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1212, 'S072', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1213, 'S073', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1214, 'S074', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1215, 'S075', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1216, 'S076', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1217, 'S077', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1218, 'S078', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1219, 'S079', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1220, 'S080', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1221, 'S081', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1222, 'S082', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1223, 'S083', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1224, 'S084', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1225, 'S085', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1226, 'S086', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1227, 'S087', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1228, 'S088', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1229, 'S089', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1230, 'S090', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1231, 'S091', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1232, 'S092', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1233, 'S093', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1234, 'S094', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1235, 'S095', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1236, 'S096', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1237, 'S097', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1238, 'S098', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1239, 'S099', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1240, 'S100', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1241, 'S101', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1242, 'S102', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1243, 'S103', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1244, 'S104', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1245, 'S105', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1246, 'S106', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1247, 'S107', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1248, 'S108', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1249, 'S109', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1250, 'S110', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1251, 'S111', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1252, 'S112', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1253, 'S113', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1254, 'S114', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1255, 'S115', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1256, 'S116', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1257, 'S117', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1258, 'S118', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1259, 'S119', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1260, 'S120', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1261, 'S121', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1262, 'S122', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1263, 'S123', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1264, 'S124', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1265, 'S125', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1266, 'S126', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1267, 'S127', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1268, 'S128', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1269, 'S129', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1270, 'S130', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1271, 'S131', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1272, 'S132', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1273, 'S133', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1274, 'S134', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1275, 'S135', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1276, 'S136', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1277, 'S137', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1278, 'S138', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1279, 'S139', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1280, 'S140', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1281, 'S141', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1282, 'S142', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1283, 'S143', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1284, 'S144', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1285, 'S145', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1286, 'S146', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1287, 'S147', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1288, 'S148', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1289, 'S149', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1290, 'S150', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1291, 'S151', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1292, 'S152', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1293, 'S153', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1294, 'S154', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1295, 'S155', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1296, 'S156', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1297, 'S157', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1298, 'S158', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1299, 'S159', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1300, 'S160', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1301, 'S161', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1302, 'S162', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1303, 'S163', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1304, 'S164', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1305, 'S165', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1306, 'S166', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1307, 'S167', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1308, 'S168', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1309, 'S169', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1310, 'S170', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1311, 'S171', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1312, 'S172', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1313, 'S173', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1314, 'S174', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1315, 'S175', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1316, 'S176', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1317, 'S177', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1318, 'S178', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1319, 'S179', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1320, 'S180', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1321, 'S181', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1322, 'S182', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1323, 'S183', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1324, 'S184', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1325, 'S185', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1326, 'S186', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1327, 'S187', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1328, 'S188', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1329, 'S189', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1330, 'S190', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1331, 'S191', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1332, 'S192', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1333, 'S193', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1334, 'S194', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1335, 'S195', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1336, 'S196', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1337, 'S197', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1338, 'S198', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1339, 'S199', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1340, 'S200', 'Standard', 106);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1341, 'S001', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1342, 'S002', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1343, 'S003', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1344, 'S004', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1345, 'S005', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1346, 'S006', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1347, 'S007', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1348, 'S008', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1349, 'S009', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1350, 'S010', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1351, 'S011', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1352, 'S012', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1353, 'S013', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1354, 'S014', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1355, 'S015', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1356, 'S016', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1357, 'S017', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1358, 'S018', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1359, 'S019', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1360, 'S020', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1361, 'S021', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1362, 'S022', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1363, 'S023', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1364, 'S024', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1365, 'S025', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1366, 'S026', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1367, 'S027', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1368, 'S028', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1369, 'S029', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1370, 'S030', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1371, 'S031', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1372, 'S032', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1373, 'S033', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1374, 'S034', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1375, 'S035', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1376, 'S036', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1377, 'S037', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1378, 'S038', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1379, 'S039', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1380, 'S040', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1381, 'S041', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1382, 'S042', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1383, 'S043', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1384, 'S044', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1385, 'S045', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1386, 'S046', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1387, 'S047', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1388, 'S048', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1389, 'S049', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1390, 'S050', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1391, 'S051', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1392, 'S052', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1393, 'S053', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1394, 'S054', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1395, 'S055', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1396, 'S056', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1397, 'S057', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1398, 'S058', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1399, 'S059', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1400, 'S060', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1401, 'S061', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1402, 'S062', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1403, 'S063', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1404, 'S064', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1405, 'S065', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1406, 'S066', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1407, 'S067', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1408, 'S068', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1409, 'S069', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1410, 'S070', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1411, 'S071', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1412, 'S072', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1413, 'S073', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1414, 'S074', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1415, 'S075', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1416, 'S076', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1417, 'S077', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1418, 'S078', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1419, 'S079', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1420, 'S080', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1421, 'S081', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1422, 'S082', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1423, 'S083', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1424, 'S084', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1425, 'S085', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1426, 'S086', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1427, 'S087', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1428, 'S088', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1429, 'S089', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1430, 'S090', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1431, 'S091', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1432, 'S092', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1433, 'S093', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1434, 'S094', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1435, 'S095', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1436, 'S096', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1437, 'S097', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1438, 'S098', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1439, 'S099', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1440, 'S100', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1441, 'S101', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1442, 'S102', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1443, 'S103', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1444, 'S104', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1445, 'S105', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1446, 'S106', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1447, 'S107', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1448, 'S108', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1449, 'S109', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1450, 'S110', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1451, 'S111', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1452, 'S112', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1453, 'S113', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1454, 'S114', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1455, 'S115', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1456, 'S116', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1457, 'S117', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1458, 'S118', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1459, 'S119', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1460, 'S120', 'Standard', 107);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1461, 'S001', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1462, 'S002', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1463, 'S003', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1464, 'S004', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1465, 'S005', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1466, 'S006', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1467, 'S007', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1468, 'S008', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1469, 'S009', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1470, 'S010', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1471, 'S011', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1472, 'S012', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1473, 'S013', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1474, 'S014', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1475, 'S015', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1476, 'S016', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1477, 'S017', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1478, 'S018', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1479, 'S019', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1480, 'S020', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1481, 'S021', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1482, 'S022', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1483, 'S023', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1484, 'S024', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1485, 'S025', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1486, 'S026', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1487, 'S027', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1488, 'S028', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1489, 'S029', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1490, 'S030', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1491, 'S031', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1492, 'S032', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1493, 'S033', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1494, 'S034', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1495, 'S035', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1496, 'S036', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1497, 'S037', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1498, 'S038', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1499, 'S039', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1500, 'S040', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1501, 'S041', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1502, 'S042', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1503, 'S043', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1504, 'S044', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1505, 'S045', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1506, 'S046', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1507, 'S047', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1508, 'S048', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1509, 'S049', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1510, 'S050', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1511, 'S051', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1512, 'S052', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1513, 'S053', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1514, 'S054', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1515, 'S055', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1516, 'S056', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1517, 'S057', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1518, 'S058', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1519, 'S059', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1520, 'S060', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1521, 'S061', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1522, 'S062', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1523, 'S063', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1524, 'S064', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1525, 'S065', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1526, 'S066', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1527, 'S067', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1528, 'S068', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1529, 'S069', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1530, 'S070', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1531, 'S071', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1532, 'S072', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1533, 'S073', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1534, 'S074', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1535, 'S075', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1536, 'S076', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1537, 'S077', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1538, 'S078', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1539, 'S079', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1540, 'S080', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1541, 'S081', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1542, 'S082', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1543, 'S083', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1544, 'S084', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1545, 'S085', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1546, 'S086', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1547, 'S087', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1548, 'S088', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1549, 'S089', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1550, 'S090', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1551, 'S091', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1552, 'S092', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1553, 'S093', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1554, 'S094', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1555, 'S095', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1556, 'S096', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1557, 'S097', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1558, 'S098', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1559, 'S099', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1560, 'S100', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1561, 'S101', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1562, 'S102', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1563, 'S103', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1564, 'S104', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1565, 'S105', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1566, 'S106', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1567, 'S107', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1568, 'S108', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1569, 'S109', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1570, 'S110', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1571, 'S111', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1572, 'S112', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1573, 'S113', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1574, 'S114', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1575, 'S115', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1576, 'S116', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1577, 'S117', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1578, 'S118', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1579, 'S119', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1580, 'S120', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1581, 'S121', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1582, 'S122', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1583, 'S123', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1584, 'S124', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1585, 'S125', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1586, 'S126', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1587, 'S127', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1588, 'S128', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1589, 'S129', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1590, 'S130', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1591, 'S131', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1592, 'S132', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1593, 'S133', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1594, 'S134', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1595, 'S135', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1596, 'S136', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1597, 'S137', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1598, 'S138', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1599, 'S139', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1600, 'S140', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1601, 'S141', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1602, 'S142', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1603, 'S143', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1604, 'S144', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1605, 'S145', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1606, 'S146', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1607, 'S147', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1608, 'S148', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1609, 'S149', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1610, 'S150', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1611, 'S151', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1612, 'S152', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1613, 'S153', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1614, 'S154', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1615, 'S155', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1616, 'S156', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1617, 'S157', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1618, 'S158', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1619, 'S159', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1620, 'S160', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1621, 'S161', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1622, 'S162', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1623, 'S163', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1624, 'S164', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1625, 'S165', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1626, 'S166', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1627, 'S167', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1628, 'S168', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1629, 'S169', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1630, 'S170', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1631, 'S171', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1632, 'S172', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1633, 'S173', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1634, 'S174', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1635, 'S175', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1636, 'S176', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1637, 'S177', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1638, 'S178', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1639, 'S179', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1640, 'S180', 'Standard', 108);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1641, 'S001', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1642, 'S002', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1643, 'S003', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1644, 'S004', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1645, 'S005', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1646, 'S006', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1647, 'S007', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1648, 'S008', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1649, 'S009', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1650, 'S010', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1651, 'S011', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1652, 'S012', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1653, 'S013', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1654, 'S014', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1655, 'S015', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1656, 'S016', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1657, 'S017', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1658, 'S018', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1659, 'S019', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1660, 'S020', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1661, 'S021', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1662, 'S022', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1663, 'S023', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1664, 'S024', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1665, 'S025', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1666, 'S026', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1667, 'S027', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1668, 'S028', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1669, 'S029', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1670, 'S030', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1671, 'S031', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1672, 'S032', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1673, 'S033', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1674, 'S034', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1675, 'S035', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1676, 'S036', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1677, 'S037', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1678, 'S038', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1679, 'S039', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1680, 'S040', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1681, 'S041', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1682, 'S042', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1683, 'S043', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1684, 'S044', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1685, 'S045', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1686, 'S046', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1687, 'S047', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1688, 'S048', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1689, 'S049', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1690, 'S050', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1691, 'S051', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1692, 'S052', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1693, 'S053', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1694, 'S054', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1695, 'S055', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1696, 'S056', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1697, 'S057', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1698, 'S058', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1699, 'S059', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1700, 'S060', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1701, 'S061', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1702, 'S062', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1703, 'S063', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1704, 'S064', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1705, 'S065', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1706, 'S066', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1707, 'S067', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1708, 'S068', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1709, 'S069', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1710, 'S070', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1711, 'S071', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1712, 'S072', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1713, 'S073', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1714, 'S074', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1715, 'S075', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1716, 'S076', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1717, 'S077', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1718, 'S078', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1719, 'S079', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1720, 'S080', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1721, 'S081', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1722, 'S082', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1723, 'S083', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1724, 'S084', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1725, 'S085', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1726, 'S086', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1727, 'S087', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1728, 'S088', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1729, 'S089', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1730, 'S090', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1731, 'S091', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1732, 'S092', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1733, 'S093', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1734, 'S094', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1735, 'S095', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1736, 'S096', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1737, 'S097', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1738, 'S098', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1739, 'S099', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1740, 'S100', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1741, 'S101', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1742, 'S102', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1743, 'S103', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1744, 'S104', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1745, 'S105', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1746, 'S106', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1747, 'S107', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1748, 'S108', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1749, 'S109', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1750, 'S110', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1751, 'S111', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1752, 'S112', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1753, 'S113', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1754, 'S114', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1755, 'S115', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1756, 'S116', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1757, 'S117', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1758, 'S118', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1759, 'S119', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1760, 'S120', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1761, 'S121', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1762, 'S122', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1763, 'S123', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1764, 'S124', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1765, 'S125', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1766, 'S126', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1767, 'S127', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1768, 'S128', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1769, 'S129', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1770, 'S130', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1771, 'S131', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1772, 'S132', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1773, 'S133', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1774, 'S134', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1775, 'S135', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1776, 'S136', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1777, 'S137', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1778, 'S138', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1779, 'S139', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1780, 'S140', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1781, 'S141', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1782, 'S142', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1783, 'S143', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1784, 'S144', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1785, 'S145', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1786, 'S146', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1787, 'S147', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1788, 'S148', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1789, 'S149', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1790, 'S150', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1791, 'S151', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1792, 'S152', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1793, 'S153', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1794, 'S154', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1795, 'S155', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1796, 'S156', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1797, 'S157', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1798, 'S158', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1799, 'S159', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1800, 'S160', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1801, 'S161', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1802, 'S162', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1803, 'S163', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1804, 'S164', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1805, 'S165', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1806, 'S166', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1807, 'S167', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1808, 'S168', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1809, 'S169', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1810, 'S170', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1811, 'S171', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1812, 'S172', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1813, 'S173', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1814, 'S174', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1815, 'S175', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1816, 'S176', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1817, 'S177', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1818, 'S178', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1819, 'S179', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1820, 'S180', 'Standard', 109);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1821, 'S001', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1822, 'S002', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1823, 'S003', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1824, 'S004', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1825, 'S005', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1826, 'S006', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1827, 'S007', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1828, 'S008', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1829, 'S009', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1830, 'S010', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1831, 'S011', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1832, 'S012', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1833, 'S013', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1834, 'S014', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1835, 'S015', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1836, 'S016', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1837, 'S017', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1838, 'S018', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1839, 'S019', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1840, 'S020', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1841, 'S021', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1842, 'S022', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1843, 'S023', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1844, 'S024', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1845, 'S025', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1846, 'S026', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1847, 'S027', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1848, 'S028', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1849, 'S029', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1850, 'S030', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1851, 'S031', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1852, 'S032', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1853, 'S033', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1854, 'S034', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1855, 'S035', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1856, 'S036', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1857, 'S037', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1858, 'S038', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1859, 'S039', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1860, 'S040', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1861, 'S041', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1862, 'S042', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1863, 'S043', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1864, 'S044', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1865, 'S045', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1866, 'S046', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1867, 'S047', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1868, 'S048', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1869, 'S049', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1870, 'S050', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1871, 'S051', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1872, 'S052', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1873, 'S053', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1874, 'S054', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1875, 'S055', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1876, 'S056', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1877, 'S057', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1878, 'S058', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1879, 'S059', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1880, 'S060', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1881, 'S061', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1882, 'S062', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1883, 'S063', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1884, 'S064', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1885, 'S065', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1886, 'S066', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1887, 'S067', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1888, 'S068', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1889, 'S069', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1890, 'S070', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1891, 'S071', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1892, 'S072', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1893, 'S073', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1894, 'S074', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1895, 'S075', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1896, 'S076', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1897, 'S077', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1898, 'S078', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1899, 'S079', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1900, 'S080', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1901, 'S081', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1902, 'S082', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1903, 'S083', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1904, 'S084', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1905, 'S085', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1906, 'S086', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1907, 'S087', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1908, 'S088', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1909, 'S089', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1910, 'S090', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1911, 'S091', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1912, 'S092', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1913, 'S093', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1914, 'S094', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1915, 'S095', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1916, 'S096', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1917, 'S097', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1918, 'S098', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1919, 'S099', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1920, 'S100', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1921, 'S101', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1922, 'S102', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1923, 'S103', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1924, 'S104', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1925, 'S105', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1926, 'S106', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1927, 'S107', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1928, 'S108', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1929, 'S109', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1930, 'S110', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1931, 'S111', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1932, 'S112', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1933, 'S113', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1934, 'S114', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1935, 'S115', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1936, 'S116', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1937, 'S117', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1938, 'S118', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1939, 'S119', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1940, 'S120', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1941, 'S121', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1942, 'S122', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1943, 'S123', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1944, 'S124', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1945, 'S125', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1946, 'S126', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1947, 'S127', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1948, 'S128', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1949, 'S129', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1950, 'S130', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1951, 'S131', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1952, 'S132', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1953, 'S133', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1954, 'S134', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1955, 'S135', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1956, 'S136', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1957, 'S137', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1958, 'S138', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1959, 'S139', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1960, 'S140', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1961, 'S141', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1962, 'S142', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1963, 'S143', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1964, 'S144', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1965, 'S145', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1966, 'S146', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1967, 'S147', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1968, 'S148', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1969, 'S149', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1970, 'S150', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1971, 'S151', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1972, 'S152', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1973, 'S153', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1974, 'S154', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1975, 'S155', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1976, 'S156', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1977, 'S157', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1978, 'S158', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1979, 'S159', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1980, 'S160', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1981, 'S161', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1982, 'S162', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1983, 'S163', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1984, 'S164', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1985, 'S165', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1986, 'S166', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1987, 'S167', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1988, 'S168', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1989, 'S169', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1990, 'S170', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1991, 'S171', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1992, 'S172', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1993, 'S173', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1994, 'S174', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1995, 'S175', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1996, 'S176', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1997, 'S177', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1998, 'S178', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (1999, 'S179', 'Standard', 110);
INSERT INTO SIEGE (id_Siege, numero_Siege, Zone, id_Salle) VALUES (2000, 'S180', 'Standard', 110);

-- INSERTION DES SEANCES
INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (1, '13-11-2024', '10:00:00', '12:00:00', 'VOST', 101, 558449, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (2, '13-11-2024', '12:30:00', '14:30:00', 'VF', 102, 558449, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (3, '29-11-2024', '20:00:00', '22:00:00', 'VOST', 103, 558449, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (4, '04-12-2024', '18:00:00', '20:20:00', 'VOST', 104, 558449, 2);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (5, '10-12-2024', '20:05:00', '23:00:00', 'VF', 105, 402431, 3);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (6, '12-02-2024', '17:30:00', '20:30:00', 'VOST', 103, 402431, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (7, '11-12-2024', '11:00:00', '13:30:00', 'VOST', 107, 839033, 5);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (8, '23-12-2024', '19:30:00', '22:00:00', 'VF', 101, 839033, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (9, '18-12-2024', '18:00:00', '20:40:00', 'VOST', 109, 762509, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (10, '19-12-2024', '20:00:00', '22:40:00', 'VOST', 110, 762509, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (11, '28-04-2024', '10:00:00', '12:40:00', 'VF', 101, 762509, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (12, '27-11-2024', '12:30:00', '14:30:00', 'VOST', 102, 1241982, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (13, '30-11-2024', '18:00:00', '20:00:00', 'VOST', 103, 1241982, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (14, '05-12-2024', '18:00:00', '20:00:00', 'VF', 104, 1241982, 2);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (15, '21-12-2024', '20:15:00', '22:15:00', 'VF', 105, 1241982, 3);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (16, '21-12-2024', '20:30:00', '22:30:00', 'VOST', 105, 1241982, 3);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (17, '18-12-2024', '20:30:00', '23:00:00', 'VF', 101, 539972, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (18, '20-12-2024', '20:30:00', '23:00:00', 'VOST', 103, 539972, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (19, '25-12-2024', '20:30:00', '22:30:00', 'VF', 105, 939243, 3);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (21, '26-12-2024', '20:30:00', '22:30:00', 'VF', 110, 939243, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (22, '01-01-2025', '17:15:00', '20:15:00', 'VOST', 108, 939243, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (23, '04-01-2025', '18:00:00', '20:00:00', 'VOST', 107, 939243, 5);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (24, '16-10-2024', '20:30:00', '23:00:00', 'VF', 102, 1100782, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (25, '20-10-2024', '20:30:00', '23:00:00', 'VOST', 109, 1100782, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (26, '30-10-2024', '20:30:00', '22:30:00', 'VF', 103, 912649, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (27, '11-11-2024', '20:30:00', '22:30:00', 'VOST', 103, 912649, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (28, '09-10-2024', '20:30:00', '22:30:00', 'VF', 102, 1184918, 4);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (29, '11-10-2024', '17:30:00', '20:30:00', 'VF', 104, 1184918, 2);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (30, '23-10-2024', '19:30:00', '21:30:00', 'VOST', 107, 698687, 5);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (31, '02-10-2024', '19:30:00', '22:10:00', 'VOST', 101, 889737, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (32, '23-10-2024', '19:30:00', '22:20:00', 'VOST', 101, 889737, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (33, '31-10-2024', '19:30:00', '21:30:00', 'VOST', 108, 1208808, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (34, '09-11-2024', '19:30:00', '21:30:00', 'VOST', 109, 1208808, 1);

INSERT INTO SEANCE (id_Seance, Date_Seance, Heure_Début, Heure_Fin, Version_Film, id_Salle, id_Film, id_Format)
VALUES (35, '25-11-2024', '19:30:00', '21:10:00', 'VOST', 110, 1299652, 4);

-- INSERTION DES BILLETS
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (1, 7.50, '-12', 1, 31);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (2, 15.00, 'normal', 1, 18);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (3, 7.50, '-12', 1, 116);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (4, 10.00, 'étudiant', 1, 72);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (5, 15.00, 'normal', 1, 97);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (6, 15.00, 'normal', 2, 188);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (7, 7.50, '-12', 2, 257);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (8, 7.50, '-12', 2, 235);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (9, 7.50, '-12', 2, 360);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (10, 7.50, '-12', 2, 202);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (11, 15.00, 'normal', 2, 298);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (12, 7.50, '-12', 2, 191);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (13, 10.00, 'étudiant', 2, 260);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (14, 7.50, '-12', 2, 339);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (15, 15.00, 'normal', 3, 437);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (16, 10.00, 'étudiant', 3, 485);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (17, 15.00, 'normal', 3, 525);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (18, 15.00, 'normal', 3, 495);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (19, 10.00, 'étudiant', 3, 367);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (20, 15.00, 'normal', 3, 439);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (21, 7.50, '-12', 3, 375);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (22, 10.00, 'étudiant', 3, 490);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (23, 7.50, '-12', 3, 457);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (24, 15.00, 'normal', 3, 512);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (25, 15.00, 'normal', 4, 551);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (26, 10.00, 'étudiant', 4, 544);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (27, 7.50, '-12', 4, 553);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (28, 10.00, 'étudiant', 4, 564);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (29, 10.00, 'étudiant', 4, 613);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (30, 15.00, 'normal', 4, 570);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (31, 7.50, '-12', 4, 542);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (32, 15.00, 'normal', 4, 615);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (33, 7.50, '-12', 4, 590);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (34, 10.00, 'étudiant', 5, 954);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (35, 15.00, 'normal', 5, 1068);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (36, 10.00, 'étudiant', 5, 966);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (37, 10.00, 'étudiant', 5, 1140);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (38, 10.00, 'étudiant', 5, 970);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (39, 7.50, '-12', 5, 967);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (40, 7.50, '-12', 5, 1113);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (41, 7.50, '-12', 5, 1099);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (42, 15.00, 'normal', 5, 1101);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (43, 15.00, 'normal', 6, 379);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (44, 10.00, 'étudiant', 6, 398);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (45, 10.00, 'étudiant', 6, 377);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (46, 7.50, '-12', 6, 537);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (47, 15.00, 'normal', 6, 370);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (48, 10.00, 'étudiant', 7, 1362);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (49, 15.00, 'normal', 7, 1421);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (50, 10.00, 'étudiant', 7, 1393);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (51, 7.50, '-12', 7, 1415);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (52, 7.50, '-12', 7, 1407);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (53, 10.00, 'étudiant', 8, 90);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (54, 15.00, 'normal', 8, 168);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (55, 7.50, '-12', 8, 170);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (56, 10.00, 'étudiant', 8, 82);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (57, 7.50, '-12', 8, 63);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (58, 10.00, 'étudiant', 9, 1792);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (59, 7.50, '-12', 9, 1765);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (60, 15.00, 'normal', 9, 1644);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (61, 7.50, '-12', 9, 1813);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (62, 10.00, 'étudiant', 9, 1762);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (63, 15.00, 'normal', 9, 1752);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (64, 10.00, 'étudiant', 9, 1705);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (65, 7.50, '-12', 9, 1748);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (66, 7.50, '-12', 9, 1795);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (67, 15.00, 'normal', 9, 1697);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (68, 7.50, '-12', 10, 1990);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (69, 10.00, 'étudiant', 10, 1829);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (70, 15.00, 'normal', 10, 1855);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (71, 15.00, 'normal', 10, 1870);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (72, 15.00, 'normal', 10, 1923);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (73, 15.00, 'normal', 10, 1863);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (74, 7.50, '-12', 10, 1933);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (75, 10.00, 'étudiant', 10, 1991);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (76, 15.00, 'normal', 10, 1967);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (77, 15.00, 'normal', 10, 1980);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (78, 7.50, '-12', 11, 52);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (79, 10.00, 'étudiant', 11, 76);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (80, 7.50, '-12', 11, 18);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (81, 7.50, '-12', 11, 2);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (82, 10.00, 'étudiant', 12, 294);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (83, 10.00, 'étudiant', 12, 289);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (84, 7.50, '-12', 12, 305);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (85, 7.50, '-12', 12, 269);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (86, 7.50, '-12', 12, 209);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (87, 7.50, '-12', 12, 273);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (88, 7.50, '-12', 12, 337);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (89, 10.00, 'étudiant', 12, 267);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (90, 15.00, 'normal', 13, 459);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (91, 15.00, 'normal', 13, 504);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (92, 10.00, 'étudiant', 13, 441);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (93, 7.50, '-12', 13, 480);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (94, 10.00, 'étudiant', 13, 375);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (95, 15.00, 'normal', 13, 369);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (96, 10.00, 'étudiant', 13, 536);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (97, 7.50, '-12', 13, 385);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (98, 15.00, 'normal', 14, 573);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (99, 15.00, 'normal', 14, 549);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (100, 10.00, 'étudiant', 14, 595);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (101, 15.00, 'normal', 14, 557);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (102, 10.00, 'étudiant', 14, 618);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (103, 7.50, '-12', 14, 567);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (104, 10.00, 'étudiant', 14, 547);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (105, 15.00, 'normal', 14, 548);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (106, 10.00, 'étudiant', 15, 972);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (107, 15.00, 'normal', 15, 1125);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (108, 15.00, 'normal', 15, 1069);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (109, 15.00, 'normal', 15, 1091);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (110, 10.00, 'étudiant', 15, 999);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (111, 15.00, 'normal', 16, 1062);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (112, 15.00, 'normal', 16, 1055);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (113, 10.00, 'étudiant', 16, 984);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (114, 10.00, 'étudiant', 16, 1128);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (115, 7.50, '-12', 16, 1072);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (116, 15.00, 'normal', 16, 1137);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (117, 7.50, '-12', 16, 1000);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (118, 10.00, 'étudiant', 17, 120);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (119, 10.00, 'étudiant', 17, 50);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (120, 10.00, 'étudiant', 17, 143);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (121, 15.00, 'normal', 17, 174);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (122, 10.00, 'étudiant', 17, 36);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (123, 15.00, 'normal', 17, 9);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (124, 15.00, 'normal', 17, 110);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (125, 10.00, 'étudiant', 18, 420);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (126, 7.50, '-12', 18, 474);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (127, 10.00, 'étudiant', 18, 380);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (128, 10.00, 'étudiant', 18, 390);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (129, 7.50, '-12', 18, 367);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (130, 10.00, 'étudiant', 18, 534);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (131, 7.50, '-12', 19, 1051);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (132, 10.00, 'étudiant', 19, 972);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (133, 7.50, '-12', 19, 978);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (134, 15.00, 'normal', 19, 986);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (135, 15.00, 'normal', 19, 1096);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (136, 10.00, 'étudiant', 19, 1134);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (137, 7.50, '-12', 19, 941);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (138, 10.00, 'étudiant', 19, 1069);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (139, 10.00, 'étudiant', 21, 1966);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (140, 10.00, 'étudiant', 21, 1859);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (141, 10.00, 'étudiant', 21, 1954);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (142, 10.00, 'étudiant', 21, 1860);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (143, 7.50, '-12', 21, 1922);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (144, 10.00, 'étudiant', 21, 1861);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (145, 10.00, 'étudiant', 21, 1855);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (146, 15.00, 'normal', 21, 1854);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (147, 10.00, 'étudiant', 21, 1867);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (148, 10.00, 'étudiant', 22, 1632);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (149, 15.00, 'normal', 22, 1472);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (150, 7.50, '-12', 22, 1531);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (151, 7.50, '-12', 22, 1615);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (152, 15.00, 'normal', 22, 1565);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (153, 7.50, '-12', 22, 1553);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (154, 15.00, 'normal', 22, 1492);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (155, 10.00, 'étudiant', 22, 1633);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (156, 15.00, 'normal', 22, 1505);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (157, 15.00, 'normal', 23, 1457);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (158, 15.00, 'normal', 23, 1375);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (159, 7.50, '-12', 23, 1359);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (160, 7.50, '-12', 23, 1364);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (161, 15.00, 'normal', 23, 1449);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (162, 10.00, 'étudiant', 23, 1383);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (163, 7.50, '-12', 23, 1440);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (164, 15.00, 'normal', 24, 343);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (165, 15.00, 'normal', 24, 332);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (166, 10.00, 'étudiant', 24, 236);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (167, 10.00, 'étudiant', 24, 286);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (168, 10.00, 'étudiant', 24, 190);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (169, 10.00, 'étudiant', 24, 191);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (170, 15.00, 'normal', 25, 1728);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (171, 10.00, 'étudiant', 25, 1699);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (172, 10.00, 'étudiant', 25, 1697);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (173, 10.00, 'étudiant', 25, 1725);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (174, 10.00, 'étudiant', 25, 1739);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (175, 10.00, 'étudiant', 25, 1736);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (176, 7.50, '-12', 25, 1808);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (177, 7.50, '-12', 25, 1660);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (178, 15.00, 'normal', 26, 505);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (179, 10.00, 'étudiant', 26, 371);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (180, 10.00, 'étudiant', 26, 419);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (181, 10.00, 'étudiant', 26, 462);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (182, 7.50, '-12', 26, 438);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (183, 15.00, 'normal', 26, 417);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (184, 15.00, 'normal', 26, 498);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (185, 7.50, '-12', 26, 398);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (186, 7.50, '-12', 26, 415);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (187, 7.50, '-12', 26, 481);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (188, 10.00, 'étudiant', 27, 394);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (189, 15.00, 'normal', 27, 509);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (190, 7.50, '-12', 27, 434);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (191, 15.00, 'normal', 27, 369);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (192, 7.50, '-12', 27, 370);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (193, 15.00, 'normal', 28, 186);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (194, 7.50, '-12', 28, 258);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (195, 10.00, 'étudiant', 28, 284);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (196, 15.00, 'normal', 28, 182);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (197, 7.50, '-12', 28, 194);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (198, 15.00, 'normal', 28, 214);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (199, 15.00, 'normal', 28, 226);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (200, 10.00, 'étudiant', 28, 290);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (201, 10.00, 'étudiant', 28, 358);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (202, 10.00, 'étudiant', 28, 354);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (203, 10.00, 'étudiant', 29, 575);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (204, 15.00, 'normal', 29, 567);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (205, 10.00, 'étudiant', 29, 617);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (206, 7.50, '-12', 29, 586);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (207, 15.00, 'normal', 29, 557);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (208, 15.00, 'normal', 29, 582);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (209, 15.00, 'normal', 29, 551);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (210, 15.00, 'normal', 29, 584);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (211, 10.00, 'étudiant', 29, 549);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (212, 10.00, 'étudiant', 29, 609);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (213, 7.50, '-12', 30, 1359);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (214, 10.00, 'étudiant', 30, 1449);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (215, 15.00, 'normal', 30, 1455);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (216, 15.00, 'normal', 30, 1396);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (217, 10.00, 'étudiant', 30, 1377);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (218, 10.00, 'étudiant', 30, 1351);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (219, 10.00, 'étudiant', 30, 1366);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (220, 10.00, 'étudiant', 30, 1425);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (221, 7.50, '-12', 31, 113);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (222, 15.00, 'normal', 31, 77);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (223, 15.00, 'normal', 31, 2);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (224, 7.50, '-12', 31, 144);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (225, 7.50, '-12', 32, 126);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (226, 15.00, 'normal', 32, 17);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (227, 7.50, '-12', 32, 27);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (228, 10.00, 'étudiant', 32, 54);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (229, 7.50, '-12', 32, 12);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (230, 10.00, 'étudiant', 32, 15);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (231, 15.00, 'normal', 32, 156);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (232, 10.00, 'étudiant', 33, 1573);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (233, 7.50, '-12', 33, 1555);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (234, 7.50, '-12', 33, 1476);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (235, 7.50, '-12', 33, 1529);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (236, 7.50, '-12', 33, 1536);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (237, 10.00, 'étudiant', 33, 1568);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (238, 10.00, 'étudiant', 33, 1549);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (239, 7.50, '-12', 33, 1574);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (240, 10.00, 'étudiant', 34, 1817);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (241, 10.00, 'étudiant', 34, 1805);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (242, 7.50, '-12', 34, 1694);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (243, 15.00, 'normal', 34, 1776);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (244, 10.00, 'étudiant', 34, 1733);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (245, 15.00, 'normal', 34, 1716);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (246, 7.50, '-12', 34, 1751);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (247, 15.00, 'normal', 35, 1844);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (248, 15.00, 'normal', 35, 1916);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (249, 10.00, 'étudiant', 35, 1823);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (250, 10.00, 'étudiant', 35, 1894);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (251, 7.50, '-12', 35, 1984);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (252, 10.00, 'étudiant', 35, 1872);
INSERT INTO BILLET (id_Billet, Prix, Catégorie, id_Seance, id_Siege) VALUES (253, 7.50, '-12', 35, 1862);

-- Insertion des acteurs : pas eu le temps de corriger la nationalité qui est ici le lieu de naissance 
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (18918, 'Johnson', 'Dwayne', 'Hayward, California, USA', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (16828, 'Evans', 'Chris', 'Sudbury, Massachusetts, USA', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (18999, 'Simmons', 'J.K.', 'Detroit, Michigan, USA', 69);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (140, 'Liu', 'Lucy', 'New York City, New York, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (934289, 'Shipka', 'Kiernan', 'Chicago, Illinois, USA', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2524, 'Hardy', 'Tom', 'Hammersmith, London, England, UK', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5294, 'Ejiofor', 'Chiwetel', 'Forest Gate, London, England, UK', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (36594, 'Temple', 'Juno', 'Hammersmith, London, England, UK', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1861573, 'Backo', 'Clark', 'Montréal, Québec, Canada', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (7026, 'Ifans', 'Rhys', 'Haverfordwest, Pembrokeshire, Wales, UK', 57);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1564846, 'Cravalho', 'Auliʻi', 'Kohala, Hawaii, USA', 24);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4775908, 'Chung', 'Hualālai', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1868823, 'Matafeo', 'Rose', 'Auckland, New Zealand', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (55937, 'Fane', 'David', 'Auckland, New Zealand', 58);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (53650, 'Mackie', 'Anthony', 'New Orleans, Louisiana, USA', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (54882, 'Baccarin', 'Morena', 'Rio de Janeiro, Rio de Janeiro, Brazil', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (593202, 'Hasson', 'Maddie', 'New Bern, North Carolina, USA', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2437735, 'Jr.', 'Danny Boyd', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1840932, 'Nicks', 'Rachel', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3896, 'Neeson', 'Liam', 'Ballymena, County Antrim, Northern Ireland, UK', 72);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2372, 'Perlman', 'Ron', 'Manhattan, New York City, New York, USA', 74);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (36549, 'Ross', 'Yolonda', 'Omaha, Nebraska, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (85756, 'Shaw', 'Frankie', 'Boston, Massachusetts, USA', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1710334, 'Diemer', 'Daniel', 'Brentwood Bay, Canada', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1763709, 'Pierre', 'Aaron', 'London, England, UK', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1344361, 'Jr.', 'Kelvin Harrison', 'New Orleans, Louisiana, USA', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1074676, 'Boone', 'Tiffany', 'Baltimore, Maryland, USA', 37);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (107529, 'Lediga', 'Kagiso', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1251835, 'Nyman', 'Preston', 'London, England', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1981044, 'Thatcher', 'Sophie', 'Chicago, Illinois, USA', 24);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1512280, 'East', 'Chloe', 'San Clemente, California, USA', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3291, 'Grant', 'Hugh', 'London, England, UK', 64);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17052, 'Grace', 'Topher', 'New York City, New York, USA', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2019444, 'Young', 'Elle', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1267329, 'Nyong''o', 'Lupita', 'Mexico City, Mexico', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1253360, 'Pascal', 'Pedro', 'Santiago, Chile', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1538851, 'Connor', 'Kit', 'London, England, UK', 20);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2440, 'Nighy', 'Bill', 'Caterham, Surrey, England, UK', 75);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1381186, 'Hsu', 'Stephanie', 'Torrance, California, USA', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (222121, 'Schwartz', 'Ben', 'New York City, New York, USA', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (206, 'Carrey', 'Jim', 'Newmarket, Ontario, Canada', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6384, 'Reeves', 'Keanu', 'Beirut, Lebanon', 60);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17605, 'Elba', 'Idris', 'Hackney, London, England, UK', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1212864, 'O''Shaughnessey', 'Colleen', 'Grand Rapids, Michigan, USA ', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (27428, 'Taylor-Johnson', 'Aaron', 'High Wycombe, Buckinghamshire, England, UK', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1437491, 'DeBose', 'Ariana', 'North Carolina, USA', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2099497, 'Hechinger', 'Fred', 'New York City, New York, USA', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (934, 'Crowe', 'Russell', 'Wellington, New Zealand', 60);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4941, 'Nivola', 'Alessandro', 'Boston, Massachusetts, USA', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (16483, 'Stallone', 'Sylvester', 'New York City, New York, USA', 78);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (12261, 'Patric', 'Jason', 'Queens, New York City, New York, USA', 58);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1279814, 'Wiggins', 'Josh', 'Houston, Texas, USA', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6066, 'Mihok', 'Dash', 'New York City, New York, USA', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1986492, 'Ownbey', 'Erin', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (114019, 'Evans', 'Luke', 'Pontypool, Wales, UK', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (85962, 'Lun-mei', 'Gwei', 'Taipei, Taiwan', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (61697, 'Kang', 'Sung', 'Gainesville, Georgia, USA', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4849577, 'Yang', 'Wyatt', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1476142, 'Walker', 'Pernell', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2326151, 'Mescal', 'Paul', 'Maynooth, County Kildare, Republic of Ireland', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5292, 'Washington', 'Denzel', 'Mount Vernon, New York, USA', 70);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (935, 'Nielsen', 'Connie', 'Elling, Frederikshavn, Denmark', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1597365, 'Quinn', 'Joseph', 'London, England, UK', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1248, 'Cox', 'Brian', 'Dundee, Scotland, UK', 78);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (10981, 'Shaw', 'Fiona', 'County Cork, Ireland', 66);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (66431, 'Whittaker', 'Jodie', 'Skelmanthorpe, Huddersfield, West Yorkshire, England, UK', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1627501, 'Adefope', 'Lolly', 'Preston, London, England, UK', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (963818, 'Baker', 'Troy', 'Dallas, Texas, USA', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (11782, 'Barbeau', 'Adrienne', 'Sacramento, California, USA', 79);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (49827, 'Cerveris', 'Michael', 'Bethesda, Maryland, USA', 64);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2222440, 'Fazal', 'Zehra', 'Libertyville, Illinois, USA', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (12662, 'Fondacaro', 'Phil', 'New Orleans, Louisiana, USA', 66);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1762588, 'Hautbois', 'Annouck', 'Paris, France', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1558832, 'Bollen', 'Benjamin', 'NULL', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1373143, 'Nonnenmacher', 'Marie', 'NULL', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1762589, 'Kazazian', 'Thierry', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1373246, 'Chetail', 'Adeline', 'Semur-en-Auxois, France', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3416, 'Moore', 'Demi', 'Roswell, New Mexico, USA', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1392137, 'Qualley', 'Margaret', 'Kalispell, Montana, USA', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6065, 'Quaid', 'Dennis', 'Houston, Texas, USA', 70);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2313436, 'Hamilton-Clark', 'Edward', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1508131, 'Abrams', 'Gore', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (10859, 'Reynolds', 'Ryan', 'Vancouver, British Columbia, Canada', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6968, 'Jackman', 'Hugh', 'Sydney, New South Wales, Australia', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2324569, 'Corrin', 'Emma', 'Royal Tunbridge Wells, Kent, England, UK', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (15576, 'Macfadyen', 'Matthew', 'Great Yarmouth, Norfolk, England, UK', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1464650, 'Keen', 'Dafne', 'Fuenlabrada, Madrid, Spain', 19);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1882502, 'LaVera', 'Lauren', 'Philadelphia, Pennsylvania, USA', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1880016, 'Thornton', 'David Howard', 'Huntsville, Alabama, USA', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1676771, 'Scaffidi', 'Samantha', 'New York City, New York, USA', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2787720, 'Fullam', 'Elliott', 'New Jersey, USA', 19);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (37405, 'Florence', 'Margaret Anne', 'Charleston, South Carolina, USA', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1765068, 'Erivo', 'Cynthia', 'Stockwell, London, England, UK', 37);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (226001, 'Grande', 'Ariana', 'Boca Raton, Florida, USA', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (80860, 'Bailey', 'Jonathan', 'Wallingford, Oxfordshire, England, UK', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1620, 'Yeoh', 'Michelle', 'Ipoh, Perak, Malaysia', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4785, 'Goldblum', 'Jeff', 'Pittsburgh, Pennsylvania, USA', 72);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (240724, 'Scott', 'Naomi', 'Hounslow, Greater London, England, UK', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (14892, 'DeWitt', 'Rosemarie', 'Flushing, Queens, New York City, New York, USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1371509, 'Gage', 'Lukas', 'San Diego, California, USA', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3535991, 'Gutierrez-Riley', 'Miles', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (31514, 'Jacobson', 'Peter', 'Chicago, Illinois, USA', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2422766, 'Ortiz', 'Francisco', 'Madrid, Community of Madrid, Spain', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (72128, 'Yázpik', 'José María', 'Mexico City, Mexico', 54);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1457340, 'Vázquez', 'Berta', 'Kiev - Ukraine', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2264694, 'Río', 'Iria del', 'Barcelona, Spain', 37);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1460406, 'Poveda', 'Marta', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (56322, 'Poehler', 'Amy', 'Newton, Massachusetts, USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1903874, 'Hawke', 'Maya', 'New York City, New York, USA', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3020876, 'Tallman', 'Kensington', ' Denver, Colorado, USA', 16);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (51998, 'Lapira', 'Liza', 'Queens, New York City, New York, USA', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (25147, 'Hale', 'Tony', 'West Point, New York, USA', 54);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1683343, 'Spaeny', 'Cailee', 'Springfield, Missouri, USA', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2761308, 'Jonsson', 'David', 'NULL', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2164506, 'Renaux', 'Archie', 'Kingston upon Thames, London, England, UK', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1428070, 'Merced', 'Isabela', 'Cleveland, Ohio, USA', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2304140, 'Fearn', 'Spike', 'Coalville, Leicestershire, England, UK', 24);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (74568, 'Hemsworth', 'Chris', 'Melbourne, Victoria, Australia', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (226366, 'Henry', 'Brian Tyree', 'Fayetteville, North Carolina, USA', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1245, 'Johansson', 'Scarlett', 'New York City, New York, USA', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (298410, 'Key', 'Keegan-Michael', 'Southfield, Michigan, USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (65717, 'Hamm', 'Jon', 'St. Louis, Missouri, USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1537084, 'Agudong', 'Siena', 'Honolulu, Hawaii, USA', 20);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3032312, 'Beck', 'Noah', 'Peoria, Arizona, USA', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1475818, 'Tanner', 'Drew Ray', 'Victoria, British Columbia, Canada', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (19210, 'Beek', 'James Van Der', 'Cheshire, Connecticut, USA', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (211458, 'Cox', 'Deborah', 'Toronto, Ontario, Canada', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4495, 'Carell', 'Steve', 'Concord, Massachusetts, USA', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (41091, 'Wiig', 'Kristen', 'Canandaigua, New York, USA', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (23659, 'Ferrell', 'Will', 'Irvine, California, USA', 57);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (63522, 'Vergara', 'Sofía', 'Barranquilla, Colombia', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17743, 'Cosgrove', 'Miranda', 'Los Angeles, California, USA', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1303037, 'Egerton', 'Taron', 'Birkenhead, Merseyside, England, UK', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1331457, 'Carson', 'Sofia', 'Fort Lauderdale, Florida, USA', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1853909, 'Deadwyler', 'Danielle', 'Atlanta, Georgia, USA', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (51995, 'Rossi', 'Theo', 'Staten Island, New York City, New York, USA', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (130253, 'Marshall-Green', 'Logan', 'Charleston, South Carolina, USA', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1197122, 'Gee', 'Cara', 'Calgary, Alberta, Canada', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (212772, 'Mooney', 'Peter', 'Winnipeg, Manitoba, Canada', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (56262, 'Abrams', 'Aaron', 'Toronto, Ontario, Canada', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5892, 'Hewlett', 'David', 'Redhill, Surrey, England, UK', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (26087, 'Tapping', 'Amanda', 'Rochford, Essex, England, UK', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (35792, 'Shergill', 'Jimmy', 'Gorakhpur, India', 54);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1059474, 'Tiwary', 'Avinash', 'Gopalganj, Bihar, India', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (85721, 'Bhatia', 'Tamannaah', 'Mumbai, Maharashtra, India', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (35778, 'Dutta', 'Divya', 'Ludhiana, Punjab, India', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (562225, 'Mehta', 'Rajeev', 'India', 68);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2939756, 'Baya', 'Ava', 'Francia', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (72327, 'Lespert', 'Jalil', 'Paris - France', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1618429, 'Laheurte', 'Jérémie', 'Paris, France', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2032782, 'Évrard', 'Thibaut', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2820853, 'Belaïche', 'Riadh', 'Sidi Bel Abbes, Algeria', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (147, 'Madsen', 'Michael', 'Chicago, Illinois, USA', 67);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (21315, 'Roberts', 'Eric', 'Biloxi, Mississippi, USA', 68);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (65831, 'LaSardo', 'Robert', 'Brooklyn, New York City, New York, USA', 61);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1387577, 'Wells', 'John', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1752944, 'Hager', 'Kevin', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1653751, 'Porta', 'Sophia La', 'Watford, Hertfordshire, England', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2200203, 'Edward-Robertson', 'David', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3157007, 'Dormer-Phillips', 'Elizabeth', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3475255, 'Peachey', 'Mark', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (579300, 'Hackett', 'Vicki', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2106489, 'Ban', 'Taito', 'Fukuoka, Japan', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2784795, 'Nakamura', 'Genta', 'Kanagawa, Japan', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3279626, 'Mikawa', 'Haruna', 'Kanagawa, Japan', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1452028, 'Ueda', 'Reina', 'Toyama, Japan', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1096528, 'Hirakawa', 'Daisuke', 'Niigata City, Niigata, Japan', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2199581, 'Zermani', 'Sofiane', 'Saint-Denis, Seine-Saint-Denis, France', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2025923, 'Sersoub', 'Waël', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (114953, 'Nakache', 'Géraldine', 'Puteaux, Hauts-de-Seine, France', 44);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5063191, 'Cano', 'Cassandra', 'Francia', 21);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (62447, 'Guesmi', 'Samir', 'Paris, France', 57);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6383, 'Eckhart', 'Aaron', 'Cupertino, California, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3129, 'Roth', 'Tim', 'London, England, UK', 63);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17140, 'Breslin', 'Abigail', 'New York City, New York, USA', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1075104, 'Hookings', 'Matt', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4916739, 'Ali', 'Lucky', 'Almaty, Kazakhstan', 31);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1073985, 'Pietschmann', 'Andreas', 'Würzburg, Germany', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (23671, 'Dequenne', 'Émilie', 'Belœil, Belgique', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4340928, 'Ebel', 'Lucas', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (234921, 'Bajraktaraj', 'Arben', 'Pristina, Kosovo', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4980097, 'Delamar', 'Lisa', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2217977, 'Zegler', 'Rachel', 'Hackensack, New Jersey, USA', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1846370, 'Bernardeau', 'Miguel', 'Valencia, Spain', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2961622, 'Bush', 'Giovanna', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3709664, 'Stowe', 'Dennis', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (15899, 'Lewis', 'Jenifer', 'Kinloch, Missouri, USA', 67);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2963, 'Cage', 'Nicolas', 'Long Beach, California, USA', 60);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1274508, 'Martell', 'Jaeden', 'Philadelphia, Pennsylvania, USA', 21);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1810651, 'Jenkins', 'Maxwell', 'Chicago, Illinois, USA', 19);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2270402, 'Soverall', 'Sadie', 'London, England, UK', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1321622, 'Coughlan', 'Samantha', 'Seattle, Washington, USA', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2888, 'Smith', 'Will', 'Philadelphia, Pennsylvania, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (78029, 'Lawrence', 'Martin', 'Frankfurt am Main, Germany', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (67599, 'Hudgens', 'Vanessa', 'Salinas, California, USA', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (23498, 'Ludwig', 'Alexander', 'Vancouver, British Columbia, Canada', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (544442, 'Nuñez', 'Paola', 'Tijuana, Baja California, Mexico', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1372369, 'Weaving', 'Samara', 'Adelaide, South Australia, Australia', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1141086, 'Sonne', 'Vic Carmen', 'København, Danmark', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (137537, 'Unt', 'Katariina', 'Tallinn, Estonian SSR, USSR [now Estonia]', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1460359, 'Christoffersen', 'Peter', 'NULL', 44);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (221980, 'Stewart-Jarrett', 'Nathan', 'Wandsworth, London, England, UK', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1474032, 'Convery', 'Turlough', 'Ireland', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2219112, 'Arthur', 'Benny O.', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4312759, 'Fontana', 'Alessia Yoko', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4259994, 'Moré', 'Jacqueline', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3921565, 'Scudder', 'Kyle', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3513082, 'Andrada', 'Gabriela', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2504043, 'Ermito', 'Mario', ' Brindisi, Italy ', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1062026, 'Freijeiro', 'Celia', 'Vigo, Pontevedra, Galicia, Spain', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1144322, 'Solans', 'David', 'Vilassar de Mar, Catalonia, Spain', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1042729, 'Ribas', 'Alba', ' Barcelona, Catalonia, Spain', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1134299, 'Juanes', '', 'Medellín, Colombia', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1889622, 'Speitzer', 'Alejandro', 'Culiacán, Sinaloa, Mexico', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1020697, 'Guerra', 'Alberto', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1652056, 'Osma', 'Laura', 'Colombia', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (145121, 'Niney', 'Pierre', 'Boulogne-Billancourt, Hauts-de-Seine, France', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (910944, 'Bouillon', 'Bastien', 'France', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (123989, 'Demoustier', 'Anaïs', 'Lille, Nord, France', 37);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1021689, 'Vartolomei', 'Anamaria', 'Bacău, România', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (93532, 'Lafitte', 'Laurent', 'Paris, France', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3103725, 'Smith', 'Robert Timothy', 'NULL', 13);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (70851, 'Black', 'Jack', 'Santa Monica, California, USA', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (132312, 'Howey', 'Brianne', 'Los Angeles, California, USA', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (74930, 'MacArthur', 'Hayes', 'Chicago, Illinois, USA', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2527414, 'Wallace', 'Nicole', 'Madrid, Spain', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2786960, 'Guevara', 'Gabriel', 'Madrid, Spain', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1251336, 'Sánchez', 'Iván', 'Madrid, Madrid, Spain', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (970027, 'Hazas', 'Marta', 'Santander, Cantabria, Spain', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4105602, 'Ruiz', 'Eva', 'Lanzarote, Spain', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4653691, 'Pritchard', 'Nicole', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1871885, 'Foley', 'Shaun Robert', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2011509, 'Chambers', 'Tsu Shan', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3206336, 'Webster', 'Remi', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2842407, 'Bell', 'Megan', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1339199, 'Wise', 'Gaia', 'London, England, UK', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (220232, 'Pasqualino', 'Luke', 'Peterborough, Cambridgeshire, England, UK', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1674206, 'Williams', 'Laurence Ubong', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (78329, 'Ashbourne', 'Lorraine', 'Manchester, England, UK', 63);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2039476, 'Beschastny', 'Arthur', 'Perm, RSFSR, USSR', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1305990, 'Spivak', 'Maryana', 'Moscow, Russia', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2018540, 'Shidlovskaya', 'Sofya', 'NULL', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1679513, 'Grabuzov', 'Igor', 'Leningrad, USSR (St. Petersburg, Russia)', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1611594, 'Safronov', 'Sergey', 'Moscow, USSR', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (73421, 'Phoenix', 'Joaquin', 'San Juan, Puerto Rico', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (237405, 'Gaga', 'Lady', 'New York City, New York, USA', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2039, 'Gleeson', 'Brendan', 'Dublin, Ireland', 69);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2229, 'Keener', 'Catherine', 'Miami, Florida, USA', 65);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1545693, 'Beetz', 'Zazie', 'Mitte, Berlin, Germany', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1190668, 'Chalamet', 'Timothée', 'Manhattan, New York City, New York, USA', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (505710, 'Zendaya', '', 'Oakland, California, USA', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (933238, 'Ferguson', 'Rebecca', 'Stockholm, Sweden', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3810, 'Bardem', 'Javier', 'Las Palmas de Gran Canaria, Gran Canaria, Canary Islands, Spain', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (16851, 'Brolin', 'Josh', 'Santa Monica, Los Angeles, California, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (11701, 'Jolie', 'Angelina', 'Los Angeles, California, USA ', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17839, 'Favino', 'Pierfrancesco', 'Rome, Italy', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (128748, 'Rohrwacher', 'Alba', 'Florence, Tuscany, Italy', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (117640, 'Bilginer', 'Haluk', 'İzmir, Turkey', 70);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (113505, 'Smit-McPhee', 'Kodi', 'Sydney, New South Wales, Australia', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (19537, 'Fox', 'Megan', 'Oak Ridge, Tennessee, USA', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2349355, 'Morrone', 'Michele', 'Melegnano, Italy', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (84613, 'Zima', 'Madeline', 'New Haven, Connecticut, USA', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3844059, 'Firth', 'Matilda', 'Leeds, West Yorkshire, England, UK ', 10);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1231852, 'Whipp', 'Andrew', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4895159, 'Martínez', 'Pablo', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4895160, 'Caballero', 'Lucas', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2385590, 'Alfaro', 'Rafael', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4895161, 'Chamorro', 'Lara', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4895162, 'Romero', 'Andy', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (73457, 'Pratt', 'Chris', 'Virginia, Minnesota, USA', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2231, 'Jackson', 'Samuel L.', 'Washington, D.C., USA', 76);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1278487, 'Waddingham', 'Hannah', 'Wandsworth, London, England, UK', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (10182, 'Rhames', 'Ving', 'New York City, New York, USA', 65);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3292, 'Hoult', 'Nicholas', 'Wokingham, England, UK', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4654153, 'Khawam', 'Thomas', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2883933, 'Planas', 'Aurore', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1108619, 'André', 'Pierre', 'Mont-Saint-Aignan, Seine-Maritime, France', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2232, 'Keaton', 'Michael', 'Coraopolis, Pennsylvania, USA', 73);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1158, 'Pacino', 'Al', 'New York City, New York, USA', 84);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4726, 'Harden', 'Marcia Gay', 'La Jolla, California, USA', 65);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (11006, 'Marsden', 'James', 'Stillwater, Oklahoma, USA', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (26998, 'Nakamura', 'Suzy', 'Chicago, Illinois, USA', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (224413, 'Hino', 'Satoshi', 'San Francisco, California, USA', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1353244, 'Hara', 'Yumi', 'Osaka Prefecture, Japan', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1287796, 'Katou', 'Masayuki', 'Tokyo, Japan', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1643476, 'Aoyama', 'Yoshino', 'Kumamoto, Japan', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1241562, 'Nabatame', 'Hitomi', 'Sado, Niigata, Japan', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2560224, 'Smit', 'Milena', 'Elche, Alicante, Spain', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1131415, 'Keuchkerian', 'Hovik', 'Beirut, Lebanon', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3300, 'Tena', 'Natalia', 'London, England, UK', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (59129, 'Jaenada', 'Óscar', 'Esplugues de Llobregat, Barcelona, Catalonia, Spain', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (31422, 'Massagué', 'Ivan', ' Barcelona, Catalonia, Spain', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (8891, 'Travolta', 'John', 'Englewood, New Jersey, USA', 70);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (38025, 'Davis', 'Kristin', 'Boulder, Colorado, USA', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (526, 'Haas', 'Lukas', 'West Hollywood, California, USA', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2138143, 'Quavo', '', 'Athens, Georgia, USA', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4286420, 'Cohen', 'Joel', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1625558, 'Awkwafina', '', 'Stony Brook, Brookhaven, New York, USA', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (19492, 'Davis', 'Viola', 'Saint Matthews, South Carolina, USA', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4483, 'Hoffman', 'Dustin', 'Los Angeles, California, USA', 87);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17419, 'Cranston', 'Bryan', 'Hollywood, Los Angeles, California, USA', 68);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (237455, 'Claflin', 'Sam', 'Ipswich, Suffolk, UK', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (221981, 'Thomas', 'Antonia', 'London, England, UK', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5033809, 'Rhoden', 'Caréll Vincent', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3769810, 'Davis', 'Will', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2190584, 'Leonce', 'Adelle', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (10912, 'Green', 'Eva', 'Paris, France', 44);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2408703, 'Bakalova', 'Maria', 'Burgas, Bulgaria', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2135069, 'Gibbs', 'Jojo T.', 'Gaffney, South Carolina, USA', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1246972, 'Rose', 'Ruby', 'Melbourne, Victoria, Australia', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (112328, 'Backus', 'Christopher', 'Orange County, California, USA', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (15556, 'Hall', 'Rebecca', 'London, England, UK', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (221018, 'Stevens', 'Dan', 'Croydon, London, England, UK', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2948491, 'Hottle', 'Kaylee', 'Atlanta, Georgia, USA', 16);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (60416, 'Ferns', 'Alex', 'Lennoxtown, Scotland, UK', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4173, 'Hopkins', 'Anthony', 'Margam, Port Talbot, Glamorgan, Wales, UK', 87);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4156214, 'Cohen', 'Noa', 'Israel', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3044906, 'Tako', 'Ido', 'Tel Aviv-Yafo, Israel', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (15441, 'Avital', 'Mili', 'Jerusalem, Israel', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2275144, 'Nur', 'Stephanie', 'Cairo, Egypt', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (10297, 'McConaughey', 'Matthew', 'Uvalde, Texas, USA', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1540615, 'Kelly', 'Tori', 'Wildomar, California, USA', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (208519, 'Kroll', 'Nick', 'Rye, New York, USA', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1640439, 'Madison', 'Mikey', 'Los Angeles, California, USA', 25);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3051936, 'Eydelshteyn', 'Mark', 'Nizhny Novgorod, Russia', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1266686, 'Borisov', 'Yura', 'Reutov, Moscow oblast, Russia', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (966306, 'Karagulian', 'Karren', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4338956, 'Tovmasyan', 'Vache', 'Yerevan, Armenian, USSR', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (137905, 'Skarsgård', 'Bill', 'Vällingby, Sweden', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1503200, 'twigs', 'FKA', 'Cheltenham, Gloucestershire, England, UK', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6413, 'Huston', 'Danny', 'Rome, Italy', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (174708, 'Simon', 'Josette', 'Leicester, Leicestershire, England, UK', 64);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (212815, 'Birn', 'Laura', 'Helsinki, Finland', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1586047, 'Teague', 'Owen', 'Tampa, Florida, USA', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2146942, 'Allan', 'Freya', 'Oxfordshire, England, UK', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (79072, 'Durand', 'Kevin', 'Thunder Bay, Ontario, Canada', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1444816, 'Macon', 'Peter', 'Cincinnati, Ohio, USA', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3905, 'Macy', 'William H.', 'Miami, Florida, USA', 74);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (36586, 'Gaitán', 'Paulina', 'Mexico City, Distrito Federal, Mexico', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3247768, 'Guaita', 'Azul', 'Mexico City, Mexico', 23);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (42009, 'Larios', 'Iazua', 'Tampico, Tamaulipas, Mexico', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1831843, 'Llabrés', 'Adriana', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (16406, 'Spíndola', 'Patricia Reyes', 'Oaxaca, Mexico', 71);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (115290, 'Sun-kyun', 'Lee', 'Seoul, South Korea', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (150125, 'Ji-hoon', 'Ju', 'Seoul, South Korea', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (550683, 'Hee-won', 'Kim', 'Namyangju, Gyeonggi, South Korea', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (240948, 'Sung-keun', 'Moon', 'Tokyo, Japan', 71);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1351055, 'Su-jeong', 'Ye', 'South Korea', 69);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1709047, 'Fleming', 'Cailey', 'Picayune, Mississippi, USA', 17);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (17697, 'Krasinski', 'John', 'Boston, Massachusetts, USA', 45);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3724154, 'Goossens', 'Lou', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4504024, 'Saeger', 'Marius De', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (220295, 'Rampelberg', 'Geert Van', 'Asse, Belgium', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2900070, 'Roo', 'Emilie De', 'Gent, Belgium', 44);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1127485, 'Dijck', 'Dirk van', 'NULL', 72);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (934281, 'Wolff', 'Alex', 'New York City, New York, USA', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (938, 'Hounsou', 'Djimon', 'Cotonou, Dahomey [now Benin]', 60);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1847948, 'Umuhire', 'Eliane', 'Kigali, Rwanda', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3051, 'Collette', 'Toni', 'Sydney, New South Wales, Australia', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (61659, 'Messina', 'Chris', 'New York City, New York, USA', 50);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1059597, 'Deutch', 'Zoey', 'Los Angeles, California, USA', 30);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (229617, 'Sariñana', 'Ximena', 'Guadalajara, Jalisco, Mexico', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2771954, 'Nuñez', 'Camila', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2990871, 'Klein', 'Diego', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1317794, 'Quijano', 'Roberto', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1325962, 'Yamashita', 'Daiki', 'Shizuoka, Japan', 35);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1245094, 'Okamoto', 'Nobuhiko', 'Tokyo, Japan', 38);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (149894, 'Kaji', 'Yuki', 'Tokyo, Japan', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (93803, 'Miyano', 'Mamoru', 'Saitama, Japan', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3046087, 'Nukumi', 'Meru', '日本, 愛知縣稻澤市', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (78798, 'Kenny', 'Tom', 'Syracuse, New York, USA', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (34398, 'Fagerbakke', 'Bill', 'Fontana, California, USA', 67);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (70615, 'Bumpass', 'Rodger', 'Little Rock, Arkansas, USA', 73);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6574, 'Brown', 'Clancy', ' Urbana, Ohio, U.S.', 65);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (78799, 'Lawrence', 'Carolyn', 'Dallas, Texas, USA', 57);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3967, 'Beckinsale', 'Kate', 'Chiswick, London, England, UK', 51);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (36669, 'Friend', 'Rupert', 'Oxfordshire, England, UK', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (9825, 'Burrows', 'Saffron', 'London, England, UK', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (56614, 'Stevenson', 'Ray', 'Lisburn, Northern Ireland, UK', 60);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (44736, 'Kostić', 'Goran', 'Sarajevo, Bosnia and Herzegovina, Yugoslavia [now Sarajevo, Bosnia and Herzegovina]', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (64774, 'Oreiro', 'Natalia', 'Montevideo, Uruguay', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1659288, 'Frigerio', 'Andrea', 'Buenos Aires, Argentina', 63);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (93648, 'Rago', 'Pablo', 'Buenos Aires, Argentina', 52);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3460924, 'Morandi', 'Sofía', 'Neuquén, Argentina', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2406157, 'Gutmann', 'Dalia', 'Almagro, Buenos Aires, Argentina', 46);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1397778, 'Taylor-Joy', 'Anya', 'Miami, Florida, USA', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (52891, 'Burke', 'Tom', 'Kent, England, UK', 43);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2431565, 'Browne', 'Alyla', 'Sydney, New South Wales, Australia', 14);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (148899, 'Shevtsov', 'George', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2230991, 'Edgar-Jones', 'Daisy', 'Islington, London, England, UK', 26);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (83271, 'Powell', 'Glen', 'Austin, Texas, USA', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1560244, 'Ramos', 'Anthony', 'New York City, New York, USA', 33);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1602972, 'Perea', 'Brandon', 'Chicago, Illinois, USA', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (16307, 'Tierney', 'Maura', 'Boston, Massachusetts, USA', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1920, 'Ryder', 'Winona', 'Winona, Minnesota, USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (11514, 'O''Hara', 'Catherine', 'Toronto, Ontario, Canada', 70);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (974169, 'Ortega', 'Jenna', 'Coachella Valley, Palm Desert, California, USA', 22);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (15009, 'Theroux', 'Justin', 'Washington, D.C., USA', 53);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (108215, 'Arjun', 'Allu', 'Chennai, Tamil Nadu, India', 41);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1752056, 'Mandanna', 'Rashmika', 'Virajpet, Karnataka, India', 28);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1072750, 'Faasil', 'Fahadh', 'Ernakulam, Kerala, India', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2198106, 'Bandari', 'Jagadeesh', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (586629, 'Ramesh', 'Rao', 'Srikakulam, Andhra Pradesh, India', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2407997, 'Christopher', 'Cary', 'NULL', 8);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (4938394, 'Madrigal', 'Estella', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (84407, 'Gaffigan', 'Jim', 'Chesterton, Indiana, USA', 58);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1639848, 'Athie', 'Mamoudou', 'Mauritania', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1044255, 'Perry', 'Alex Ross', 'Bryn Mawr, Pennsylvania, USA', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (7399, 'Stiller', 'Ben', 'New York City, New York, USA', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1817, 'Cardellini', 'Linda', 'Redwood City, California, USA', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5090250, 'Janson', 'Homer', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5090252, 'Janson', 'Ulysses', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5090254, 'Janson', 'Arlo', 'NULL', NULL);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (20442, 'Zem', 'Roschdy', 'Gennevilliers, Hauts-de-Seine, France', 59);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1357722, 'Eïdo', 'Laëtitia', 'NULL', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (26197, 'Elouahabi', 'Nabil', 'England, UK', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1730170, 'Haji', 'Sherwan', 'NULL', 39);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (71038, 'Storoge', 'Dimitri', 'France', 47);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (5469, 'Fiennes', 'Ralph', 'Ipswich, Suffolk, England, UK', 62);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2283, 'Tucci', 'Stanley', 'Peekskill, New York, USA', 64);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (12074, 'Lithgow', 'John', 'Rochester, New York, USA', 79);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (6588, 'Rossellini', 'Isabella', 'Rome, Lazio, Italy', 72);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1240427, 'Msamati', 'Lucian', 'NULL', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (22970, 'Dinklage', 'Peter', 'Morristown, New Jersey, USA', 55);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (515, 'Close', 'Glenn', 'Greenwich, Connecticut, USA', 77);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (18269, 'Fraser', 'Brendan', 'Indianapolis, Indiana, USA', 56);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1335818, 'Paige', 'Taylour', 'Santa Monica, California, USA', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (205, 'Dunst', 'Kirsten', 'Point Pleasant, New Jersey, USA', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (52583, 'Moura', 'Wagner', 'Rodelas, Bahia, Brazil', 48);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (196179, 'Henderson', 'Stephen McKinley', 'Kansas City, Missouri, USA', 75);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (109019, 'Lee', 'Nelson', 'Taipei, Taiwan', 49);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1210634, 'Shimazaki', 'Nobunaga', 'Shiogama, Miyagi, Japan', 36);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1492992, 'Uchida', 'Yuma', 'Tokyo, Japan', 32);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1254260, 'Okitsu', 'Kazuyuki', 'Kobe, Hyogo, Japan', 44);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (2534630, 'Ura', 'Kazuki', 'Osaka, Japan', 29);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (3195937, 'Kaito', 'Tasuku', 'Kyoto, Japan', 27);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (59175, 'Lively', 'Blake', 'Tarzana, California, USA', 37);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (88675, 'Baldoni', 'Justin', 'Los Angeles, California, USA', 40);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (213001, 'Slate', 'Jenny', 'Milton, Massachusetts, USA', 42);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (1855143, 'Sklenar', 'Brandon', 'New Jersey, USA', 34);
INSERT INTO ACTEUR (id_Acteur, Nom, Prénom, Nationalité, Age) VALUES (552252, 'Minhaj', 'Hasan', 'Davis, California, USA', 39);

INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (845781, 18918);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (845781, 16828);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (845781, 18999);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (845781, 140);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (845781, 934289);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (912649, 2524);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (912649, 5294);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (912649, 36594);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (912649, 1861573);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (912649, 7026);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1241982, 1564846);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1241982, 18918);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1241982, 4775908);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1241982, 1868823);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1241982, 55937);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1035048, 53650);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1035048, 54882);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1035048, 593202);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1035048, 2437735);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1035048, 1840932);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974453, 3896);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974453, 2372);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974453, 36549);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974453, 85756);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974453, 1710334);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762509, 1763709);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762509, 1344361);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762509, 1074676);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762509, 107529);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762509, 1251835);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1138194, 1981044);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1138194, 1512280);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1138194, 3291);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1138194, 17052);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1138194, 2019444);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1184918, 1267329);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1184918, 1253360);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1184918, 1538851);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1184918, 2440);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1184918, 1381186);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (939243, 222121);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (939243, 206);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (939243, 6384);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (939243, 17605);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (939243, 1212864);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (539972, 27428);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (539972, 1437491);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (539972, 2099497);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (539972, 934);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (539972, 4941);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1182387, 16483);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1182387, 12261);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1182387, 1279814);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1182387, 6066);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1182387, 1986492);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1167271, 114019);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1167271, 85962);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1167271, 61697);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1167271, 4849577);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1167271, 1476142);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (558449, 2326151);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (558449, 5292);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (558449, 1253360);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (558449, 935);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (558449, 1597365);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (645757, 1248);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (645757, 10981);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (645757, 66431);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (645757, 2440);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (645757, 1627501);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1299652, 963818);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1299652, 11782);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1299652, 49827);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1299652, 2222440);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1299652, 12662);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1147416, 1762588);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1147416, 1558832);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1147416, 1373143);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1147416, 1762589);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1147416, 1373246);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (933260, 3416);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (933260, 1392137);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (933260, 6065);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (933260, 2313436);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (933260, 1508131);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (533535, 10859);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (533535, 6968);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (533535, 2324569);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (533535, 15576);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (533535, 1464650);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1034541, 1882502);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1034541, 1880016);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1034541, 1676771);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1034541, 2787720);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1034541, 37405);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (402431, 1765068);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (402431, 226001);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (402431, 80860);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (402431, 1620);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (402431, 4785);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100782, 240724);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100782, 14892);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100782, 1371509);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100782, 3535991);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100782, 31514);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1118031, 2422766);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1118031, 72128);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1118031, 1457340);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1118031, 2264694);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1118031, 1460406);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1022789, 56322);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1022789, 1903874);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1022789, 3020876);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1022789, 51998);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1022789, 25147);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (945961, 1683343);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (945961, 2761308);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (945961, 2164506);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (945961, 1428070);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (945961, 2304140);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (698687, 74568);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (698687, 226366);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (698687, 1245);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (698687, 298410);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (698687, 65717);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957119, 1537084);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957119, 3032312);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957119, 1475818);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957119, 19210);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957119, 211458);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (519182, 4495);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (519182, 41091);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (519182, 23659);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (519182, 63522);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (519182, 17743);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1005331, 1303037);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1005331, 1331457);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1005331, 1853909);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1005331, 51995);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1005331, 130253);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (791042, 1197122);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (791042, 212772);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (791042, 56262);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (791042, 5892);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (791042, 26087);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252470, 35792);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252470, 1059474);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252470, 85721);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252470, 35778);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252470, 562225);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1171640, 2939756);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1171640, 72327);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1171640, 1618429);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1171640, 2032782);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1171640, 2820853);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (995803, 147);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (995803, 21315);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (995803, 65831);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (995803, 1387577);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (995803, 1752944);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1155095, 1653751);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1155095, 2200203);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1155095, 3157007);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1155095, 3475255);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1155095, 579300);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1357633, 2106489);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1357633, 2784795);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1357633, 3279626);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1357633, 1452028);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1357633, 1096528);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154223, 2199581);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154223, 2025923);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154223, 114953);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154223, 5063191);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154223, 62447);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1124641, 6383);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1124641, 3129);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1124641, 17140);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1124641, 1075104);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1124641, 4916739);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1196470, 1073985);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1196470, 23671);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1196470, 4340928);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1196470, 234921);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1196470, 4980097);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (592983, 2217977);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (592983, 1846370);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (592983, 2961622);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (592983, 3709664);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (592983, 15899);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1051896, 2963);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1051896, 1274508);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1051896, 1810651);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1051896, 2270402);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1051896, 1321622);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (573435, 2888);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (573435, 78029);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (573435, 67599);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (573435, 23498);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (573435, 544442);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1029235, 1372369);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1029235, 1141086);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1029235, 137537);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1029235, 1460359);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1029235, 221980);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1165466, 1474032);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1165466, 2219112);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1165466, 4312759);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1165466, 4259994);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1165466, 3921565);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252309, 3513082);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252309, 2504043);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252309, 1062026);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252309, 1144322);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1252309, 1042729);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1326059, 1134299);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1326059, 1889622);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1326059, 1020697);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1326059, 1652056);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1084736, 145121);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1084736, 910944);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1084736, 123989);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1084736, 1021689);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1084736, 93532);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1097870, 3103725);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1097870, 70851);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1097870, 298410);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1097870, 132312);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1097870, 74930);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1156593, 2527414);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1156593, 2786960);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1156593, 1251336);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1156593, 970027);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1156593, 4105602);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1296753, 4653691);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1296753, 1871885);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1296753, 2011509);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1296753, 3206336);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1296753, 2842407);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (839033, 1248);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (839033, 1339199);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (839033, 220232);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (839033, 1674206);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (839033, 78329);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100856, 2039476);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100856, 1305990);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100856, 2018540);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100856, 1679513);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1100856, 1611594);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (889737, 73421);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (889737, 237405);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (889737, 2039);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (889737, 2229);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (889737, 1545693);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (693134, 1190668);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (693134, 505710);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (693134, 933238);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (693134, 3810);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (693134, 16851);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 11701);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 17839);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 128748);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 117640);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 113505);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064028, 19537);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064028, 2349355);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064028, 84613);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064028, 3844059);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064028, 1231852);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1287717, 4895159);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1287717, 4895160);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1287717, 2385590);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1287717, 4895161);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1287717, 4895162);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (748783, 73457);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (748783, 2231);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (748783, 1278487);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (748783, 10182);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (748783, 3292);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1389147, 4654153);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1389147, 2883933);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1389147, 1108619);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (972614, 2232);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (972614, 1158);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (972614, 4726);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (972614, 11006);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (972614, 26998);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1014505, 224413);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1014505, 1353244);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1014505, 1287796);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1014505, 1643476);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1014505, 1241562);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1125510, 2560224);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1125510, 1131415);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1125510, 3300);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1125510, 59129);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1125510, 31422);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1116490, 8891);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1116490, 38025);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1116490, 526);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1116490, 2138143);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1116490, 4286420);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1011985, 70851);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1011985, 1625558);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1011985, 19492);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1011985, 4483);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1011985, 17419);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (978796, 237455);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (978796, 221981);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (978796, 5033809);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (978796, 3769810);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (978796, 2190584);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1043905, 10912);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1043905, 2408703);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1043905, 2135069);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1043905, 1246972);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1043905, 112328);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (823464, 15556);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (823464, 226366);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (823464, 221018);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (823464, 2948491);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (823464, 60416);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1243381, 4173);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1243381, 4156214);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1243381, 3044906);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1243381, 15441);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1243381, 2275144);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 11701);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 17839);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 128748);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 117640);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1038263, 113505);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1371727, 10297);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1371727, 1540615);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1371727, 208519);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1371727, 1245);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1371727, 1303037);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064213, 1640439);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064213, 3051936);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064213, 1266686);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064213, 966306);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1064213, 4338956);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957452, 137905);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957452, 1503200);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957452, 6413);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957452, 174708);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (957452, 212815);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (653346, 1586047);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (653346, 2146942);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (653346, 79072);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (653346, 1444816);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (653346, 3905);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1208808, 36586);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1208808, 3247768);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1208808, 42009);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1208808, 1831843);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1208808, 16406);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (726139, 115290);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (726139, 150125);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (726139, 550683);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (726139, 240948);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (726139, 1351055);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (639720, 1709047);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (639720, 10859);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (639720, 17697);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (639720, 10981);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (639720, 4495);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1232449, 3724154);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1232449, 4504024);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1232449, 220295);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1232449, 2900070);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1232449, 1127485);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762441, 1267329);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762441, 1597365);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762441, 934281);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762441, 938);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (762441, 1847948);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1106739, 3292);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1106739, 3051);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1106739, 61659);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1106739, 1059597);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1106739, 18999);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1340602, 229617);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1340602, 2771954);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1340602, 2990871);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1340602, 1317794);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1159311, 1325962);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1159311, 1245094);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1159311, 149894);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1159311, 93803);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1159311, 3046087);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1354627, 78798);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1354627, 34398);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1354627, 70615);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1354627, 6574);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1354627, 78799);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (976734, 3967);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (976734, 36669);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (976734, 9825);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (976734, 56614);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (976734, 44736);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1191611, 64774);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1191611, 1659288);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1191611, 93648);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1191611, 3460924);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1191611, 2406157);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (786892, 1397778);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (786892, 74568);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (786892, 52891);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (786892, 2431565);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (786892, 148899);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (718821, 2230991);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (718821, 83271);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (718821, 1560244);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (718821, 1602972);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (718821, 16307);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (917496, 2232);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (917496, 1920);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (917496, 11514);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (917496, 974169);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (917496, 15009);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (857598, 108215);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (857598, 1752056);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (857598, 1072750);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (857598, 2198106);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (857598, 586629);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1355755, 2407997);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1355755, 4938394);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1355755, 84407);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1355755, 1639848);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1355755, 1044255);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1203236, 7399);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1203236, 1817);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1203236, 5090250);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1203236, 5090252);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1203236, 5090254);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154215, 20442);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154215, 1357722);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154215, 26197);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154215, 1730170);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1154215, 71038);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974576, 5469);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974576, 2283);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974576, 12074);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974576, 6588);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (974576, 1240427);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (616446, 16851);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (616446, 22970);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (616446, 515);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (616446, 18269);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (616446, 1335818);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (929590, 205);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (929590, 52583);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (929590, 1683343);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (929590, 196179);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (929590, 109019);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1104844, 1210634);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1104844, 1492992);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1104844, 1254260);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1104844, 2534630);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1104844, 3195937);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1079091, 59175);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1079091, 88675);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1079091, 213001);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1079091, 1855143);
INSERT INTO FILM_ACTEUR (id_Film, id_Acteur) VALUES (1079091, 552252);

Pour le SQL*LOAD on charge les données depuis un fichier "data.csv"
-- Charger les données dans la table FORMAT
LOAD DATA
INFILE 'data.csv'
APPEND INTO TABLE FORMAT
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_Format, Nom_Format)
BEGINDATA
1,"Classique"
2,"IMAX"
3,"Dolby Atmos"
4,"3D"
5,"4DX"

-- Charger les données dans la table SALLE
LOAD DATA
INFILE 'data.csv'
APPEND INTO TABLE SALLE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_Salle, Numero_Salle, id_Format)
BEGINDATA
101,"Salle 1",1
102,"Salle 2",4
103,"Salle 3",1
104,"Salle IMAX",2
105,"Salle 5",3
106,"Salle 6",3
107,"Salle 4DX",5
108,"Salle 8",1
109,"Salle 9",1
110,"Salle 10",4

-- Charger les données dans la table GENRE
LOAD DATA
INFILE 'data.csv'
APPEND INTO TABLE GENRE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_Genre, Genre)
BEGINDATA
28,"Action"
12,"Aventure"
16,"Animation"
35,"Comédie"
80,"Crime"
99,"Documentaire"
18,"Drame"
10751,"Familial"
14,"Fantastique"
36,"Histoire"
27,"Horreur"
10402,"Musique"
9648,"Mystère"
10749,"Romance"
878,"Science-Fiction"
10770,"Téléfilm"
53,"Thriller"
10752,"Guerre"
37,"Western"

-- Charger les données dans la table FILM_GENRE
LOAD DATA
INFILE "data.csv"
APPEND INTO TABLE FILM_GENRE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_Salle, Numero_Salle, id_Format)
BEGINDATA
845781, 28
845781, 14
845781, 35
912649, 28
912649, 878
912649, 12
912649, 53
1241982, 16
1241982, 12
1241982, 10751
1241982, 35
1035048, 28
1035048, 878
1035048, 53
974453, 28
974453, 80
974453, 53
762509, 12
762509, 10751
762509, 18
762509, 16
762509, 27
1138194, 27
1138194, 53
1184918, 16
1184918, 28
1184918, 878
1184918, 10751
939243, 12
939243, 35
939243, 10751
939243, 878
539972, 28
539972, 12
539972, 53
1182387, 28
1182387, 80
1182387, 53
1167271, 28
1167271, 12
1167271, 53
558449, 28
558449, 12
558449, 36
645757, 16
645757, 35
645757, 10751
645757, 14
645757, 12
1299652, 16
1299652, 9648
1299652, 878
1299652, 28
1147416, 16
1147416, 12
1147416, 28
1147416, 14
933260, 27
933260, 878
533535, 28
533535, 35
533535, 878
1034541, 27
1034541, 53
402431, 18
402431, 10749
402431, 14
1100782, 27
1100782, 9648
1118031, 18
1118031, 28
1118031, 27
1022789, 16
1022789, 12
1022789, 35
1022789, 18
1022789, 10751
945961, 27
945961, 878
698687, 16
698687, 878
698687, 12
698687, 10751
957119, 35
957119, 10749
957119, 10770
519182, 16
519182, 10751
519182, 35
519182, 878
1005331, 28
1005331, 9648
1005331, 53
791042, 28
791042, 878
791042, 53
1252470, 53
1252470, 80
1252470, 9648
1252470, 28
1171640, 28
1171640, 80
1171640, 18
995803, 28
995803, 878
995803, 53
995803, 35
995803, 27
1155095, 27
1155095, 9648
1155095, 18
1357633, 28
1357633, 12
1357633, 14
1357633, 16
1154223, 28
1154223, 53
1124641, 28
1124641, 53
1196470, 53
1196470, 12
1196470, 28
1196470, 878
592983, 16
592983, 14
592983, 10751
592983, 12
592983, 35
1051896, 28
1051896, 27
1051896, 53
1051896, 878
573435, 28
573435, 35
573435, 80
573435, 53
573435, 12
1029235, 28
1029235, 27
1029235, 53
1165466, 27
1165466, 53
1165466, 28
1252309, 10749
1252309, 18
1326059, 28
1326059, 80
1326059, 18
1084736, 28
1084736, 12
1084736, 18
1097870, 14
1097870, 35
1156593, 18
1156593, 10749
1296753, 878
1296753, 27
1296753, 53
839033, 16
839033, 14
1100856, 27
1100856, 53
889737, 18
889737, 80
889737, 53
693134, 878
693134, 12
1038263, 18
1038263, 10402
1064028, 878
1064028, 53
1064028, 27
1287717, 27
748783, 16
748783, 35
748783, 10751
748783, 12
748783, 28
1389147, 28
972614, 80
972614, 53
972614, 28
1014505, 28
1014505, 12
1014505, 16
1014505, 14
1125510, 878
1125510, 27
1116490, 28
1116490, 53
1011985, 16
1011985, 10751
1011985, 14
1011985, 28
978796, 27
978796, 53
1043905, 28
1043905, 18
1043905, 53
823464, 28
823464, 12
823464, 878
1243381, 18
1243381, 36
1243381, 28
1038263, 18
1038263, 10402
1371727, 16
1371727, 10751
1371727, 35
1064213, 10749
1064213, 35
1064213, 18
957452, 28
957452, 14
957452, 27
653346, 878
653346, 12
653346, 28
1208808, 27
726139, 28
726139, 53
726139, 27
726139, 878
639720, 35
639720, 14
639720, 10751
1232449, 18
1232449, 10751
762441, 27
762441, 878
762441, 53
1106739, 80
1106739, 18
1340602, 27
1159311, 16
1159311, 28
1159311, 12
1159311, 878
1354627, 10770
1354627, 10751
1354627, 35
1354627, 27
1354627, 16
976734, 28
976734, 53
976734, 80
1191611, 35
1191611, 10749
786892, 28
786892, 878
786892, 12
718821, 53
718821, 28
917496, 35
917496, 14
917496, 27
857598, 80
857598, 28
857598, 53
1355755, 16
1355755, 12
1355755, 14
1355755, 10751
1203236, 35
1203236, 18
1154215, 28
1154215, 53
974576, 53
974576, 18
616446, 28
616446, 35
616446, 80
929590, 10752
929590, 28
929590, 18
1104844, 16
1104844, 28
1104844, 18
1079091, 10749
1079091, 18
