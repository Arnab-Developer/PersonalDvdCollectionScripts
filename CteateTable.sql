USE [PersonalDvdCollection]
GO

CREATE SCHEMA Dvd AUTHORIZATION dbo
GO

-- Create tables without Foreign keys.
-- -----------------------------------

CREATE TABLE Dvd.Films
(
	FilmID INT NOT NULL IDENTITY(1, 1),
	Title VARCHAR(50) NOT NULL,
	Story VARCHAR(50) NOT NULL,
	ReleaseDate DATE NOT NULL,
	Duration INT NOT NULL CONSTRAINT dfFilmDuration DEFAULT (3),
	AditionalInformation VARCHAR(100) NULL,

	GenreID INT NOT NULL,
	CertificateID INT NOT NULL,
	
	CONSTRAINT pkFilms PRIMARY KEY (FilmID)
)
GO

CREATE TABLE Dvd.[Certificates]
(
	CertificateID INT NOT NULL IDENTITY(1, 1),
	Content VARCHAR(50) NOT NULL,

	CONSTRAINT pkCertificates PRIMARY KEY (CertificateID)
)
GO

CREATE TABLE Dvd.Genres
(
	GenreID INT NOT NULL IDENTITY(1, 1),
	Name VARCHAR(50) NOT NULL,

	CONSTRAINT pkGenres PRIMARY KEY (GenreID)
)
GO

CREATE TABLE Dvd.Producers
(
	ProducerID INT NOT NULL IDENTITY(1, 1),
	Name VARCHAR(50) NOT NULL,
	EmailAddress VARCHAR(50) NULL,
	Website VARCHAR(50) NULL,

	CONSTRAINT pkProducers PRIMARY KEY (ProducerID)
)
GO

CREATE TABLE Dvd.FilmsProducers
(
	FilmID INT NOT NULL,
	ProducerID INT NOT NULL,
)
GO

CREATE TABLE Dvd.Actors
(
	ActorID INT NOT NULL IDENTITY(1, 1),
	FirstName VARCHAR(20) NOT NULL,
	MiddleName VARCHAR(10) NULL,
	LastName VARCHAR(20) NOT NULL,
	Notes VARCHAR(50) NULL,

	CONSTRAINT pkActors PRIMARY KEY (ActorID)
)
GO

CREATE TABLE Dvd.Roles
(
	RoleID INT NOT NULL IDENTITY(1, 1),
	Name VARCHAR(20) NOT NULL,

	CONSTRAINT pkRoles PRIMARY KEY (RoleID)
)
GO

CREATE TABLE Dvd.FilmsActorsRoles
(
	FilmID INT NOT NULL,
	ActorID INT NOT NULL,
	RoleID INT NOT NULL,

	CharacterName VARCHAR(50) NOT NULL,
	CharacterDescription VARCHAR(50) NULL
)
GO

-- Now add Foreign keys to create table relations.
-- -----------------------------------------------

ALTER TABLE Dvd.Films
ADD CONSTRAINT fkFilmsWithGenres FOREIGN KEY (GenreID) REFERENCES Dvd.Genres (GenreID)
GO

ALTER TABLE Dvd.Films
ADD CONSTRAINT fkFilmsWithCertificates FOREIGN KEY (CertificateID) REFERENCES Dvd.[Certificates] (CertificateID)
GO

ALTER TABLE Dvd.FilmsProducers
ADD CONSTRAINT fkFilmsProducersWithFilms FOREIGN KEY (FilmID) REFERENCES Dvd.Films (FilmID)
GO

ALTER TABLE Dvd.FilmsProducers
ADD CONSTRAINT fkFilmsProducersWithProducers FOREIGN KEY (ProducerID) REFERENCES Dvd.Producers (ProducerID)
GO

ALTER TABLE Dvd.FilmsActorsRoles
ADD CONSTRAINT fkFilmsActorsRolesWithFilms FOREIGN KEY (FilmID) REFERENCES Dvd.Films (FilmID)
GO

ALTER TABLE Dvd.FilmsActorsRoles
ADD CONSTRAINT fkFilmsActorsRolesWithActors FOREIGN KEY (ActorID) REFERENCES Dvd.Actors (ActorID)
GO

ALTER TABLE Dvd.FilmsActorsRoles
ADD CONSTRAINT fkFilmsActorsRolesWithRoles FOREIGN KEY (RoleID) REFERENCES Dvd.Roles (RoleID)
GO