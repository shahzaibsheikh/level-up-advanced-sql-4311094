
-- total number of cars sold by each employee

SELECT e.employeeId,e.firstName,e.lastName,count(*) AS totalcarssold, sls.soldDate,SUM(sls.salesAmount)AS TotalAmount
FROM employee e
INNER JOIN sales sls
  ON e.employeeId = sls.employeeId
GROUP BY e.employeeId,e.firstName, e.lastName, sls.soldDate
ORDER BY totalcarssold DESC;