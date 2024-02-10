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

/*The order of dropping tables in a database is important because of constraints.
Tables with foreign keys pointing to other tables must be dropped first to avoid violating these constraints.
Dropping a referenced table before removing the tables that reference it would result in errors due to these foreign key dependencies.
So you typically drop tables in the reverse order of their dependency hierarchy,
starting with the child tables and ending with the parent tables. */

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

/* 11) Create a statement that will insert yourself as an RETAILEMPLOYEE of the company.  
•	Use a unique RETAILEMPLOYEE number of your choice 
•	Use your school email address and 
•	Your job title will be “Cashier” 
•	Office code will be 4 
•	You will report to RETAILEMPLOYEE 1088 */

INSERT INTO RETAILEMPLOYEES
(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE) 
VALUES (1127, 'Ilacas', 'Abcedi', 9999, 'ailacas1@myseneca.ca', 4, 1088, 'Cashier');

/* 12) Create a query that displays your, and only your, RETAILEMPLOYEE data */
SELECT * FROM RETAILEMPLOYEES
WHERE EMPLOYEENUMBER = 1127;

/* 13) Create a statement to update just your job title to “Head Cashier” */
UPDATE RETAILEMPLOYEES
SET JOBTITLE = 'Head Cashier'
WHERE EMPLOYEENUMBER = 1127;

/* 14) Create a statement to insert another fictional RETAILEMPLOYEE into the database.  
This RETAILEMPLOYEE will be a “Cashier” and will report to you.  Make up fake data for the other fields. */
INSERT INTO RETAILEMPLOYEES
(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE) 
VALUES (6900, 'Kirby', 'Val', 0805, 'vkirby@myseneca.ca', 4, 1127, 'Cashier');

/* 15) Create a statement to Delete yourself from the database.  Did it work?  If not, why? */
DELETE FROM RETAILEMPLOYEES
WHERE EMPLOYEENUMBER = 1127;

/* 
The delete operation for my own employee record did not work because I previously inserted another fake RETAILEMPLOYEES record that reports directly to me REPORTSTO = 1127.
Referential integrity constraints prevent the deletion of a record if it is referenced by a foreign key in another table to avoid orphaned records.
So the presence of an employee reporting to me creates a dependency that stops the database from allowing my record to be deleted. */

/* 16) Create a statement to delete the fake RETAILEMPLOYEE from the database and then rerun the statement to delete yourself.  Did it work? */
DELETE FROM RETAILEMPLOYEES
WHERE EMPLOYEENUMBER = 6900;
DELETE FROM RETAILEMPLOYEES
WHERE EMPLOYEENUMBER = 1127;

SELECT * FROM RETAILEMPLOYEES;

/* 
By first deleting the fake RETAILEMPLOYEES record with EMPLOYEENUMBER = 6900 I remove any dependencies that might have prevented the deletion of my record.
So deleting my record with EMPLOYEENUMBER = 1127 should then work without issue.
This sequence allows for successful deletion of both records while maintaining database integrity by respecting referential constraints. */

/* 17) Create a single statement that will insert both yourself and the fake RETAILEMPLOYEE at the same time.  
This time the fake RETAILEMPLOYEE will report to 1088 as well. */
INSERT ALL 
INTO RETAILEMPLOYEES (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES (1127, 'Ilacas', 'Abcedi', 9999, 'ailacas1@myseneca.ca', 4, 1088, 'Head Cashier')
INTO RETAILEMPLOYEES (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES (6900, 'Kirby', 'Val', 0805, 'vkirby@myseneca.ca', 4, 1088, 'Cashier')
SELECT * FROM dual;

/* 18) Create a single statement to delete both yourself and the fake RETAILEMPLOYEE. */
DELETE FROM RETAILEMPLOYEES
WHERE EMAIL LIKE '%@myseneca.ca';

/* 19) Create a new order in RETAILORDER table with required date Sep 22nd, 2021 and order date as Sep 17th, 2021. 
Make up the rest of the fields and then display only the new order that you have created just now. */
INSERT INTO RETAILORDERS
(ORDERNUMBER, ORDERDATE, REQUIREDDATE, SHIPPEDDATE, STATUS, COMMENTS, CUSTOMERNUMBER) 
VALUES (10469, '17-09-21', '22-09-21', '20-09-21', 'Shipped', 'Can we renegotiate this one?', 103);

/* 20) Insert a new product into product table with product name as “2020 Bugatti Veyron” and productcode as “S111_111” and make up the rest of the fields. */
INSERT INTO RETAILPRODUCTS
(PRODUCTCODE, PRODUCTNAME, PRODUCTLINE, RETAILPRODUCTSCALE, PRODUCTVENDOR, PRODUCTDESCRIPTION, QUANTITYINSTOCK, BUYPRICE, MSRP) 
VALUES ('S111_111', '2020 Bugatti Veyron', 'Classic Cars', '1:5', 'Classic Metal Creations',
'The Bugatti Veyron EB 16.4 is a mid-engine sports car, designed and developed in Germany by the Volkswagen Group and Bugatti and manufactured in Molsheim, France, by French automobile manufacturer Bugatti. It was named after the racing driver Pierre Veyron.',
3, 3000.00, 2900.00);