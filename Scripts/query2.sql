SELECT sql
FROM sqlite_schema
where name = "sales";

ON
-- get all salesperson who have zero sales --
SELECT emp.title, emp.firstName, emp.lastName, sl.salesAmount
FROM employee emp
LEFT JOIN sales sl 
ON sl.employeeId = emp.employeeId
WHERE emp.title = 'Sales Person'
AND sl.salesId IS NULL;
