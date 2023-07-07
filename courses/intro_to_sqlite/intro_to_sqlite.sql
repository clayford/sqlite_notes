-- Intro to SQLite examples

-- 01-01
SELECT * FROM Genre;

SELECT * FROM Customer Limit 10;

SELECT * FROM Invoice Limit 10;

-- 01-02

CREATE TABLE test_table (name STRING, id INT);

INSERT INTO test_table VALUES ('Eric Seablade', 100);

SELECT * FROM test_table;

SELECT * FROM genre WHERE name LIKE 'S%';

INSERT INTO genre VALUES (26, 'Spoken Word');

UPDATE Genre SET name = 'Sci-Fi' WHERE name = 'Science Fiction';

SELECT * FROM genre WHERE name LIKE 'S%';

-- 01-04
SELECT Total, BillingCountry FROM Invoice;

.mode csv
.header on
.output filename.csv 

SELECT * FROM Invoice;

.output stdout
.mode list
.shell filename.csv

-- 01-05
SELECT *
FROM Invoice
WHERE Total > 10
AND InvoiceDate BETWEEN '2024-01-01' AND '2024-03-31';

SELECT *
FROM Invoice
WHERE Total > 10
AND (InvoiceDate BETWEEN '2023-01-01' AND '2023-03-31' 
  OR InvoiceDate BETWEEN '2024-01-01' AND '2024-03-31');

SELECT * FROM Genre WHERE LOWER(Name) = 'rock';

SELECT * FROM Genre WHERE LOWER(Name) LIKE '%rock%';

-- 01-06
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

-- 02-01

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

-- 02-02

CREATE TABLE UniqueTest
(Name TEXT,
 Id INTEGER UNIQUE);

INSERT INTO UniqueTest VALUES('Eric Seablade', 100);

INSERT INTO UniqueTest VALUES('Mauve d''Orm-mul', 100);

INSERT INTO UniqueTest VALUES('Forestall Grimm', NULL);

INSERT INTO UniqueTest VALUES('Iolo', NULL);

SELECT NULL = NULL;

SELECT NULL = NULL IS NULL;

DROP TABLE UniqueTest;

CREATE TABLE UniqueTest
(Name TEXT NOT NULL,
 Id INTEGER NOT NULL UNIQUE);

INSERT INTO UniqueTest VALUES('Forestall Grimm', NULL);

CREATE TABLE Inventory
(PlayerId INTEGER,
 ItemId INTEGER,
 Quantity INTEGER
 CHECK (Quantity <= 10)
);

INSERT INTO Inventory VALUES(100, 1, 10);

INSERT INTO Inventory VALUES(100, 2, 20);

-- 02-03

CREATE TABLE RowIdDemo
(Name TEXT);

INSERT INTO RowIdDemo
VALUES
('Eric Seablade'),
('Mauve d''Orm-mul'),
('Forestall Grimm');

SELECT RowId, *
FROM RowIdDemo;

DELETE FROM RowIdDemo
WHERE Name = 'Mauve d''Orm-mul';

INSERT INTO RowIdDemo
VALUES ('Mauve d''Orm-mul');

SELECT RowId, *
FROM RowIdDemo;

CREATE TABLE Player
(Name TEXT NOT NULL,
 Id INTEGER PRIMARY KEY);

INSERT INTO Player
(Name)
VALUES
('Eric Seablade'),
('Mauve d''Orm-mul'),
('Forestall Grimm');

SELECT * FROM Player;

CREATE TABLE Inventory
(PlayerId INTEGER,
 ItemId INTEGER,
 Quantity INTEGER CHECK (Quantity <= 10),
 PRIMARY KEY (PlayerId, ItemId)
) STRICT;

UPDATE Inventory SET Quantity = Quantity + 2
WHERE PlayerId = 1
AND ItemId = 1;

SELECT * FROM Inventory;

INSERT INTO Inventory
VALUES
(1, 1, 3),
(2, 1, 1),
(3, 1, 2),
(1, 2, 1),
(2, 2, 1);

SELECT * FROM Inventory;

INSERT INTO Inventory VALUES(1, 1, 2);

UPDATE Inventory SET Quantity = Quantity + 2
WHERE PlayerId = 1
AND ItemId = 1;

SELECT * FROM Inventory;
CREATE TABLE Item
(Name TEXT NOT NULL,
 Id INTEGER PRIMARY KEY);

INSERT INTO Item
VALUES
('Iron Rations', 1), ('Leather Armor', 2);

SELECT Player.Name AS PlayerName,
       Item.Name AS ItemName,
       Quantity
FROM Inventory
JOIN Player ON Player.Id = Inventory.PlayerId
JOIN Item ON Item.Id = Inventory.ItemId;
INSERT INTO Inventory VALUES(1, 200, 20);
DROP TABLE Inventory;

CREATE TABLE Inventory
(PlayerId INTEGER,
 ItemId INTEGER,
 Quantity INTEGER CHECK (Quantity <= 10),
 PRIMARY KEY (PlayerId, ItemId),
 FOREIGN KEY (PlayerId) REFERENCES Player(Id),
 FOREIGN KEY (ItemId) REFERENCES Item(Id)
) STRICT;

INSERT INTO Inventory
VALUES
(1, 1, 5),
(2, 1, 1),
(3, 1, 2),
(1, 2, 1),
(2, 2, 1);

PRAGMA foreign_keys = ON;

INSERT INTO Inventory VALUES(1, 200, 2);

DELETE FROM Player WHERE Id = 1;

CREATE INDEX PlayerIdx ON Inventory(PlayerId);

CREATE INDEX ItemIdx ON Inventory(ItemId);

-- 02-04

CREATE TABLE Item
(Name TEXT NOT NULL,
 Id INTEGER PRIMARY KEY);

INSERT INTO Item
VALUES
('Iron Rations', NULL),
('Leather Armor', NULL);

CREATE TABLE Item2
(Name TEXT NOT NULL,
 Id INTEGER PRIMARY KEY);

INSERT INTO Item2
(Name, Id)
SELECT * FROM Item;

CREATE TABLE Item3
(Name TEXT NOT NULL,
 Id INTEGER PRIMARY KEY,
 Weight INTEGER NOT NULL);

INSERT INTO Item3
(Name, Id)
SELECT * FROM Item;

.mode csv

.import quests.csv quest

.header on

SELECT * FROM quest;

DROP TABLE quest;

CREATE TABLE quest
(Quest TEXT UNIQUE,
 XP INTEGER);

.import --skip 1 quests.csv quest

SELECT * FROM quest;

CREATE TABLE InventoryRedux
(PlayerId INTEGER,
 ItemId INTEGER,
 Quantity INTEGER,
 PRIMARY KEY (PlayerId, ItemId)
);

INSERT INTO InventoryRedux
VALUES
(1, 1, 5);

INSERT INTO InventoryRedux VALUES(1, 1, 2)
  ON CONFLICT(PlayerId, ItemId) DO
    UPDATE SET Quantity=Quantity + excluded.Quantity;

SELECT * FROM InventoryRedux;
