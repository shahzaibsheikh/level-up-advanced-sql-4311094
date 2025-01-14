
SELECT e.firstName, e.lastName, ms.model, 
       count(ms.model) AS noOfCarSold,
       rank() OVER (PARTITION BY sls.employeeId
                     ORDER BY count(ms.model) DESC )AS RANK
FROM employee e 
INNER JOIN sales sls
  ON e.employeeId = sls.employeeId
INNER JOIN inventory inv 
 ON sls.inventoryId = inv.inventoryId
INNER JOIN model ms
 ON inv.modelId = ms.modelId
GROUP BY ms.model,e.firstName, e.lastName;
