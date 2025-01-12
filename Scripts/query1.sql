SELECT sql
FROM sqlite_schema
where name = "employee";

ON 
-- To Fetch employees and their managers--
SELECT e1.title, e1.firstName, e1.lastName, m1.title, m1.firstName, m1.lastName
FROM employee e1
INNER JOIN employee m1
ON e1.managerId = m1.employeeId;
