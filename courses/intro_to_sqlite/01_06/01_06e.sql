.header on

SELECT SUM(Total) AS OverallTotal
FROM Invoice;

SELECT InvoiceDate, SUM(Total) AS DailyTotal
FROM Invoice
GROUP BY InvoiceDate;

SELECT InvoiceDate, SUM(Total) AS DailyTotal
FROM Invoice
GROUP BY InvoiceDate
ORDER BY InvoiceDate;

SELECT InvoiceDate, SUM(Total) AS DailyTotal
FROM Invoice
GROUP BY InvoiceDate
ORDER BY SUM(Total) DESC;

SELECT InvoiceDate, SUM(Total) AS DailyTotal
FROM Invoice
GROUP BY InvoiceDate
HAVING SUM(Total) > 10
ORDER BY SUM(Total) DESC;

SELECT InvoiceDate,
       CustomerId,
       SUM(Total) AS DailyTotal,
       COUNT(InvoiceId) AS InvoiceCount
FROM Invoice
GROUP BY InvoiceDate, CustomerId;