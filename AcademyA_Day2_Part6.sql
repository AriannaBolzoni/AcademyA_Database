/*
Mostrare:
1. Tutti i voli in partenza da Milano
2. Tutti i tipi di aerei in partenza da Londra
3. Tutti i tipi di aerei in partenza da Milano con il corrispondente numero di 
	passeggeri
4. Le città da cui partono voli per Ibiza
5. I voli che non partono ne arrivano in Italia


6. La lista di aerei di tipo Boeing
7. Tutti i voli con durata <= a 4 ore
8. I voli in partenza ad Agosto
*/
-- Tutti i voli in partenza da Milano
DECLARE @citta nvarchar(50);
SET @citta = 'Milano'

SELECT *
FROM dbo.ViewVoli
WHERE CittaDiPartenza = @citta

-- Tutti i tipi di aerei in partenza da Londra
DECLARE @citta nvarchar(50);
SET @citta = 'Londra'

SELECT TipoAereo,
		CittaDiPartenza
FROM dbo.ViewVoli
WHERE CittaDiPartenza = @citta

--Tutti i tipi di aerei in partenza da Milano con il corrispondente numero di passeggeri
DECLARE @citta nvarchar(50);
SET @citta = 'Milano'

SELECT	TipoAereo,
		CittaDiPartenza,
		a.NumeroPasseggeri
FROM dbo.ViewVoli		AS vv
JOIN dbo.Aerei			AS a
ON vv.TipoAereo = a.Tipo
WHERE CittaDiPartenza = @citta

--Le città da cui partono voli per Ibiza
DECLARE @citta nvarchar(50)
SET @citta = 'Ibiza'

SELECT CittaDiPartenza
FROM dbo.ViewVoli
WHERE CittaDiArrivo = @citta

-- I voli che non partono ne arrivano in Italia
SELECT * 
FROM dbo.ViewVoli	
WHERE AereoportoDiArrivo IN (
								SELECT Nome
								FROM dbo.Aereoporti
								WHERE Nazione != 'Italia'
							)
	AND
	AereoportoDiPartenza IN (
								SELECT *
								FROM dbo.Aereoporti
								WHERE Nazione != 'Italia'
							)

-- La lista di aerei di tipo Boeing
SELECT *
FROM dbo.Aerei
WHERE Tipo LIKE '%Boeing%'

-- Tutti i voli con durata <= a 4 ore

-- hour  : Arrivo alle 12 Partenza alle 08      12-8 = 4
-- hour  : Arrivo alle 12 Partenza alle 08:30   12-8 = 4 != 3:30
-- minute: Arrivo alle 12 Partenza alle 08      12:00-8:00 = 4    * 60
-- minute: Arrivo alle 12 Partenza alle 08:30   12:00-8:30 = 3,5  * 60

SELECT *, DATEDIFF(minute, Partenza, Arrivo)   
FROM dbo.ViewVoli
WHERE DATEDIFF(minute, Partenza, Arrivo) < 4 * 60
	
-- I voli in partenza ad Agosto
SELECT *
FROM dbo.ViewVoli
WHERE MONTH(Partenza) = 8