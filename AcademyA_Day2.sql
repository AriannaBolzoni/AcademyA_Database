USE [master]
GO
/****** Object:  Database [AcademyA.Musica]    Script Date: 15/02/2022 10:47:58 ******/
CREATE DATABASE [AcademyA.Musica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademyA.Musica', FILENAME = N'C:\Users\arian\AcademyA.Musica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcademyA.Musica_log', FILENAME = N'C:\Users\arian\AcademyA.Musica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AcademyA.Musica] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademyA.Musica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademyA.Musica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyA.Musica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademyA.Musica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AcademyA.Musica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademyA.Musica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcademyA.Musica] SET  MULTI_USER 
GO
ALTER DATABASE [AcademyA.Musica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademyA.Musica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademyA.Musica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademyA.Musica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcademyA.Musica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcademyA.Musica] SET QUERY_STORE = OFF
GO
USE [AcademyA.Musica]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AcademyA.Musica]
GO
/****** Object:  Table [dbo].[Generi]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Generi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artisti]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artisti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
 CONSTRAINT [PK_Artisti_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canzoni]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canzoni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](50) NOT NULL,
	[IdArtisti] [int] NOT NULL,
	[Durata] [time](7) NOT NULL,
	[IdGenere] [int] NOT NULL,
 CONSTRAINT [PK_Canzoni] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCanzoni]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCanzoni]
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
GO
/****** Object:  Table [dbo].[AnagraficaArtisti]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnagraficaArtisti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[IdNomeArte] [nvarchar](50) NULL,
 CONSTRAINT [PK_Artisti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistCanzoni]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistCanzoni](
	[IdPlaylist] [int] NOT NULL,
	[IdCanzoni] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 15/02/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnagraficaArtisti] ON 

INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (1, N'Lauro', N'De Marinis', N'5')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (2, N'Jacopo', N'D''amico', N'6')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (3, N'Michele', N'Bravi', N'10')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (4, N'Gian Luigi', N'Morandi', N'7')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (6, N'Francesco', N'Sarcina', N'1')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (7, N'Stefano', N'Verderi', N'1')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (8, N'Marco', N'Castellani', N'1')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (9, N'Alessandro', N'Deidda', N'1')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (10, N'Alessandro', N'Mahmoud', N'8')
INSERT [dbo].[AnagraficaArtisti] ([Id], [Nome], [Cognome], [IdNomeArte]) VALUES (11, N'Riccardo', N'Fabbriconi', N'8')
SET IDENTITY_INSERT [dbo].[AnagraficaArtisti] OFF
GO
SET IDENTITY_INSERT [dbo].[Artisti] ON 

INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (1, N'Le Vibrazioni')
INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (5, N'Achille Lauro')
INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (6, N'Dargen D''amico')
INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (7, N'Gianni Morandi')
INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (8, N'Mahmood & Blanco')
INSERT [dbo].[Artisti] ([Id], [Nome]) VALUES (10, N'Michele Bravi')
SET IDENTITY_INSERT [dbo].[Artisti] OFF
GO
SET IDENTITY_INSERT [dbo].[Canzoni] ON 

INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (3, N'Brividi', 8, CAST(N'00:03:19' AS Time), 4)
INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (5, N'Apri tutte le porte', 7, CAST(N'00:03:43' AS Time), 1)
INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (6, N'Domenica', 5, CAST(N'00:03:10' AS Time), 1)
INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (7, N'Dove si balla', 6, CAST(N'00:03:18' AS Time), 2)
INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (8, N'Tantissimo', 1, CAST(N'00:03:08' AS Time), 3)
INSERT [dbo].[Canzoni] ([Id], [Titolo], [IdArtisti], [Durata], [IdGenere]) VALUES (9, N'Inverno dei fiori', 10, CAST(N'00:02:56' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Canzoni] OFF
GO
SET IDENTITY_INSERT [dbo].[Generi] ON 

INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (1, N'Pop')
INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (2, N'Dance')
INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (3, N'Indie')
INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (4, N'Ballata')
SET IDENTITY_INSERT [dbo].[Generi] OFF
GO
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (1, 6)
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (1, 7)
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (1, 3)
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (2, 3)
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (2, 5)
INSERT [dbo].[PlaylistCanzoni] ([IdPlaylist], [IdCanzoni]) VALUES (2, 9)
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([Id], [Nome]) VALUES (1, N'Febbraio')
INSERT [dbo].[Playlists] ([Id], [Nome]) VALUES (2, N'Gennaio')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
ALTER TABLE [dbo].[Canzoni]  WITH CHECK ADD  CONSTRAINT [FK_Canzoni_Artisti] FOREIGN KEY([IdArtisti])
REFERENCES [dbo].[Artisti] ([Id])
GO
ALTER TABLE [dbo].[Canzoni] CHECK CONSTRAINT [FK_Canzoni_Artisti]
GO
ALTER TABLE [dbo].[Canzoni]  WITH CHECK ADD  CONSTRAINT [FK_Canzoni_Generi] FOREIGN KEY([IdGenere])
REFERENCES [dbo].[Generi] ([Id])
GO
ALTER TABLE [dbo].[Canzoni] CHECK CONSTRAINT [FK_Canzoni_Generi]
GO
ALTER TABLE [dbo].[PlaylistCanzoni]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCanzoni_Canzoni] FOREIGN KEY([IdCanzoni])
REFERENCES [dbo].[Canzoni] ([Id])
GO
ALTER TABLE [dbo].[PlaylistCanzoni] CHECK CONSTRAINT [FK_PlaylistCanzoni_Canzoni]
GO
ALTER TABLE [dbo].[PlaylistCanzoni]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCanzoni_Playlists] FOREIGN KEY([IdPlaylist])
REFERENCES [dbo].[Playlists] ([Id])
GO
ALTER TABLE [dbo].[PlaylistCanzoni] CHECK CONSTRAINT [FK_PlaylistCanzoni_Playlists]
GO
USE [master]
GO
ALTER DATABASE [AcademyA.Musica] SET  READ_WRITE 
GO
