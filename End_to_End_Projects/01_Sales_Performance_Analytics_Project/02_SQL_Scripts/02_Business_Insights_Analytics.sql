--TOP 5 employees by revenue
SELECT TOP 5 
    Employee_ID, 
    SUM(CAST(Revenue AS FLOAT)) AS 'Total_Revenue', 
    COUNT(*) AS 'Total_Order',
    ROUND(SUM(CAST(Revenue AS FLOAT)) / COUNT(*), 0) AS 'Avg_Value_Per_Order'
FROM Sales_detail_2021_2025
GROUP BY Employee_ID
ORDER BY Total_Revenue DESC;

--Growth Year over Year
SELECT Year, ROUND(SUM(CAST(Revenue AS FLOAT)) / 1000000000, 2) AS 'Total_Revenue_Billions', COUNT(*) AS 'Total_Order'
FROM Sales_detail_2021_2025
GROUP BY YEAR
ORDER BY YEAR ASC;

--Top 5 low/high revenue by product
WITH 
Ascending AS (
    SELECT TOP 5 
        'Low_Revenue' AS Product_Type,
        Product_ID, 
        SUM(CAST(Revenue AS FLOAT)) AS Total_Revenue
    FROM Sales_detail_2021_2025
    WHERE CAST(Revenue AS FLOAT) > 0
    GROUP BY Product_ID
    ORDER BY Total_Revenue ASC
),
Descending AS (
    SELECT TOP 5 
        'High_Revenue' AS Product_Type,
        Product_ID, 
        SUM(CAST(Revenue AS FLOAT)) AS Total_Revenue
    FROM Sales_detail_2021_2025
    WHERE CAST(Revenue AS FLOAT) > 0
    GROUP BY Product_ID
    ORDER BY Total_Revenue DESC
)
SELECT * FROM Ascending
UNION ALL
SELECT * FROM Descending;