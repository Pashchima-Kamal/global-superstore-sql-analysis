# Global Superstore SQL Analysis Summary


## 1. Objective
The objective of this project is to analyze global retail sales data to understand sales and profit trends, customer behavior, product performance, and profitability drivers using SQL.


---


## 2. Dataset Overview
- 51,290 transaction rows
- Time period: 2011–2014
- 1590 unique customers
- 25035 orders
- Operations across multiple countries and regions
- Product categories include Furniture, Office Supplies, and Technology


---


## 3. Data Preparation
The following steps were performed:


- Data imported into MySQL using DBeaver
- Column names standardized to snake_case
- Clean analysis table created
- Order and ship dates converted to DATE format
- Data validation checks performed (nulls, ranges, duplicates)
- Customer segmentation created using NTILE() window function


---


## 4. Exploratory Analysis
Initial exploration included:


- Total sales and total profit
- Number of unique customers, orders, products, categories, and segments
- Geographic spread of data
- Identification of basic trends in sales and profit


---


## 5. Business Analysis


### Sales Trends
- Sales increased over time with noticeable seasonal spikes (Around Q4 every year)


### Profit Trends
- Profit does not always follow sales trends
- High sales periods sometimes have lower margins


### Customer Analysis
- A small group of customers contributes a large portion of sales
- Highest number of orders falls in the 40+ range per customer over the four-year period


### Product Analysis
- Staples is the most sold product (876 units), followed by Cardinal Index Tab, Clear (337 units)
- Technology category generates the highest sales
- Furniture category has significantly lower profit margins compared to the other two categories
- Some sub-categories consistently generate low or negative profit
- Overall, the Table sub-category generates significant losses


### Geographic Analysis
- Certain countries contribute significantly more sales than others including US, and Australia
- Most profitable countries are US, China, and India
- APAC market contributes the highest sales


### Shipping Analysis
- Average shipping time is stable across orders
- Faster shipping modes are used less frequently


### Discount Analysis
- Higher discounts are associated with lower profitability


---


## 6. Customer Segmentation Analysis


Customers were segmented into three groups based on lifetime sales using NTILE():


- High Value (Top 20%)
- Mid Value (Next 30%)
- Low Value (Bottom 50%)


Key Findings


- High-value customers contribute a large share of total sales
- High-value customers have higher average order values
- Product category and shipping mode preference is consistent across all segments
- Low-value customers are more discount-sensitive
- High-value customers show stronger repeat purchasing behavior
- Certain regions (central, and south) have a higher concentration of high-value customers


---


## 7. Business Recommendations


#### High-value customers = top 20% driving most revenue
Recommendation: Implement targeted retention strategies for high-value customers, such as loyalty programs, exclusive offers, and priority customer service. Even a small drop in retention within this segment could significantly impact total revenue.


### Mid-value customers = growth opportunity
- Recommendation: Design targeted upsell and cross-sell campaigns for mid-value customers to convert them into high-value customers. This could include personalized product recommendations and bundled offers.


### Higher discounts = lower profit
- Recommendation: Introduce controlled discounting strategies by setting upper discount thresholds for low-margin products. Discounts should be selectively applied based on product category and customer segment rather than uniformly.


### Shipping modes vary in usage and efficiency
- Recommendation: Optimize shipping strategies by promoting cost-efficient shipping modes while ensuring service levels for high-value customers. Consider offering faster shipping selectively to premium customers.


### High-value customers have higher order value
- Recommendation: Increase average order value through bundling strategies, minimum order incentives, and cross-selling techniques, especially for mid-value customers.



---



## 8. Conclusion


This project demonstrates how SQL can be used to transform raw transactional data into actionable business insights, including customer segmentation and profitability analysis.
