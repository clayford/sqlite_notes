SELECT ROUND(1.2345678, 3);

SELECT INSTR(BillingAddress, ' ') FROM Invoice LIMIT 25;

SELECT SUBSTR(BillingAddress, 0, INSTR(BillingAddress, ' '))
FROM Invoice LIMIT 25;

SELECT FORMAT('$%f', SUM(Total)) FROM Invoice;

SELECT FORMAT('$%.2f', SUM(Total)) FROM Invoice;

SELECT InvoiceDate, strftime('%Y-%m-%d', InvoiceDate)
FROM Invoice LIMIT 10;
