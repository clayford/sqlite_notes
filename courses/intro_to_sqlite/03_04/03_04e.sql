SELECT Name,
       ROW_NUMBER() OVER (ORDER BY Name DESC)
FROM Genre
ORDER BY 2;

SELECT CustomerId,
       City,
       Country,
       COUNT(CustomerId) 
         OVER (PARTITION BY Country) AS num_per_country
FROM Customer
ORDER BY CustomerId;

SELECT AlbumId,
       Name,
       Milliseconds
FROM (
  SELECT AlbumId,
         ROW_NUMBER() OVER (PARTITION BY AlbumId ORDER BY Milliseconds DESC) row_num,
         Name,
         Milliseconds
  FROM Track
)
WHERE row_num = 1;
