-- MS3
-- Abcedi Ilacas, Sarah Mathew and Wing Wong
-- Group 15
-- DBS211-NBB
-- 04-19-24

--Business Reports: 
--A single SQL file providing the scripting to create at least 4 VIEWS, 
--that provide a report on the data that support the business, or organization, in making informed business decisions. 
--Each report should have a paragraph writeup – in comment form, that explain the purpose of the report and 
--how the business will benefit from having the report.

SET AUTOCOMMIT ON;

/* Daily Sales Report by Store */
-- This view calculates the total sales per store per day. It is crucial for understanding the revenue performance
-- of each store location on a daily basis, allowing for timely adjustments in marketing and inventory management.
CREATE OR REPLACE VIEW DailySalesByStore AS
SELECT
  STOREID,
  DATEOFPURCHASE,
  SUM(PRICEOFEACH * QUANTITY) AS TotalSales
FROM PURCHASEHISTORY
GROUP BY STOREID, DATEOFPURCHASE
ORDER BY STOREID, DATEOFPURCHASE;

/* Daily Sales Report by Item */
-- This view shows daily sales figures by item. It helps identify which items are performing well or poorly,
-- providing valuable insights for inventory planning and promotional strategies.
CREATE OR REPLACE VIEW DailySalesByItem AS
SELECT
  ITEMID,
  DATEOFPURCHASE,
  SUM(PRICEOFEACH * QUANTITY) AS TotalSales
FROM PURCHASEHISTORY
GROUP BY ITEMID, DATEOFPURCHASE
ORDER BY ITEMID, DATEOFPURCHASE;

/* Employee Performance Report */
-- This view summarizes sales performance of each employee, including the number of transactions they handled
-- and the total sales they generated. It's used for evaluating employee performance, identifying training needs,
-- and rewarding top performers.
CREATE OR REPLACE VIEW EmployeePerformanceReport AS
SELECT
  EMPLOYEEID,
  COUNT(DISTINCT PURCHASEID) AS NumberOfSales,
  SUM(PRICEOFEACH * QUANTITY) AS TotalSales
FROM PURCHASEHISTORY
GROUP BY EMPLOYEEID
ORDER BY EMPLOYEEID;

/* Inventory Status Report by Store */
-- This view provides real time inventory levels for each item in each store. It is essential for managing stock levels,
-- ensuring availability of products, and planning restocking schedules to avoid overstocking or stock shortages.
CREATE OR REPLACE VIEW InventoryStatusByStore AS
SELECT
  STOREID,
  ITEMID,
  QUANTITY
FROM INVENTORYLEVELS
ORDER BY STOREID, ITEMID;

SELECT * FROM DailySalesByStore;
SELECT * FROM DailySalesByItem;
SELECT * FROM EmployeePerformanceReport;
SELECT * FROM InventoryStatusByStore;