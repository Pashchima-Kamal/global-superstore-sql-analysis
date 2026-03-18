-- ======================================
-- File: 01_Data_Cleaning.sql
-- Description:
-- This file contains all data cleaning steps including column renaming, data type handling,
-- and creation of the clean analysis table used for further analysis.
-- ======================================

#0
DESCRIBE global_superstore_gg;

#1
SELECT COUNT(*) FROM global_superstore_gg;

#2
SELECT * FROM global_superstore_gg LIMIT 20;

#3
ALTER TABLE global_superstore_gg CHANGE `Row ID` Row_ID INT;
ALTER TABLE global_superstore_gg CHANGE `Order ID` Order_ID VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Order Date` Order_Date VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Ship Date` Ship_Date VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Ship Mode` Ship_Mode VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Customer ID` Customer_ID VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Customer Name` Customer_Name VARCHAR(150);
ALTER TABLE global_superstore_gg CHANGE `Postal Code` Postal_Code VARCHAR(20);
ALTER TABLE global_superstore_gg CHANGE `Product ID` Product_ID VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Sub-Category` Sub_Category VARCHAR(50);
ALTER TABLE global_superstore_gg CHANGE `Product Name` Product_Name TEXT;
ALTER TABLE global_superstore_gg CHANGE `Shipping Cost` Shipping_Cost DECIMAL(10,2);
ALTER TABLE global_superstore_gg CHANGE `Order Priority` Order_Priority VARCHAR(20);

#Creating new clean table
CREATE TABLE global_superstore_clean AS
SELECT
    Row_ID,
    Order_ID,
    STR_TO_DATE(Order_Date, '%d-%m-%Y') AS Order_Date_Clean,
    STR_TO_DATE(Ship_Date, '%d-%m-%Y') AS Ship_Date_Clean,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    City,
    State,
    Country,
    Postal_Code,
    Market,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Discount,
    Profit,
    Shipping_Cost,
    Order_Priority
FROM global_superstore_gg;