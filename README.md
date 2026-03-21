# Global Superstore SQL Analysis


## Project Overview
This project analyzes global retail sales data using SQL to uncover insights on sales trends, customer behavior, product performance, profitability, and customer segmentation.


## Dataset
- Kaggle: [Global Superstore dataset](https://www.kaggle.com/datasets/apoorvaappz/global-super-store-dataset/data)
- ~51,000 rows
- Time period: 2011–2014
- 1590 unique customers


## Tools Used
- MySQL
- MySQL Workbench
- DBeaver (for data import)
- Microsoft Excel


## Project Workflow
1. Data import into MySQL
2. Data cleaning and column renaming
3. Data validation checks
4. Exploratory analysis
5. Core business analysis
6. Customer segmentation using NTILE()


## Repository Structure
```
global-superstore-sql-analysis/
│
├── sql/
│   ├── 01_Data_Cleaning.sql
│   ├── 02_Data_Checks.sql
│   ├── 03_Data_Exploration.sql
│   ├── 04_Analysis_Queries.sql
│   └── 06_customer_segmentation.sql
│
├── docs/
│   └── analysis_summary.md
│
├── images/
│
└── README.md
```

## Key Insights
- Sales show consistent growth with seasonal peaks
- Technology category generates the highest revenue
- Consumer Segment generates the highest sales
- Staples is the most sold product
- High-value customers contribute a significant share of total sales
- Higher discounts are associated with lower profitability
- Certain regions drive the majority of revenue


## Full Analysis
Detailed findings are available in: docs/analysis_summary.md
