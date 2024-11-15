create database t1;
use t1;

CREATE TABLE Utilisateur (

                             ID_utilisateur INT NOT NULL AUTO_INCREMENT,
                             Mot_de_passe VARCHAR(50) NOT NULL,
                             nom_utilisateur VARCHAR(50) NOT NULL,
                             PRIMARY KEY (ID_utilisateur)
);

CREATE TABLE Joueur(
                       Numéro_de_licence INT,
                       Nom VARCHAR(50) ,
                       Prénom VARCHAR(50) ,
                       Date_de_naissance DATE,
                       Taille__en_cm_ SMALLINT,
                       Poids DECIMAL(3,2)  ,
                       Statut VARCHAR(50) ,
                       PRIMARY KEY(Numéro_de_licence)
);

CREATE TABLE Matchs(
                       ID_Match VARCHAR(50) ,
                       Dateheure DATETIME,
                       Nom_équipe_ennemi VARCHAR(30) ,
                       Lieu_de_bataille VARCHAR(50) ,
                       Terrain VARCHAR(50) ,
                       Resultat VARCHAR(50) ,
                       PRIMARY KEY(ID_Match)
);

CREATE TABLE Note(
                     ID_Note VARCHAR(50) ,
                     Commentaire VARCHAR(100) ,
                     PRIMARY KEY(ID_Note)
);

CREATE TABLE Correspondre(
                             Numéro_de_licence INT,
                             ID_Note VARCHAR(50) ,
                             PRIMARY KEY(Numéro_de_licence, ID_Note),
                             FOREIGN KEY(Numéro_de_licence) REFERENCES Joueur(Numéro_de_licence),
                             FOREIGN KEY(ID_Note) REFERENCES Note(ID_Note)
);

CREATE TABLE Participe(
                          Numéro_de_licence INT,
                          ID_Match VARCHAR(50) ,
                          Evaluation_Après_match TINYINT,
                          Statut_titulaire_remplacant VARCHAR(50) ,
                          Poste VARCHAR(50) ,
                          PRIMARY KEY(Numéro_de_licence, ID_Match),
                          FOREIGN KEY(Numéro_de_licence) REFERENCES Joueur(Numéro_de_licence),
                          FOREIGN KEY(ID_Match) REFERENCES Matchs(ID_Match)
);
