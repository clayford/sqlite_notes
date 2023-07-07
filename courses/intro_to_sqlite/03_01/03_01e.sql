SELECT Company, COUNT(InvoiceID)
FROM Customer
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
WHERE Company IS NOT NULL
GROUP BY Company;

SELECT Company, COUNT(InvoiceID)
FROM Customer, Invoice
WHERE Company IS NOT NULL
GROUP BY Company;

-- don't run this! Cartesian product
SELECT Company, InvoiceId
FROM Customer, Invoice
WHERE Company IS NOT NULL
ORDER BY Company, InvoiceId;

INSERT INTO Customer
(CustomerId, FirstName, LastName, Company, Email)
VALUES (NULL, 'Brian', 'Jepson', 'LinkedIn', 'bjepson@linkedin.com');

SELECT Company, COUNT(InvoiceID)
FROM Customer
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
WHERE Company IS NOT NULL
GROUP BY Company;

SELECT Company, COUNT(InvoiceID)
FROM Customer
LEFT OUTER JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
WHERE Company IS NOT NULL
GROUP BY Company;

SELECT COALESCE(Company, 'Unknown'), COUNT(InvoiceID)
FROM (SELECT * FROM Customer WHERE Company IS NOT NULL) Customer
FULL OUTER JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Company;