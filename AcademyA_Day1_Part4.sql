SELECT * FROM dbo.Libri

-- Cancellazione puntuale 
DELETE dbo.Libri
WHERE Id = 1

-- Cancellazione di tutte le righe
--DELETE dbo.Libri    uguale  TRUNCATE TABLE dbo.Libri

-- Cancella anche la tabella 
DROP TABLE dbo.Libri