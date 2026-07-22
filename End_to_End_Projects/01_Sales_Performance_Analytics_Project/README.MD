\# End-to-End Sales Performance Analytics (2021-2025)



\## 📌 Project Overview

An enterprise-grade data analytics project covering the entire data pipeline—from consolidating 5 years of raw, fragmented Excel data to building an optimized SQL analytical engine and deploying an interactive Power BI executive dashboard.



\---



\## 📁 Repository Structure

\* \*\*`01\_Data\_Ingestion/`\*\*: Contains 5 raw, annual sales datasets (`.xlsx`) from 2021 to 2025.

\* \*\*`02\_SQL\_Scripts/`\*\*: Production-grade SQL queries including advanced metrics extraction, CTEs, and query optimizations.

\* \*\*`03\_Final\_Dataset/`\*\*: Cleaned, consolidated, and integrated master dataset (`.csv`) ready for BI modeling.

\* \*\*`04\_PowerBI\_Dashboard/`\*\*: Core `.pbix` file featuring dynamic cross-filtering and executive-level insight sections.



\---



\## 🛠️ Key Data Pipeline Milestones



\### 1. Extract \& Transform (ETL)

\* Consolidated \*\*5 annual Excel workbooks\*\* into a unified 5-year relational structure.

\* Managed data type constraints by migrating messy raw text inputs via strategic `nvarchar(50)` staging fields, standardizing with dynamic type casting (`CAST(Revenue AS FLOAT)`).



\### 2. SQL Analytics Engine \& Data Modeling

\* Engineered an optimized \*\*Star Schema Data Model\*\* (`tblSummary` central fact linked to `tblCustomers`, `tblEmployees`, and `tblProduct\_Details` dimension tables) to ensure zero circular loops and high query speeds.

\* Implemented \*\*Common Table Expressions (CTEs)\*\* combined with \*\*UNION ALL\*\* to isolate top-performing and underperforming SKUs in a single optimized query execution.



\### 3. Business Visualizations \& Executive Insights

\* Developed an executive-facing interactive dashboard capturing \*\*193bn Total Revenue\*\*, \*\*9K Total Orders\*\*, and a \*\*31.38% Average Profit Margin\*\*.

\* Highlighted critical brand concentration risks where 2 core brands dominate over 71% of total revenue.



\---

