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
    score DECIMAL(3, 2),
    CONSTRAINT score_chk CHECK (score BETWEEN 3 AND 10)
    );
    
/* ACTORS (actorid:int, firstname:varchar(20), lastname:varchar(30)) */
CREATE TABLE ACTORS(
    actorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
    );
    
/*CASTINGS (movieid:int, actorid:int)*/
CREATE TABLE CASTINGS(
    movieid INT,
    actorid INT,
    PRIMARY KEY(movieid, actorid),
    CONSTRAINT
    movie_id_fk FOREIGN KEY
    (movieid) REFERENCES MOVIES(movieid),
    CONSTRAINT
    actor_id_fk FOREIGN KEY
    (actorid) REFERENCES ACTORS(actorid)
    );

/*DIRECTORS(directorid:int, firstname:varchar(20), lastname:varchar(30))*/
CREATE TABLE DIRECTORS(
    directorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
    );
    
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
INSERT INTO DIRECTORS (directorid, firstname, lastname) 
VALUES (1010, 'Rob', 'Minkoff');
INSERT INTO DIRECTORS (directorid, firstname, lastname) 
VALUES (1020, 'Bill', 'Condon');
INSERT INTO DIRECTORS (directorid, firstname, lastname) 
VALUES (1050, 'Josh', 'Cooley');
INSERT INTO DIRECTORS (directorid, firstname, lastname) 
VALUES (2010, 'Brad', 'Bird');
INSERT INTO DIRECTORS (directorid, firstname, lastname) 
VALUES (3020, 'Lake', 'Bell');
SELECT * FROM DIRECTORS;

INSERT INTO MOVIES (movieid, title, releaseyear, director, score)
VALUES (100, 'The Lion King', 2019, 3020, 3.50);
INSERT INTO MOVIES (movieid, title, releaseyear, director, score)
VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20);
INSERT INTO MOVIES (movieid, title, releaseyear, director, score)
VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);
INSERT INTO MOVIES (movieid, title, releaseyear, director, score)
VALUES (400, 'Mission Impossible', 2018, 2010, 5.00);
INSERT INTO MOVIES (movieid, title, releaseyear, director, score)
VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90);
SELECT * FROM MOVIES;

/* 5) Write SQL statements to remove all above tables. 
Is the order of tables important when removing? Why? */
DROP TABLE CASTINGS;
DROP TABLE MOVIES;
DROP TABLE DIRECTORS;
DROP TABLE ACTORS;

/* 6) Create a new empty table (that means the table will not have any data after creating) employeecopy the same as table retailemployees.  
Use a single statement to create the table and insert the data at the same time (Hint use a WHERE clause that is false like 1=2)*/
CREATE TABLE employeecopy
AS SELECT * FROM RETAILEMPLOYEES
WHERE 3=10;
SELECT * FROM EMPLOYEECOPY;

/* 7) Modify table employeecopy and add a new column username to this table. The value of this column is not required and does not have to be unique. */
ALTER TABLE EMPLOYEECOPY
ADD username VARCHAR2(20);

/* 8) Re-insert all data from the retailemployees table into your new table employeecopy using a single statement. */
INSERT INTO EMPLOYEECOPY
    (EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE)
SELECT * FROM RETAILEMPLOYEES
WHERE 1=1;

/* 9) In table employeecopy, generate the email address for column username for each student by concatenating the employeeid and the string “@seneca.ca”. For instance, the username of employee 123 will be “123@seneca.ca’. */
UPDATE EMPLOYEECOPY
SET username = CONCAT(EMPLOYEENUMBER, '@seneca.ca');

/* 10) Delete all the employeecopy data and display the data in the table. Does employeecopy exist? If not how can you delete table employeecopy. */
DELETE FROM EMPLOYEECOPY;
SELECT * FROM EMPLOYEECOPY;
DROP TABLE EMPLOYEECOPY;



