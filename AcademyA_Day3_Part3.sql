CREATE TABLE Prezzi
(
	[Id]		[int]		IDENTITY(1,1)	NOT NULL,
	[IdVolo]	[int]						NOT NULL,
	[Classe]	[int]						NOT NULL,
	[Prezzo]	[float]						NOT NULL
)

INSERT INTO dbo.Prezzi
VALUES	(1, 1, 200),
		(1, 2, 80),
		(2, 2, 450),
		(2, 2, 130),
		(3, 1, 382),
		(3, 2, 147),
		(4, 1, 550),
		(4, 2, 398),
		(5, 1, 79),
		(5, 2, 10),
		(6, 1, 146),
		(6, 2, 48)

UPDATE dbo.Prezzi
SET Classe = 1
WHERE Id = 3

SELECT * FROM dbo.Prezzi

SELECT *
FROM dbo.ViewVoli

SELECT *
FROM dbo.Prezzi
WHERE IdVolo = 1

-- Prendo il volo 1
-- in seconda Classe
-- viaggiamo in 2
-- Quanto paga?

-- Query con variabili
DECLARE @idVolo int, @classe int, @numPersone int
SET @idVolo = 1;
SET @classe = 2;
SET @numPersone = 2;

SELECT 
		--Id,
		--IdVolo,
		--Classe,
		--Prezzo,
		PrezzoTotale = Prezzo * @numPersone
FROM dbo.Prezzi
WHERE IdVolo = @idVolo
AND classe = @classe

-- Eseguire la stp (EXEC + nome stp + variabile/i
EXEC CalcoloPrezzo 1, 1, 3;

-- Creare un tabella che gestisca il numero di posti rimasti
-- Modificare la stp CalcoloPrezzo che dopo avere calcolato il prezzo totale,
-- vada a fare l'update dei posti rimasti

CREATE TABLE GestionePosti
(
	Id				[int]		IDENTITY(1,1)	NOT NULL,
	IdVolo			[int]						NOT NULL,
	PostiRimasti	[int]						NOT NULL
)

-- Inserisco nella tabella - Ho creato una tabella e NON una vista quindi posso 
-- modificare i dati
-- Inserimento da query

INSERT INTO dbo.GestionePosti
SELECT	v.CodiceVolo,
		a.NumeroPasseggeri
FROM dbo.Voli		AS v
JOIN dbo.Aerei		AS a
ON v.IdAereo = a.Codice

SELECT *
FROM dbo.GestionePosti

--Modifico la stp