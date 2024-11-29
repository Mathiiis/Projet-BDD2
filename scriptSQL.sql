DROP DATABASE IF EXISTS Laboratoire;
CREATE DATABASE Laboratoire;


-- Suppression des tables de relation (tables avec des clés étrangères)
DROP TABLE IF EXISTS AuteurExternePublication;
DROP TABLE IF EXISTS AuteurLASSPublication;
DROP TABLE IF EXISTS ParticipationPartenaire;
DROP TABLE IF EXISTS OrganisationJPO;
DROP TABLE IF EXISTS OrganisationCongres;
DROP TABLE IF EXISTS EncadrantDoctorant;

-- Suppression des tables principales
DROP TABLE IF EXISTS Doctorant;
DROP TABLE IF EXISTS ChercheurEnseignant;
DROP TABLE IF EXISTS Chercheur;
DROP TABLE IF EXISTS Scientifique;
DROP TABLE IF EXISTS Personnel;

-- Suppression des autres tables
DROP TABLE IF EXISTS Partenaire;
DROP TABLE IF EXISTS LabosExternes;
DROP TABLE IF EXISTS Publication;
DROP TABLE IF EXISTS ProjetRecherche;
DROP TABLE IF EXISTS Congrès;
DROP TABLE IF EXISTS JPO;
DROP TABLE IF EXISTS EtablissementEnseignement;
DROP TABLE IF EXISTS Evenement;



CREATE TABLE Personnel (
    idPersonnel SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    dateNaissance DATE NOT NULL,
    adresse VARCHAR(255),
    dateRecrutement DATE NOT NULL
);

CREATE TABLE Scientifique (
    idScientifique SERIAL PRIMARY KEY,
    idPersonnel INT UNIQUE NOT NULL,
    grade VARCHAR(50)
);

CREATE TABLE Chercheur (
    idChercheur SERIAL PRIMARY KEY,
    idScientifique INT UNIQUE NOT NULL
);

CREATE TABLE ChercheurEnseignant (
    idChercheurEnseignant SERIAL PRIMARY KEY,
    idScientifique INT UNIQUE NOT NULL,
    echelon INT,
    idEtablissement INT NOT NULL
);

CREATE TABLE Doctorant (
    idDoctorant SERIAL PRIMARY KEY,
    idPersonnel INT UNIQUE NOT NULL,
    dateDebutThese DATE,
    dateSoutenance DATE
);

CREATE TABLE Evenement (
    idEvenement SERIAL PRIMARY KEY,
    dateDebut DATE NOT NULL,
    dateFin DATE NOT NULL
);

CREATE TABLE JPO (
    idJPO SERIAL PRIMARY KEY,
    idEvenement INT UNIQUE NOT NULL
);

CREATE TABLE Congres (
    idCongres SERIAL PRIMARY KEY,
    idEvenement INT UNIQUE NOT NULL,
    nbInscriptions INT,
    classe VARCHAR(50)
);

CREATE TABLE EtablissementEnseignement (
    idEtablissement SERIAL PRIMARY KEY,
    acronyme VARCHAR(20),
    adresse VARCHAR(255),
    nom VARCHAR(100)
);

CREATE TABLE ProjetRecherche (
    idProjet SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    acronyme VARCHAR(20),
    anneeDebut INT,
    dateFin DATE,
    coutGlobal DECIMAL(15, 2),
    budgetAlloue DECIMAL(15, 2),
    idScientifique INT
);

CREATE TABLE Partenaire (
    idPartenaire SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    pays VARCHAR(100)
);

CREATE TABLE Publication (
    idPublication SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    anneePublication INT,
    nomConference VARCHAR(100),
    classeConference VARCHAR(50),
    nombrePage INT
);

CREATE TABLE LabosExternes (
    idLaboExterne SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    pays VARCHAR(100)
);

CREATE TABLE AuteurExterne (
    idAuteur SERIAL PRIMARY KEY,
    Nom VARCHAR(100),
    Prénom VARCHAR(100),
    Mai VARCHAR(100),
    idLaboExterne INT
);

CREATE TABLE AuteurLASSPublication (
    idPersonnel INT,
    idPublication INT,
    PRIMARY KEY (idPersonnel, idPublication)
);

CREATE TABLE AuteurExternePublication (
    idPublication INT,
    idAuteur INT,
    PRIMARY KEY (idPublication, idAuteur)
);

CREATE TABLE ParticipationPartenaire (
    idProjet INT,
    idPartenaire INT,
    PRIMARY KEY (idProjet, idPartenaire)
);

CREATE TABLE OrganisationJPO (
    idJPO INT,
    idPersonnel INT,
    PRIMARY KEY (idJPO, idPersonnel)
);

CREATE TABLE OrganisationCongres (
    idScientifique INT,
    idCongres INT,
    PRIMARY KEY (idScientifique, idCongres)
);

CREATE TABLE EncadrantDoctorant (
    idScientifique INT,
    idDoctorant INT,
    PRIMARY KEY (idScientifique, idDoctorant)
);
