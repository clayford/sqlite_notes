CREATE TEMPORARY TABLE Invoice2
AS SELECT * FROM Invoice;

UPDATE Invoice2
SET BillingCountry = 'US'
WHERE BillingCountry = 'USA';

UPDATE Invoice2
SET BillingAddress = 'One Apple Park Way'
WHERE CustomerId = 19;

SELECT *
FROM Invoice2
WHERE CustomerId = 19;
UPDATE Genre SET GenreId=100;

ALTER TABLE Invoice2
RENAME Total TO InvoiceTotal;

ALTER TABLE Genre
DROP COLUMN GenreId;
DROP TABLE IF EXISTS Player;

CREATE TABLE Player
(Name TEXT);

INSERT INTO Player
VALUES ('Eric Seablade');

ALTER TABLE Player
ADD Id PRIMARY KEY;

ALTER TABLE Player
ADD HitPoints NOT NULL;

ALTER TABLE Player 
ADD HitPoints NOT NULL DEFAULT 20;

ALTER TABLE Player
RENAME TO OldPlayer;

CREATE TABLE Player
(Name TEXT,
 HitPoints INTEGER,
 Id INTEGER PRIMARY KEY);

INSERT INTO Player
(Name, HitPoints)
SELECT Name, HitPoints FROM OldPlayer;

DROP TABLE OldPlayer;

SELECT * FROM Player;