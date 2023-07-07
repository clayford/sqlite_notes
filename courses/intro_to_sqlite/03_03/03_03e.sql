SELECT COUNT(*) FROM Invoice;

SELECT COUNT(BillingPostalCode) FROM Invoice;

SELECT COUNT(DISTINCT BillingPostalCode) FROM Invoice;

SELECT Country,
       COUNT(DISTINCT CustomerId) AS num
FROM Customer
GROUP BY Country;

SELECT AVG(num)
FROM (SELECT Country,
             COUNT(DISTINCT CustomerId) AS num
      FROM Customer
      GROUP BY Country
);

SELECT AVG(num) AS avg_num,
       MIN(num) AS min_num,
       MAX(num) AS max_num
FROM (SELECT Country,
             COUNT(DISTINCT CustomerId) AS num
      FROM Customer
      GROUP BY Country
);

SELECT Country,
       GROUP_CONCAT(DISTINCT State) AS States
FROM Customer
GROUP BY Country;
