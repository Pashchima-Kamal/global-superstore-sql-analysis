-- ======================================
-- File: 03_Data_Exploration.sql
-- Description:
-- This file contains exploratory analysis queries to understand
-- dataset structure, key metrics (sales, profit), and overall data distribution.
-- ======================================


#1 Total sales
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM global_superstore_clean;

#2 Total profit
SELECT ROUND(SUM(Profit), 2) AS net_profit
FROM global_superstore_clean;

#3 Total unique customers
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers
FROM global_superstore_clean;

#4 Total unique orders
SELECT COUNT(DISTINCT Order_ID) AS unique_orders
FROM global_superstore_clean;

#5 Total unique products
SELECT COUNT(DISTINCT Product_ID) AS unique_products
FROM global_superstore_clean;

#6 Unique Categories
SELECT DISTINCT Category
FROM global_superstore_clean;

#7 Top 5 Highest Sales Order
SELECT Order_ID, COUNT(Product_ID), ROUND(Sum(Sales), 2) as total_sales
FROM global_superstore_clean
GROUP BY Order_ID
ORDER BY Sum(Sales) DESC
LIMIT 5;

#8 Lowest Order Value Info
SELECT *
FROM global_superstore_clean
WHERE Sales = 0.44;

#9 Total countries
SELECT COUNT(DISTINCT Country) AS unique_countries
FROM global_superstore_clean;

#10 Unique Segments
SELECT DISTINCT Segment
FROM global_superstore_clean;

#11 Unique Market
SELECT DISTINCT Market
FROM global_superstore_clean;

#12 Unique Regions
SELECT DISTINCT Region
FROM global_superstore_clean;

#13 Avg, Min, Max Order Value
SELECT ROUND(AVG(q.Order_Value),2) as Average_Order_Value, MIN(q.Order_Value), MAX(q.Order_Value)
from (SELECT ROUND(SUM(Sales),2) AS Order_Value
FROM global_superstore_clean
GROUP BY Order_ID) q;

