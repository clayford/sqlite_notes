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

