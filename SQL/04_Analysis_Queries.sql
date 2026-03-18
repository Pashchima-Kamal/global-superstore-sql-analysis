-- ======================================
-- File: 04_Analysis_Queries.sql
-- Description:
-- This file contains business analysis queries including
-- sales trends, profit trends, customer analysis, product performance,
-- geographic analysis, and shipping insights.
-- ======================================



#Sales Trend Over Time
#How have sales changed over time? Are there seasonal or growth trends?
SELECT DATE_FORMAT(Order_Date_Clean, '%Y-%m') AS month, ROUND(SUM(Sales), 2) AS monthly_sales
FROM global_superstore_clean
GROUP BY month
ORDER BY month;

SELECT QUARTER(Order_Date_Clean) AS Quarter, YEAR (Order_Date_Clean) AS Year, ROUND(SUM(Sales), 2) AS quarterly_sales
FROM global_superstore_clean
GROUP BY year, quarter
ORDER BY year, quarter;


#Profit Trend Over Time
#Has profit followed the same trend as sales?
SELECT DATE_FORMAT(Order_Date_Clean, '%Y-%m') AS month, ROUND(SUM(Profit), 2) AS monthly_profit
FROM global_superstore_clean
GROUP BY month
ORDER BY month;

SELECT QUARTER(Order_Date_Clean) AS Quarter, YEAR (Order_Date_Clean) AS Year, ROUND(SUM(Profit), 2) AS quarterly_profit
FROM global_superstore_clean
GROUP BY year, quarter
ORDER BY year, quarter;


#Top Customers by Sales
#Which customers generate the most sales?
SELECT Customer_Name, ROUND(SUM(Sales), 2) AS total_sales, Min(Order_Date_Clean) as first_order, Max(Order_Date_Clean) as last_order
FROM global_superstore_clean
GROUP BY Customer_Name
ORDER BY total_sales DESC
LIMIT 10;


#Customers with Most Orders
#Which customers order most frequently?
SELECT Customer_Name, COUNT(DISTINCT Order_ID) AS total_orders
FROM global_superstore_clean
GROUP BY Customer_Name
ORDER BY total_orders DESC
LIMIT 10;


#Sales by Segment
#Which customer segment contributes the most sales and profit?
SELECT Segment, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Segment
ORDER BY total_sales DESC;

#Category Performance
#Which categories drive the most sales and profit?
SELECT Category, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Category
ORDER BY total_sales DESC;


#Sub-Category Performance
#Which sub-categories are strongest and weakest?
SELECT Category, Sub_Category, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Category, Sub_Category
ORDER BY total_sales DESC;


#Most Sold Products
#Which products sell the most units?
SELECT Product_Name, SUM(Quantity) AS total_units_sold
FROM global_superstore_clean
GROUP BY Product_Name
ORDER BY total_units_sold DESC
LIMIT 5;

SELECT Product_name, Count(Product_name) AS Number_Orders
FROM global_superstore_clean
GROUP BY Product_name
ORDER BY number_orders DESC
LIMIT 5;


#Sales/Profit by Country
#Which countries contribute the most sales?
SELECT Country, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Country
ORDER BY total_sales DESC
LIMIT 15;

#Which countries are most profitable?
SELECT Country, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Country
ORDER BY total_profit DESC
LIMIT 15;


#Sales by Region
#Which regions perform best?
SELECT Region, ROUND(SUM(Sales), 2) AS total_sales, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Region
ORDER BY total_sales DESC;


#Sales by Market
#Which markets drive global performance?
SELECT Market, ROUND(SUM(Sales),2) as total_sales, ROUND(SUM(Profit),2) as total_profit
FROM global_superstore_clean
GROUP BY Market
ORDER BY total_Sales DESC;


#Average Shipping Time
#How long does it take on average to ship an order?
SELECT ROUND(AVG(datediff(Ship_Date_Clean, Order_Date_Clean))) as Average_Shipping_Time
FROM global_superstore_clean;


#Shipping Time by Ship Mode
#Which shipping modes are fastest and slowest?
SELECT Ship_Mode, ROUND(AVG(datediff(Ship_Date_Clean, Order_Date_Clean))) as Average_Shipping_Time
FROM global_superstore_clean
GROUP BY Ship_Mode
ORDER BY Average_Shipping_Time;


#Discount vs Profitability
#How does discounting affect average profit?
SELECT Discount, ROUND(AVG(Profit),2) as Profit, COUNT(*) as Order_Count
FROM global_superstore_clean
GROUP BY Discount
Order BY Discount DESC;


SELECT
Discount,
Profit
FROM global_superstore_clean;


#Profit Margin by Category
#Which categories have the strongest margins?
SELECT Category, ROUND((SUM(Profit)*100) / SUM(Sales), 4) AS profit_margin
FROM global_superstore_gg
GROUP BY Category
ORDER BY profit_margin DESC;


#Loss-making products
SELECT Product_Name, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Product_Name
HAVING total_profit < 0
ORDER BY total_profit
LIMIT 20;


#Loss-making sub-categories
SELECT Sub_Category, ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore_clean
GROUP BY Sub_Category
HAVING total_profit < 0
ORDER BY total_profit;




