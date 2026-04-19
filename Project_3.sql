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
    Age     NUMBER(2) CONSTRAINT Cinematographer_age_cc CHECK((Age >= 18) and (Age <= 99))
    RelativeID NUMBER(5));

CREATE TABLE Composer (
    ScoreID     NUMBER(5) CONSTRAINT Composer_ScoreID_PK PRIMARY KEY,
    Name        VARCHAR(50),
    Sex         CHAR(1) CONSTRAINT Composer_Sex_cc CHECK(Sex = 'M' OR Sex = 'F'),
    Age         NUMBER(2) CONSTRAINT Composer_age_cc CHECK((Age >= 18) and (Age <= 99))
    RelativeID NUMBER(5));

CREATE TABLE Relatives (
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

ALTER TABLE Cinematographer 
ADD CONSTRAINT cinematographer_relativeID_fk FOREIGN KEY(RelativeID)
REFERENCES Relative(RelativeID);

ALTER TABLE Composer 
ADD CONSTRAINT composer_relativeID_fk FOREIGN KEY(RelativeID)
REFERENCES Relative(RelativeID);


INSERT INTO Film
VALUES( 'The Batman', 12356, '2:56', 13345, 22375, 12349);
    INSERT INTO Person 
        VALUES (13345, 'Matt', 'G', 'Reeves', 1966-04-27, 'M', '59', 09451) 
         INSERT INTO Relatives
                VALUES (09451, ' Melinda Wang', 1973-05-29, 52, 'F', 'Wife')
        INSERT INTO Director
            VALUES 13345
                  INSERT INTO Producer
                        VALUES  13345
                     INSERT INTO Person 
                        VALUES (22375 , 'Greig', '', 'Fraser', 1975-10-03, 'M', '50', 09576)  
                                   INSERT INTO Relatives
                                        VALUES (09576, ' Jodie Fried', 1977-5-19, 49, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (22375, 'Greig Fraser', 'M', '50', 09576)
                                    INSERT INTO Person 
                                        VALUES (78956 , 'Michael', '', 'Giacchino', 1967-10-10, 'M', '58', 09676)
                                                         INSERT INTO Relatives
                                                                VALUES (09676, ' Maria Giacchino', 1969-8-27, 56, 'F', 'Wife')
                                                INSERT INTO Composer
                                                    VALUES (12349, 'Michael Giacchino', 'M', '58', 09676 )
                                                            INSERT INTO Genre
                                                                VALUES  (12356, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '4', 12345);

        
INSERT INTO Film
VALUES( 'Superman', 91921, '2:09', 25962, 61921, 91923);
    INSERT INTO Person
            VALUES (25962 , 'James', 'F', 'Gunn', 1966-08-06, 'M', '59', 09565) 
        INSERT INTO Relatives
                 VALUES (09565, ' Jennifer Holland', 1987-09-09, 38, 'F', 'Wife')
        INSERT INTO Director
            VALUES 25962
                  INSERT INTO Producer
                        VALUES  25962
                     INSERT INTO Person 
                        VALUES (61921 , 'Henry', '', 'Braham', 1965-10-30, 'M', '60', 083874) /
                                    INSERT INTO Relatives
                                            VALUES (083874, ' Glynis Murray', 1968-6-17, 57, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Henry Braham', 'M', '60',083874)
                                    INSERT INTO Person 
                                        VALUES (78956 , 'John', '', 'Murphy', 1965-03-04, 'M', '61', NULL )
                                                  /* no apparent relative online*/ 
                                                INSERT INTO Composer
                                                    VALUES (91923, 'John Murphy', 'M', '61', NULL )
                                                            INSERT INTO Genre
                                                                VALUES  (91921, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '5', 91921);




        
INSERT INTO Film
VALUES( 'Justice League', 81972, '2:00', 81973, 81372 , 71972)
    INSERT INTO Person
            VALUES (81973 , 'Zack', 'E', 'Snyder', 1966-3-01, 'M', '60', 05747) 
        INSERT INTO Relatives
                 VALUES (09565, ' Deborah Snyder', 1969-03-13, 57, 'F', 'Wife')
        INSERT INTO Director
            VALUES 81973
                  INSERT INTO Producer
                        VALUES  81973
                     INSERT INTO Person 
                        VALUES (61921 , 'Fabian', '', 'Wagner', 1978-10-30, 'M', '47', NULL) 
                                     /* no apparent relative online*/ 
                            INSERT INTO Cinematographer
                                VALUES (81372, 'Fabian Wagner', 'M', '47', 08764)
                                    INSERT INTO Person 
                                        VALUES (75775 , 'Danny', '', 'Elfman', 1953-05-29, 'M', '72', 07684)
                                                       INSERT INTO Relatives
                                                             VALUES (07684, ' Bridget Fonda', 1964-01-27, 62, 'F', 'Wife')
                                                INSERT INTO Composer
                                                    VALUES (91923, 'Danny Elfman', 'M', '72',07684 )
                                                            INSERT INTO Genre
                                                                VALUES  (81972, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '1', 81972);

INSERT INTO Film
VALUES( '300', 23279 , '1:57', 26536, 25877 , 29889 )
INSERT INTO Person
            VALUES (26536 , 'Zack', 'E', 'Snyder', 1966-3-01, 'M', '60', 05747) 
        INSERT INTO Relatives
                 VALUES (09565, ' Deborah Snyder', 1969-03-13, 57, 'F', 'Wife')
        INSERT INTO Director
            VALUES 26536
                  INSERT INTO Producer
                        VALUES  26536
                     INSERT INTO Person 
                        VALUES (61921 , 'Larry', '', 'Fong', 1960-06-30, 'M', '65', NULL) 
                                     
                            INSERT INTO Cinematographer
                                VALUES (81372, 'Larry Fong', 'M', '65', NULL)
                                    INSERT INTO Person 
                                        VALUES (76566 , 'Tyler', '', 'Bates', 1965-06-05, 'M', '72', 07687)
                                                      INSERT INTO Relatives
                                                                 VALUES (07687, 'Lola Bates', 1967-02-11, 57, 'F', 'Wife')
                                                INSERT INTO Composer
                                                    VALUES (91676, 'Tyler Bates', 'M', '60', 07687 )
                                                            INSERT INTO Genre
                                                                VALUES  (23279, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '3', 23279);

INSERT INTO Film
VALUES( 'Guardians of the Galaxy 3', 92778 , '2:29', 92644 , 93636  , 93464)
INSERT INTO Person
            VALUES (25962 , 'James', 'F', 'Gunn', 1966-08-06, 'M', '59', 09565) 
        INSERT INTO Relatives
                 VALUES (09565, ' Jennifer Holland', 1987-09-09, 38, 'F', 'Wife')
        INSERT INTO Director
            VALUES 25962
                  INSERT INTO Producer
                        VALUES  25962
                     INSERT INTO Person 
                        VALUES (61921 , 'Henry', '', 'Braham', 1965-10-30, 'M', '60', 083874)  
                                     INSERT INTO Relatives
                                                VALUES (083874, 'Glynis Murray ', 1965-06-09, 38, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Henry Braham', 'M', '60', 083874)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'John', '', 'Murphy', 1965-03-04, 'M', '61', NULL)
                                                                
                                                INSERT INTO Composer
                                                    VALUES (91923, 'John Murphy', 'M', '61', NULL )
                                                            INSERT INTO Genre
                                                                VALUES  (92778, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '5', 92778);

INSERT INTO Film
VALUES( 'Guardians of the Galaxy 2', 92778 , '2:17', 92644 , 93636  , 93464)
INSERT INTO Person
            VALUES (25962 , 'James', 'F', 'Gunn', 1966-08-06, 'M', '59', 09565) 
        INSERT INTO Relatives
                 VALUES (09565, ' Jennifer Holland', 1987-09-09, 38, 'F', 'Wife')
        INSERT INTO Director
            VALUES 25962
                  INSERT INTO Producer
                        VALUES  25962
                     INSERT INTO Person 
                        VALUES (61921 , 'Henry', '', 'Braham', 1965-10-30, 'M', '60', 083874)  
                                     INSERT INTO Relatives
                                                VALUES (083874, 'Glynis Murray ', 1965-06-09, 38, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Henry Braham', 'M', '60', 083874)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'John', '', 'Murphy', 1965-03-04, 'M', '61', NULL)
                                                                
                                                INSERT INTO Composer
                                                    VALUES (91923, 'John Murphy', 'M', '61' , NULL)
                                                            INSERT INTO Genre
                                                                VALUES  (92778, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '5', 92778);


INSERT INTO Film
VALUES( 'Guardians of the Galaxy ', 99778 , '2:01', 92644 , 93636  , 93464)
INSERT INTO Person
            VALUES (25962 , 'James', 'F', 'Gunn', 1966-08-06, 'M', '59', 09565) 
        INSERT INTO Relatives
                 VALUES (09565, ' Jennifer Holland', 1987-09-09, 38, 'F', 'Wife')
        INSERT INTO Director
            VALUES 25962
                  INSERT INTO Producer
                        VALUES  25962
                     INSERT INTO Person 
                        VALUES (61921 , 'Henry', '', 'Braham', 1965-10-30, 'M', '60', 083874)  
                                     INSERT INTO Relatives
                                                VALUES (083874, 'Glynis Murray ', 1965-06-09, 38, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Henry Braham', 'M', '60', 083874)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'John', '', 'Murphy', 1965-03-04, 'M', '61', NULL)
                                                                
                                                INSERT INTO Composer
                                                    VALUES (91923, 'John Murphy', 'M', '61' , NULL)
                                                            INSERT INTO Genre
                                                                VALUES  (99778, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '5', 99778);

INSERT INTO Film
VALUES( 'Iron Man ', 11361  , '2:06', 11335 , 14644  , 15855)
INSERT INTO Person
            VALUES (45054 , 'Jonathan ', 'K', 'Favreau', 1966-10-19, 'M', '59', 06555) 
        INSERT INTO Relatives
                 VALUES (06555, ' Joya Tillem', 1970-05-14, 55, 'F', 'Wife')
        INSERT INTO Director
            VALUES 45054
                  INSERT INTO Producer
                        VALUES  45054
                     INSERT INTO Person 
                        VALUES (61921 , 'Matthew ', 'J', 'Libatique ', 1968-07-19, 'M', '57', 04474)  
                                     INSERT INTO Relatives
                                                VALUES (04474, 'Mary-Ellen Libatique ', 1970-07-09, 55, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Matthew José Libatique', 'M', '57', 04474)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'Ramin', '', 'Djawadi', 1974-07-19, 'M', '51', 04222)
                                                                 INSERT INTO Relatives
                                                                         VALUES (06555, 'Jennifer Hawks', 1974-06-14, 55, 'F', 'Wife')
                                                    INSERT INTO Composer
                                                        VALUES (91923, 'Ramin Djawadi', 'M', '61',04222 )
                                                             INSERT INTO Genre
                                                                VALUES  (11361, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '4', 11361);
INSERT INTO Film
VALUES( 'Iron Man 2 ', 11362  , '2:06', 11335 , 14644  , 15855)
INSERT INTO Person
            VALUES (45054 , 'Jonathan ', 'K', 'Favreau', 1966-10-19, 'M', '59', 06555) 
        INSERT INTO Relatives
                 VALUES (06555, ' Joya Tillem', 1970-05-14, 55, 'F', 'Wife')
        INSERT INTO Director
            VALUES 45054
                  INSERT INTO Producer
                        VALUES  45054
                     INSERT INTO Person 
                        VALUES (61921 , 'Matthew ', 'J', 'Libatique ', 1968-07-19, 'M', '57', 04474)  
                                     INSERT INTO Relatives
                                                VALUES (04474, 'Mary-Ellen Libatique ', 1970-07-09, 55, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Matthew José Libatique', 'M', '57', 04474)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'Ramin', '', 'Djawadi', 1974-07-19, 'M', '51', 04222)
                                                                 INSERT INTO Relatives
                                                                         VALUES (06555, 'Jennifer Hawks', 1974-06-14, 55, 'F', 'Wife')
                                                    INSERT INTO Composer
                                                        VALUES (91923, 'Ramin Djawadi', 'M', '61',04222 )
                                                             INSERT INTO Genre
                                                                VALUES  (11362, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '4', 11362);

INSERT INTO Film
VALUES( 'Iron Man 3', 11363  , '2:06', 11335 , 14644  , 15855)
INSERT INTO Person
            VALUES (45054 , 'Jonathan ', 'K', 'Favreau', 1966-10-19, 'M', '59', 06555) 
        INSERT INTO Relatives
                 VALUES (06555, ' Joya Tillem', 1970-05-14, 55, 'F', 'Wife')
        INSERT INTO Director
            VALUES 45054
                  INSERT INTO Producer
                        VALUES  45054
                     INSERT INTO Person 
                        VALUES (61921 , 'Matthew ', 'J', 'Libatique ', 1968-07-19, 'M', '57', 04474)  
                                     INSERT INTO Relatives
                                                VALUES (04474, 'Mary-Ellen Libatique ', 1970-07-09, 55, 'F', 'Wife')
                            INSERT INTO Cinematographer
                                VALUES (61921, 'Matthew José Libatique', 'M', '57', 04474)
                                    INSERT INTO Person 
                                                       VALUES (78956 , 'Ramin', '', 'Djawadi', 1974-07-19, 'M', '51', 04222)
                                                                 INSERT INTO Relatives
                                                                         VALUES (06555, 'Jennifer Hawks', 1974-06-14, 55, 'F', 'Wife')
                                                    INSERT INTO Composer
                                                        VALUES (91923, 'Ramin Djawadi', 'M', '61',04222 )
                                                             INSERT INTO Genre
                                                                VALUES  (11363, 'Action')
                                                                        INSERT INTO Reviews 
                                                                                VALUES ( '4', 11363);
