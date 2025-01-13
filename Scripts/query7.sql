
WITH salesperyear AS (
    SELECT 
        sum(salesAmount) AS totalSales,
        strftime('%Y', soldDate) AS salesYear
    FROM sales
    WHERE strftime('%Y', soldDate) <= strftime('%Y', 'now')
    GROUP BY strftime('%Y', soldDate)
)
SELECT * FROM salesperyear;