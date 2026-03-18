-- ======================================
-- File: 02_Data_checks.sql
-- Description:
-- This file includes data validation checks such as row counts,
-- null value checks, duplicate checks, and basic sanity checks on numeric fields.
-- ======================================


USE global_superstore_db;

#0
DESCRIBE global_superstore_clean;

#1
SELECT COUNT(*) FROM global_superstore_clean;

SELECT *
FROM global_superstore_clean
LIMIT 10;

#2
SELECT MIN(Order_Date_Clean), MAX(Order_Date_Clean), MIN(Ship_Date_Clean), MAX(Ship_Date_Clean)
FROM global_superstore_clean;

##Checking for Nulls
SELECT COUNT(*)
FROM global_superstore_clean
WHERE customer_id is null or Customer_ID = ''; #o/p: 0

SELECT COUNT(*)
FROM global_superstore_clean
WHERE postal_code is null or postal_code = ''; #o/p: 41296

SELECT COUNT(*)
FROM global_superstore_clean
WHERE Product_ID IS NULL OR Product_ID = ''; #o/p: 0

SELECT COUNT(*)
FROM global_superstore_clean
WHERE Product_name IS NULL OR Product_name = ''; #o/p: 0


#Checking for loss
SELECT COUNT(*) AS loss_making_rows
FROM global_superstore_clean
WHERE Profit < 0; #o/p: 12540


#Numeric sanity check
SELECT MIN(Sales) AS min_sales, MAX(Sales) AS max_sales, MIN(Profit) AS min_profit,
MAX(Profit) AS max_profit, MIN(Discount) AS min_discount,MAX(Discount) AS max_discount
FROM global_superstore_clean;
USE global_superstore_db;
