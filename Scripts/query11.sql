WITH CTE_SALES AS( 
SELECT SUM(salesAmount) AS totalSales,
    strftime('%m', soldDate) AS soldMonth,
    strftime('%Y', soldDate) AS soldYear
FROM sales
GROUP BY soldYear, soldMonth
)

SELECT totalSales, soldMonth, soldYear,
  SUM(totalSales) OVER (
  PARTITION BY soldYear 
   ORDER BY soldYear, soldMonth) AS AnnualSales 
FROM CTE_SALES
ORDER BY soldYear, soldMonth;