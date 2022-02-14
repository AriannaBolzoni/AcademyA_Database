SELECT *
FROM [dbo].[Numeri]

SELECT *
FROM dbo.Lettere

-- Non ha campo di match, per ogni valore della tabella A, associa tutti i valori della tabella B
SELECT *
FROM dbo.Numeri
CROSS JOIN dbo.Lettere
-- Ha campo di match, mostra solo le righe che sono referenziate in tutte le tabelle della join
SELECT l.Letter, n.Segno
FROM dbo.Lettere		AS l
INNER JOIN dbo.Numeri			AS n
ON l.Num = n.Num

-- mantiene TUTTE le righe della tabella di JOIN
SELECT *
FROM dbo.Lettere		AS l
RIGHT JOIN dbo.Numeri	AS n
on l.Num = n.Num
-- mantiene TUTTE le righe della tabella di FROM
SELECT *
FROM dbo.Numeri			AS n
LEFT JOIN dbo.Lettere	AS l
on n.Num = l.Num

SELECT *
FROM dbo.Lettere		AS l
LEFT JOIN dbo.Numeri	AS n
on l.Num = n.Num

SELECT *
FROM dbo.Numeri			AS n
RIGHT JOIN dbo.Lettere	AS l
on l.Num = n.Num