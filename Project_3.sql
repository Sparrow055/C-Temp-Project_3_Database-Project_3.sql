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
    Sex     CHAR(1) CONSTRAINT Person_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age     NUMBER(2) CONSTRAINT Person_age_cc CHECK((Age >= 18) and (Age <= 99)),
    RelativeID   NUMBER(5));

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
    Runtime     TIME,
    DirectorID  NUMBER(5),
    CinematographerID   NUMBER(5),
    ScoreID     NUMBER(5));

CREATE TABLE Genre (
    MovieID     NUMBER(5) CONSTRAINT Genre_MovieID_PK PRIMARY KEY,
    Movie_Genre     VARCHAR(20));

CREATE TABLE Reviews (
    No_stars    NUMBER(1) CONSTRAINT Reviews_No_stars_cc CHECK((No_stars >= 1) and (No_stars <= 5)),
    Comments    VARCHAR(50),
    MovieID     NUMBER(5),
    CONSTRAINT reviews_MovieID_No_stars_pk PRIMARY KEY (MovieID, No_stars));

CREATE TABLE Cinematographer (
    CinematographerID   NUMBER(5) CONSTRAINT Cinematographer_CinematographerID_PK PRIMARY KEY,
    Name    VARCHAR(50),
    Sex     CHAR(1) CONSTRAINT Cinematographer_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age     NUMBER(2) CONSTRAINT Cinematographer_age_cc CHECK((Age >= 18) and (Age <= 99)));

CREATE TABLE Composer (
    ScoreID     NUMBER(5) CONSTRAINT Composer_ScoreID_PK PRIMARY KEY,
    Name        VARCHAR(50),
    Sex         CHAR(1) CONSTRAINT Composer_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age         NUMBER(2) CONSTRAINT Composer_age_cc CHECK((Age >= 18) and (Age <= 99)));

CREATE TABLE Relative (
    RelativeID    NUMBER(5) CONSTRAINT Relative_RelativeID_PK PRIMARY KEY,
    Relative_Name   VARCHAR(30),
    B_Date  DATE,
    Age     NUMBER(2) CONSTRAINT Relative_age_cc CHECK((Age >= 18) and (Age <= 99)),
    Sex     CHAR(1) CONSTRAINT Relative_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Relation    VARCHAR(20));



ALTER TABLE Person 
ADD CONSTRAINT person_relativeID_fk FOREIGN KEY(RelativeID)
REFERENCES Relative(RelativeID);

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
ADD CONSTRAINT film_directorID_fk FOREIGN KEY(DirectorID)
REFERENCES Director(DirectorID);

ALTER TABLE Film
ADD CONSTRAINT film_scoreID_fk FOREIGN KEY(ScoreID)
REFERENCES Composer(ScoreID);

ALTER TABLE Genre 
ADD CONSTRAINT genre_movieID_fk FOREIGN KEY(MovieID)
REFERENCES Film(MovieID);

ALTER TABLE Reviews 
ADD CONSTRAINT reviews_movieID_fk FOREIGN KEY(MovieID)
REFERENCES Film(MovieID);


INSERT INTO Film
VALUES( 'Batman', 12356, '2:56', 13345, 22375, 12349);

INSERT INTO Film
VALUES( 'Superman', 91921, '2:09', 91821, 61921, 91923);

INSERT INTO Film
VALUES( 'Justice League', 81972, '2:09', 81973, 81372 , 71972);

INSERT INTO Film
VALUES( 'Supergirl', 58880, '1:45', 56880 , 58840  , 57880);

INSERT INTO Film
VALUES( 'Iron man', 68014, '2:06', 62014 , 68013  , 64914);
INSERT INTO Film
VALUES( 'Iron man', 58880, '2:06', 56880 , 58840  , 57880);
