-- ======================================
-- File: 05_Customer_Segment.sql
-- Description:
-- This file contains customer segmentation logic using NTILE(),
-- creation of the segmented view, and analysis of customer behavior
-- across high, mid, and low value segments.
-- ======================================

#Creating Customer Segment View
CREATE VIEW global_superstore_segmented AS
SELECT
    g.*,
    CASE
        WHEN c.customer_decile <= 2 THEN 'High Value'
        WHEN c.customer_decile <= 5 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS Customer_Value_Segment
FROM global_superstore_clean g
JOIN (
    SELECT
        Customer_ID,
        lifetime_sales,
        NTILE(10) OVER (ORDER BY lifetime_sales DESC) AS customer_decile
    FROM (
        SELECT
            Customer_ID,
            SUM(Sales) AS lifetime_sales
        FROM global_superstore_clean
        GROUP BY Customer_ID
    ) t
) c
ON g.Customer_ID = c.Customer_ID;

DESCRIBE global_superstore_segmented;
DROP VIEW global_superstore_segmented;


##Customer Segment Analysis

#Number of Customers in each segment
SELECT Customer_value_segment, COUNT(DISTINCT Customer_id)
FROM Global_Superstore_segmented
GROUP BY Customer_value_segment;


#Revenue Contribution by Segment
#How much revenue comes from each customer segment?
SELECT Customer_Value_Segment, ROUND(SUM(Sales),2) AS total_sales, COUNT(DISTINCT Customer_ID) AS customers
FROM Global_Superstore_segmented
GROUP BY Customer_Value_Segment
ORDER BY total_sales DESC;


#Average Order Value by Segment
#Do high-value customers place larger orders?
SELECT
Customer_Value_Segment,
ROUND(AVG(Order_Value),2) AS avg_order_value
FROM (
    SELECT
        Order_ID,
        Customer_Value_Segment,
        SUM(Sales) AS Order_Value
    FROM global_superstore_segmented
    GROUP BY Order_ID, Customer_Value_Segment
) q
GROUP BY Customer_Value_Segment
ORDER BY avg_order_value DESC;


#Profitability by Segment
#Which segment contributes the most profit?
SELECT Customer_Value_Segment, ROUND(SUM(Profit),2) AS total_profit, ROUND(SUM(Profit)/SUM(Sales),3) AS profit_margin
FROM global_superstore_segmented
GROUP BY Customer_Value_Segment
ORDER BY total_profit DESC;


#Product Category Preference
#Do segments buy different types of products?
SELECT Customer_Value_Segment, Category, ROUND(SUM(Sales),2) AS segment_sales
FROM global_superstore_segmented
GROUP BY Customer_Value_Segment, Category
ORDER BY Customer_Value_Segment, segment_sales DESC;


#Discount Sensitivity
#Do low-value customers depend more on discounts?
SELECT Customer_Value_Segment, ROUND(AVG(Discount),2) AS avg_discount
FROM global_superstore_segmented
GROUP BY Customer_Value_Segment
ORDER BY avg_discount DESC;


#Shipping Preferences
#Do high-value customers prefer faster shipping?
SELECT Customer_Value_Segment, Ship_Mode, COUNT(*) AS orders
FROM global_superstore_segmented
GROUP BY Customer_Value_Segment, Ship_Mode
ORDER BY Customer_Value_Segment, orders DESC;


#Geographic Distribution of High-Value Customers
#Where are the most valuable customers located?
SELECT Region, COUNT(DISTINCT Customer_ID) AS high_value_customers
FROM global_superstore_segmented
WHERE Customer_Value_Segment = 'High Value'
GROUP BY Region
ORDER BY high_value_customers DESC;


#Customer Retention Proxy
#Which segments place repeat orders?
SELECT Customer_Value_Segment, AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT
        Customer_ID,
        Customer_Value_Segment,
        COUNT(DISTINCT Order_ID) AS order_count
    FROM global_superstore_segmented
    GROUP BY Customer_ID, Customer_Value_Segment
) t
GROUP BY Customer_Value_Segment;