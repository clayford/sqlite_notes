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

