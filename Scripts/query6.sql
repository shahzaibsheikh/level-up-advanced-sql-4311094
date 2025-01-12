SELECT e.employeeId,
    e.firstName,
    e.lastName,
    count(sls.salesId)AS salesthisyear,
    sls.soldDate
FROM sales sls
INNER JOIN employee e
  ON sls.employeeId = e.employeeId
WHERE sls.soldDate <= date('now','start of year')
GROUP BY e.employeeId
HAVING salesthisyear > 5
ORDER BY salesthisyear DESC;