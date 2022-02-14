 Creazione del database
 CREATE DATABASE [AcademyA.Libreria]

 Comando da usare se non voglio ogni volra cambiare il database in dai tool di SSMS
USE [AcademyA.Libreria]

 Creazione della tabella con definizione dei campi
CREATE TABLE [dbo].[Libri]
(
	[Id]					[int] IDENTITY(1,1) NOT NULL,
	[Titolo]				[nvarchar](50) NOT NULL,
	[Trama]					[nvarchar](MAX) NULL,
	[Autore]				[nvarchar](50) NOT NULL,
	[CasaEditrice]			[nvarchar](50) NOT NULL,
	[AnnoDiPubblicazione]	[int] NOT NULL,
	[Prezzo]				[float] NOT NULL,
	[Genere]				[nvarchar](50) NOT NULL,
	[Quantita]				[int] NOT NULL,
	[Audiolibro]			[bit] NOT NULL
)

 Inserimento di una riga con tutti i valori -> attenzione!!! Se definisco l'Id identity, non posso andarlo a definire
INSERT [dbo].[Libri]
			(
			 --[Id], 
			 [Titolo], [Trama], [Autore], [CasaEditrice], [AnnoDiPubblicazione], [Prezzo], [Genere], [Quantita], [Audiolibro])
VALUES		(	--1,
				'Uno, nessuno e centomila',
				'Vitangelo Moscarda scopre di non conoscersi, di non essere una persona, di indossare centomila maschere, una per ogni persona che conosce e una anche per sé stesso. Vitangelo è uno, è tanti e allo stesso tempo è nessuno. Interviene allora la follia, unica via di scampo dalla tragicità e la paradossalità della vita. La follia deriva dalla consapevolezza, dal pensiero che lo porta a convincersi delle proprie teorie e a voler sfidare quel mondo dalle centomila apparenze nel quale si sente imprigionato.', 
				'Luigi Pirandello', 
				'Mondadori', 
				2016, 
				24.76, 
				'Classico italiano', 
				100, 
				0
			)

 Questa insert da errore perchè non definisco il valore di una colonna che è NOT NULL
INSERT [dbo].[Libri]
			( 
			 --[Titolo], 
			 [Trama], 
			 [Autore], [CasaEditrice], [AnnoDiPubblicazione], [Prezzo], [Genere], [Quantita], [Audiolibro])
VALUES		(	
				--'Uno, nessuno e centomila',
				'Vitangelo Moscarda scopre di non conoscersi, di non essere una persona, di indossare centomila maschere, una per ogni persona che conosce e una anche per sé stesso. Vitangelo è uno, è tanti e allo stesso tempo è nessuno. Interviene allora la follia, unica via di scampo dalla tragicità e la paradossalità della vita. La follia deriva dalla consapevolezza, dal pensiero che lo porta a convincersi delle proprie teorie e a voler sfidare quel mondo dalle centomila apparenze nel quale si sente imprigionato.', 
				'Luigi Pirandello', 
				'Giunti', 
				2014, 
				17.34, 
				'Classico italiano', 
				78, 
				1
			)

 Questo inserimento va a buon fine perchè non definisco il valore di una colonna NULL
INSERT [dbo].[Libri]
			( 
			 [Titolo], 
			 --[Trama], 
			 [Autore], [CasaEditrice], [AnnoDiPubblicazione], [Prezzo], [Genere], [Quantita], [Audiolibro])
VALUES		(	
				'Uno, nessuno e centomila',
				--'Vitangelo Moscarda scopre di non conoscersi, di non essere una persona, di indossare centomila maschere, una per ogni persona che conosce e una anche per sé stesso. Vitangelo è uno, è tanti e allo stesso tempo è nessuno. Interviene allora la follia, unica via di scampo dalla tragicità e la paradossalità della vita. La follia deriva dalla consapevolezza, dal pensiero che lo porta a convincersi delle proprie teorie e a voler sfidare quel mondo dalle centomila apparenze nel quale si sente imprigionato.', 
				'Luigi Pirandello', 
				'Giunti', 
				2014, 
				17.34, 
				'Classico italiano', 
				78, 
				1
			)

INSERT [dbo].[Libri]
		([Titolo], [Trama], [Autore], [CasaEditrice], [AnnoDiPubblicazione], [Prezzo], [Genere], [Quantita], [Audiolibro])
VALUES
		(
			'Il Gattopardo', 
			'Siamo in Sicilia, all''epoca del tramonto borbonico: è di scena una famiglia della più alta aristocrazia isolana, colta nel momento rivelatore del trapasso di regime, mentre già incalzano i tempi nuovi (dall''anno dell''impresa dei Mille di Garibaldi la storia si prolunga fino ai primordi del Novecento). Accentrato quasi interamente intorno a un solo personaggio, il principe Fabrizio Salina, il romanzo, lirico e critico insieme, ben poco concede all''intreccio e al romanzesco tanto cari alla narrativa dell''Ottocento. L''immagine della Sicilia che invece ci offre è un''immagine viva, animata da uno spirito alacre e modernissimo, ampiamente consapevole della problematica storica e politica contemporanea.', 
			'Tomasi di Lampedusa',
			'Feltrinelli',
			2018,
			9.5,
			'Classico italiano',
			34,
			0
		 ),
		(
			'Il Gattopardo', 
			'Siamo in Sicilia, all''epoca del tramonto borbonico: è di scena una famiglia della più alta aristocrazia isolana, colta nel momento rivelatore del trapasso di regime, mentre già incalzano i tempi nuovi (dall''anno dell''impresa dei Mille di Garibaldi la storia si prolunga fino ai primordi del Novecento). Accentrato quasi interamente intorno a un solo personaggio, il principe Fabrizio Salina, il romanzo, lirico e critico insieme, ben poco concede all''intreccio e al romanzesco tanto cari alla narrativa dell''Ottocento. L''immagine della Sicilia che invece ci offre è un''immagine viva, animata da uno spirito alacre e modernissimo, ampiamente consapevole della problematica storica e politica contemporanea.', 
			'Tomasi di Lampedusa',
			'Feltrinelli',
			2018,
			4.76,
			'Classico italiano',
			0,
			1
		),
		(
			'Anna Karenina',
			'In Anna Karenina vengono raccontate le vicende, viste in parallelo, dell’amore adulterino tra Anna e il giovane conte Aleksej Vronskij e del felice matrimonio tra Kitty e Levin. I personaggi del romanzo, decritti da un punto di vista psicologico ed introspettivo, sono tutti legati tra loro da vincoli di parentela e amicizia.',
			'Lev Tolstoj',
			'Mondadori',
			2000,
			23.45,
			'Classico russo',
			134,
			0
		)



SELECT *
FROM [dbo].[Libri]

SELECT
	[Id],
	[Titolo], [Trama], [Autore], [CasaEditrice], [AnnoDiPubblicazione], [Prezzo], [Genere], [Quantita], [Audiolibro]
FROM [dbo].[Libri]

SELECT
	[Titolo],
	[Autore],
	[CasaEditrice],
	[Quantita]
FROM [dbo].[Libri]

SELECT * --tutte le colonne
FROM [dbo].[Libri]
WHERE [CasaEditrice] = 'Feltrinelli'

SELECT *
FROM [dbo].[Libri]
WHERE Prezzo > 10.00



SELECT *
FROM [dbo].[Libri]
WHERE [CasaEditrice] = 'Feltrinelli'
	OR [CasaEditrice] = 'Giunti'

SELECT *
FROM [dbo].[Libri]
WHERE [CasaEditrice] IN ('Feltrinelli', 'Giunti')

SELECT *
FROM [dbo].[Libri]
WHERE [CasaEditrice] = 'Feltrinelli'
	AND [Prezzo] > 5

SELECT [Titolo], [Autore], [CasaEditrice], [Prezzo]
FROM [dbo].[Libri]
WHERE [CasaEditrice] = 'Feltrinelli'
	AND [Prezzo] > 5

SELECT *
FROM [dbo].[Libri]
ORDER BY [Titolo] -- ASC è opzionale

SELECT *
FROM [dbo].[Libri]
ORDER BY [Autore] DESC

SELECT [Titolo], [Autore], [CasaEditrice], [Prezzo]
FROM [dbo].[Libri]
WHERE [Prezzo] > 10
ORDER BY [CasaEditrice]


SELECT [Titolo], [Genere], [AnnoDiPubblicazione] FROM dbo.Libri


SELECT DISTINCT [Titolo], [Genere], [AnnoDiPubblicazione]
FROM [dbo].[Libri]

SELECT * FROM dbo.Libri

SELECT [CasaEditrice],
		SUM(Quantita)
FROM [dbo].[Libri]
GROUP BY [CasaEditrice]

SELECT  [Titolo],
		[CasaEditrice],
		SUM(Quantita)
FROM [dbo].[Libri]
GROUP BY [CasaEditrice], [Titolo]

SELECT * FROM dbo.Libri

SELECT [Titolo],
	   [CasaEditrice],
	   SUM(Quantita)
FROM [dbo].[Libri]
WHERE [Quantita] > 80
GROUP BY [CasaEditrice], [Titolo]

SELECT [Titolo],
	   [CasaEditrice],
	   SUM(Quantita)
FROM [dbo].[Libri]
GROUP BY [CasaEditrice], [Titolo]
HAVING SUM(Quantita) > 80


SELECT COUNT(*)
FROM [dbo].[Libri]


