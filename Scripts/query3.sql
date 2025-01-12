SELECT sql
FROM sqlite_schema
where name = "customer";

SELECT sql
FROM sqlite_schema
where name = "sales"

GO 
-- customer with sales--

SELECT c.customerId as CustomersId, c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate,s.customerId as SalesCustomerID
FROM customer c
INNER JOIN sales s
ON c.customerId = s.customerId
UNION 
-- UNION customer with no sales 
SELECT c.customerId as CustomersId, c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate,s.customerId as SalesCustomerID
FROM customer c
left JOIN sales s
ON c.customerId = s.customerId
WHERE s.salesId IS NULL
UNION 
-- UNION SALES WITH MISSING CUSTOMER DATA
SELECT c.customerId as CustomersId, c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate,s.customerId as SalesCustomerID
FROM sales s
left JOIN customer c
ON c.customerId = s.customerId
WHERE c.customerId IS NULL;
