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
AS SELECT *
FROM RETAILCUSTOMERS
WHERE 1=0;

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
INSERT ALL 
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(100, 'Ralph Patel', 'Patel', 'Ralph', '2233355555', '10 SenecaWay', 'Unit 7', 'Paris', 'ON', 'N3L 3E1', 'France', 1367, 100000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(101, 'Betty Denis', 'Denis', 'Betty', '3344455555', '110 SenecaWay', 'Suite 200', 'Chicago', 'IL', '60601', 'USA', 1168, 75000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(102, 'Ben Biri', 'Biri', 'Ben', '44555445544', '13000 SenecaWay', 'Apt 303', 'Toronto', 'ON', 'M5V 2T6', 'Canada', 1501, 120000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(103, 'Chad Newman', 'Newman', 'Chad', '66777332233', '12 SenecaWay', 'P.O. Box 1501', 'Mexico city', 'DF', '06000', 'Mexico', 1320, 110000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(104, 'Audrey Ropeburn', 'Ropeburn', 'Audrey', '7788811212', '15000 SenecaWay', 'Office 42', 'Havana', 'CU', '10100', 'Cuba', 1175, 130000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(105, 'Preston Lucy', 'Lucy', 'Preston', '45555511111', '12 SenecaWay', 'Top Floor', 'Charlotte', 'NC', '28202', 'USA', 1370, 90000)
SELECT * FROM dual;

-- 3.	Create a query that shows all the inserted rows from the newCustomers table. How many rows are selected?
SELECT * FROM newCustomers;

-- 4.	Execute the rollback command. Display all rows and columns from the newCustomers table. How many rows are selected?
ROLLBACK;
SELECT * FROM newCustomers;
-- No Rows are selected.
-- 5.	Repeat Question 2. Make the insertion permanent to the table newCustomers. Display all rows and columns from the newCustomers table. How many rows are selected?
INSERT ALL 
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(100, 'Ralph Patel', 'Patel', 'Ralph', '2233355555', '10 SenecaWay', 'Unit 7', 'Paris', 'ON', 'N3L 3E1', 'France', 1367, 100000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(101, 'Betty Denis', 'Denis', 'Betty', '3344455555', '110 SenecaWay', 'Suite 200', 'Chicago', 'IL', '60601', 'USA', 1168, 75000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(102, 'Ben Biri', 'Biri', 'Ben', '44555445544', '13000 SenecaWay', 'Apt 303', 'Toronto', 'ON', 'M5V 2T6', 'Canada', 1501, 120000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(103, 'Chad Newman', 'Newman', 'Chad', '66777332233', '12 SenecaWay', 'P.O. Box 1501', 'Mexico city', 'DF', '06000', 'Mexico', 1320, 110000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(104, 'Audrey Ropeburn', 'Ropeburn', 'Audrey', '7788811212', '15000 SenecaWay', 'Office 42', 'Havana', 'CU', '10100', 'Cuba', 1175, 130000)
INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
VALUES
(105, 'Preston Lucy', 'Lucy', 'Preston', '45555511111', '12 SenecaWay', 'Top Floor', 'Charlotte', 'NC', '28202', 'USA', 1370, 90000)
SELECT * FROM dual;

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
-- This ROLLBACK would be effective in undoing the update if it wasn't committed.
-- c.	What was the difference between the result of the rollback execution from Question 6 and the result of the rollback execution of this task?
-- The difference between the rollback execution from Question 6 and this task lies in the commit status.
-- In Question 6, if the update to 'unknown' was followed by a COMMIT, then the subsequent ROLLBACK would not undo the update
-- because the changes had been made permanent. In this task, assuming no COMMIT was issued after the UPDATE and before the ROLLBACK,
-- the ROLLBACK would effectively undo the changes made by the UPDATE statement, resulting in no rows showing 'unknown' for addressLine1.

-- 9.	Begin a new transaction and then create a statement to delete the customers from the newCustomers table
--BEGIN
--DELETE FROM newCustomers;
--COMMIT;
--END;

-- 10.	Perform a rollback to undo the deletion of the customers
ROLLBACK;
-- a.	How many customers are now in the newCustomers table?
-- After the ROLLBACK, the number of customers in the newCustomers table should be 
-- the same as it was before the DELETE statement was issued.
-- b.	Was the rollback effective and why?
--  The ROLLBACK should be effective because it was used before a COMMIT command was issued. If the DELETE command was not committed, 
-- the ROLLBACK would undo the deletion, restoring the table to its previous state with all the customers intact.

---- 11.	Begin a new transaction and rerun the data insertion from Question 2 (copy the code down to Question 11 and run it)
--BEGIN
--INSERT ALL 
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(100, 'Ralph Patel', 'Patel', 'Ralph', '2233355555', '10 SenecaWay', 'Unit 7', 'Paris', 'ON', 'N3L 3E1', 'France', 1367, 100000)
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(101, 'Betty Denis', 'Denis', 'Betty', '3344455555', '110 SenecaWay', 'Suite 200', 'Chicago', 'IL', '60601', 'USA', 1168, 75000)
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(102, 'Ben Biri', 'Biri', 'Ben', '44555445544', '13000 SenecaWay', 'Apt 303', 'Toronto', 'ON', 'M5V 2T6', 'Canada', 1501, 120000)
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(103, 'Chad Newman', 'Newman', 'Chad', '66777332233', '12 SenecaWay', 'P.O. Box 1501', 'Mexico city', 'DF', '06000', 'Mexico', 1320, 110000)
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(104, 'Audrey Ropeburn', 'Ropeburn', 'Audrey', '7788811212', '15000 SenecaWay', 'Office 42', 'Havana', 'CU', '10100', 'Cuba', 1175, 130000)
--INTO newCustomers (CUSTOMERNUMBER, CUSTOMERNAME, CONTACTLASTNAME, CONTACTFIRSTNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, SALESREPEMPLOYEENUMBER, CREDITLIMIT)
--VALUES
--(105, 'Preston Lucy', 'Lucy', 'Preston', '45555511111', '12 SenecaWay', 'Top Floor', 'Charlotte', 'NC', '28202', 'USA', 1370, 90000)
--SELECT * FROM dual;
--COMMIT;
--END transaction;
-- 12.	Set a Savepoint, called insertion, after inserting the data
SAVEPOINT insertion;
SELECT * FROM newCustomers;

-- 13.	Rerun the update statement from Question 6 and run a query to view the data (copy the code down and run it again)
UPDATE newCustomers
SET addressLine1 = 'unknown';

-- 14.	Rollback the transaction to the Savepoint created in Question 12 above and run a query to view the data.
-- What does the data look like (i.e. describe what happened?
ROLLBACK TO insertion;
SELECT * FROM newCustomers;
-- After rolling back to the savepoint named 'insertion', the state of the 'newCustomers' table should reflect the 
-- data as it was at the point when the savepoint was created. Any changes made to the table after the savepoint 
-- 'insertion' was set and before this ROLLBACK command will be undone.
-- This means if there were updates to the table data after the savepoint, those updates will no longer be present, 
-- and the table will show the data as it was right after the initial insertions.

-- 15.	Use the rollback statement and again view the data.  Describe what the results look like and what happened.
ROLLBACK;
-- The ROLLBACK command without specifying a savepoint will undo the entire transaction, reverting the database to the 
-- last committed state. If the insertions made during this transaction were not committed, 
-- this ROLLBACK will undo those insertions as well.
-- As a result, the 'newCustomers' table will appear as it did before the transaction began, 
-- meaning it will not contain any of the rows that were inserted during this transaction.

-- Part B - Permissions
-- 16.	Write a statement that denies all access to the newCustomers table for all public users
REVOKE ALL PRIVILEGES ON newCustomers FROM PUBLIC;

-- 17.	Write a statement that allows a person  ‘RGNANAOLIVU’ read only access to the newCustomers table.
GRANT SELECT ON newCustomers TO RGNANAOLIVU;

-- 18.	Write a statement that allows the same person  ‘RGNANAOLIVU’ to modify (insert, update and delete) the data of the newCustomers table.
GRANT INSERT, UPDATE, DELETE ON newCustomers TO RGNANAOLIVU;

-- 19.	Write a statement the denies all access to the newCustomers table for the same person  ‘RGNANAOLIVU’.
REVOKE ALL PRIVILEGES ON newCustomers FROM RGNANAOLIVU;

-- Part C – Clean up
-- 20.	Write statements to permanently remove the view and table created for this lab.
DROP TABLE newCustomers;