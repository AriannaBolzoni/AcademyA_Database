--USE [master]
--CREATE DATABASE [AcademyA.ProvaFinale_PrenotazioneHotel]
 USE [AcademyA.ProvaFinale_PrenotazioneHotel]
--CREATE TABLE [dbo].[Formule](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nome] [nvarchar](50) NOT NULL
--) 

--CREATE TABLE [dbo].[Servizi](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nome] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_Servizi] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--))

--CREATE TABLE [dbo].[Strutture](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nome] [nvarchar](50) NOT NULL,
--	[Citta] [nvarchar](50) NOT NULL,
--	[Stato] [nvarchar](50) NOT NULL,
--	[IdStruttura] [int] NOT NULL,
-- CONSTRAINT [PK_Strutture] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)) 

--CREATE TABLE [dbo].[StruttureServizi](
--	[IdStruttura] [int] NOT NULL,
--	[IdServizio] [int] NOT NULL
--) ON [PRIMARY]

--CREATE TABLE [dbo].[TipiStrutture](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nome] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_TipiStrutture] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--))


--INSERT INTO dbo.TipiStrutture
--VALUES	('Agriturismo'),
--		('Hotel'),
--		('Casa vacanze'),
--		('Residence')


--INSERT INTO dbo.Servizi
--VALUES	('Piscina'),
--		('Wifi'),
--		('Cassaforte'),
--		('Spa & Centro benessere'),
--		('Animali ammessi')



--INSERT INTO dbo.Formule
--VALUES	('Solo pernottamento'),
--		('Bed & Breakfast'),
--		('Mezza pensione'),
--		('Pensione completa')


--INSERT INTO dbo.Strutture
--VALUES	('Splendid Hotel', 'Riccione', 'Italy', 2),
--		('Hilton', 'Paris', 'France', 2),
--		('Andres Garcia', 'Ibizia', 'Spain', 3),
--		('Marku', 'Tirana', 'Albania', 4),
--		('Emily Parker', 'New York', 'USA', 3),
--		('Il Sole', 'Viaggio', 'Italy', 1)



--INSERT INTO dbo.StruttureServizi
--VALUES	(1, 2),
--		(1, 5),
--		(2, 2),
--		(2, 3),
--		(2, 5),
--		(3, 1),
--		(3, 3),
--		(3, 5),
--		(4, 1),
--		(4, 2),
--		(4, 3),
--		(4, 4),

--		(4, 5),
--		(5, 2),
--		(5, 4)


--CREATE TABLE dbo.ListinoPrezzi
--(
--	[Id]				[int] IDENTITY(1,1) NOT NULL,
--	[IdStruttura]		[int]				NOT NULL,
--	[IdFormula]			[int]				NOT NULL,
--	[PrezzoPerPersona]	[float]				NOT NULL
--)

--INSERT INTO dbo.ListinoPrezzi
--VALUES	(1, 2, 64.50),
--		(1, 3, 73.20),
--		(1, 4, 86.70),
--		(2, 2, 102.65),
--		(2, 4, 164.73),
--		(1, 4, 86.70)

--CREATE TABLE dbo.Clienti
--(
--	[Id]			[int]			IDENTITY(1,1)	NOT NULL,
--	[Nome]			[nvarchar](50)					NOT NULL,
--	[Cognome]		[nvarchar](50)					NOT NULL,
--	[DataNascita]	[date]							NOT NULL
--)

--INSERT INTO dbo.Clienti
--VALUES	('Arianna', 'Bolzoni', '1991-07-05'),
--		('Renata', 'Carriero', '1992-05-07'),
--		('Diego', 'Bianchi', '1990-11-15')

--CREATE TABLE dbo.Prenotazioni
--(
--	[Id]				[int]	IDENTITY(1,1)	NOT NULL,
--	[IdCliente]			[int]					NOT NULL,
--	[IdStruttura]		[int]					NOT NULL,
--	[IdPernottamento]	[int]					NOT NULL,
--	[DataArrivo]		[date]					NOT NULL,
--	[DataPartenza]		[date]					NOT NULL,
--	[NumPersone]		[int]					NOT NULL
--)

begin
--Creare una stored procedure che, scelto un servizio, mostri tutte le strutture che lo offrono.
--ALTER PROCEDURE dbo.StruttureDaServizi
--(
--@servizio nvarchar(50)
--)
--AS
--BEGIN
----DECLARE @servizio nvarchar(50)
----SET @servizio = 'Wifi'

--SELECT *
--FROM dbo.Strutture
--WHERE Id IN(
--			SELECT IdStruttura
--			FROM dbo.StruttureServizi
--			WHERE IdServizio = (
--								SELECT Id
--								FROM dbo.Servizi
--								WHERE Nome = @servizio
--								)
--)
--END

--EXEC dbo.StruttureDaServizi @servizio = 'Wifi'

begin 
--Creare una stored procedure che, scelto un tipo di struttura, mostri le strutture di quel tipo.
--ALTER PROCEDURE dbo.StruttureDaTipoStrutture
--(
--	 @tipo nvarchar(50)
--)
--AS
--BEGIN
----DECLARE @tipo nvarchar(50)
----SET @tipo = 'Hotel'

--SELECT *
--FROM dbo.Strutture
--WHERE IdStruttura IN(
--				SELECT Id
--				FROM dbo.TipiStrutture
--				WHERE Nome = @tipo
--			)
--END

begin
--Creare una stored procedure che, scelto un tipo di pernottamento, mostri le strutture di quel tipo.
--ALTER PROCEDURE dbo.StruttureDaFormula
--AS
--DECLARE @formula nvarchar(50)
----SET @formula = 'Pensione completa'

--SELECT * 
--FROM dbo.Strutture
--WHERE Id IN (
--SELECT IdStruttura
--FROM dbo.ListinoPrezzi
--WHERE idFormula = (
--				SELECT Id
--				FROM dbo.Formule
--				WHERE Nome = @formula
--			)
--)

begin
--Creare una stored procedure che scelta una struttura, una data di arrivo, una data di partenza, 
--tipo di pernottamento 
--e il numero di persone per cui si vuole prenotare, salvi le informazioni in una tabella 
--chiamata Prenotazioni.
--La stored dovrà tenere traccia anche delle informazioni del cliente che effettua la prenotazione.
--ALTER PROCEDURE dbo.InserimentoPrenotazioni
--(		@nome nvarchar(50),
--		@cognome nvarchar(50),
--		@struttura nvarchar(50),
--		@tipoPernottamento nvarchar(50), 
--		@dataArrivo date, 
--		@dataPartenza date,
--		@numPersone int
--)
--AS
--BEGIN
--	DECLARE	@idCliente int,
--			@idStruttura int,
--			@idPernottamento int

----SET		@nome = 'Arianna'
----SET		@cognome = 'Bolzoni'
----SET		@struttura = 'Splendid Hotel'
----SET		@tipoPernottamento = 'Pensione completa' 
----SET		@dataArrivo = '2022-08-10'
----SET		@dataPartenza = '2022-08-20'
----SET		@numPersone = 2
--	SET		@idCliente = (
--					SELECT Id
--					FROM dbo.Clienti
--					WHERE Nome = @nome AND Cognome = @cognome)
--	SET		@idStruttura = (
--					SELECT Id
--					FROM dbo.Strutture 
--					WHERE Nome = @struttura)
--	SET		@idPernottamento = (
--					SELECT id
--					FROM dbo.ListinoPrezzi
--					WHERE idFormula = (
--								SELECT Id
--								FROM dbo.Formule 
--								WHERE Nome = @tipoPernottamento
--								)
--						AND idStruttura = @idStruttura
--								)

--INSERT INTO dbo.Prenotazioni
--VALUES
--(
--	@idCliente,
--	@idStruttura,
--	@idPernottamento,
--	@dataArrivo,
--	@dataPartenza,
--	@numPersone
--)
--END
 
--EXEC [dbo].[InserimentoPrenotazioni] @nome = 'Arianna', 
--									@cognome = 'Bolzoni', 
--									@struttura = 'Hilton', 
--									@tipoPernottamento = 'Pensione completa', 
--									@dataArrivo = '2022-02-18', 
--									@dataPartenza = '2022-02-25', 
--									@numPersone = 3

begin
--Creare una vista che mostri tutte le prenotazioni(cliente, data arrivo, data partenza, numero persone,
--nome struttura, tipo struttura, totale(prezzo * giorni * persone)
--CREATE VIEW dbo.Fatture
--AS
--SELECT 
--		Nome			= c.Nome,
--		Cognome			= c.Cognome,
--		DataDiArrivo	= p.DataArrivo,
--		DataDiPartenza	= p.DataPartenza,
--		NumeroPersone	= p.NumPersone,
--		Struttura		= s.Nome,
--		Tipo			= ts.Nome,
--		NumeroGiorni	= DATEDIFF(day, p.DataArrivo, p.DataPartenza),
--		Totale			= lp.PrezzoPerPersona * p.NumPersone * (DATEDIFF(day, p.DataArrivo, p.DataPartenza))
--FROM dbo.Prenotazioni	AS p
--JOIN dbo.Clienti		AS c
--ON c.id = p.IdCliente
--JOIN dbo.Strutture		AS s
--ON s.Id = p.IdStruttura
--JOIN dbo.TipiStrutture	AS ts
--ON ts.Id = s.IdStruttura
--JOIN dbo.ListinoPrezzi	AS lp
--ON lp.IdStruttura = p.IdStruttura
--	AND lp.IdFormula = p.IdPernottamento

begin
--Creare una vista che mostri il guadagno di ogni struttura.

--CREATE VIEW TotaleGuadagno
--AS
--SELECT	Struttura,
--		TotaleGuadagno = SUM(Totale)
--FROM [dbo].[Fatture]
--GROUP BY Struttura

--ALTER VIEW dbo.StruttureConServizi
--AS
--WITH cte AS
--(
--SELECT s.nome AS Struttura, s.Citta, s.Stato, t.Nome AS Tipo, se.Nome AS Servizio, f.Nome AS Formula
--FROM dbo.Strutture			AS s
--JOIN dbo.TipiStrutture		AS t
--ON t.Id = s.IdStruttura
--JOIN dbo.StruttureServizi	AS ss
--ON s.IdStruttura = ss.IdStruttura
--JOIN dbo.Servizi			AS se
--ON se.Id = ss.IdServizio
--JOIN dbo.ListinoPrezzi		AS lp
--ON lp.IdStruttura = s.IdStruttura
--LEFT JOIN dbo.Formule			AS f
--ON f.Id = lp.IdFormula
----ORDER BY s.nome
--)
--SELECT 
--  Struttura,
--  Citta,
--  Stato,
--  Tipo,
--  Formula,
--  Servizi = STUFF((
--    select DISTINCT ',' + cast(cte.Servizio as varchar(max))
--    FROM cte 
--	WHERE (Struttura = ct.Struttura AND Citta = ct.Citta AND Stato = ct.Stato AND Tipo = ct.Tipo AND Formula = ct.Formula) 
--	FOR XML PATH ('')), 1, 1, '' ) 
--FROM cte AS ct
--GROUP BY Struttura,
--		Citta,
--		Stato,
--		Tipo,
--		Formula

begin
--Quindi creare una stored procedure che ricevuti in ingresso la tipologia della struttura,
--un servizio offerto e una tipologia di pernottamento, mostri le strutture disponibili.
--ALTER PROCEDURE dbo.StruttureDaFiltri
--(		@tipo			nvarchar(50),
--		@servizio		nvarchar(50),
--		@pernottamento	nvarchar(50)
--)
----SET		@tipo			= 'Hotel'
----SET		@servizio		= 'Cassaforte'
----SET		@pernottamento	= 'Pensione completa'
--AS
--BEGIN
--SELECT *
--FROM[dbo].[StruttureConServizi]
--WHERE	Tipo = @tipo
--	AND Formula = @pernottamento
--	AND Servizi Like CONCAT('%', @servizio, '%')
--END

--EXEC dbo.StruttureDaFiltri @tipo = 'Hotel', @servizio = 'Cassaforte', @pernottamento= 'Pensione completa'
