
SELECT e.employeeId,
    e.firstName,
    e.lastName,
    sls.soldDate,
    MAX(sls.salesAmount)AS mostExpensive,
    MIN(sls.salesAmount)AS cheap
FROM sales sls
INNER JOIN employee e
  ON sls.employeeId = e.employeeId
WHERE sls.soldDate <= date('now','start of year')
GROUP BY e.employeeId
