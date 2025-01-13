WITH sfe AS (
    SELECT employeeId,
           salesAmount,
           strftime('%Y', soldDate) AS soldYear,
           strftime('%m', soldDate) AS soldMonth
    FROM sales
)

SELECT sfe.employeeId,
       SUM(sfe.salesAmount) AS totalSales,
       sfe.soldYear,
       sfe.soldMonth,
       e.firstName,
       e.lastName
FROM sfe
INNER JOIN employee e
ON sfe.employeeId = e.employeeId
WHERE sfe.soldYear = '2021'
GROUP BY sfe.employeeId, sfe.soldYear, sfe.soldMonth;
