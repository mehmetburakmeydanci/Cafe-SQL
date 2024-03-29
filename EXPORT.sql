USE [master]
GO
/****** Object:  Database [cafe]    Script Date: 28/12/2023 22:06:52 ******/
CREATE DATABASE [cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cafe] SET RECOVERY FULL 
GO
ALTER DATABASE [cafe] SET  MULTI_USER 
GO
ALTER DATABASE [cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cafe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cafe', N'ON'
GO
USE [cafe]
GO
/****** Object:  UserDefinedFunction [dbo].[ArtisOraniIleMaasArttir]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ArtisOraniIleMaasArttir] (
    @personelID INT,
    @artisOrani DECIMAL(5, 2) -- Örnek olarak yüzde cinsinden bir oran
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @yenimaas DECIMAL(10, 2);

    SELECT @yenimaas = maas * (1 + @artisOrani / 100)
    FROM Personel
    WHERE personel_id = @personelID;

    RETURN @yenimaas;
END;
GO
/****** Object:  Table [dbo].[çalisan_yillik_gelir]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[çalisan_yillik_gelir](
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
	[maas] [decimal](10, 2) NULL,
	[ise_baslama_tarihi] [date] NULL,
	[toplam ödeme] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[fatura_id] [int] IDENTITY(1,1) NOT NULL,
	[islem_tarihi] [varchar](50) NULL,
	[odenecek_tutar] [varchar](50) NULL,
	[odeme_turu] [varchar](50) NULL,
	[siparis_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fatura_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[kategori_id] [int] IDENTITY(1,1) NOT NULL,
	[Kategori_Ad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[kategori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Ad] [varchar](50) NULL,
	[Fiyat] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[musteri_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
	[telefon] [varchar](15) NULL,
	[email] [varchar](100) NULL,
	[adres] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[ogrenci_id] [int] NOT NULL,
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
	[yas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ogrenci_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[personel_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
	[tc_no] [varchar](11) NOT NULL,
	[telefon_no] [varchar](15) NULL,
	[e_mail] [varchar](50) NULL,
	[maas] [decimal](10, 2) NULL,
	[ise_baslama_tarihi] [date] NULL,
	[adres] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[siparis_id] [int] IDENTITY(1,1) NOT NULL,
	[Siparis_Tarihi] [date] NULL,
	[menuID] [int] NOT NULL,
	[musteri_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[siparis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDurumu]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDurumu](
	[durum_id] [int] IDENTITY(1,1) NOT NULL,
	[siparis_id] [int] NULL,
	[durum] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[durum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sube]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sube](
	[sube_id] [int] IDENTITY(1,1) NOT NULL,
	[Sube_Ad] [nvarchar](max) NULL,
	[Sube_Tel] [nchar](11) NULL,
	[adres] [varchar](255) NULL,
	[personel_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sube_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unvan]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unvan](
	[unvan_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_id] [int] NULL,
	[unvan_adi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[unvan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 28/12/2023 22:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[urun_id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_Ad] [varchar](50) NULL,
	[Menu_id] [int] NULL,
	[Kategori_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
