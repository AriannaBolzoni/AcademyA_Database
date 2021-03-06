USE [master]
GO
/****** Object:  Database [AcademyA.AziendaInformatica]    Script Date: 17/02/2022 14:40:19 ******/
CREATE DATABASE [AcademyA.AziendaInformatica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademyA.AziendaInformatica', FILENAME = N'C:\Users\arian\AcademyA.AziendaInformatica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcademyA.AziendaInformatica_log', FILENAME = N'C:\Users\arian\AcademyA.AziendaInformatica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademyA.AziendaInformatica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET  MULTI_USER 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET QUERY_STORE = OFF
GO
USE [AcademyA.AziendaInformatica]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AcademyA.AziendaInformatica]
GO
/****** Object:  Table [dbo].[Dipendenti]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dipendenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[DataDiNascita] [datetime] NOT NULL,
	[DataInizioAttivita] [datetime] NOT NULL,
	[IdMansione] [int] NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[CostoOrario] [float] NOT NULL,
 CONSTRAINT [PK_Dipendenti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mansioni]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mansioni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Mansioni] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commesse]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commesse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[DataInizio] [datetime] NOT NULL,
	[DataFine] [datetime] NOT NULL,
	[Descrizione] [nvarchar](100) NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Commesse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attivita]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attivita](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCommessa] [int] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[OreAllocate] [int] NOT NULL,
	[CostoOrario] [float] NOT NULL,
	[IdDipendente] [int] NOT NULL,
 CONSTRAINT [PK_Attivita] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AllocazioneDipendenti]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllocazioneDipendenti]
AS
SELECT
		--*, 
		--DataDiOggi = GETDATE(),
		--DataDiOggiSenzaOrario = CONVERT(date, GETDATE()),
		--CommessaTerminata = IIF(CONVERT(date, GETDATE()) > c.DataFine, 0, 1),
		d.Nome, 
		d.Cognome,
		d.DataDiNascita,
		d.DataInizioAttivita,
		Mansione = m.Nome,
		SenzaAllocazione = IIF(
								SUM(
										IIF(CONVERT(date, GETDATE()) > c.DataFine, 
											0, 
											1))
								> 0, 
								0,
								1)
FROM dbo.Dipendenti				AS d
	JOIN dbo.Mansioni			AS m
		ON d.IdMansione = m.Id
	JOIN dbo.Attivita			AS a
		ON a.IdDipendente = d.Id
	JOIN dbo.Commesse			AS c
		On c.Id = a.IdCommessa

GROUP BY d.Nome, d.Cognome, d.DataDiNascita, d.DataInizioAttivita, m.Nome
GO
/****** Object:  Table [dbo].[Clienti]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clienti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Citta] [nvarchar](50) NOT NULL,
	[Regione] [nvarchar](50) NOT NULL,
	[Provicia] [nvarchar](2) NOT NULL,
	[IdDimensioneAzienda] [int] NOT NULL,
	[NomeReferente] [nvarchar](50) NOT NULL,
	[CognomeReferente] [nvarchar](50) NOT NULL,
	[MailReferente] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clienti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClienteSenzaCommesse]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClienteSenzaCommesse]
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
GO
/****** Object:  View [dbo].[ClientiPiuRemunerativi]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClientiPiuRemunerativi]
AS
SELECT --*,
	Cliente			= cl.Nome,
	Commessa		= co.Nome,
	--TotaleCommessa	= a.OreAllocate * a.CostoOrario 
	OreAllocate			= SUM(a.OreAllocate),
	Fatturato           = SUM(a.OreAllocate * a.CostoOrario)
FROM dbo.Clienti			AS cl
	JOIN dbo.Commesse		AS co
		ON cl.Id = co.IdCliente
	JOIN dbo.Attivita		AS a
		ON a.IdCommessa = co.Id
GROUP BY co.Nome, cl.nome
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAttivita] [int] NOT NULL,
	[IdDipendente] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Ore] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PercAllocazioneDipendenti]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PercAllocazioneDipendenti]
AS
SELECT 
	IdDipendente,
	Mese = Month(Data),
	-- DATENAME mette in chiaro il nome del mese
	 MeseInChiaro = DATENAME(MONTH, Data),
	OreLavorate = SUM(Ore),
	AllocazioneMedia = (CAST(SUM(Ore) AS decimal)) / (8*20) * 100
FROM Timesheet
GROUP BY IdDipendente, MONTH(data), DATENAME(MONTH, Data)
GO
/****** Object:  View [dbo].[FattAllocazioneDipendenti]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FattAllocazioneDipendenti]
AS
SELECT --*,
	t.IdDipendente,
	Mese = Month(Data),
	--FatturatoAGiornata = t.Ore * a.CostoOrario--,
	FatturatoTotale   = SUM(t.Ore * a.CostoOrario)
FROM Timesheet			AS t
JOIN dbo.Attivita		AS a
ON a.Id = t.IdAttivita
GROUP BY t.IdDipendente, MONTH(data)
GO
/****** Object:  View [dbo].[MargineGuadagno]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MargineGuadagno]
AS
SELECT  d.Nome,
		d.Cognome,
		Stipendio	= d.CostoOrario * 160,
		Mese		= DATENAME(MONTH, fad.Mese),
		MargineGuadagno = fad.FatturatoTotale - (d.CostoOrario * 160)
FROM dbo.Dipendenti					AS d
JOIN dbo.FattAllocazioneDipendenti	AS fad
ON d.Id = fad.IdDipendente
GO
/****** Object:  Table [dbo].[Dimensioni]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimensioni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dimensioni] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attivita] ON 

INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (1, 1, N'Sviluppo', 300, 5, 1)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (2, 1, N'Sviluppo', 80, 5, 2)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (3, 1, N'Testing', 40, 3, 1)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (4, 1, N'Testing', 60, 4, 3)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (5, 2, N'Analisi', 200, 7, 4)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (6, 2, N'Sviluppo', 100, 8, 4)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (7, 3, N'Testing', 50, 10, 1)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (8, 4, N'Autoformazione', 10, 5, 3)
INSERT [dbo].[Attivita] ([Id], [IdCommessa], [Nome], [OreAllocate], [CostoOrario], [IdDipendente]) VALUES (9, 4, N'Docenza', 100, 5, 3)
SET IDENTITY_INSERT [dbo].[Attivita] OFF
GO
SET IDENTITY_INSERT [dbo].[Clienti] ON 

INSERT [dbo].[Clienti] ([Id], [Nome], [Citta], [Regione], [Provicia], [IdDimensioneAzienda], [NomeReferente], [CognomeReferente], [MailReferente]) VALUES (1, N'Yoox', N'Milano', N'Lombardia', N'MI', 1, N'Luca', N'Gaias', N'lucagaias#yoox.com')
INSERT [dbo].[Clienti] ([Id], [Nome], [Citta], [Regione], [Provicia], [IdDimensioneAzienda], [NomeReferente], [CognomeReferente], [MailReferente]) VALUES (2, N'Banca D''Asti', N'Asti', N'Piemonte', N'AT', 2, N'Giovanni', N'Rossi', N'giovannirossi@bancasti.it')
INSERT [dbo].[Clienti] ([Id], [Nome], [Citta], [Regione], [Provicia], [IdDimensioneAzienda], [NomeReferente], [CognomeReferente], [MailReferente]) VALUES (3, N'Avanade', N'Milano', N'Lombardia', N'MI', 1, N'Carolina', N'Bianchi', N'carolinabianchi@avanade.it')
SET IDENTITY_INSERT [dbo].[Clienti] OFF
GO
SET IDENTITY_INSERT [dbo].[Commesse] ON 

INSERT [dbo].[Commesse] ([Id], [Nome], [DataInizio], [DataFine], [Descrizione], [IdCliente]) VALUES (1, N'Rulliera', CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Realizzazione di un portale per gestire i pacchi resi...', 1)
INSERT [dbo].[Commesse] ([Id], [Nome], [DataInizio], [DataFine], [Descrizione], [IdCliente]) VALUES (2, N'Analisi frodi', CAST(N'2021-06-01T00:00:00.000' AS DateTime), CAST(N'2023-05-15T00:00:00.000' AS DateTime), N'Analisi in merito ai pacchi persi', 1)
INSERT [dbo].[Commesse] ([Id], [Nome], [DataInizio], [DataFine], [Descrizione], [IdCliente]) VALUES (3, N'Tool di testing', CAST(N'2021-03-12T00:00:00.000' AS DateTime), CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'Sviluppo di test automatici', 2)
INSERT [dbo].[Commesse] ([Id], [Nome], [DataInizio], [DataFine], [Descrizione], [IdCliente]) VALUES (4, N'Erogazione corsi', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime), N'Corsi piattaforma .Net', 3)
SET IDENTITY_INSERT [dbo].[Commesse] OFF
GO
SET IDENTITY_INSERT [dbo].[Dimensioni] ON 

INSERT [dbo].[Dimensioni] ([Id], [Nome]) VALUES (1, N'Enterprise')
INSERT [dbo].[Dimensioni] ([Id], [Nome]) VALUES (2, N'Grande')
INSERT [dbo].[Dimensioni] ([Id], [Nome]) VALUES (3, N'Media')
INSERT [dbo].[Dimensioni] ([Id], [Nome]) VALUES (4, N'Piccola')
SET IDENTITY_INSERT [dbo].[Dimensioni] OFF
GO
SET IDENTITY_INSERT [dbo].[Dipendenti] ON 

INSERT [dbo].[Dipendenti] ([Id], [Nome], [Cognome], [DataDiNascita], [DataInizioAttivita], [IdMansione], [Mail], [CostoOrario]) VALUES (1, N'Arianna', N'Bolzoni', CAST(N'1991-07-05T00:00:00.000' AS DateTime), CAST(N'2018-03-15T00:00:00.000' AS DateTime), 3, N'arianna.bolzoni@icubed.it', 8)
INSERT [dbo].[Dipendenti] ([Id], [Nome], [Cognome], [DataDiNascita], [DataInizioAttivita], [IdMansione], [Mail], [CostoOrario]) VALUES (2, N'Renata', N'Carriero', CAST(N'1990-11-14T00:00:00.000' AS DateTime), CAST(N'2017-10-01T00:00:00.000' AS DateTime), 2, N'renata.carriero@icubed.it', 10)
INSERT [dbo].[Dipendenti] ([Id], [Nome], [Cognome], [DataDiNascita], [DataInizioAttivita], [IdMansione], [Mail], [CostoOrario]) VALUES (3, N'Alessandra', N'Degan', CAST(N'1989-04-01T00:00:00.000' AS DateTime), CAST(N'2020-09-08T00:00:00.000' AS DateTime), 1, N'alessandra.degan@icubed.it', 12)
INSERT [dbo].[Dipendenti] ([Id], [Nome], [Cognome], [DataDiNascita], [DataInizioAttivita], [IdMansione], [Mail], [CostoOrario]) VALUES (4, N'Antonia', N'Sacchitella', CAST(N'1992-01-15T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), 4, N'antonia.sacchitella@icubed.it', 7)
SET IDENTITY_INSERT [dbo].[Dipendenti] OFF
GO
SET IDENTITY_INSERT [dbo].[Mansioni] ON 

INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (1, N'Manager')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (2, N'Senior Consultant')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (3, N'Consultant')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (4, N'Senior Analyst')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (5, N'Analyst')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (6, N'Manager')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (7, N'Senior Consultant')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (8, N'Consultant')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (9, N'Senior Analyst')
INSERT [dbo].[Mansioni] ([Id], [Nome]) VALUES (10, N'Analyst')
SET IDENTITY_INSERT [dbo].[Mansioni] OFF
GO
SET IDENTITY_INSERT [dbo].[Timesheet] ON 

INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (1, 1, 1, CAST(N'2022-01-15' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (2, 1, 1, CAST(N'2022-01-16' AS Date), 4)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (3, 3, 1, CAST(N'2022-01-16' AS Date), 4)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (4, 7, 1, CAST(N'2022-02-01' AS Date), 4)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (5, 1, 1, CAST(N'2022-01-16' AS Date), 4)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (6, 1, 2, CAST(N'2022-01-17' AS Date), 4)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (7, 1, 2, CAST(N'2022-01-18' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (8, 1, 2, CAST(N'2022-01-19' AS Date), 6)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (9, 1, 2, CAST(N'2022-02-16' AS Date), 7)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (10, 1, 2, CAST(N'2022-01-13' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (11, 4, 3, CAST(N'2022-01-14' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (12, 4, 3, CAST(N'2022-02-01' AS Date), 6)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (13, 8, 3, CAST(N'2022-01-02' AS Date), 3)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (14, 8, 3, CAST(N'2022-01-02' AS Date), 5)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (15, 9, 3, CAST(N'2022-01-03' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (16, 5, 4, CAST(N'2022-01-16' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (17, 5, 4, CAST(N'2022-01-17' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (18, 6, 4, CAST(N'2022-02-05' AS Date), 7)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (19, 6, 4, CAST(N'2022-02-05' AS Date), 1)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (20, 6, 4, CAST(N'2022-02-10' AS Date), 5)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (21, 1, 1, CAST(N'2022-02-17' AS Date), 6)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (22, 1, 1, CAST(N'2022-02-18' AS Date), 6)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (23, 7, 1, CAST(N'2022-02-19' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (24, 7, 1, CAST(N'2022-02-20' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (25, 7, 1, CAST(N'2022-02-21' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (26, 7, 1, CAST(N'2022-01-21' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (27, 7, 1, CAST(N'2022-01-22' AS Date), 8)
INSERT [dbo].[Timesheet] ([Id], [IdAttivita], [IdDipendente], [Data], [Ore]) VALUES (28, 7, 1, CAST(N'2022-01-23' AS Date), 8)
SET IDENTITY_INSERT [dbo].[Timesheet] OFF
GO
ALTER TABLE [dbo].[Attivita]  WITH CHECK ADD  CONSTRAINT [FK_Attivita_Commesse] FOREIGN KEY([IdCommessa])
REFERENCES [dbo].[Commesse] ([Id])
GO
ALTER TABLE [dbo].[Attivita] CHECK CONSTRAINT [FK_Attivita_Commesse]
GO
ALTER TABLE [dbo].[Attivita]  WITH CHECK ADD  CONSTRAINT [FK_Attivita_Dipendenti] FOREIGN KEY([IdDipendente])
REFERENCES [dbo].[Dipendenti] ([Id])
GO
ALTER TABLE [dbo].[Attivita] CHECK CONSTRAINT [FK_Attivita_Dipendenti]
GO
ALTER TABLE [dbo].[Clienti]  WITH CHECK ADD  CONSTRAINT [FK_Clienti_Dimensioni] FOREIGN KEY([IdDimensioneAzienda])
REFERENCES [dbo].[Dimensioni] ([Id])
GO
ALTER TABLE [dbo].[Clienti] CHECK CONSTRAINT [FK_Clienti_Dimensioni]
GO
ALTER TABLE [dbo].[Commesse]  WITH CHECK ADD  CONSTRAINT [FK_Commesse_Clienti] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clienti] ([Id])
GO
ALTER TABLE [dbo].[Commesse] CHECK CONSTRAINT [FK_Commesse_Clienti]
GO
ALTER TABLE [dbo].[Dipendenti]  WITH CHECK ADD  CONSTRAINT [FK_Dipendenti_Mansioni] FOREIGN KEY([IdMansione])
REFERENCES [dbo].[Mansioni] ([Id])
GO
ALTER TABLE [dbo].[Dipendenti] CHECK CONSTRAINT [FK_Dipendenti_Mansioni]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Attivita] FOREIGN KEY([IdAttivita])
REFERENCES [dbo].[Attivita] ([Id])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Attivita]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Dipendenti] FOREIGN KEY([IdDipendente])
REFERENCES [dbo].[Dipendenti] ([Id])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Dipendenti]
GO
/****** Object:  StoredProcedure [dbo].[InserimentoTimesheet]    Script Date: 17/02/2022 14:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserimentoTimesheet]
 @idAttivita int, @idDipendente int, @data date, @ore int
AS

INSERT INTO dbo.Timesheet
VALUES(@idAttivita, @idDipendente, @data, @ore)
GO
USE [master]
GO
ALTER DATABASE [AcademyA.AziendaInformatica] SET  READ_WRITE 
GO
