DROP TABLE Person CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Producer CASCADE CONSTRAINTS;
DROP TABLE StarIN CASCADE CONSTRAINTS;
DROP TABLE Film CASCADE CONSTRAINTS;
DROP TABLE Genre CASCADE CONSTRAINTS;
DROP TABLE Reviews CASCADE CONSTRAINTS;
DROP TABLE Cinematographer CASCADE CONSTRAINTS;
DROP TABLE Composer CASCADE CONSTRAINTS;
DROP TABLE Relative CASCADE CONSTRAINTS;



CREATE TABLE Person (
    PersonID    NUMBER(5) CONSTRAINT Person_PersonID_PK PRIMARY KEY,
    Fname   VARCHAR(20) CONSTRAINT Person_Fname_nn NOT NULL,
    Minit   CHAR(1),
    Lname   VARCHAR(20) CONSTRAINT Person_Lname_nn NOT NULL,
    Bdate   DATE,
    Sex     CHAR(1),
    Age     NUMBER(2) CONSTRAINT Person_Age_nn NOT NULL,
    Relative_name   VARCHAR(30));

CREATE TABLE Director (
    DirectorID     NUMBER(5) CONSTRAINT Director_DirectorID_PK PRIMARY KEY);

CREATE TABLE Actor (
    ActorID     NUMBER(5) CONSTRAINT Actor_ActorID_PK PRIMARY KEY);

CREATE TABLE Producer (
    ProducerID      NUMBER(5) CONSTRAINT Producer_ProducerID_PK PRIMARY KEY);

CREATE TABLE StarIN (
    ActorID     NUMBER(5),
    MovieID     NUMBER(5),
    CONSTRAINT StarIN_pk PRIMARY KEY(ActorID, MovieID));

CREATE TABLE Film (
    Title       VARCHAR(20),
    MovieID     NUMBER(5) CONSTRAINT Film_MovieID_PK PRIMARY KEY,
    Runtime     TIMESTAMP,
    DirectorID  NUMBER(5),
    CinematographerID   NUMBER(5),
    ScoreID     NUMBER(5));

CREATE TABLE Genre (
    MovieID     NUMBER(5) CONSTRAINT Genre_MovieID_PK PRIMARY KEY,
    Movie_Genre     VARCHAR(20));

CREATE TABLE Reviews (
    No_stars    NUMBER(1),
    Comments    VARCHAR(50),
    MovieID     NUMBER(5)
    CONSTRAINT reviews_movieID_no_stars_pk PRIMARY KEY(MovieID, No_stars));

CREATE TABLE Cinematographer (
    CinematographerID   NUMBER(5) CONSTRAINT Cinematographer_CinematographerID_PK PRIMARY KEY,
    Name    VARCHAR(50),
    Sex     CHAR(1),
    Age     NUMBER(2));

CREATE TABLE Composer (
    ScoreID     NUMBER(5) CONSTRAINT Composer_ScoreID_PK PRIMARY KEY,
    Name        VARCHAR(50),
    Sex         CHAR(1),
    Age         NUMBER(2));

CREATE TABLE Relative (
    RelativeID    NUMBER(5),
    Relative_Name   VARCHAR(30),
    B_Date  DATE,
    Age     NUMBER(2),
    Sex     CHAR(1),
    Relation    VARCHAR(20),
    CONSTRAINT relative_pk PRIMARY KEY(RelatievID, Relative_Name));




ALTER TABLE Person
ADD CONSTRAINT person_relative_name_fk FOREIGN KEY(Relative_Name)
REFERENCES Relative(Relative_Name);

ALTER TABLE Director
ADD CONSTRAINT director_directorID_fk FOREIGN KEY(DirectorID)
REFERENCES Person(PersonID);

ALTER TABLE Actor
ADD CONSTRAINT actor_actorID_fk FOREIGN KEY(ActorID)
REFERENCES Person(PersonID);

ALTER TABLE Producer
ADD CONSTRAINT producer_procuderID_fk FOREIGN KEY(ProducerID)
REFERENCES Person(PersonID);

ALTER TABLE StarIN
ADD CONSTRAINT starIN_actorID_fk FOREIGN KEY(ActorID)
REFERENCES Actor(ActorID);

ALTER TABLE StarIN
ADD CONSTRAINT starIN_movieID_fk FOREIGN KEY(MovieID)
REFERENCES Film(MovieID);

ALTER TABLE Film
ADD CONSTRAINT film_cinematographerID_fk FOREIGN KEY(CinematographerID)
REFERENCES Cinematographer(CinematographerID);

ALTER TABLE Film
ADD CONSTRAINT film_scoreID_fk FOREIGN KEY(ScoreID)
REFERENCES Composer(ScoreID);

ALTER TABLE Genre 
ADD CONSTRAINT genre_movieID_fk FOREIGN KEY(MovieID)
REFERENCES Film(MovieID);

ALTER TABLE Reviews 
ADD CONSTRAINT reviews_movieID_fk FOREIGN KEY(MovieID)
REFERENCES Film(MovieID);

ALTER TABLE Relative
ADD CONSTRAINT relative_relativeID_fk FOREIGN KEY(RelativeID)
REFERENCES Person(PersonID);