--USE master

--CREATE DATABASE [AcademyA.AziendaInformatica]

USE [AcademyA.AziendaInformatica]

--CREATE TABLE Dipendenti
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL,
--	Cognome				[nvarchar](50)					NOT NULL,
--	DataDiNascita		[datetime]						NOT NULL,
--	DataInizioAttivita	[datetime]						NOT NULL,
--	IdMansione			[int]							NOT NULL,
--	Mail				[nvarchar](50)					NOT NULL,
--	CostoOrario			[float]							NOT NULL
--)

--CREATE TABLE Mansioni
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL
--)

--CREATE TABLE Clienti
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL,
--	Citta				[nvarchar](50)					NOT NULL,
--	Regione				[nvarchar](50)					NOT NULL,
--	Provicia			[nvarchar](2)					NOT NULL,
--	IdDimensioneAzienda	[int]							NOT NULL,
--	NomeReferente		[nvarchar](50)					NOT NULL,
--	CognomeReferente	[nvarchar](50)					NOT NULL,
--	MailReferente		[nvarchar](50)					NOT NULL
--)

--CREATE TABLE Dimensioni
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL,
--)

--CREATE TABLE Commesse
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL,
--	DataInizio			[datetime]						NOT NULL,
--	DataFine			[datetime]						NOT NULL,
--	Descrizione			[nvarchar](100)					NOT NULL,
--	IdCliente			[int]							NOT NULL
--)

--CREATE TABLE Attivita
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	IdCommessa			[int]							NOT NULL,
--	Nome				[nvarchar](50)					NOT NULL,
--	OreAllocate			[datetime]						NOT NULL,
--	CostoOrario			[float]							NOT NULL,
--	IdDipendente		[int]							NOT NULL
--)

--CREATE TABLE Timesheet
--(
--	Id					[int]			IDENTITY(1,1)	NOT NULL,
--	IdAttivita			[int]							NOT NULL,
--	IdDipendente		[int]							NOT NULL,
--	[Data]				[date]							NOT NULL,
--	Ore					[int]							NOT NULL
--)

--INSERT INTO dbo.Mansioni
--VALUES	('Manager'),
--		('Senior Consultant'),
--		('Consultant'),
--		('Senior Analyst'),
--		('Analyst')

--INSERT INTO dbo.Dimensioni
--VALUES	('Enterprise'),
--		('Grande'),
--		('Media'),
--		('Piccola')

--INSERT INTO dbo.Clienti
--VALUES	('Yoox', 'Milano', 'Lombardia', 'MI', 1, 'Luca', 'Gaias', 'lucagaias#yoox.com'),
--		('Banca D''Asti', 'Asti', 'Piemonte', 'AT', 2, 'Giovanni', 'Rossi', 'giovannirossi@bancasti.it'),
--		('Avanade', 'Milano', 'Lombardia', 'MI', 1, 'Carolina', 'Bianchi', 'carolinabianchi@avanade.it')

--INSERT INTO dbo.Dipendenti
--VALUES	('Arianna', 'Bolzoni', '1991-07-05', '2018-03-15', 3, 'arianna.bolzoni@icubed.it', '8.00'),
--		('Renata', 'Carriero', '1990-11-14', '2017-10-01', 2, 'renata.carriero@icubed.it', '10.00'),
--		('Alessandra', 'Degan', '1989-04-01', '2020-09-08', 1, 'alessandra.degan@icubed.it', '12.00'),
--		('Antonia', 'Sacchitella', '1992-01-15', '2021-02-23', 4, 'antonia.sacchitella@icubed.it', '7.00')

--INSERT INTO dbo.Commesse
--VALUES	('Rulliera', '2022-01-15', '2022-12-15', 'Realizzazione di un portale per gestire i pacchi resi...', 1),
--		('Analisi frodi', '2021-06-01', '2023-05-15', 'Analisi in merito ai pacchi persi', 1),
--		('Tool di testing', '2021-03-12', '2021-11-19', 'Sviluppo di test automatici', 2),
--		('Erogazione corsi', '2020-01-01', '2025-12-31', 'Corsi piattaforma .Net', 3)

--INSERT INTO dbo.Attivita
--VALUES (1, 'Sviluppo', 120, 5, 1),
--		(1, 'Sviluppo', 80, 5, 2),
--		(1, 'Testing', 40, 3, 1),
--		(1, 'Testing', 60, 4, 3),
--		(2, 'Analisi', 200, 7, 4),
--		(2, 'Sviluppo', 100, 8, 4),
--		(3, 'Testing', 50, 10, 1),
--		(4, 'Autoformazione', 0, 5, 3),
--		(4, 'Docenza', '100', 5, 3)



--IIF(condizione, cosa fare se true, cosa fare se false)

CREATE VIEW dbo.AllocazioneDipendenti
AS
SELECT
		--*, 
		DataDiOggi = CURRENT_TIMESTAMP,--GETDATE(),
		--DataDiOggiSenzaOrario = CONVERT(date, GETDATE()),
		--CommessaTerminata = IIF(CONVERT(date, GETDATE()) > c.DataFine, 0, 1),
		d.Nome, 
		d.Cognome,
		d.DataDiNascita,
		d.DataInizioAttivita,
		Mansione = m.Nome,--,
		--SenzaAllocazione = IIF(
		--						SUM(
		--								IIF(CONVERT(date, GETDATE()) > c.DataFine, 
		--									0, 
		--									1))
		--						> 0, 
		--						0,
		--						1)
		SenzaAllocazione = CASE 
							WHEN SUM(IIF(CONVERT(date,GETDATE()) > c.DataFine, 0, 1)) >  0 THEN 1
							WHEN SUM(IIF(CONVERT(date,GETDATE()) > c.DataFine, 0, 1)) <= 0 THEN 0
						END
FROM dbo.Dipendenti				AS d
	JOIN dbo.Mansioni			AS m
		ON d.IdMansione = m.Id
	JOIN dbo.Attivita			AS a
		ON a.IdDipendente = d.Id
	JOIN dbo.Commesse			AS c
		On c.Id = a.IdCommessa

GROUP BY d.Nome, d.Cognome, d.DataDiNascita, d.DataInizioAttivita, m.Nome


CREATE VIEW dbo.ClienteSenzaCommesse
AS
SELECT DISTINCT
	--*, 
	--AnnoInCorso = YEAR(GETDATE()),
	--AnnoFineCommessa = YEAR(co.DataFine)
	cl.Nome,
	cl.Citta,
	cl.NomeReferente
FROM dbo.Clienti	AS cl
JOIN dbo.Commesse	AS co
ON   cl.Id = co.IdCliente
WHERE YEAR(co.DataFine) < YEAR(GETDATE())