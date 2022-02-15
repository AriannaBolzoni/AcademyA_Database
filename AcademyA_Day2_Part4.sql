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

DECLARE @nomePlaylist nvarchar(50);
SET @nomePlaylist = 'Febbraio';

WITH cte AS
(
	SELECT *
	FROM dbo.Playlists				AS p

	JOIN dbo.playlistCanzoni		AS pc
	ON pc.IdPlaylist = p.Id

	WHERE Nome = @nomePlaylist
)

SELECT vc.Titolo,
		vc.Artista,
		vc.Durata,
		vc.Genere
FROM dbo.Canzoni		AS c
JOIN cte				AS ct
ON ct.IdCanzoni = c.Id
JOIN dbo.vwCanzoni		AS vc
ON vc.Titolo = c.Titolo