--Creare un database chiamato AcademyA.Musica
--che gestica brani musicali

--Un brano musicale ha:
--Titolo, artisti, durata, genere

--Gli artisti possono essere un singolo cantante o un gruppo(insieme di artisti)
--Gli artisti hanno nome cognome e nome d'arte
--E' possibile selezionare i brani con durata minore a 3 minuti ok
--E' possibile selezionare i brani di un certo artista  ok
--E' possibile selezionare i brani di un certo genere  ok
--E' possibile visualizzare tutti i brani ok
--E' possibile creare una propria playlist

ALTER VIEW dbo.vwCanzoni
AS
(
	SELECT  -- c.[Id]
			--, 
			c.[Titolo]
			--, c.[IdArtisti]
			, Artista			= a.Nome
			, c.[Durata]
			--, c.[IdGenere]
			, Genere			= g.Descrizione
	FROM [AcademyA.Musica].[dbo].[Canzoni]	AS c

		JOIN dbo.Artisti							AS a
			ON a.Id = c.idArtisti

		JOIN dbo.Generi							AS g
			ON g.Id = c.IdGenere
)

-- Visualizzare tutti i brani
SELECT * 
FROM dbo.vwCanzoni

-- Durata < 3 minuti
-- Durata < 00:03:30
DECLARE @durata time(7);
SET @durata = '00:03:00'

SELECT *
FROM dbo.vwCanzoni
WHERE Durata < @durata



--Genere
DECLARE @genere nvarchar(50);
SET @genere = 'Pop'

SELECT *
FROM dbo.vwCanzoni
WHERE Genere = @genere

--Brani di un artista
DECLARE @artista nvarchar(50);
SET @artista = 'Achille Lauro'

SELECT *
FROM dbo.vwCanzoni
WHERE Artista = @artista

-- Per artista
DECLARE @nomeArtista nvarchar(50);
SET @nomeArtista = 'Michele'

SELECT  vc.Titolo,
		vc.Artista,
		vc.Durata,
		vc.Genere
FROM dbo.AnagraficaArtisti		AS aa

JOIN dbo.Artisti				AS a
ON aa.IdNomeArte = a.Id

JOIN dbo.Canzoni				AS c
ON c.IdArtisti = a.Id

JOIN [dbo].[vwCanzoni]			AS vc
ON c.Titolo = vc.Titolo

WHERE aa.Nome				= @nomeArtista
	OR aa.Cognome			= @nomeArtista
	OR a.Nome				= @nomeArtista

-- Playlist
DECLARE @nomePlaylist nvarchar(50);
SET @nomePlaylist = 'Febbraio';

SELECT vc.Titolo,
		vc.Artista,
		vc.Durata,

		vc.Genere
FROM dbo.Playlists				AS p
JOIN dbo.PlaylistCanzoni		AS pc
ON pc.IdPlaylist = p.Id
JOIN dbo.Canzoni				AS c
ON c.Id = pc.IdCanzoni
JOIN dbo.vwCanzoni				AS vc
ON vc.Titolo = c.Titolo
WHERE p.Nome = @nomePlaylist


-- Per artista e genere
DECLARE @nomeArtista nvarchar(50), @genere nvarchar(50);
SET @nomeArtista = 'Alessandro';
SET @genere = 'Ballata'

SELECT  vc.Titolo,
		vc.Artista,
		vc.Durata,
		vc.Genere
FROM dbo.AnagraficaArtisti		AS aa

JOIN dbo.Artisti				AS a
ON aa.IdNomeArte = a.Id

JOIN dbo.Canzoni				AS c
ON c.IdArtisti = a.Id

JOIN [dbo].[vwCanzoni]			AS vc
ON c.Titolo = vc.Titolo

WHERE (
			aa.Nome				= @nomeArtista
		OR	aa.Cognome			= @nomeArtista
		OR	a.Nome				= @nomeArtista
	)
	AND 
	vc.Genere			= @genere
