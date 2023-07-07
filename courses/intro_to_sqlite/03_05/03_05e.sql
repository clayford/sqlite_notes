
SELECT Name
FROM Track
WHERE TrackId IN (
  SELECT TrackId
  FROM InvoiceLine
);

SELECT DISTINCT t.Name
FROM Track t
JOIN InvoiceLine l
ON l.TrackId = t.TrackId;

SELECT Name
FROM Track
WHERE TrackId NOT IN (
  SELECT TrackId
  FROM InvoiceLine
);

SELECT t1.AlbumId,
       t1.Name,
       t1.Milliseconds
FROM Track t1
WHERE t1.Milliseconds = (
  SELECT MAX(t2.Milliseconds)
  FROM Track t2
  WHERE t2.AlbumId = t1.AlbumId
);

WITH max_lengths AS (
  SELECT AlbumId,
         MAX(Milliseconds) AS max_ms
  FROM Track
  GROUP BY AlbumId
)
SELECT t.AlbumId,
       t.Name,
       t.Milliseconds
FROM Track t
JOIN max_lengths m
  ON m.AlbumId = t.AlbumId AND m.max_ms = t.Milliseconds;
