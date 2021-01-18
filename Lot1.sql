DROP TABLE FONCTION cascade constraints;
DROP TABLE PROSPECTEUR cascade constraints;
DROP TABLE PROJET cascade constraints;
DROP TABLE SEMINAIRE cascade constraints;

REM ***Table***

CREATE TABLE FONCTION (
    Id_Fonction int NOT NULL,
    Nom_Fonction varchar(20) NOT NULL UNIQUE,
    Descrip_Fonction varchar(255)
);

CREATE TABLE PROSPECTEUR (
    Id_Pro int NOT NULL,
    Nom_Pro varchar(20) NOT NULL,
    Prenom_Pro varchar(20) NOT NULL,
    Adresse_Pro varchar(20),
    Tel_Pro int,
    Mail_Pro varchar(20)
);

CREATE TABLE PROJET(
    Id_Projet int NOT NULL,
    Libelle_Projet varchar(20),
    NbAdherent int NOT NULL,
    Budget int
);

CREATE TABLE SEMINAIRE(
    Id_Sem int NOT NULL,
    LibelleSem varchar(20)
);

REM ***Primary key***

ALTER TABLE FONCTION
ADD CONSTRAINT PK_BM_FONCTION PRIMARY KEY(Id_Fonction);

ALTER TABLE PROSPECTEUR
ADD CONSTRAINT PK_BM_PROSPECTEUR PRIMARY KEY (Id_Pro);

ALTER TABLE PROJET
ADD CONSTRAINT PK_BM_PROJET PRIMARY KEY(Id_Projet);

ALTER TABLE SEMINAIRE
ADD CONSTRAINT PK_BM_SEMINAIRE PRIMARY KEY(Id_Sem);

REM ***Foreign key***

ALTER TABLE PROSPECTEUR
ADD CONSTRAINT FK_BM_PROSPECTEUR FOREIGN KEY(Id_Pro) REFERENCES FONCTION (Id_Fonction);

ALTER TABLE SEMINAIRE
ADD CONSTRAINT FK_BM_SEMINAIRE FOREIGN KEY(Id_Sem) REFERENCES PROJET (Id_Projet);

REM ***Sequences***

DROP SEQUENCE SEQFONCTION;
DROP SEQUENCE SEQPROSPECTEUR;
DROP SEQUENCE SEQPROJET;
DROP SEQUENCE SEQSEMINAIRE;

CREATE SEQUENCE SEQFONCTION START WITH 1 MINVALUE 1 INCREMENT BY 1;
CREATE SEQUENCE SEQPROSPECTEUR START WITH 1 MINVALUE 1 INCREMENT BY 1;
CREATE SEQUENCE SEQPROJET START WITH 1 MINVALUE 1 INCREMENT BY 1;
CREATE SEQUENCE SEQSEMINAIRE START WITH 1 MINVALUE 1 INCREMENT BY 1;

REM ***Jeu de test***
INSERT INTO FONCTION (Id_Fonction,Nom_Fonction,Descrip_Fonction)
VALUES (SEQFONCTION.nextval,'Animateur',' ');
INSERT INTO FONCTION (Id_Fonction,Nom_Fonction,Descrip_Fonction)
VALUES (SEQFONCTION.nextval,'Dirigeant','Nécessite le doctorat');
INSERT INTO FONCTION (Id_Fonction,Nom_Fonction,Descrip_Fonction)
VALUES (SEQFONCTION.nextval,'Gestion','Nécessite le diplome de comptabilite');
INSERT INTO PROSPECTEUR (Id_Pro,Nom_Pro,Prenom_Pro,Adresse_Pro,Tel_Pro,Mail_Pro)
VALUES (SEQPROSPECTEUR.nextval, 'Jean' , 'Maurice' , '19 rue Chicago' , 0784261492 , 'jean@paris.com');
INSERT INTO PROSPECTEUR (Id_Pro,Nom_Pro,Prenom_Pro,Adresse_Pro,Tel_Pro,Mail_Pro)
VALUES (SEQPROSPECTEUR.nextval, 'Coralie' , 'Voisine' , '94 rue Alfortville' , 068416189 , 'Coralie@paris.com');
INSERT INTO PROSPECTEUR (Id_Pro,Nom_Pro,Prenom_Pro,Adresse_Pro,Tel_Pro,Mail_Pro)
VALUES (SEQPROSPECTEUR.nextval, 'Minette' , 'Forest' , '43 rue Colomiers' , 0581761894 , 'Minette@paris.com');
INSERT INTO PROJET (Id_Projet,Libelle_Projet,NbAdherent,Budget)
VALUES (SEQPROJET.nextval, 'Projet d aide' , 5 , 2000);
INSERT INTO PROJET (Id_Projet,Libelle_Projet,NbAdherent,Budget)
VALUES (SEQPROJET.nextval, 'Projet de RH' , 34 , 10000);
INSERT INTO SEMINAIRE(Id_Sem, LibelleSem)
VALUES (SEQSEMINAIRE.nextval, 'réunion');
INSERT INTO SEMINAIRE(Id_Sem, LibelleSem)
VALUES (SEQSEMINAIRE.nextval, 'Soirée recrutement');

Select * FROM FONCTION;
Select * FROM PROSPECTEUR;
Select * FROM PROJET;
Select * FROM SEMINAIRE;