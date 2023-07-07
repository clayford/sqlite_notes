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
