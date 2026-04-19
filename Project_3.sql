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
DROP TABLE Relatives CASCADE CONSTRAINTS;



CREATE TABLE Person (
    PersonID    NUMBER(5) CONSTRAINT Person_PersonID_PK PRIMARY KEY,
    Fname   VARCHAR(20) CONSTRAINT Person_Fname_nn NOT NULL,
    Minit   CHAR(1),
    Lname   VARCHAR(20) CONSTRAINT Person_Lname_nn NOT NULL,
    Bdate   DATE,
    Sex     CHAR(1) CONSTRAINT Person_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age     NUMBER(2) CONSTRAINT Person_age_cc CHECK((Age >= 18) and (Age <= 99)),
    RelativesID   NUMBER(5));

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
    Title       VARCHAR(30),
    MovieID     NUMBER(5) CONSTRAINT Film_MovieID_PK PRIMARY KEY,
    Runtime     VARCHAR(5),
    DirectorID  NUMBER(5),
    CinematographerID   NUMBER(5),
    ScoreID     NUMBER(5));

CREATE TABLE Genre (
    MovieID     NUMBER(5) CONSTRAINT Genre_MovieID_PK PRIMARY KEY,
    Movie_Genre     VARCHAR(20));

CREATE TABLE Reviews (
    No_stars    NUMBER(1) CONSTRAINT Reviews_No_stars_cc CHECK((No_stars >= 1) and (No_stars <= 5)),
    MovieID     NUMBER(5),
    CONSTRAINT reviews_MovieID_No_stars_pk PRIMARY KEY (MovieID, No_stars));

CREATE TABLE Cinematographer (
    CinematographerID   NUMBER(5) CONSTRAINT Cinematographer_CinematographerID_PK PRIMARY KEY,
    Name    VARCHAR(50),
    Sex     CHAR(1) CONSTRAINT Cinematographer_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age     NUMBER(2) CONSTRAINT Cinematographer_age_cc CHECK((Age >= 18) and (Age <= 99)),
    RelativesID NUMBER(5));

CREATE TABLE Composer (
    ScoreID     NUMBER(5) CONSTRAINT Composer_ScoreID_PK PRIMARY KEY,
    Name        VARCHAR(50),
    Sex         CHAR(1) CONSTRAINT Composer_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age         NUMBER(2) CONSTRAINT Composer_age_cc CHECK((Age >= 18) and (Age <= 99)),
    RelativesID NUMBER(5));

CREATE TABLE Relatives (
    RelativesID    NUMBER(5) CONSTRAINT Relatives_RelativesID_PK PRIMARY KEY,
    Relatives_Name   VARCHAR(30),
    B_Date  DATE,
    Age     NUMBER(2) CONSTRAINT Relative_age_cc CHECK((Age >= 18) and (Age <= 99)),
    Sex     CHAR(1) CONSTRAINT Relative_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Relation    VARCHAR(20));



ALTER TABLE Person 
ADD CONSTRAINT person_relativesID_fk FOREIGN KEY(RelativesID)
REFERENCES Relatives(RelativesID);

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

ALTER TABLE Cinematographer 
ADD CONSTRAINT cinematographer_relativeID_fk FOREIGN KEY(RelativesID)
REFERENCES Relatives(RelativesID);

ALTER TABLE Composer 
ADD CONSTRAINT composer_relativesID_fk FOREIGN KEY(RelativesID)
REFERENCES Relatives(RelativesID);

ALTER TABLE Cinematographer
ADD CONSTRAINT cinematographer_cinematographerID_fk FOREIGN KEY(CinematographerID)
REFERENCES Person(PersonID);


INSERT INTO Film
VALUES( 'The Batman', 12345, '2:56', 13345, 22375, 12349);
INSERT INTO Person 
VALUES (13345, 'Matt', 'G', 'Reeves', '27-APR-1966', 'M', 59, 09451);
INSERT INTO Relatives
VALUES (09451, ' Melinda Wang', '29-MAY-1973', 52, 'F', 'Wife');
INSERT INTO Director
VALUES (13345);
INSERT INTO Producer
VALUES  (13345);
INSERT INTO Person 
VALUES (22375 , 'Greig', NULL, 'Fraser', '03-OCT-1975', 'M', 50, 09576)  ;
INSERT INTO Relatives
VALUES (09576, ' Jodie Fried', '19-MAY-1977', 49, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (22375, 'Greig Fraser', 'M', 50, 09576);
INSERT INTO Person 
VALUES (78956 , 'Michael',NULL, 'Giacchino', '10-OCT-1967', 'M', 58, 09676);
INSERT INTO Relatives
VALUES (09676, ' Maria Giacchino', '27-AUG-1969', 56, 'F', 'Wife');
INSERT INTO Composer
VALUES (12349, 'Michael Giacchino', 'M', 58, 09676 );
INSERT INTO Genre
VALUES  (12345, 'Action');
INSERT INTO Reviews 
VALUES ( 4, 12345);
INSERT INTO Person 
VALUES (63636, 'Robert', 'D', 'Pattinson', '13-MAY-1986', 'M', 39, 02345);
INSERT INTO Relatives 
VALUES (02345, 'Suki Waterhouse', '05-JAN-1992', 34, 'F', 'Wife')
INSERT INTO Actor
VALUES (63636);
INSERT INTO StarIN
VALUES (63636, 12345);
INSERT INTO Person 
VALUES (63637, 'Zoe', 'I', 'Kravitz', '01-DEC-1988', 'F', 37, 02346);
INSERT INTO Relatives 
VALUES (02346, 'Lenny Kravitz', '26-MAY-1964', 61, 'M', 'Father')
INSERT INTO Actor
VALUES (63637);
INSERT INTO StarIN
VALUES (63637, 12345);

INSERT INTO Film
VALUES( 'Superman', 91921, '2:09', 25962, 61915, 91923);
INSERT INTO Person
VALUES (25962 , 'James', 'F', 'Gunn', '1966-08-06', 'M', 59, 09565);
INSERT INTO Relatives
VALUES (09565, 'Jennifer Holland', '1987-09-09', 38, 'F', 'Wife');
INSERT INTO Director
VALUES (25962);
INSERT INTO Producer
VALUES  (25962);
INSERT INTO Person 
VALUES (61915 , 'Henry', NULL, 'Braham', '1965-10-30', 'M', 60, 083874) ;
INSERT INTO Relatives
VALUES (083874, 'Glynis Murray', '1968-6-17', 57, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (61915, 'Henry Braham', 'M', 60, 083874);
INSERT INTO Person 
VALUES (78956 , 'John', NULL, 'Murphy', '1965-03-04', 'M', 61, NULL );
/* no apparent relative online*/ 
INSERT INTO Composer
VALUES (91923, 'John Murphy', 'M', 61, NULL );
INSERT INTO Genre
VALUES  (91921, 'Action');
INSERT INTO Reviews 
VALUES ( 5, 91921);
INSERT INTO Person 
VALUES (87855, 'David', 'P', 'Corenswet', '08-JUL-1993', 'M', 32, 07843);
INSERT INTO Relatives 
VALUES (07843, 'Julia Best Warner', '05-FEB-1992', 33, 'F', 'Wife');
INSERT INTO Actor
VALUES (87855);
INSERT INTO StarIN
VALUES (87855, 91921);
INSERT INTO Person 
VALUES (63647, 'Nicholas ', 'C', 'Hoult', '07-DEC-1989', 'M', 36, 08933);
INSERT INTO Relatives 
VALUES (08933, 'Bryana Holly', '26-AUG-1990', 35, 'F', 'Wife');
INSERT INTO Actor
VALUES (63647);
INSERT INTO StarIN
VALUES (63647, 91921);

        
INSERT INTO Film
VALUES( 'Justice League', 81972, '2:00', 81973, 81372 , 71972);
INSERT INTO Person
VALUES (81973 , 'Zack', 'E', 'Snyder', '1966-3-01', 'M', 60, 05747) ;
INSERT INTO Relatives
VALUES (05747, ' Deborah Snyder', '13-MAR-1969', 57, 'F', 'Wife');
INSERT INTO Director
VALUES (81973);
INSERT INTO Producer
VALUES  (81973);
INSERT INTO Person 
VALUES (81372 , 'Fabian', NULL, 'Wagner', '1978-10-30', 'M', 47, NULL) ;
/* no apparent relative online*/ 
INSERT INTO Cinematographer
VALUES (81372, 'Fabian Wagner', 'M', 47, NULL);
INSERT INTO Person 
VALUES (75775 , 'Danny', NULL, 'Elfman', '1953-05-29', 'M', 72, 07684);
INSERT INTO Relatives
VALUES (07684, ' Bridget Fonda', '27-JAN-1964', 62, 'F', 'Wife');
INSERT INTO Composer
VALUES (71972, 'Danny Elfman', 'M', 72,07684 );
INSERT INTO Genre
VALUES  (81972, 'Action');
INSERT INTO Reviews 
VALUES ( 1, 81972);
INSERT INTO Person 
VALUES (57484, 'Benjamin ', 'G', 'Affleck', '05-AUG-1972', 'M', 53, 07844);
INSERT INTO Relatives 
VALUES (07844, 'Jennifer Lopez', '05-JUL-1969', 56, 'F', 'Wife');
INSERT INTO Actor
VALUES (57484);
INSERT INTO StarIN
VALUES (57484, 81972);
INSERT INTO Person 
VALUES (63638, 'Henry ', 'W', 'Cavill', '05-MAY-1983', 'M', 42, 08833);
INSERT INTO Relatives 
VALUES (08833, 'Natalie Viscuso', '26-MAR-1990', 35, 'F', 'Wife');
INSERT INTO Actor
VALUES (63638);
INSERT INTO StarIN
VALUES (63638, 81972);


INSERT INTO Film
VALUES( '300', 23279 , '1:57', 81973, 25877 , 29889 );
INSERT INTO Person
VALUES (81973 , 'Zack', 'E', 'Snyder', '1966-3-01', 'M', 60, 05747) ;
INSERT INTO Relatives
VALUES (05747, ' Deborah Snyder', '1969-03-13', 57, 'F', 'Wife');
INSERT INTO Director
VALUES (81973);
INSERT INTO Producer
VALUES  (81973);
INSERT INTO Person 
VALUES (25877 , 'Larry', NULL, 'Fong', '1960-06-30', 'M', 65, NULL); 
INSERT INTO Cinematographer
VALUES (25877, 'Larry Fong', 'M', 65, NULL);
INSERT INTO Person 
VALUES (76566 , 'Tyler', NULL, 'Bates', '1965-06-05', 'M', 72, 07687);
INSERT INTO Relatives
VALUES (07687, 'Lola Bates', '11-FEB-1967', 57, 'F', 'Wife');
INSERT INTO Composer
VALUES (29889, 'Tyler Bates', 'M', 60, 07687 );
INSERT INTO Genre
VALUES  (23279, 'Action');
INSERT INTO Reviews 
VALUES ( 3, 23279);
INSERT INTO Person 
VALUES (57480, 'Gerard ', 'G', 'Affleck', '13-NOV-1969', 'M', 56, NULL);
INSERT INTO Relatives 
    /*no apparent relatives online */
INSERT INTO Actor
VALUES (57480);
INSERT INTO StarIN
VALUES (57480, 23279);
INSERT INTO Person 
VALUES (63633, 'David ', NULL, 'Wenham', '05-AUG-1965', 'M', 60, 05843);
INSERT INTO Relatives 
VALUES (05843, 'Kate Agnew', '26-APR-1964', 61, 'F', 'Wife');
INSERT INTO Actor
VALUES (63633);
INSERT INTO StarIN
VALUES (63633, 23279);

INSERT INTO Film
VALUES( 'Guardians of the Galaxy 3', 92778 , '2:29', 25962 , 61915 , 93464);
INSERT INTO Person
VALUES (25962 , 'James', 'F', 'Gunn', '1966-08-06', 'M', 59, 09565);
INSERT INTO Relatives
VALUES (09565, 'Jennifer Holland', '1987-09-09', 38, 'F', 'Wife');
INSERT INTO Director
VALUES (25962);
INSERT INTO Producer
VALUES  (25962);
INSERT INTO Person 
VALUES (61915 , 'Henry', NULL, 'Braham', '1965-10-30', 'M', 60, 083874) ;
INSERT INTO Relatives
VALUES (083874, 'Glynis Murray', '1968-6-17', 57, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (61915, 'Henry Braham', 'M', 60, 083874);
INSERT INTO Person 
VALUES (78956 , 'John', NULL, 'Murphy', '1965-03-04', 'M', 61, NULL );
INSERT INTO Composer
VALUES (93464, 'John Murphy', 'M', 61, NULL );
INSERT INTO Genre
VALUES  (92778, 'Action');
INSERT INTO Reviews 
VALUES ( 5, 92778);
INSERT INTO Person 
VALUES (54484, 'Christopher ', 'M', 'Pratt', '29-JUN-1979', 'M', 46, 07830);
INSERT INTO Relatives 
VALUES (07830, 'Katherine Schwarzenegger', '13-DEC-1989', 36, 'F', 'Wife');
INSERT INTO Actor
VALUES (54484);
INSERT INTO StarIN
VALUES (54484, 92778);
INSERT INTO Person 
VALUES (68637, 'Zoe ', 'Y', 'Saldana', '19-JUN-1978', 'F', 47, 03833);
INSERT INTO Relatives 
VALUES (03833, 'Marco Perego-Saldaña', '26-JUN-1979', 47, 'M', 'Husband');
INSERT INTO Actor
VALUES (68637);
INSERT INTO StarIN
VALUES (68637, 92778);

INSERT INTO Film
VALUES( 'Guardians of the Galaxy 2', 92770 , '2:17', 25962 , 61915 , 93466);
INSERT INTO Person
VALUES (25962 , 'James', 'F', 'Gunn', '1966-08-06', 'M', 59, 09565);
INSERT INTO Relatives
VALUES (09565, 'Jennifer Holland', '1987-09-09', 38, 'F', 'Wife');
INSERT INTO Director
VALUES (25962);
INSERT INTO Producer
VALUES  (25962);
INSERT INTO Person 
VALUES (61915 , 'Henry', NULL, 'Braham', '1965-10-30', 'M', 60, 083874) ;
INSERT INTO Relatives
VALUES (083874, 'Glynis Murray', '1968-6-17', 57, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (61915, 'Henry Braham', 'M', 60, 083874);
INSERT INTO Person 
VALUES (78956 , 'John', NULL, 'Murphy', '1965-03-04', 'M', 61, NULL );
INSERT INTO Composer
VALUES (93466, 'John Murphy', 'M', 61 , NULL);
INSERT INTO Genre
VALUES  (92770, 'Action');
INSERT INTO Reviews 
VALUES ( 5, 92770);
INSERT INTO Person 
VALUES (54484, 'Christopher ', 'M', 'Pratt', '29-JUN-1979', 'M', 46, 07830);
INSERT INTO Relatives 
VALUES (07830, 'Katherine Schwarzenegger', '13-DEC-1989', 36, 'F', 'Wife');
INSERT INTO Actor
VALUES (54484);
INSERT INTO StarIN
VALUES (54484, 92770);
INSERT INTO Person 
VALUES (68637, 'Zoe ', 'Y', 'Saldana', '19-JUN-1978', 'F', 47, 03833);
INSERT INTO Relatives 
VALUES (03833, 'Marco Perego-Saldaña', '26-JUN-1979', 47, 'M', 'Husband');
INSERT INTO Actor
VALUES (68637);
INSERT INTO StarIN
VALUES (68637, 92770);

INSERT INTO Film
VALUES( 'Guardians of the Galaxy ', 99771 , '2:01', 25962 , 61915 , 93467);
INSERT INTO Person
VALUES (25962 , 'James', 'F', 'Gunn', '1966-08-06', 'M', 59, 09565);
INSERT INTO Relatives
VALUES (09565, 'Jennifer Holland', '1987-09-09', 38, 'F', 'Wife');
INSERT INTO Director
VALUES (25962);
INSERT INTO Producer
VALUES  (25962);
INSERT INTO Person 
VALUES (61915 , 'Henry', NULL, 'Braham', '1965-10-30', 'M', 60, 083874) ;
INSERT INTO Relatives
VALUES (083874, 'Glynis Murray', '1968-6-17', 57, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (61915, 'Henry Braham', 'M', 60, 083874);
INSERT INTO Person 
VALUES (78956 , 'John', NULL, 'Murphy', '1965-03-04', 'M', 61, NULL );
INSERT INTO Composer
VALUES (93467, 'John Murphy', 'M', 61 , NULL);
INSERT INTO Genre
VALUES  (99771, 'Action');
INSERT INTO Reviews 
VALUES ( 5, 99771);
INSERT INTO Person 
VALUES (54484, 'Christopher ', 'M', 'Pratt', '29-JUN-1979', 'M', 46, 07830);
INSERT INTO Relatives 
VALUES (07830, 'Katherine Schwarzenegger', '13-DEC-1989', 36, 'F', 'Wife');
INSERT INTO Actor
VALUES (54484);
INSERT INTO StarIN
VALUES (54484, 99771);
INSERT INTO Person 
VALUES (68637, 'Zoe ', 'Y', 'Saldana', '19-JUN-1978', 'F', 47, 03833);
INSERT INTO Relatives 
VALUES (03833, 'Marco Perego-Saldaña', '26-JUN-1979', 47, 'M', 'Husband');
INSERT INTO Actor
VALUES (68637);
INSERT INTO StarIN
VALUES (68637, 99771);

INSERT INTO Film
VALUES( 'Iron Man ', 11361  , '2:06', 11335 , 14645  , 15855);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '1966-10-19', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '14-MAY-1970', 55, 'F', 'Wife');
INSERT INTO Director
VALUES (11335);
INSERT INTO Producer
VALUES  (11335);
INSERT INTO Person 
VALUES (14645 , 'Matthew ', 'J', 'Libatique ', '1968-07-19', 'M', 57, 04474)  ;
INSERT INTO Relatives
VALUES (04474, 'Mary-Ellen Libatique ','09-JUL-1970', 55, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (14645, 'Matthew José Libatique', 'M', '57', 04474);
INSERT INTO Person 
VALUES (78950 , 'Ramin', NULL, 'Djawadi', '1974-07-19', 'M', 51, 04220);
INSERT INTO Relatives
VALUES (04220, 'Jennifer Hawks', '04-JUN-1974', 55, 'F', 'Wife');
INSERT INTO Composer
VALUES (15855, 'Ramin Djawadi', 'M', 61,04220 );
INSERT INTO Genre
VALUES  (11361, 'Action');
INSERT INTO Reviews 
VALUES ( 4, 11361);
INSERT INTO Person 
VALUES (44484, 'Robert ', 'J', 'Downey Jr.', '04-APR-1965', 'M', 61, 06631);
INSERT INTO Relatives 
VALUES (06631, 'Susan Downey', '06-NOV-1973', 52, 'F', 'Wife');
INSERT INTO Actor
VALUES (44484);
INSERT INTO StarIN
VALUES (44484, 11361);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '19-OCT-1966', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '14-MAY-1970', 55, 'F', 'Wife');
INSERT INTO Actor
VALUES (11335);
INSERT INTO StarIN
VALUES (11335, 11361);


INSERT INTO Film
VALUES( 'Iron Man 2 ', 11362  , '2:06', 11335 , 14645 , 15854);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '1966-10-19', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '1970-05-14', 55, 'F', 'Wife');
INSERT INTO Director
VALUES (11335);
INSERT INTO Producer
VALUES  (11335);
INSERT INTO Person 
VALUES (14645 , 'Matthew ', 'J', 'Libatique ', '1968-07-19', 'M', 57, 04474)  ;
INSERT INTO Relatives
VALUES (04474, 'Mary-Ellen Libatique ','1970-07-09', 55, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (14645, 'Matthew José Libatique', 'M', '57', 04474);
INSERT INTO Person 
VALUES (78950 , 'Ramin', NULL, 'Djawadi', '1974-07-19', 'M', 51, 04220);
INSERT INTO Relatives
VALUES (04220, 'Jennifer Hawks', '1974-06-14', 55, 'F', 'Wife');
INSERT INTO Composer
VALUES (15854, 'Ramin Djawadi', 'M', 61,04220);
INSERT INTO Genre
VALUES  (11362, 'Action');
INSERT INTO Reviews 
VALUES ( 4, 11362);
INSERT INTO Person 
VALUES (44484, 'Robert ', 'J', 'Downey Jr.', '04-APR-1965', 'M', 61, 06631);
INSERT INTO Relatives 
VALUES (06631, 'Susan Downey', '06-NOV-1973', 52, 'F', 'Wife');
INSERT INTO Actor
VALUES (44484);
INSERT INTO StarIN
VALUES (44484, 11362);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '19-OCT-1966', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '14-MAY-1970', 55, 'F', 'Wife');
INSERT INTO Actor
VALUES (11335);
INSERT INTO StarIN
VALUES (11335, 11362);


INSERT INTO Film
VALUES( 'Iron Man 3', 11363  , '2:06', 11335 , 14645 , 15853);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '1966-10-19', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '1970-05-14', 55, 'F', 'Wife');
INSERT INTO Director
VALUES (11335);
INSERT INTO Producer
VALUES  (11335);
INSERT INTO Person 
VALUES (14645 , 'Matthew ', 'J', 'Libatique ', '1968-07-19', 'M', 57, 04474)  ;
INSERT INTO Relatives
VALUES (04474, 'Mary-Ellen Libatique ','1970-07-09', 55, 'F', 'Wife');
INSERT INTO Cinematographer
VALUES (14645, 'Matthew José Libatique', 'M', '57', 04474);
INSERT INTO Person 
VALUES (78950 , 'Ramin', NULL, 'Djawadi', '1974-07-19', 'M', 51, 04220);
INSERT INTO Relatives
VALUES (04220, 'Jennifer Hawks', '1974-06-14', 55, 'F', 'Wife');
INSERT INTO Composer
VALUES (15853, 'Ramin Djawadi', 'M', 61, 04220);
INSERT INTO Genre
VALUES  (11363, 'Action');
INSERT INTO Reviews 
VALUES ( 4, 11363);
INSERT INTO Person 
VALUES (44484, 'Robert ', 'J', 'Downey Jr.', '04-APR-1965', 'M', 61, 06631);
INSERT INTO Relatives 
VALUES (06631, 'Susan Downey', '06-NOV-1973', 52, 'F', 'Wife');
INSERT INTO Actor
VALUES (44484);
INSERT INTO StarIN
VALUES (44484, 11363);
INSERT INTO Person
VALUES (11335 , 'Jonathan ', 'K', 'Favreau', '19-OCT-1966', 'M', 59, 06550) ;
INSERT INTO Relatives
VALUES (06550, ' Joya Tillem', '14-MAY-1970', 55, 'F', 'Wife');
INSERT INTO Actor
VALUES (11335);
INSERT INTO StarIN
VALUES (11335, 11363);

SELECT MovieID
FROM Reviews
WHERE No_stars >= 4;

SELECT Fname, Lname
FROM Person NATURAL JOIN Director
WHERE PersonID = DirectorID;

SELECT Movie_Genre
FROM Genre NATURAL JOIN Reviews
WHERE No_stars <= 3;

SELECT Title, Movie_Genre
FROM Film NATURAL JOIN Reviews NATURAL JOIN Genre
WHERE Reviews.No_stars = 5;

SELECT Relatives_Name
FROM Relatives, Person, Cinematographer
WHERE Person.RelativesID=Cinematographer.RelativesID and Relatives.Sex='F';

SELECT Fname, Lname, Title
FROM Person NATURAL JOIN Film NATURAL JOIN Actor NATURAL JOIN StarIN
WHERE PersonID = ActorID and MovieID=MovieID;

SELECT Fname, Lname FROM Person, Director WHERE PersonID = DirectorID
INTERSECT
SELECT Fname, Lname FROM Person, Producer WHERE PersonID = ProducerID;

SELECT Fname, Lname FROM Person WHERE Sex = 'M'
MINUS
SELECT Fname, Lname FROM Person WHERE Sex = 'F';

SELECT COUNT(DirectorID) FROM Director;

SELECT AVG(No_stars) FROM Reviews;
