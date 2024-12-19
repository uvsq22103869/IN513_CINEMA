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

