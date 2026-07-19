# SQL Scripts - Data Cleaning & Business Analytics

This folder contains the production-grade SQL scripts used to process, clean, and analyze 5 years of sales data (2021-2025) before feeding it into Power BI.

## 🛠️ Key Technical Implementations
* **Data Staging Strategy:** Kept raw data as `nvarchar(50)` during the initial import wizard to prevent system crashes caused by hidden white spaces or blank fields from promotional orders.
* **Dynamic Type Casting:** Applied `CAST(Revenue AS FLOAT)` directly inside aggregation functions to handle complex calculations on raw text fields.
* **Advanced Query Optimization:** Utilized **Common Table Expressions (CTEs)** combined with **UNION ALL** to isolate and merge top-performing and underperforming products into a single optimized dataset, avoiding heavy nested subqueries.
* **Data Mindset & Sanity Check:** Implemented deep-dive logic checks (e.g., analyzing `Total_Orders` vs `Total_Revenue`) to accurately differentiate between low-performing employees and marketing staff processing 0-VND promotional items.

## 📁 Files in this Directory
1. `01_Database_Setup_Staging.sql`: Script for initial staging table inspections.
2. `02_Business_Insights_Analytics.sql`: Advanced scripts for CTEs, Union All, and core business metric extractions.