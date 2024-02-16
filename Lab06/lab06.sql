-- Abcedi Ilacas
-- Lab 06
-- DBS211-NBB
-- 138180211

--  PART A - Transactions
-- 1.	Execute the following commands.
--  SET AUTCOMMIT OFF;
-- 	SET TRANSACTION READ WRITE;
-- Using SQL, create an empty table, that is the same as the RETAILCUSTOMERS table, and name it 
-- newCustomers.
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

CREATE TABLE newCustomers
(
    CUSTOMERNUMBER INT NOT NULL,
    CUSTOMERNAME VARCHAR(50) NOT NULL,
    CONTACTLASTNAME VARCHAR(50) NOT NULL,
    CONTACTFIRSTNAME VARCHAR(50) NOT NULL,
    PHONE VARCHAR(50) NOT NULL,
    ADDRESSLINE1 VARCHAR(50) NOT NULL,
    ADDRESSLINE2 VARCHAR(50),
    CITY VARCHAR(50) NOT NULL,
    STATE VARCHAR(50),
    POSTALCODE VARCHAR(50),
    COUNTRY VARCHAR(50) NOT NULL,
    SALESREPEMPLOYEENUMBER INT,
    CREDITLIMIT DECIMAL(10,2)
);

DROP TABLE NEWCUSTOMERS;
-- 2.	Write an INSERT statement to populate the newCustomers table with the rows of the sample data.
-- (Write a single INSERT statement to insert all the rows, combine firstname and last name to get full name during insert)
--  customerNumber	contactLastName	contactFirstName	Phone	addressLine1	city	country
-- 100	Patel	Ralph	2233355555	10 SenecaWay	Paris	France
-- 101	Denis	Betty	3344455555	110 SenecaWay Chicago	USA
-- 102	Biri	Ben	44555445544	13000 SenecaWay Toronto	Canada
-- 103	Newman	Chad	66777332233	12 SenecaWay Mexico city	Mexico
-- 104	Ropeburn	Audrey	7788811212	15000 SenecaWay Havana	Cuba
-- 105	Lucy	Preston	45555511111	12 SenecaWay	Charlotte	USA
-- REST OF COLUMNS SHOULD BE MADE UP

INSERT INTO newCustomers
VALUES
(100, 'Ralph Patel', 'Patel', 'Ralph', '2233355555', '10 SenecaWay', 'Paris', 'France', NULL, NULL),
(101, 'Betty Denis', 'Denis', 'Betty', '3344455555', '110 SenecaWay', 'Chicago', 'USA', NULL, NULL),
(102, 'Ben Biri', 'Biri', 'Ben', '44555445544', '13000 SenecaWay', 'Toronto', 'Canada', NULL, NULL),
(103, 'Chad Newman', 'Newman', 'Chad', '66777332233', '12 SenecaWay', 'Mexico city', 'Mexico', NULL, NULL),
(104, 'Audrey Ropeburn', 'Ropeburn', 'Audrey', '7788811212', '15000 SenecaWay', 'Havana', 'Cuba', NULL, NULL),
(105, 'Preston Lucy', 'Lucy', 'Preston', '45555511111', '12 SenecaWay', 'Charlotte', 'USA', NULL, NULL);


-- 3.	Create a query that shows all the inserted rows from the newCustomers table. How many rows are selected?
SELECT * FROM newCustomers;
-- 4.	Execute the rollback command. Display all rows and columns from the newCustomers table. How many rows are selected?
ROLLBACK;
SELECT * FROM newCustomers;
-- 5.	Repeat Question 2. Make the insertion permanent to the table newCustomers. Display all rows and columns from the newCustomers table. How many rows are selected?
INSERT INTO newCustomers
VALUES
(100, 'Ralph Patel', 'Patel', 'Ralph', '2233355555', '10 SenecaWay', 'Paris', 'France', NULL, NULL),
(101, 'Betty Denis', 'Denis', 'Betty', '3344455555', '110 SenecaWay', 'Chicago', 'USA', NULL, NULL),
(102, 'Ben Biri', 'Biri', 'Ben', '44555445544', '13000 SenecaWay', 'Toronto', 'Canada', NULL, NULL),
(103, 'Chad Newman', 'Newman', 'Chad', '66777332233', '12 SenecaWay', 'Mexico city', 'Mexico', NULL, NULL),
(104, 'Audrey Ropeburn', 'Ropeburn', 'Audrey', '7788811212', '15000 SenecaWay', 'Havana', 'Cuba', NULL, NULL),
(105, 'Preston Lucy', 'Lucy', 'Preston', '45555511111', '12 SenecaWay', 'Charlotte', 'USA', NULL, NULL);
-- 6.	Write an update statement to update the value of column addressLine1 to ‘unknown’ for all the customers in the newCustomers table.
UPDATE newCustomers
SET addressLine1 = 'unknown';
-- 7.	Make your changes permanent.
COMMIT;
-- 8.	Execute the rollback command. 
ROLLBACK;
-- a.	Display all customers from the newCustomers table whose address is ‘unknown’. How many rows are still updated?
SELECT * FROM newCustomers WHERE addressLine1 = 'unknown';
-- b.	Was the rollback command effective?


-- c.	What was the difference between the result of the rollback execution from Question 6 and the result of the rollback execution of this task?
-- 9.	Begin a new transaction and then create a statement to delete the customers from the newCustomers table
BEGIN TRANSACTION;
DELETE FROM newCustomers;

-- 10.	Perform a rollback to undo the deletion of the customers
ROLLBACK;
-- a.	How many customers are now in the newCustomers table?
-- b.	Was the rollback effective and why?
-- 11.	Begin a new transaction and rerun the data insertion from Question 2 (copy the code down to Question 11 and run it)
BEGIN TRANSACTION;
-- 12.	Set a Savepoint, called insertion, after inserting the data
SAVEPOINT insertion;
-- 13.	Rerun the update statement from Question 6 and run a query to view the data (copy the code down and run it again)
UPDATE newCustomers
SET addressLine1 = 'unknown';
-- 14.	Rollback the transaction to the Savepoint created in Question 12 above and run a query to view the data.
-- What does the data look like (i.e. describe what happened?
ROLLBACK TO insertion;
-- 15.	Use the rollback statement and again view the data.  Describe what the results look like and what happened.
ROLLBACK;
-- Part B - Permissions
-- 16.	Write a statement that denies all access to the newCustomers table for all public users
DENY ALL newCustomers TO PUBLIC;
-- 17.	Write a statement that allows a person  ‘RGNANAOLIVU’ read only access to the newCustomers table.
GRANT SELECT ON newCustomers TO RGNANAOLIVU;
-- 18.	Write a statement that allows the same person  ‘RGNANAOLIVU’ to modify (insert, update and delete) the data of the newCustomers table.
GRANT INSERT, UPDATE, DELETE ON newCustomers TO RGNANAOLIVU;
-- 19.	Write a statement the denies all access to the newCustomers table for the same person  ‘RGNANAOLIVU’.
DENY ALL ON newCustomers TO RGNANAOLIVU;
-- Part C – Clean up
-- 20.	Write statements to permanently remove the view and table created for this lab.
DROP TABLE newCustomers;
