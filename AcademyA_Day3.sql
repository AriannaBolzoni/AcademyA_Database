USE [master]
GO
/****** Object:  Database [AcademyA.ControlloVoli]    Script Date: 16/02/2022 11:25:30 ******/
CREATE DATABASE [AcademyA.ControlloVoli]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademyA.ControlloVoli', FILENAME = N'C:\Users\arian\AcademyA.ControlloVoli.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcademyA.ControlloVoli_log', FILENAME = N'C:\Users\arian\AcademyA.ControlloVoli_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademyA.ControlloVoli].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET  MULTI_USER 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET QUERY_STORE = OFF
GO
USE [AcademyA.ControlloVoli]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AcademyA.ControlloVoli]
GO
/****** Object:  Table [dbo].[Aereoporti]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aereoporti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Citta] [nvarchar](50) NOT NULL,
	[Nazione] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Aereoporti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aerei]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aerei](
	[Codice] [int] IDENTITY(1,1) NOT NULL,
	[NumeroPasseggeri] [int] NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Aerei] PRIMARY KEY CLUSTERED 
(
	[Codice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompagnieAeree]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompagnieAeree](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Sede] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompagnieAeree] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gates]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAereoporto] [int] NOT NULL,
	[Numero] [int] NOT NULL,
 CONSTRAINT [PK_Gates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voli]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voli](
	[CodiceVolo] [int] IDENTITY(1,1) NOT NULL,
	[Partenza] [datetime] NOT NULL,
	[Arrivo] [datetime] NOT NULL,
	[IdAereoportoPartenza] [int] NOT NULL,
	[IdAereoportoArrivo] [int] NOT NULL,
	[IdAereo] [int] NOT NULL,
	[IdCompagniaAerea] [int] NOT NULL,
	[IdGate] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewVoli]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewVoli]
AS
(
	SELECT  v.CodiceVolo,
			v.Partenza,
			v.Arrivo,
			AereoportoDiPartenza		= ap.Nome,
			CittaDiPartenza				= ap.Citta,
			AereoportoDiArrivo			= ap2.Nome,
			CittaDiArrivo				= ap2.Citta,
			TipoAereo					= a.Tipo,
			Compagnia					= ca.Nome,
			NumeroGate					= g.Numero
	FROM dbo.Voli			AS v
	JOIN dbo.Aereoporti		AS ap
	ON ap.Id = v.IdAereoportoPartenza
	JOIN dbo.Aereoporti		AS ap2
	ON ap2.Id = v.IdAereoportoArrivo
	JOIN dbo.Aerei			AS a
	ON a.Codice = v.IdAereo
	JOIN dbo.Gates			AS g
	ON g.Id = v.IdGate
	JOIN dbo.CompagnieAeree	AS ca
	ON ca.Id = v.IdCompagniaAerea
)
GO
/****** Object:  Table [dbo].[GestionePosti]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GestionePosti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdVolo] [int] NOT NULL,
	[PostiRimasti] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prezzi]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prezzi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdVolo] [int] NOT NULL,
	[Classe] [int] NOT NULL,
	[Prezzo] [float] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aerei] ON 

INSERT [dbo].[Aerei] ([Codice], [NumeroPasseggeri], [Tipo]) VALUES (1, 250, N'Boeing 747')
INSERT [dbo].[Aerei] ([Codice], [NumeroPasseggeri], [Tipo]) VALUES (2, 20, N'Aliante X')
INSERT [dbo].[Aerei] ([Codice], [NumeroPasseggeri], [Tipo]) VALUES (3, 6, N'Lux')
INSERT [dbo].[Aerei] ([Codice], [NumeroPasseggeri], [Tipo]) VALUES (4, 500, N'Boeing 757')
SET IDENTITY_INSERT [dbo].[Aerei] OFF
GO
SET IDENTITY_INSERT [dbo].[Aereoporti] ON 

INSERT [dbo].[Aereoporti] ([Id], [Nome], [Citta], [Nazione]) VALUES (1, N'Malpensa', N'Milano', N'Italia')
INSERT [dbo].[Aereoporti] ([Id], [Nome], [Citta], [Nazione]) VALUES (2, N'Heathrow', N'Londra', N'Inghilterra')
INSERT [dbo].[Aereoporti] ([Id], [Nome], [Citta], [Nazione]) VALUES (3, N'Goldcar', N'Ibiza', N'Spagna')
INSERT [dbo].[Aereoporti] ([Id], [Nome], [Citta], [Nazione]) VALUES (4, N'Newark-Liberty', N'New York', N'USA')
SET IDENTITY_INSERT [dbo].[Aereoporti] OFF
GO
SET IDENTITY_INSERT [dbo].[CompagnieAeree] ON 

INSERT [dbo].[CompagnieAeree] ([Id], [Nome], [Sede]) VALUES (1, N'Alitalia', N'Fiumicino')
INSERT [dbo].[CompagnieAeree] ([Id], [Nome], [Sede]) VALUES (2, N'Ryanair', N'Swords')
INSERT [dbo].[CompagnieAeree] ([Id], [Nome], [Sede]) VALUES (3, N'Emirates', N'Dubai')
SET IDENTITY_INSERT [dbo].[CompagnieAeree] OFF
GO
SET IDENTITY_INSERT [dbo].[Gates] ON 

INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (1, 1, 1)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (2, 1, 2)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (3, 1, 3)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (4, 2, 1)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (5, 2, 2)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (6, 2, 3)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (7, 2, 4)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (8, 3, 1)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (9, 4, 1)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (10, 4, 2)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (11, 4, 3)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (12, 4, 4)
INSERT [dbo].[Gates] ([Id], [IdAereoporto], [Numero]) VALUES (13, 4, 5)
SET IDENTITY_INSERT [dbo].[Gates] OFF
GO
SET IDENTITY_INSERT [dbo].[GestionePosti] ON 

INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (1, 1, 244)
INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (2, 2, 500)
INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (3, 3, 1)
INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (4, 4, 20)
INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (5, 5, 6)
INSERT [dbo].[GestionePosti] ([Id], [IdVolo], [PostiRimasti]) VALUES (6, 6, 500)
SET IDENTITY_INSERT [dbo].[GestionePosti] OFF
GO
SET IDENTITY_INSERT [dbo].[Prezzi] ON 

INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (1, 1, 1, 200)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (2, 1, 2, 80)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (3, 2, 1, 450)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (4, 2, 2, 130)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (5, 3, 1, 382)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (6, 3, 2, 147)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (7, 4, 1, 550)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (8, 4, 2, 398)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (9, 5, 1, 79)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (10, 5, 2, 10)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (11, 6, 1, 146)
INSERT [dbo].[Prezzi] ([Id], [IdVolo], [Classe], [Prezzo]) VALUES (12, 6, 2, 48)
SET IDENTITY_INSERT [dbo].[Prezzi] OFF
GO
SET IDENTITY_INSERT [dbo].[Voli] ON 

INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (1, CAST(N'2022-02-15T12:49:00.000' AS DateTime), CAST(N'2022-02-15T15:32:00.000' AS DateTime), 1, 2, 1, 1, 3)
INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (2, CAST(N'2022-02-15T16:48:00.000' AS DateTime), CAST(N'2022-02-17T02:55:00.000' AS DateTime), 1, 4, 4, 1, 1)
INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (3, CAST(N'2022-04-03T14:35:00.000' AS DateTime), CAST(N'2022-04-03T22:12:00.000' AS DateTime), 2, 4, 3, 2, 7)
INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (4, CAST(N'2022-06-15T06:45:00.000' AS DateTime), CAST(N'2022-06-15T08:06:00.000' AS DateTime), 2, 4, 2, 3, 6)
INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (5, CAST(N'2022-08-12T04:32:00.000' AS DateTime), CAST(N'2022-08-12T09:48:00.000' AS DateTime), 3, 1, 3, 2, 8)
INSERT [dbo].[Voli] ([CodiceVolo], [Partenza], [Arrivo], [IdAereoportoPartenza], [IdAereoportoArrivo], [IdAereo], [IdCompagniaAerea], [IdGate]) VALUES (6, CAST(N'2022-08-12T17:05:00.000' AS DateTime), CAST(N'2022-08-12T22:08:00.000' AS DateTime), 4, 3, 4, 3, 13)
SET IDENTITY_INSERT [dbo].[Voli] OFF
GO
ALTER TABLE [dbo].[Gates]  WITH CHECK ADD  CONSTRAINT [FK_Gates_Aereoporti] FOREIGN KEY([IdAereoporto])
REFERENCES [dbo].[Aereoporti] ([Id])
GO
ALTER TABLE [dbo].[Gates] CHECK CONSTRAINT [FK_Gates_Aereoporti]
GO
ALTER TABLE [dbo].[Voli]  WITH CHECK ADD  CONSTRAINT [FK_Voli_Aerei] FOREIGN KEY([IdAereo])
REFERENCES [dbo].[Aerei] ([Codice])
GO
ALTER TABLE [dbo].[Voli] CHECK CONSTRAINT [FK_Voli_Aerei]
GO
ALTER TABLE [dbo].[Voli]  WITH CHECK ADD  CONSTRAINT [FK_Voli_Aereoporti] FOREIGN KEY([IdAereoportoArrivo])
REFERENCES [dbo].[Aereoporti] ([Id])
GO
ALTER TABLE [dbo].[Voli] CHECK CONSTRAINT [FK_Voli_Aereoporti]
GO
ALTER TABLE [dbo].[Voli]  WITH CHECK ADD  CONSTRAINT [FK_Voli_Aereoporti1] FOREIGN KEY([IdAereoportoPartenza])
REFERENCES [dbo].[Aereoporti] ([Id])
GO
ALTER TABLE [dbo].[Voli] CHECK CONSTRAINT [FK_Voli_Aereoporti1]
GO
ALTER TABLE [dbo].[Voli]  WITH CHECK ADD  CONSTRAINT [FK_Voli_CompagnieAeree] FOREIGN KEY([IdCompagniaAerea])
REFERENCES [dbo].[CompagnieAeree] ([Id])
GO
ALTER TABLE [dbo].[Voli] CHECK CONSTRAINT [FK_Voli_CompagnieAeree]
GO
ALTER TABLE [dbo].[Voli]  WITH CHECK ADD  CONSTRAINT [FK_Voli_Gates] FOREIGN KEY([IdGate])
REFERENCES [dbo].[Gates] ([Id])
GO
ALTER TABLE [dbo].[Voli] CHECK CONSTRAINT [FK_Voli_Gates]
GO
/****** Object:  StoredProcedure [dbo].[CalcoloPrezzo]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalcoloPrezzo]
 @idVolo int, @classe int, @numPersone int
AS

SELECT 
		PrezzoTotale = Prezzo * @numPersone
FROM dbo.Prezzi
WHERE IdVolo = @idVolo
AND classe = @classe

UPDATE dbo.GestionePosti
SET PostiRimasti = PostiRimasti - @numPersone
WHERE IdVolo = @idVolo

SELECT *
FROM dbo.GestionePosti
GO
/****** Object:  StoredProcedure [dbo].[VoliDaMalpensa]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VoliDaMalpensa]
AS

SELECT *
FROM dbo.ViewVoli
WHERE AereoportoDiPartenza = 'Malpensa'
GO
/****** Object:  StoredProcedure [dbo].[VoliDaUnaMeta]    Script Date: 16/02/2022 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VoliDaUnaMeta]
@aereoporto nvarchar(50)
AS

SELECT *
FROM dbo.ViewVoli
WHERE AereoportoDiPartenza = @aereoporto
GO
USE [master]
GO
ALTER DATABASE [AcademyA.ControlloVoli] SET  READ_WRITE 
GO
