SELECT * FROM Invoice;

SELECT * FROM Invoice LIMIT 10;

SELECT Total, BillingCountry FROM Invoice;

.mode csv

.header on

.output filename.csv 

SELECT * FROM Invoice;

.output stdout

.mode list

.shell filename.csv

SELECT * FROM Invoice;