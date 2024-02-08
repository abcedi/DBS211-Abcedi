/* 
Abcedi Ilacas
Lab 05
DBS211-NBB
138180211
*/

SET AUTOCOMMIT ON;

/*1.	
Create all the following tables and their given constraints:

MOVIES (movieid:int, title:varchar(35), releaseYear:int, director:int,score:decimal(3,2))	
*/
CREATE TABLE MOVIES(
    movieid INT PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    releaseYear INT NOT NULL,
    director INT NOT NULL,
    score DECIMAL(3,2)
    CONSTRAINT
    score_chk CHECK (score BETWEEN 3 AND 10));
    
/* ACTORS (actorid:int, firstname:varchar(20), lastname:varchar(30)) */
CREATE TABLE ACTORS(
    actorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL);
    
/*CASTINGS (movieid:int, actorid:int)*/
DROP TABLE CASTINGS;
CREATE TABLE CASTINGS(
    movieid INT,
    actorid INT,
    PRIMARY KEY(movieid, actorid),
    CONSTRAINT
    movie_id_fk FOREIGN KEY
    (movieid) REFERENCES MOVIES(movieid),
    CONSTRAINT
    actor_id_fk FOREIGN KEY
    (actorid) REFERENCES ACTORS(actorid));

/*DIRECTORS(directorid:int, firstname:varchar(20), lastname:varchar(30))*/
CREATE TABLE DIRECTORS(
    directorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL);
    
/* 2) Modify the movies table to create a foreign key constraint that refers to table directors. */
ALTER TABLE MOVIES
ADD CONSTRAINT director_id_fk
FOREIGN KEY (director)
REFERENCES DIRECTORS (directorid);

/* 3) Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed. */
ALTER TABLE MOVIES
ADD CONSTRAINT unique_movie_title
UNIQUE(TITLE);

/* 4) Write insert statements to add the following data to table directors and movies. */
INSERT ALL 
INTO DIRECTORS (directorid, firstname, lastname) VALUES (1010, 'Rob', 'Minkoff')
INTO DIRECTORS VALUES (1020, 'Bill', 'Condon')
INTO DIRECTORS VALUES (1050, 'Josh', 'Cooley')
INTO DIRECTORS VALUES (2010, 'Brad', 'Bird')
INTO DIRECTORS VALUES (3020, 'Lake', 'Bell')
SELECT * FROM DIRECTORS;
