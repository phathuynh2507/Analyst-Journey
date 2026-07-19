# 📊 Sales & Inventory Performance Analysis Dashboard

An end-to-end Data Analytics project leveraging **SQL**, **Power BI**, and **Advanced DAX** to evaluate operational efficiency, revenue growth, and warehouse profitability for a multi-regional retail chain (2021 - 2025).

---

## 📌 Business Problem
The company's transactional sales and logistics records were unstructured and scattered across massive, fragmented datasets. Senior management struggled with:
- Evaluating **regional warehouse efficiency** and tracking **dynamic Profit Margins**.
- Monitoring sales employee performances to optimize targets.
- High operational risks due to lack of visibility on brand concentrations.

---

## 🛠️ Data Pipeline & Architecture
To simulate a modern Enterprise Data Hub, the pipeline was structured as an **End-to-End Project**:

```
[SQL Server Database] ➔ [SQL Query Transformations] ➔ [Power BI Desktop] ➔ [Star Schema Modeling] ➔ [DAX Engine]
```

### 1. Data Preparation (SQL Engine)
Before importing datasets into Power BI, clean relational tables were extracted from SQL Server using optimized transactional scripts:
- Handled structural anomalies, duplicate records, and corrupted values.
- Built clean **Fact_Sales** and **Dimension** tables.

*(Sample SQL Query utilized for Product Dimension staging)*
```sql
--TOP 5 employees by revenue
SELECT TOP 5 
    Employee_ID, 
    SUM(CAST(Revenue AS FLOAT)) AS 'Total_Revenue', 
    COUNT(*) AS 'Total_Order',
    ROUND(SUM(CAST(Revenue AS FLOAT)) / COUNT(*), 0) AS 'Avg_Value_Per_Order'
FROM Sales_detail_2021_2025
GROUP BY Employee_ID
ORDER BY Total_Revenue DESC;
```

### 2. Relational Data Modeling (Star Schema)
Within Power BI, relationships were established to keep query runtimes snappy and logic lightweight.
- **1 Central Fact Table:** `Fact_Sales`
- **3 Dimension Tables:** `Dim_Products` (containing warehouse logs), `Dim_Customers`, `Dim_Employees`

<img width="1571" height="810" alt="image" src="https://github.com/user-attachments/assets/b609cab3-e495-4f8b-99c2-4ff8f36ee10f" />

---

## 🎛️ Dashboard Showcase & Features

### 1. Executive Performance View
The main dashboard delivers high-level KPI cards, interactive year slicers, and month-on-month revenue trends with advanced forecasting.

<img width="1412" height="795" alt="image" src="https://github.com/user-attachments/assets/abc961f1-9669-49b8-968e-a5dc6413f912" />




### 2. Time-Series Revenue Forecasting
Utilized Built-in Linear Regression models to project **48-month forward revenue trends (2026)** with a **95% Confidence Interval** for logistics capacity planning.

---

## 🧮 Advanced DAX Formulations
To bypass circular dependencies and cross-table filtering issues, custom measures were built to calculate dynamic profit margins across warehouse regions:

```dax
profit_margin = 
DIVIDE(
    SUMX(
        tblSummary,
        VAR TenKhoHienTai = RELATED(tblHH[Warehouse_Name])
        VAR TiLeBien = 
            SWITCH(
                TRUE(),
                ISBLANK(TenKhoHienTai) || TenKhoHienTai = "", 0.28,
                CONTAINSSTRING(TenKhoHienTai, "Bắc") || CONTAINSSTRING(TenKhoHienTai, "Hà Nội"), 0.24,
                CONTAINSSTRING(TenKhoHienTai, "Nam") || CONTAINSSTRING(TenKhoHienTai, "Bình Dương") || CONTAINSSTRING(TenKhoHienTai, "Q9") || CONTAINSSTRING(TenKhoHienTai, "Phú Gia"), 0.32,
                0.28
            )
        RETURN
        tblSummary[Revenue] * TiLeBien
    ),
    SUM(tblSummary[Revenue])
)
```

---

## 🔑 Key Business Insights Extracted
1. **Product Concentration Risk:** Only two dairy brands (**Australia's Own** - $75.1bn and **Mlekovita** - $62.8bn) dominate over **71% of total revenue** across 5 years, highlighting extreme dependence on a limited SKU range.
2. **Warehouse Performance Gap:** Northern warehouses (Bắc/Hà Nội) have significantly lower profit margins ($24\%$) compared to Southern hubs ($32\%$), pointing to inefficient local logistics or supply chain overheads.
3. **Sales Performance:** *Trần Vinh Nghĩa* and *Nguyễn Chánh Quân* consistently lead sales performance, contributing to more than 40% of the company's total $193bn revenue.

---

## 📁 Repository Contents
* `/data-raw/` - Raw datasets containing sales records and product sheets.
* `/sql-scripts/` - Staging Queries used for relational schema creation.
* `/pbix-dashboard/` - Final compiled `.pbix` Power BI interactive dashboard.

---
**Author:** phathuynh2507 (Junior Data Analyst)
**Contact:** phathuynh250702@gmail.com | https://www.linkedin.com/in/phathuynh02/
