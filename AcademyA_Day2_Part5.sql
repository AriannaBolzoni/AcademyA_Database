-- Creazione di un database che gestisca i voli
CREATE DATABASE [AcademyA.ControlloVoli]

USE [AcademyA.ControlloVoli]

-- Creazione tabella 'Aereoporti' con campi Id, Nome, Città, Nazione
CREATE TABLE dbo.Aereoporti
(
	Id		[int]			IDENTITY(1,1)	NOT NULL,
	Nome	[nvarchar](50)					NOT NULL,
	Citta	[nvarchar](50)					NOT NULL,
	Nazione	[nvarchar](50)					NOT NULL
)

-- Inserimento di alcuni valori
INSERT INTO dbo.Aereoporti
	(Nome, Citta, Nazione)
VALUES
	('Malpensa', 'Milano', 'Italia'),
	('Heathrow', 'Londra', 'Inghilterra'),
	('Goldcar', 'Ibiza', 'Spagna'),
	('Newark-Liberty', 'New York', 'USA')

SELECT * FROM dbo.Aereoporti

--Creazione tabella 'Aerei' con campi Codice, numero passeggeri, tipo aereo
CREATE TABLE dbo.Aerei
(
	Codice				[int]			IDENTITY(1,1)	NOT NULL,
	NumeroPasseggeri	[int]							NOT NULL,
	Tipo				[nvarchar](50)					NOT NULL
)

--Inserimento di alcuni valori
INSERT INTO dbo.Aerei 
VALUES	 (250, 'Boeing 747'),
		 (20, 'Aliante X'),
		 (6, 'Lux'),
		 (500, 'Boeing 757')

SELECT * FROM dbo.Aerei

--Creazione tabella 'CompagnieAeree' con campi Id, Nome, Sede
CREATE TABLE dbo.CompagnieAeree
(
	Id		[int]			IDENTITY(1,1)	NOT NULL,
	Nome	[nvarchar](50)					NOT NULL,
	Sede	[nvarchar](50)					NOT NULL
)

-- Inserimento di valori
INSERT INTO dbo.CompagnieAeree
VALUES	('Alitalia', 'Fiumicino'),
		('Ryanair', 'Swords'),
		('Emirates', 'Dubai')

SELECT * FROM dbo.CompagnieAeree

--Creazione tabella 'Gates' con campi Id, IdAereoporto, Numero
CREATE TABLE dbo.Gates
(
	Id				[int]		IDENTITY(1,1)	NOT NULL,
	IdAereoporto	[int]						NOT NULL,
	Numero			[int]						NOT NULL
)

-- Inserimento di valori
INSERT INTO dbo.Gates
VALUES	(1, 1),
		(1, 2),
		(1, 3),
		(2, 1),
		(2, 2),
		(2, 3),
		(2, 4),
		(3, 1),
		(4, 1),
		(4, 2),
		(4, 3),
		(4, 4),
		(4, 5)

SELECT * FROM dbo.Gates

-- Priviamo a vedere i gates di ogni aereoporto
SELECT	*
--		a.Nome,
--		a.Citta,
--		g.Numero
FROM dbo.Aereoporti		AS a
JOIN dbo.Gates			AS g
ON g.IdAereoporto = a.Id

--Creazione tabella 'Voli' con Id/codiceVolo, data e ora partenza, data e ora di arrivo,
-- idAereoportoPartenza, idAereportoArrivo, id aereo, idCompagniaAerea, idGate
CREATE TABLE dbo.Voli
(
	CodiceVolo				[int]		IDENTITY(1,1)	NOT NULL,
	Partenza				[dateTime]					NOT NULL,
	Arrivo					[dateTime]					NOT NULL,
	IdAereoportoPartenza	[int]						NOT NULL,
	IdAereoportoArrivo		[int]						NOT NULL,
	IdAereo					[int]						NOT NULL,
	IdCompagniaAerea		[int]						NOT NULL,
	IdGate					[int]						NOT NULL
)

--Inserire i valori
INSERT INTO dbo.Voli
VALUES	('2022-02-15 12:49:00', '2022-02-15 15:32:00', 1, 2, 1, 1, 3),
		('2022-02-15 16:48:00', '2022-02-17 02:55:00', 1, 4, 4, 1, 1),
		('2022-04-03 14:35:00', '2022-04-03 22:12:00', 2, 4, 3, 2, 7),
		('2022-06-15 06:45:00', '2022-06-15 08:06:00', 2, 4, 2, 3, 6),
		('2022-08-12 04:32:00', '2022-08-12 09:48:00', 3, 1, 3, 2, 8),
		('2022-08-12 17:05:00', '2022-08-12 22:08:00', 4, 3, 4, 3, 13)

SELECT * FROM dbo.Voli

-- Creare un tabella che mostri i voli in maniera esplicita
CREATE VIEW dbo.ViewVoli
AS
(
	SELECT  v.CodiceVolo,
			v.Partenza,
			v.Arrivo,
			AereoportoDiPartenza		= ap.Nome,
			CittaDiPartenza				= ap.Citta,
			AereoportoDiArrivo			= ap2.Nome,
			CittaDiArrivo				= ap2.Citta,
			TipoAereo					= a.Tipo,
			Compagnia					= ca.Nome,
			NumeroGate					= g.Numero
	FROM dbo.Voli			AS v
	JOIN dbo.Aereoporti		AS ap
	ON ap.Id = v.IdAereoportoPartenza
	JOIN dbo.Aereoporti		AS ap2
	ON ap2.Id = v.IdAereoportoArrivo
	JOIN dbo.Aerei			AS a
	ON a.Codice = v.IdAereo
	JOIN dbo.Gates			AS g
	ON g.Id = v.IdGate
	JOIN dbo.CompagnieAeree	AS ca
	ON ca.Id = v.IdCompagniaAerea
)

SELECT * FROM dbo.ViewVoli