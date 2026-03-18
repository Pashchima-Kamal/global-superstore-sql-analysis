#Loading data

CREATE DATABASE global_superstore_db;
USE global_superstore_db;

CREATE TABLE global_superstore_raw (
    Row_ID VARCHAR(50),
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(50),
    Ship_Date VARCHAR(50),
    Ship_Mode VARCHAR(100),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(150),
    Segment VARCHAR(100),
    City VARCHAR(150),
    State VARCHAR(150),
    Country VARCHAR(150),
    Postal_Code VARCHAR(50),
    Market VARCHAR(100),
    Region VARCHAR(100),
    Product_ID VARCHAR(100),
    Category VARCHAR(100),
    Sub_Category VARCHAR(100),
    Product_Name TEXT,
    Sales VARCHAR(50),
    Quantity VARCHAR(50),
    Discount VARCHAR(50),
    Profit VARCHAR(50),
    Shipping_Cost VARCHAR(50),
    Order_Priority VARCHAR(50)
);
drop table global_superstore_gg;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'max_allowed_packet';
