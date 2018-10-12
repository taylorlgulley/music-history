SELECT ArtistName, YearEstablished 
FROM Artist
WHERE YearEstablished > 1970
AND YearEstablished < 2000
ORDER BY YearEstablished DESC
;

SELECT a.Title, 
			a.AlbumLength, 
			a.Label AS AlbumLabel,
			ar.ArtistName,
			ar.YearEstablished,
			g.Label AS GenreLabel
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g ON a.GenreId = g.GenreId
;

SELECT *
FROM Song s
JOIN Album al ON al.AlbumId = s.AlbumId
JOIN Artist ar ON al.ArtistId = s.ArtistId
JOIN Genre g ON al.GenreId = s.GenreId
;

INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Busty and the Bass", 2008)
;

SELECT * FROM Artist
;

UPDATE Artist
	SET ArtistName = "BUSTY AND THE BASS"
	WHERE ArtistId = 28
;

--1
SELECT * FROM Genre
;

--2
INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Lake Street Dive", 2006)
;

--3
INSERT INTO Album
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES
("Uncommon Good", "2016", 16, "Busty", 28, 6)
;

SELECT * FROM Album
;

--4
INSERT INTO Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
("Uncommon Good", 3, "2016", 6, 28, 23)
;

-- Which Genre has the most albums assigned to it?
-- Make sure to have commas after the Select and before the function
SELECT g.Label, COUNT(al.AlbumId) AS AlbumCount
FROM Genre g
JOIN Album al ON al.GenreId = g.GenreId
GROUP BY g.Label
ORDER BY AlbumCount DESC
LIMIT 1
;

SELECT al.Title,
			MAX(al.AlbumLength)
FROM Album al
;

--5a
SELECT a.Title, 
s.Title FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.AlbumId
WHERE a.ArtistId = 28
;
--5b
SELECT a.Title, 
s.Title FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
WHERE s.ArtistId = 28
;

--6
SELECT g.Label,
			ar.ArtistName,
			al.Title AS AlbumName
			, COUNT(s.AlbumId) AS SongCount
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
JOIN Artist ar ON s.ArtistId = ar.ArtistId
JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.AlbumId
ORDER BY SongCount DESC
;

--7
SELECT g.Label,
			ar.ArtistName,
			al.Title AS AlbumName
			, COUNT(s.ArtistId) AS SongCount
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
JOIN Artist ar ON s.ArtistId = ar.ArtistId
JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.ArtistId
ORDER BY SongCount DESC
;

--8
SELECT g.Label
			, COUNT(s.GenreId) AS SongCount
FROM Song s
JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId
ORDER BY SongCount DESC
;

--9
SELECT al.Title,
			MAX(al.AlbumLength) AS Duration
FROM Album al
;

--10/11
SELECT s.Title As SongTitle,
			al.Title As AlbumTitle,
			MAX(s.SongLength) AS Duration
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
;