USE [master]
GO
/****** Object:  Database [MvcDbStok]    Script Date: 14.07.2022 21:38:51 ******/
CREATE DATABASE [MvcDbStok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MvcDbStok', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MvcDbStok.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MvcDbStok_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MvcDbStok_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MvcDbStok] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MvcDbStok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ARITHABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MvcDbStok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MvcDbStok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MvcDbStok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MvcDbStok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MvcDbStok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MvcDbStok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MvcDbStok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECOVERY FULL 
GO
ALTER DATABASE [MvcDbStok] SET  MULTI_USER 
GO
ALTER DATABASE [MvcDbStok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MvcDbStok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MvcDbStok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MvcDbStok] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MvcDbStok] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MvcDbStok] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MvcDbStok', N'ON'
GO
ALTER DATABASE [MvcDbStok] SET QUERY_STORE = OFF
GO
USE [MvcDbStok]
GO
/****** Object:  Table [dbo].[Tbl_Kategoriler]    Script Date: 14.07.2022 21:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Kategoriler](
	[KategoriId] [smallint] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Musteriler]    Script Date: 14.07.2022 21:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Musteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAd] [varchar](50) NULL,
	[MusteriSoyad] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Satislar]    Script Date: 14.07.2022 21:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Satislar](
	[SatisId] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [tinyint] NULL,
	[Fiyat] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tbl_Satislar] PRIMARY KEY CLUSTERED 
(
	[SatisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Urunler]    Script Date: 14.07.2022 21:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Urunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](50) NULL,
	[Marka] [varchar](50) NULL,
	[UrunKategori] [smallint] NULL,
	[Fiyat] [decimal](18, 2) NULL,
	[Stok] [tinyint] NULL,
 CONSTRAINT [PK_Tbl_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Kategoriler] ON 

INSERT [dbo].[Tbl_Kategoriler] ([KategoriId], [KategoriAd]) VALUES (1, N'BEYAZ EŞYA')
INSERT [dbo].[Tbl_Kategoriler] ([KategoriId], [KategoriAd]) VALUES (2, N'KÜÇÜK EV ALETLERİ')
INSERT [dbo].[Tbl_Kategoriler] ([KategoriId], [KategoriAd]) VALUES (3, N'BİLGİSAYAR')
INSERT [dbo].[Tbl_Kategoriler] ([KategoriId], [KategoriAd]) VALUES (4, N'PC Ürünleri')
INSERT [dbo].[Tbl_Kategoriler] ([KategoriId], [KategoriAd]) VALUES (6, N'TV')
SET IDENTITY_INSERT [dbo].[Tbl_Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Musteriler] ON 

INSERT [dbo].[Tbl_Musteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (1, N'EMEL', N'ÇINAR')
INSERT [dbo].[Tbl_Musteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (2, N'ALİ', N'YILDIZ')
INSERT [dbo].[Tbl_Musteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (3, N'MEHMET', N'ÖZTÜRK')
INSERT [dbo].[Tbl_Musteriler] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (4, N'Mesut', N'Yücedağ')
SET IDENTITY_INSERT [dbo].[Tbl_Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Satislar] ON 

INSERT [dbo].[Tbl_Satislar] ([SatisId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (1, 4, 1, 1, CAST(145.00 AS Decimal(18, 2)))
INSERT [dbo].[Tbl_Satislar] ([SatisId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (2, 1, 1, 2, CAST(1450.00 AS Decimal(18, 2)))
INSERT [dbo].[Tbl_Satislar] ([SatisId], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (3, 1, 1, 2, CAST(1450.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Tbl_Satislar] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Urunler] ON 

INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (1, N'ÇAMAŞIR MAKİNESİ', N'ARÇELİK', 1, CAST(1235.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (2, N'BULAŞIK MAKİNESİ', N'ARÇELİK', 1, CAST(850.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (3, N'SU ISITICI', N'VESTEL', 2, CAST(25.00 AS Decimal(18, 2)), 50)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (4, N'ÜTÜ', N'TEFAL', 2, CAST(150.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (5, N'BUZDOLABI', N'REGAL', 1, CAST(2500.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (6, N'LAPTOP NIRVANA', N'TOSHIBA', 3, CAST(3450.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (7, N'LAPTOP A5', N'MONSTER', 3, CAST(6542.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (8, N'HDD 250 GB', N'TOSHIBA', 4, CAST(150.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (9, N'SSD 250GB', N'KINGSTON', 3, CAST(260.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Tbl_Urunler] ([UrunId], [UrunAd], [Marka], [UrunKategori], [Fiyat], [Stok]) VALUES (11, N'Mouse', N'Logitech', 6, CAST(20.00 AS Decimal(18, 2)), 10)
SET IDENTITY_INSERT [dbo].[Tbl_Urunler] OFF
GO
ALTER TABLE [dbo].[Tbl_Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Satislar_Tbl_Musteriler] FOREIGN KEY([Musteri])
REFERENCES [dbo].[Tbl_Musteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[Tbl_Satislar] CHECK CONSTRAINT [FK_Tbl_Satislar_Tbl_Musteriler]
GO
ALTER TABLE [dbo].[Tbl_Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Satislar_Tbl_Urunler] FOREIGN KEY([Urun])
REFERENCES [dbo].[Tbl_Urunler] ([UrunId])
GO
ALTER TABLE [dbo].[Tbl_Satislar] CHECK CONSTRAINT [FK_Tbl_Satislar_Tbl_Urunler]
GO
ALTER TABLE [dbo].[Tbl_Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Urunler_Tbl_Kategoriler] FOREIGN KEY([UrunKategori])
REFERENCES [dbo].[Tbl_Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[Tbl_Urunler] CHECK CONSTRAINT [FK_Tbl_Urunler_Tbl_Kategoriler]
GO
USE [master]
GO
ALTER DATABASE [MvcDbStok] SET  READ_WRITE 
GO
