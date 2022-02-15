/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Nome]
      ,[Sede]
  FROM [AcademyA.Libreria].[dbo].[CaseEditrici]

-- Filtrare tutti i libri la cui casa editrice è a Milano

DECLARE @sede nvarchar(50);
SET @sede = 'Milano'
SELECT lv.Titolo,
		lv.Autore,
		lv.Trama,
		lv.AnnoDiPubblicazione,
		lv.Genere,
		lv.Prezzo,
		lv.CasaEditrice
FROM dbo.LibriConId			AS l
JOIN dbo.CaseEditrici		AS ce
ON l.IdCasaEditrice = ce.Id
JOIN dbo.LibriView			AS lv
ON lv.Id = l.Id
WHERE ce.Sede = @sede


WITH cte AS
(
	SELECT * 
	FROM dbo.CaseEditrici
	WHERE Sede = 'Milano'
)

SELECT *
FROM dbo.LibriView			AS lv

JOIN cte					AS ct
ON lv.CasaEditrice			= ct.Nome
