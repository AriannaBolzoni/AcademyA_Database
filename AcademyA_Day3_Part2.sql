-- Cosa sono le tabelle -> insieme di informazioni
--						Lo sviluppatore gestisce le tabelle(crea, inserisce i dati, cancella, modifica)


-- Cosa sono le view -> insieme di informazioni (tabelle)
--				Lo sviluppatore scrive lo script che genera la tabella
--				Non si possono fare operazioni di insert, update, delete

-- Sql supporta le variabili

CREATE PROCEDURE VoliDaMalpensa
AS

SELECT *
FROM dbo.ViewVoli
WHERE AereoportoDiPartenza = 'Malpensa'


EXEC VoliDaMalpensa;



CREATE PROCEDURE VoliDaUnaMeta
@aereoporto nvarchar(50)
AS

SELECT *
FROM dbo.ViewVoli
WHERE AereoportoDiPartenza = @aereoporto


EXEC VoliDaUnaMeta 'Heathrow';