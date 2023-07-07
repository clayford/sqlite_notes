.tables

SELECT * FROM Customer Limit 10;

.header on

SELECT * FROM Invoice Limit 10;

CREATE TABLE test_table (name STRING, id INT);

INSERT INTO test_table VALUES ('Eric Seablade', 100);

SELECT * FROM test_table;

SELECT * FROM genre WHERE name LIKE 'S%';

INSERT INTO genre VALUES (26, 'Spoken Word');

UPDATE Genre SET name = 'Sci-Fi' WHERE name = 'Science Fiction';

SELECT * FROM genre WHERE name LIKE 'S%';