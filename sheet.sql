-- DBS Exam Reference Sheet

-- Application Development Layers
-- 1. Presentation Layer: Handles the user interface, could be a web browser or mobile UI.
-- 2. Business Logic Layer: Processes user input and manages business rules.
-- 3. Data Access Layer: Manages data storage and retrieval.

-- Entity Relationship Diagrams (ERDs)
-- ERDs visually represent the structure of a database with tables, attributes, and relationships.
-- Tables (Entities) store data in rows (records) and columns (attributes).
-- Relationships (one-to-one, one-to-many, many-to-many) define how tables relate to each other.
-- Primary Keys (PK) uniquely identify records, Foreign Keys (FK) establish relationships between tables.

-- Normalization
-- The process of structurally organizing tables to minimize redundancy and dependency.
-- 1NF: Eliminates repeating groups, enforces atomicity, and establishes unique records.
-- 2NF: Removes partial dependencies in tables with composite primary keys.
-- 3NF: Ensures non-key columns are only dependent on primary keys, removing transitive dependencies.

-- SQL Template for Creating a Basic Table
CREATE TABLE TableName (
    ColumnName1 DataType CONSTRAINTS,
    ColumnName2 DataType CONSTRAINTS,
    ...
    PRIMARY KEY (ColumnName1),
    FOREIGN KEY (ColumnName2) REFERENCES OtherTable(ColumnName2)
);

-- SQL for Normalization (1NF Example)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE
    -- Age is not included because it is a derived attribute from DateOfBirth.
);

-- SQL for Normalization (2NF Example)
-- Assuming 'Courses' has a composite key of Course_ID and SectionID, and 'SectionName' is dependent on SectionID only.
CREATE TABLE Courses (
    Course_ID INT,
    Course_Name VARCHAR(255),
    SectionID INT,
    PRIMARY KEY (Course_ID, SectionID)
);

CREATE TABLE Sections (
    SectionID INT PRIMARY KEY,
    SectionName VARCHAR(255)
);

-- SQL for Normalization (3NF Example)
-- Example based on quiz questions regarding transitive dependencies.
CREATE TABLE Models (
    ModelID INT PRIMARY KEY,
    ModelName VARCHAR(255)
    -- FK to Makes table removed to prevent transitive dependency.
);

CREATE TABLE Makes (
    MakeID INT PRIMARY KEY,
    MakeName VARCHAR(255)
    -- Maintains relationship to Models table.
);

-- Usage of DDL and DML statements:
-- DDL (Data Definition Language): CREATE, ALTER, DROP - for structuring and modifying tables.
-- DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE - for managing data within tables.

-- Example of a SELECT statement to query records:
SELECT ColumnName1, ColumnName2 FROM TableName WHERE condition;

-- Inserting data into a table:
INSERT INTO TableName (ColumnName1, ColumnName2) VALUES (Value1, Value2);

-- Updating data in a table:
UPDATE TableName SET ColumnName1 = Value1 WHERE condition;

-- Deleting data from a table:
DELETE FROM TableName WHERE condition;

-- Remember to replace placeholders with actual table names, column names, and conditions relevant to your database structure.

-- Derived Fields
-- Derived fields are calculated from other fields and are not stored in the database to prevent redundancy.
-- Example: Age is derived from the current date and the DateOfBirth field.

-- Handling Transitive Dependencies
-- Transitive dependencies occur when a non-key column depends on another non-key column.
-- To achieve 3NF, remove transitive dependencies by ensuring all non-key columns depend only on the primary key.


--Lab08
--Rules and Relationships:
--
--1)	College and Department
---	A college can contain many departments
---	Relationship: One-to-Many (College to Department)
--
--2)	Department and Program
---	Each department offers one or more programs
---	Relationship: One-to-Many (Department to Program)
--
--3)	Department and Professor
---	A department can employ multiple professors
---	Relationship: One-to-Many (Department to Professor)
---	
--4)	Program and Course (with Program_Course)
---	A program can include several courses
---	Courses can be part of one or more programs
---	Relationship: Many-to-Many (Program to Course), resolved by Program_Course bridge entity
--
--5)	Professor and Course (with Professor_Course)
---	Professors can teach one or more courses
---	Courses can be taught by one or more professors
---	Relationship: Many-to-Many (Professor to Course), resolved by Professor_Course bridge entity
--
--6)	Student and Program (with Student_Program)
---	Students can be enrolled in one or more programs
---	Programs can have many students enrolled
---	Relationship: Many-to-Many (Student to Program), resolved by Student_Program bridge entity
--
--7)	Student and Course (with Student_Course)
---	Students can register for multiple courses
---	Courses can have multiple students registered
---	Relationship: Many-to-Many (Student to Course), resolved by Student_Course bridge entity
--
--8)	Course and Section
---	Each course can have multiple sections
---	Each section belongs to one specific course
---	Relationship: One-to-Many (Course to Section)
--
--9)	Professor and Section
---	A professor teaches one or more sections
---	Each section is taught by exactly one professor
---	Relationship: One-to-Many (Professor to Section)
--
--10)	Advisor and Student
---	An advisor can advise multiple students assigned to them. But not every student is required to have an advisor
---	Having an advisor is optional for a student
---	Relationship: One-to-Many (Advisor to Student), with the Advisor_ID as an optional foreign key in the Student table

--Lab09
--A.) What type of data does each line in the report represent?
--The displayed data represent a list of products, called “parts”, assumably from a retail store.
--B.) What attributes can you identify from the user view?
--PartNumber, PartDescription, PartQuantityOnHand ,
--DBS211_LAB9
--PartClass, PartWarehouseOnHand, PartPrice
--C.) What would be a suitable name for the UNF relation?
--Parts
--D.) Which attribute would be suitable as a primary key? PartNumber
--E.) Describe the UNF relation using DBDL:
--Parts [PK PartNumber, PartDescription, PartQuantityOnHand , (PartClass), PartWarehouseOnHand, PartPrice ]
--QUESTION 2
--For the following User View, determine the UNF and the 1NF and hand in this page to your instructor.
--Premiere Corporation Order Detail Report
--UNF: CorporationOrder [PK Order_num, Order_date, Cust_num, (Part_num, Part_desc, Num_order, Qty, Total)]
--1NF: CorporationOrder [PK Order_num, PK Part_num, Order_date, Cust_num, Part_desc, Num_order, Qty, Total]

--Lab10
--UNF:
--Order [PK OrderNo, Orderdate, CustNo, CustLname, (PartNo, PartDesc, QtyOrd, Price)]
--1NF:
--Order [PK OrderNo, Orderdate, CustNo, CustLname]
--Part_Order [FK OrderNo, PartNo, PartDesc, QtyOrd,QuotedPrice]
--2NF: (NO PARTIAL DEPENDENCY)
--Order [PK OrderNo, Orderdate, CustNo, CustLname] Part_Order [FK OrderNo, FK PartNo, QtyOrd]
--Part [ PK PartNo, PartDesc, QuotedPrice ]
--3NF: (NO TRANSITIVE DEPENDENCY)
--Customer [PK CustNo, CustLname]
--Order [PK OrderNo, Orderdate, FK CustNo] Part_Order [PK OrderNo, FK PartNo, QtyOrd] Part [ PK PartNo, PartDesc, QuotedPrice ]
--DBS211- LAB10
--UNF:
--Client [PK clientId, fullName, address, salutation, (movieName)]
--1NF:
--Client [PK clientId, fullName, address, salutation]
--Client_Movie [FK clientId, movieID, movieName]
--2NF:
--Client [PK clientId, fullName, address, salutation]
--Client_Movie [FK clientId, FK movieID]
--Movie [PK movieID, movieName]
--3NF:
--Client [PK clientId, FK fullName, address]
--Client_Movie [FK clientId, FK movieID]
--Movie [PK movieID, movieName]
--ClientSal[ PK fullName , salutation]

--Lab07
--#include <iostream> 
--#include <occi.h>
--
--using oracle::occi::Environment;
--using oracle::occi::Connection;
--using oracle::occi::Statement;
--using oracle::occi::ResultSet;
--using namespace oracle::occi;
--using namespace std;
--
--int main(void) {
--    // OCCI Variables
--    Environment* env = nullptr;
--    Connection* conn = nullptr;
--    // User Variables
--    string str;
--    string usr = "dbs211_241nbb11";
--    string pass = "21903207";
--    string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";
--
--    try {
--        env = Environment::createEnvironment(Environment::DEFAULT);
--        conn = env->createConnection(usr, pass, srv);
--        cout << "Connection is Successful!" << endl;
--        cout << endl;
--        
--        cout<< "Display details of all Employees who work in San Francisco:" << endl;
--        Statement* stmt1 = conn->createStatement(
--            "SELECT EMPLOYEENUMBER, FIRSTNAME, LASTNAME, PHONE, EXTENSION "
--            "FROM RETAILEMPLOYEES RE "
--            "JOIN RETAILOFFICES RO ON RE.OFFICECODE = RO.OFFICECODE "
--            "WHERE RO.CITY = 'San Francisco' "
--            "ORDER BY EMPLOYEENUMBER"
--        );
--        ResultSet* rs1 = stmt1->executeQuery();
--        while (rs1->next()) {
--            cout << rs1->getInt(1) << " " << rs1->getString(2) << " "
--                << rs1->getString(3) << " " << rs1->getString(4) << " "
--                << rs1->getString(5) << endl;
--        }
--        cout << endl;
--        conn->terminateStatement(stmt1);
--
--        cout << "Display details for all managers:" << endl;
--        Statement* stmt2 = conn->createStatement(
--            "SELECT DISTINCT MANAGER.EMPLOYEENUMBER, MANAGER.LASTNAME, "
--            "RO.PHONE, MANAGER.EXTENSION "
--            "FROM RETAILEMPLOYEES MANAGER "
--            "JOIN RETAILEMPLOYEES EMPLOYEE ON MANAGER.EMPLOYEENUMBER = EMPLOYEE.REPORTSTO "
--            "JOIN RETAILOFFICES RO ON MANAGER.OFFICECODE = RO.OFFICECODE"
--        );
--        ResultSet* rs2 = stmt2->executeQuery();
--        while (rs2->next()) {
--            cout << rs2->getInt(1) << " " << rs2->getString(2) << " "
--                << rs2->getString(3) << " " << rs2->getString(4) << endl;
--        }
--        conn->terminateStatement(stmt2);
--
--        // Terminate the connection and the environment
--        env->terminateConnection(conn);
--        Environment::terminateEnvironment(env);
--    }
--    catch (SQLException& sqlExcp) {
--        cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage() << endl;
--    }
--
--    return 0;
--}
