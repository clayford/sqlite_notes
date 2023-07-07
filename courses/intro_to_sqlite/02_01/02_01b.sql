
CREATE TABLE TypeTest
(Name TEXT,
 Id INTEGER);

INSERT INTO TypeTest
VALUES (100, 'hello');

SELECT * FROM TypeTest;
CREATE TABLE TypeTestStrict
(Name TEXT,
 Id INTEGER) STRICT;

INSERT INTO TypeTestStrict
VALUES (100, 'hello');

.schema TypeTest

CREATE TABLE TypeTest
(Name TEXT,
 Id INTEGER);

CREATE TABLE IF NOT EXISTS TypeTest
(Name TEXT,
 Id INTEGER,
 City TEXT);

.schema TypeTest

CREATE TABLE NewTypeTest
AS
SELECT Name,
       Id,
       NULL AS City
FROM TypeTest;
DROP TABLE TypeTest;

DROP TABLE TypeTestStrict;

DROP TABLE NewTypeTest;
