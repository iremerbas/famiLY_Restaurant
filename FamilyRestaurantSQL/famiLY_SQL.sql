USE [master]
GO
/****** Object:  Database [famiLYRestaurantDb]    Script Date: 26.12.2022 09:30:58 ******/
CREATE DATABASE [famiLYRestaurantDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'famiLYRestaurantDb', FILENAME = N'C:\Users\Dell\famiLYRestaurantDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'famiLYRestaurantDb_log', FILENAME = N'C:\Users\Dell\famiLYRestaurantDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [famiLYRestaurantDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [famiLYRestaurantDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [famiLYRestaurantDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [famiLYRestaurantDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [famiLYRestaurantDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [famiLYRestaurantDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [famiLYRestaurantDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET RECOVERY FULL 
GO
ALTER DATABASE [famiLYRestaurantDb] SET  MULTI_USER 
GO
ALTER DATABASE [famiLYRestaurantDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [famiLYRestaurantDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [famiLYRestaurantDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [famiLYRestaurantDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [famiLYRestaurantDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [famiLYRestaurantDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [famiLYRestaurantDb] SET QUERY_STORE = OFF
GO
USE [famiLYRestaurantDb]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NULL,
	[TableName] [nvarchar](100) NULL,
	[WaiterId] [int] NULL,
	[Date] [date] NULL,
	[TotalPrice] [float] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillPay]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillPay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NULL,
	[PayName] [nvarchar](50) NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillProduct]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[ProductId] [int] NULL,
	[ProductTotal] [float] NULL,
	[Piece] [int] NULL,
	[Price] [float] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Surname] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[RegistrationNo] [nvarchar](6) NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Surname] [nvarchar](100) NULL,
	[Balance] [float] NULL,
	[OrderQuantity] [int] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitchen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Stock] [int] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductCategory] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuKitchenn]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuKitchenn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NULL,
	[KitchenId] [int] NULL,
	[Piece] [float] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rapor]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rapor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CashTotal] [float] NULL,
	[Iban] [float] NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Waiter]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waiter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Surname] [nvarchar](100) NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
	[Phone] [nchar](14) NULL,
	[Email] [nchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BillProduct] ON 

INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5019, 5012, 1, 75, 5, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5020, 5013, 9, 168, 3, 56, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5021, 5013, 1, 75, 5, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5022, 5013, 4, 60, 4, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5023, 5014, 7, 100, 4, 25, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5024, 5015, 2, 75, 5, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (5025, 5016, 1, 45, 3, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (6013, 6008, 1, 45, 3, 15, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (6014, 6009, 4, 60, 4, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (6015, 6009, 9, 224, 4, 56, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7013, 7008, 6, 20, 1, 20, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7014, 7008, 13, 22, 1, 22, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7015, 7008, 32, 35, 1, 35, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7016, 7008, 48, 30, 2, 15, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7017, 7008, 51, 40, 2, 20, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (7018, 7008, 48, 30, 2, 15, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (8013, 8008, 9, 168, 3, 56, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (8014, 8008, 12, 96, 3, 32, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (8015, 8008, 8, 90, 3, 30, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (8016, 8008, 13, 66, 3, 22, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (9013, 9008, 32, 385, 11, 35, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (9014, 9008, 5, 15, 1, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (9015, 9009, 6, 20, 1, 20, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (9016, 9008, 3, 15, 1, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (9017, 9008, 9, 56, 1, 56, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10013, 10009, 6, 100, 5, 20, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10014, 10009, 10, 275, 5, 55, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10015, 10009, 14, 100, 5, 20, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10016, 10010, 15, 25, 1, 25, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10017, 10011, 9, 56, 1, 56, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10018, 10012, 5, 30, 2, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10019, 10012, 10, 110, 2, 55, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10020, 10012, 36, 24, 2, 12, 1, 1)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10021, 10013, 3, 15, 1, 15, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10022, 10013, 8, 30, 1, 30, 1, 0)
INSERT [dbo].[BillProduct] ([Id], [BillId], [ProductId], [ProductTotal], [Piece], [Price], [IsStatus], [IsDelete]) VALUES (10023, 10012, 6, 20, 1, 20, 1, 0)
SET IDENTITY_INSERT [dbo].[BillProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Cashier] ON 

INSERT [dbo].[Cashier] ([Id], [Name], [Surname], [Password], [RegistrationNo], [IsStatus], [IsDelete]) VALUES (1, N'Mert', N'Yılmaz', N'123', N'123456', 1, 0)
SET IDENTITY_INSERT [dbo].[Cashier] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitchen] ON 

INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1, N'Mercimek', N'Gram', 1, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (2, N'Soğan', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (3, N'Havuç', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (4, N'Patates', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (5, N'Un', N'Gram', 20000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (6, N'Salça', N'Gram', 20000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (7, N'Sıvıyağ', N'Gram', 2000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (8, N'Su', N'Litre', 200000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (9, N'Tereyağ', N'Gram', 2000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (10, N'Tel Şehriye', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (11, N'Maydanoz', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (12, N'Limon', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (13, N'Yumurta', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (14, N'Tavuk But', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (15, N'Mantar', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (16, N'Sıvı Krema', N'Gram', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (17, N'Domates', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (18, N'Süt', N'Litre', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (19, N'Kaşar', N'Gram', 500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (20, N'Pirinç', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (21, N'Yoğurt', N'Gram', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (22, N'Nane', N'Gram', 200, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (23, N'Kırmızı Biber', N'Quantity', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (24, N'Yeşil Biber', N'Quantity', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (25, N'Kıyma', N'Gram', 200000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (26, N'Patlıcan', N'Quantity', 800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (27, N'Ciğer', N'Gram', 5500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (28, N'Kuyruk Yağı', N'Gram', 500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (29, N'Sarımsak', N'Quantity', 500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (30, N'Maya', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (31, N'Et Döner', N'Gram', 2000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (32, N'Tavuk Göğsü', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (33, N'Levrek', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (34, N'Hamsi', N'Gram', 2000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (35, N'Mısır Unu', N'Gram', 5000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (36, N'Somon', N'Quantity', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (37, N'Dereotu', N'Quantity', 200, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (38, N'Brokoli', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (39, N'Kabak', N'Quantity', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (40, N'Havuç', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (41, N'Tam Buğday Makarna', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (42, N'Turşu ', N'Quantity', 200, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (43, N'Mısır', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (44, N'Çilek', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (45, N'Yulaf', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (46, N'Bal ', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (47, N'Muz', N'Quantity', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (48, N'Müsli', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (49, N'Salatalık', N'Quantity', 5000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (50, N'Roka', N'Quantity', 5000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (51, N'Sumak', N'Gram', 2000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1052, N'Kara Lahana', N'Quantity', 3600, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1053, N'Zeytinyağı', N'Gram', 470000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1054, N'Tuz', N'Gram', 150000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1055, N'Nar Ekşisi', N'Gram', 89000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1056, N'Marul', N'Quantity', 14000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1057, N'Limon', N'Quantity', 5500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1058, N'Kereviz', N'Quantity', 6400, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1059, N'Mayonez', N'Gram', 88000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1060, N'Ceviz', N'Quantity', 3300, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1061, N'Şeker', N'Gram', 45000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1062, N'Vanilya', N'Quantity', 23100, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1063, N'Çikolata Sosu', N'Gram', 11000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1064, N'Tel Kadayıf', N'Gram', 20000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1065, N'Antep Fıstığı', N'Quantity', 7700, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1066, N'Kabartma Tozu', N'Quantity', 3500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1067, N'Çikolata', N'Gram', 90000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1068, N'Nişasta', N'Gram', 4800, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1069, N'Bisküvi', N'Quantity', 12000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1070, N'Sirke', N'Gram', 66000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1071, N'Pirinç', N'Gram', 42000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1072, N'Kola', N'Quantity', 50000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1073, N'Meyve Suyu', N'Quantity', 12000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1074, N'Çay', N'Quantity', 111000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1075, N'Türk Kahvesi', N'Quantity', 36600, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1076, N'Latte', N'Quantity', 33000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1077, N'Filtre Kahve', N'Quantity', 25000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1078, N'Americano', N'Quantity', 14500, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1079, N'Espresso', N'Quantity', 11300, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1080, N'Mocha', N'Quantity', 1000000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1081, N'Cappuchino', N'Quantity', 530000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1082, N'Nohut', N'Gram', 57000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1083, N'Tahin', N'Gram', 663000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1084, N'Kimyon', N'Gram', 44000, 1, 0)
INSERT [dbo].[Kitchen] ([Id], [Name], [Unit], [Stock], [IsStatus], [IsDelete]) VALUES (1085, N'Maden Suyu', N'Quantity', 12000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kitchen] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (1, N'Mercimek Çorbası', N'Çorbalar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (2, N'Tavuk Suyu Çorbası', N'Çorbalar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (3, N'Kremalı Mantar Çorbası', N'Çorbalar', 15, 1, 1)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (4, N'Domates Çorbası', N'Çorbalar', 15, 1, 1)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (5, N'Yayla Çorbası', N'Çorbalar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (6, N'Lahmacun', N'Ana Yemekler', 20, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (7, N'Patlıcan Musakka', N'Ana Yemekler', 25, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (8, N'Ciğer Şiş', N'Ana Yemekler', 30, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (9, N'Adana Kebap', N'Ana Yemekler', 56, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (10, N'Urfa Kebap', N'Ana Yemekler', 55, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (11, N'İskender', N'Ana Yemekler', 50, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (12, N'Köfte', N'Ana Yemekler', 32, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (13, N'Tavuk Şiş', N'Ana Yemekler', 22, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (14, N'Tavuk Izgara', N'Ana Yemekler', 20, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (15, N'Fırında Levrek', N'Ana Yemekler', 48, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (16, N'Hamsi Tava', N'Ana Yemekler', 38, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (17, N'Somon', N'Ana Yemekler', 42, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (18, N'Buharda Sebze', N'Diyet Yemekler', 23, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (19, N'Tam Buğday Makarnalı Salata', N'Diyet Yemekler', 26, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (20, N' Kabak Yemeği', N'Diyet Yemekler', 27, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (21, N'Smoothie Bowl ', N'Diyet Yemekler', 24, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (22, N'Yoğurtlu Müsli', N'Diyet Yemekler', 18, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (23, N'Çoban Salatası', N'Salatalar', 12, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (24, N'Roka Salatası', N'Salatalar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (25, N'Sumaklı Soğan Salatası', N'Salatalar', 13, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (26, N'Mevsim Salatası', N'Salatalar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (27, N'Kereviz Salatası', N'Salatalar', 14, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (28, N'Profiterol', N'Tatlılar', 26, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (29, N'Kadayıf', N'Tatlılar', 24, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (30, N'Waffle', N'Tatlılar', 55, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (31, N'Magnolia', N'Tatlılar', 32, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (32, N'Baklava', N'Tatlılar', 35, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (33, N'Sütlaç', N'Tatlılar', 25, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (34, N'Ayran', N'Soğuk İçecekler', 7, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (35, N'Limonata', N'Soğuk İçecekler', 10, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (36, N'Kola', N'Soğuk İçecekler', 12, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (37, N'Meyve Suyu', N'Soğuk İçecekler', 12, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (38, N'Maden Suyu', N'Soğuk İçecekler', 14, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (39, N'Su', N'Soğuk İçecekler', 5, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (40, N'Çay', N'Sıcak İçecekler', 10, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (41, N'Türk Kahvesi', N'Sıcak İçecekler', 22, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (42, N'Latte', N'Sıcak İçecekler', 23, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (43, N'Mocha', N'Sıcak İçecekler', 23, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (44, N'Cappuccino', N'Sıcak İçecekler', 21, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (45, N'Filtre Kahve', N'Sıcak İçecekler', 18, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (46, N'Americano', N'Sıcak İçecekler', 18, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (47, N'Espresso', N'Sıcak İçecekler', 19, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (48, N'Humus', N'Ara Sıcaklar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (49, N'Mücver', N'Ara Sıcaklar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (50, N'Havuç Tarator', N'Ara Sıcaklar', 15, 1, 0)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (51, N'Beşeme Soslu Tavuk', N'et', 20, 1, 1)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (1051, N'qqqqqqqqqqqqqq', N'qqqq', 0, 1, 1)
INSERT [dbo].[Menu] ([Id], [ProductName], [ProductCategory], [Price], [IsStatus], [IsDelete]) VALUES (2051, N'sdfghjklş', N'pis
', 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuKitchenn] ON 

INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1002, 1, 1, 30, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1003, 1, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1004, 1, 3, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1005, 1, 4, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1006, 1, 5, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1007, 1, 6, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1008, 1, 7, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1009, 1, 8, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1010, 2, 9, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1011, 2, 10, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1012, 2, 11, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1013, 2, 12, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1014, 2, 13, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1015, 2, 5, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1016, 2, 7, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1017, 2, 14, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1018, 2, 8, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1019, 3, 15, 400, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1020, 3, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1021, 3, 5, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1022, 3, 16, 200, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1023, 3, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1024, 3, 9, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1025, 3, 11, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1026, 3, 8, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1027, 4, 17, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1028, 4, 9, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1029, 4, 5, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1030, 4, 8, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1031, 4, 18, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1032, 4, 19, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1033, 5, 20, 50, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1034, 5, 8, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1035, 5, 21, 210, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1036, 5, 13, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1037, 5, 5, 25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1038, 5, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1039, 5, 9, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1040, 5, 22, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1041, 6, 23, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1042, 6, 24, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1043, 6, 2, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1044, 6, 11, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1045, 6, 17, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1046, 6, 6, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1047, 6, 7, 80, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1048, 6, 8, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1049, 6, 25, 500, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1050, 6, 5, 550, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1051, 7, 7, 170, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1052, 7, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1053, 7, 24, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1054, 7, 26, 4, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1055, 7, 25, 300, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1056, 7, 6, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1057, 7, 17, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1058, 7, 8, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1059, 8, 27, 600, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1060, 8, 28, 300, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1061, 8, 7, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1062, 9, 25, 500, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1063, 9, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1064, 9, 28, 100, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1065, 9, 29, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1066, 9, 23, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1067, 9, 6, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1068, 9, 8, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1069, 9, 21, 90, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1070, 9, 7, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1071, 9, 30, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1072, 9, 5, 440, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1073, 10, 25, 1000, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1074, 10, 28, 50, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1075, 10, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1076, 10, 29, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1077, 10, 6, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1078, 11, 31, 600, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1079, 11, 9, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1080, 11, 6, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1081, 11, 8, 0.75, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1082, 11, 9, 125, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1083, 12, 25, 500, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1084, 12, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1085, 12, 29, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1086, 12, 13, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1087, 12, 5, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1088, 12, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1089, 12, 11, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1090, 13, 32, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1091, 13, 21, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1092, 13, 6, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1093, 13, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1094, 14, 32, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1095, 14, 6, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1096, 14, 21, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1097, 14, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1098, 15, 33, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1099, 15, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1100, 15, 17, 2, 1, 0)
GO
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1101, 15, 12, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1102, 15, 7, 40, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1103, 16, 34, 1000, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1104, 16, 35, 55, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1105, 16, 7, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1106, 17, 36, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1107, 17, 7, 40, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1108, 17, 29, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1109, 17, 12, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1110, 17, 37, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1111, 18, 38, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1112, 18, 39, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1113, 18, 40, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1114, 18, 12, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1115, 18, 7, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1116, 19, 41, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1117, 19, 21, 90, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1118, 19, 43, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1119, 19, 23, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1120, 19, 42, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1121, 19, 11, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1122, 19, 37, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1123, 20, 39, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1124, 20, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1125, 20, 17, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (1126, 20, 22, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (3065, 21, 44, 4, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4065, 21, 18, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4066, 21, 45, 90, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4067, 21, 8, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4068, 21, 47, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4069, 21, 46, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4070, 21, 46, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4071, 22, 21, 420, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4072, 22, 16, 60, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4073, 22, 48, 210, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4074, 22, 45, 105, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4075, 22, 44, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4076, 23, 49, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4077, 23, 2, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4078, 23, 24, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4079, 23, 11, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4080, 23, 12, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4081, 23, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4082, 24, 50, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4083, 24, 17, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4084, 24, 29, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4085, 24, 12, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4086, 24, 7, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4087, 25, 2, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4088, 25, 51, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4089, 25, 17, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4090, 25, 11, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4091, 25, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4092, 26, 1052, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4093, 26, 3, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4094, 26, 1056, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4095, 26, 1054, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4096, 26, 1055, 2.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4097, 26, 1057, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4098, 27, 1058, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4099, 27, 1057, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4100, 27, 21, 100, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4101, 27, 1059, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4102, 27, 1054, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4103, 27, 29, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4104, 27, 1060, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4105, 28, 8, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4106, 28, 5, 150, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4107, 28, 9, 125, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4108, 28, 13, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4109, 28, 18, 2.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4110, 28, 5, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4111, 28, 1061, 80, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4112, 28, 13, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4113, 28, 1062, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4114, 28, 1063, 25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4115, 29, 1064, 500, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4116, 29, 9, 200, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4117, 29, 1065, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4118, 29, 1061, 650, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4119, 29, 8, 1.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4120, 29, 57, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4121, 30, 13, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4122, 30, 1061, 150, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4123, 30, 18, 0.2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4124, 30, 7, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4125, 30, 1062, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4126, 30, 1066, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4127, 30, 5, 350, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4128, 30, 1054, 0.1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4129, 30, 44, 6, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4130, 30, 47, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4131, 30, 1067, 120, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4132, 31, 18, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4133, 31, 5, 30, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4134, 31, 1068, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4135, 31, 13, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4136, 31, 16, 100, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4137, 31, 1062, 1, 1, 0)
GO
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4138, 31, 1069, 14, NULL, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4139, 32, 9, 3650, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4140, 32, 7, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4141, 32, 18, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4142, 32, 13, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4143, 32, 1070, 13, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4144, 32, 1054, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4145, 32, 5, 800, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4146, 32, 21, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4147, 32, 8, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4148, 32, 1068, 200, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4149, 32, 1061, 500, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4150, 32, 1057, 0.25, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4151, 32, 1065, 15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4152, 33, 1071, 40, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4153, 33, 8, 0.4, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4154, 33, 18, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4155, 33, 1061, 200, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4156, 33, 1068, 20, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4157, 33, 8, 0.15, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4158, 34, 21, 0.2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4159, 34, 8, 0.1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4160, 35, 1057, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4161, 35, 8, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4162, 35, 1061, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4163, 36, 1072, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4164, 37, 1073, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4165, 38, 1085, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4166, 39, 8, 0.5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4167, 40, 1074, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4168, 41, 1075, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4169, 42, 1076, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4170, 43, 1080, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4171, 44, 1081, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4172, 45, 1077, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4173, 46, 1078, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4174, 47, 1079, 1, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4175, 48, 1083, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4176, 48, 29, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4177, 48, 1057, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4178, 48, 1084, 150, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4179, 48, 1053, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4180, 48, 1085, 5, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4181, 48, 1054, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4182, 49, 13, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4183, 49, 5, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4184, 49, 39, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4185, 49, 11, 4, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4186, 49, 1054, 3, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4187, 50, 40, 2, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4188, 50, 21, 100, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (4189, 32, 9, 250, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (5151, 1, 1, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6151, 1, 1054, 10, 1, 0)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6152, 1, 2, 3, 0, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6153, 1, 3, 3, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6154, 1, 6, 3, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6155, 2, 10, 3, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6156, 1, 2, 30, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (6157, 2, 11, 5, 1, 1)
INSERT [dbo].[MenuKitchenn] ([Id], [MenuId], [KitchenId], [Piece], [IsStatus], [IsDelete]) VALUES (7151, 1, 2, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[MenuKitchenn] OFF
GO
SET IDENTITY_INSERT [dbo].[Rapor] ON 

INSERT [dbo].[Rapor] ([Id], [CashTotal], [Iban], [TotalPrice]) VALUES (1, 630, 240, 870)
SET IDENTITY_INSERT [dbo].[Rapor] OFF
GO
SET IDENTITY_INSERT [dbo].[Waiter] ON 

INSERT [dbo].[Waiter] ([Id], [Name], [Surname], [IsStatus], [IsDelete], [Phone], [Email]) VALUES (1, N'Fatih', N'Uzun', 1, 0, N'05302586569   ', N'fatihuzun@gmail.com                                                                                                                                                                                                                                       ')
INSERT [dbo].[Waiter] ([Id], [Name], [Surname], [IsStatus], [IsDelete], [Phone], [Email]) VALUES (2, N'Metin', N'Yıldırım', 1, 0, N'05341452536   ', N'metinyildirim@gmail.com                                                                                                                                                                                                                                   ')
INSERT [dbo].[Waiter] ([Id], [Name], [Surname], [IsStatus], [IsDelete], [Phone], [Email]) VALUES (3, N'Nilay', N'Demir', 1, 0, N'05323625484   ', N'nilaydemir@gmail.com                                                                                                                                                                                                                                      ')
INSERT [dbo].[Waiter] ([Id], [Name], [Surname], [IsStatus], [IsDelete], [Phone], [Email]) VALUES (4, N'Dilek', N'Tekin', 1, 0, N'05354785478   ', N'dilektekin@gmail.com                                                                                                                                                                                                                                      ')
INSERT [dbo].[Waiter] ([Id], [Name], [Surname], [IsStatus], [IsDelete], [Phone], [Email]) VALUES (5, N'Selin', N'Aktaş', 1, 0, N'05359632565   ', N'selinaktas@gmail.com                                                                                                                                                                                                                                      ')
SET IDENTITY_INSERT [dbo].[Waiter] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddBill]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddBill]
@BillNo int,
@TableName Nvarchar(100),
@WaiterId int,
@Date date,
@TotalPrice float
as
begin
	declare @IsBill int
	set @IsBill=(select count(Id) from Bill where BillNo=@BillNo)
	 if @IsBill=0 begin
        insert into Bill(BillNo,TableName,WaiterId,Date,TotalPrice,IsStatus,IsDelete)
        values(@BillNo,@TableName,@WaiterId,@Date, @TotalPrice, 1,0)
        Print 'Bill Added Successful'
    end
    else begin
        Print 'Warning! This Bill Is Registered. Please Continue With Another Bill Information.'
    end
	return @IsBill
end
GO
/****** Object:  StoredProcedure [dbo].[AddBillPay]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddBillPay]
@BillNo int,
@PayName Nvarchar(100),
@TotalPrice float
as
begin
	declare @IsBillPay int
	set @IsBillPay=(select count(Id) from BillPay where BillNo=@BillNo)
	 if @IsBillPay=0 begin
        insert into BillPay(BillNo,PayName,TotalPrice)
        values(@BillNo,@PayName,@TotalPrice)
        Print 'BillPay Added Successful'
    end
    else begin
        Print 'Warning! This BillPay Is Registered. Please Continue With Another BillPay Information.'
    end
	return @IsBillPay
end
GO
/****** Object:  StoredProcedure [dbo].[AddBillProduct]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddBillProduct]

@BillId int,
@ProductId int,
@ProductTotal float,
@Piece int,
@Price float
as
begin 
	declare @IsBillProduct int
	begin try
		--transection kullanımı
		begin tran addBillProductTran

			insert into  BillProduct(BillId,ProductId,ProductTotal,Piece,Price,IsStatus,IsDelete)
			values(@BillId,@ProductId,@ProductTotal,@Piece,@Price,1,0)

		--işlem başarılı ise kodlar çalıştırılacak
		commit tran addBillProductTran
		set @IsBillProduct=1
	end try
	begin catch
		--işlem başarısız ise yapılan bütün işlemler geri alınacak.
		rollback tran addBillProductTran
		set @IsBillProduct=0
	end catch
	return @IsBillProduct 
end
GO
/****** Object:  StoredProcedure [dbo].[AddCashier]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddCashier]
@Name nvarchar(100),
@Surname nvarchar(100),
@Password nvarchar(100),
@RegistrationNo nvarchar(6)
as
begin
	declare @IsCashier int
	set @IsCashier=(select count(Id) from Cashier where RegistrationNo=@RegistrationNo)

	
	 if @IsCashier=0 begin
        insert into Cashier([Name],Surname,[Password],RegistrationNo)
        values(@Name,@Surname,@Password,@RegistrationNo)
        Print 'Cashier Added Successful'
    end
    else begin
        Print 'Warning! This Cashier Is Registered. Please Continue With Another Cashier Information.'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddCustomer]
@Name nvarchar(100),
@Surname nvarchar(100),
@Balance float,
@OrderQuantity int
as
begin
	declare @IsCustomer int
	set @IsCustomer=(select count(Id) from Customer)

	
	 if @IsCustomer=0 begin
        insert into Customer([Name],Surname,Balance,OrderQuantity)
        values(@Name,@Surname,@Balance,@OrderQuantity)
        Print 'Customer Added Successful'
    end
    else begin
        Print 'Warning! This Customer Is Registered. Please Continue With Another Customer Information.'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[AddKitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddKitchen]
@Name nvarchar(100),
@Unit nvarchar(100),
@Stock int,
@IsStatus bit,
@IsDelete bit
as
begin
	declare @IsKitchen int
	set @IsKitchen=(select count(Id) from Kitchen where [Name]=@Name)

	
	 if @IsKitchen=0 begin
        insert into Kitchen([Name],Unit,Stock,IsStatus,IsDelete)
        values(@Name,@Unit,@Stock,@IsStatus,@IsDelete)
        Print 'Kitchen Added Successful'
    end
    else begin
        Print 'Warning! This Kitchen Is Registered. Please Continue With Another Kitchen Information.'
    end
	return @IsKitchen
end
GO
/****** Object:  StoredProcedure [dbo].[AddMenu]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddMenu]
@ProductName nvarchar(100),
@ProductCategory nvarchar(100),
@Price float,
@IsStatus bit,
@IsDelete bit
as
begin
	declare @IsMenu int
	set @IsMenu=(select count(Id) from Menu where ProductName=@ProductName)

	
	 if @IsMenu=0 begin
        insert into Menu(ProductName,ProductCategory,Price,IsStatus,IsDelete)
        values(@ProductName,@ProductCategory,@Price, @IsStatus,@IsDelete)
        Print 'Menu Added Successful'
    end
    else begin
        Print 'Warning! This Menu Is Registered. Please Continue With Another Menu Information.'
    end
	return @IsMenu
end
GO
/****** Object:  StoredProcedure [dbo].[AddMenuKitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddMenuKitchen]
@MenuId int,
@KitchenId int,
@Piece float,
@Status bit
as
begin

	declare  @IsMenuKitchen int
	declare  @IsMenuKitchenReturn int
	set @IsMenuKitchen = (select count(Id) from MenuKitchenn where MenuId = @MenuId and KitchenId = @KitchenId and Piece= @Piece)

	if @IsMenuKitchen =0 
	begin
		insert into MenuKitchenn(MenuId,KitchenId,Piece,IsStatus,IsDelete)
		values(@MenuId,@KitchenId,@Piece,@Status,0)
		set @IsMenuKitchenReturn=1
	end
	else begin
		set @IsMenuKitchenReturn=0
	end
	return @IsMenuKitchenReturn
end
GO
/****** Object:  StoredProcedure [dbo].[AddPaymentType]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddPaymentType]
@Name nvarchar(100)

as
begin
	declare @IsPaymentType int
	set @IsPaymentType=(select count(Id) from PaymentType)

	
	 if @IsPaymentType=0 begin
        insert into PaymentType([Name])
        values(@Name)
        Print 'PaymentType Added Successful'
    end
    else begin
        Print 'Warning! This PaymentType Is Registered. Please Continue With Another PaymentType Information.'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[AddRapor]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddRapor]
@CashTotal float,
@Iban float,
@TotalPrice float
as
begin
	declare @IsRapor int
	set @IsRapor=(select count(Id) from Rapor)
	 if @IsRapor=0 begin
        insert into Rapor(CashTotal,Iban,TotalPrice)
        values(@CashTotal,@Iban,@TotalPrice)
        Print 'Bill Added Successful'
    end
    else begin
        Print 'Warning! This Bill Is Registered. Please Continue With Another Bill Information.'
    end
	return @IsRapor
end
GO
/****** Object:  StoredProcedure [dbo].[AddWaiter]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddWaiter]
@Name nvarchar(100),
@Surname nvarchar(100),
@Phone nvarchar(14),
@Email nvarchar(250)
as
begin
	declare @IsWaiter int
	set @IsWaiter=(select count(Id) from Waiter where Phone=@Phone or Email=@Email )

	
	 if @IsWaiter=0 begin
        insert into Waiter([Name],Surname,Phone,Email)
        values(@Name,@Surname,@Phone,@Email)
        Print 'Waiter Added Successful'
    end
    else begin
        Print 'Warning! This Waiter Is Registered. Please Continue With Another Waiter Information.'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[CashierLogin]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CashierLogin]
@RegistrationNo nvarchar(200),
@Password nvarchar(200)
as
begin
	Declare @LoginControl int
	Declare @LoginUserName nvarchar(250)
	select @LoginControl=Id,@LoginUserName=RegistrationNo from Cashier where RegistrationNo=@RegistrationNo and [Password]=@Password
	if @LoginControl>0 begin
		Print 'Success'
	end
	else begin
		Print 'Error'
		
	end
	return @LoginControl
end
GO
/****** Object:  StoredProcedure [dbo].[CashTotal]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[CashTotal]
as 
begin
declare @CashTotal float 
set @CashTotal  = (select sum (TotalPrice) from BillPay where PayName = 0)
return @CashTotal
end
GO
/****** Object:  StoredProcedure [dbo].[CrediCartTotal]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CrediCartTotal]
as 
begin
declare @CrediCartTotal float 
set @CrediCartTotal  = (select sum (TotalPrice) from BillPay where PayName = 1)
return @CrediCartTotal
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteBill]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteBill]
@Id int
as
begin
    declare @IsBill int
    set @IsBill=(select count(Id) from Bill where @Id=Id)

    if @IsBill>0 begin
        update Bill set IsDelete=1 where @Id=Id

        print 'Bill Deleted Successful'
    end
    else begin
        print 'Not Found Bill'
    end
	return @IsBill
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteBillProduct]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteBillProduct]
@Id int
as
begin
    declare @IsBillProduct int
    set @IsBillProduct=(select count(Id) from BillProduct where @Id=Id)

    if @IsBillProduct>0 begin
  update BillProduct set IsDelete=1 where @Id=Id
        print 'Menu Deleted Successful'
    end
    else begin
        print 'Not Found Menu'
    end
	return @IsBillProduct
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteCashier]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteCashier]
@Id int
as
begin
    declare @IsCashier int
    set @IsCashier=(select count(Id) from Cashier where Id=@Id)

    if @IsCashier>0 begin
        update Cashier set IsDelete=1 where Id=@Id

        print 'Cashier Deleted Successful'
    end
    else begin
        print 'Not Found Cashier'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteCustomer]
@Id int
as
begin
    declare @IsCustomer int
    set @IsCustomer=(select count(Id) from Customer where Id=@Id)

    if @IsCustomer>0 begin
        update Customer set IsDelete=1 where Id=@Id

        print 'Customer Deleted Successful'
    end
    else begin
        print 'Not Found Customer'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteKitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteKitchen]
@Id int
as
begin
    declare @IsKitchen int
    set @IsKitchen=(select count(Id) from Kitchen where Id=@Id)

    if @IsKitchen>0 begin
        update Kitchen set IsDelete=1 where Id=@Id

        print 'Kitchen Deleted Successful'
    end
    else begin
        print 'Not Found Kitchen'
    end
	return @IsKitchen
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteMenu]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteMenu]
@Id int
as
begin
    declare @IsMenu int
    set @IsMenu=(select count(Id) from Menu where @Id=Id)

    if @IsMenu>0 begin
        update Menu set IsDelete=1 where @Id=Id

        print 'Menu Deleted Successful'
    end
    else begin
        print 'Not Found Menu'
    end
	return @IsMenu
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteMenuKitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteMenuKitchen]
@Id int
as
begin
    declare @IsMenuKitchen int
    set @IsMenuKitchen=(select count(Id) from MenuKitchenn where @Id=Id)
    if @IsMenuKitchen>0 begin
        update MenuKitchenn set IsDelete=1 where @Id=Id

        print 'MenuKitchen Deleted Successful'
    end
    else begin
        print 'Not Found MenuKitchen'
    end	
	return @IsMenuKitchen
end
GO
/****** Object:  StoredProcedure [dbo].[DeletePaymentType]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeletePaymentType]
@Id int
as
begin
    declare @IsPaymentType int
    set @IsPaymentType=(select count(Id) from PaymentType where Id=@Id)

    if @IsPaymentType>0 begin
        update PaymentType set IsDelete=1 where Id=@Id

        print 'PaymentType Deleted Successful'
    end
    else begin
        print 'Not Found PaymentType'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteWaiter]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteWaiter]
@Id int
as
begin
    declare @IsWaiter int
    set @IsWaiter=(select count(Id) from Waiter where Id=@Id)

    if @IsWaiter>0 begin
        update Waiter set IsDelete=1 where Id=@Id

        print 'Waiter Deleted Successful'
    end
    else begin
        print 'Not Found Waiter'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[EditBill]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditBill]
@Id int,
@WaiterId int,
@TotalPrice float

as
begin
    declare  @IsEditBill int
    set @IsEditBill=(Select count(Id) from Bill where Id=@Id)

    if @IsEditBill>0 begin
        update Bill set
   WaiterId=@WaiterId,
   TotalPrice=@TotalPrice
            where Id=@Id
        print 'Bill Edited Successful'
    end
    else begin
        print 'Not Found Bill'
    end
	return @IsEditBill
end
GO
/****** Object:  StoredProcedure [dbo].[EditBillProductStatus]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditBillProductStatus]
@Id int

as
begin
    declare  @IsEditBillProduct int
    set @IsEditBillProduct=(Select count(Id) from BillProduct where Id=@Id)

    if @IsEditBillProduct>0 begin
        update BillProduct set
   IsDelete=1
            where Id=@Id
        print 'Bill Edited Successful'
    end
    else begin
        print 'Not Found Bill'
    end
	return @IsEditBillProduct
end
GO
/****** Object:  StoredProcedure [dbo].[EditBillStatus]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditBillStatus]
@Id int

as
begin
    declare  @IsEditBill int
    set @IsEditBill=(Select count(Id) from Bill where Id=@Id)

    if @IsEditBill>0 begin
        update Bill set
   IsStatus=0
            where Id=@Id
        print 'Bill Edited Successful'
    end
    else begin
        print 'Not Found Bill'
    end
	return @IsEditBill
end
GO
/****** Object:  StoredProcedure [dbo].[EditCashier]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditCashier]
@Id int,
@Name nvarchar(100),
@Surname nvarchar(100),
@Password nvarchar(100),
@RegistrationNo nvarchar(14),
@Status bit
as
begin
    declare  @IsCashier int
    set @IsCashier=(Select count(Id) from Cashier where Id=@Id)

    if @IsCashier>0 begin
        update Cashier set
           [Name]=@Name,
		   Surname=@Surname,
		   [Password]=@Password,
		   RegistrationNo=@RegistrationNo,	  
		   IsStatus=@Status
            where Id=@Id
        print 'Cashier Edited Successful'
    end
    else begin
        print 'Not Found Cashier'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[EditCustomer]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditCustomer]
@Id int,
@Name  nvarchar(100),
@Surname nvarchar(100),
@Balance float,
@OrderQuantity int,
@Status bit
as
begin
    declare  @IsCustomer int
    set @IsCustomer=(Select count(Id) from Customer where Id=@Id)

    if @IsCustomer>0 begin
        update Customer set
			[Name]=@Name,
			Surname=@Surname,
			Balance=@Balance,
			OrderQuantity=@OrderQuantity,
		   IsStatus=@Status
            where Id=@Id
        print 'Customer Edited Successful'
    end
    else begin
        print 'Not Found Customer'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[EditKitchen]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditKitchen]
@Id int,
@Name  nvarchar(50),
@Unit nvarchar(50),
@Stock int,
@Status bit
as
begin
    declare  @IsKitchen int
    set @IsKitchen=(Select count(Id) from Kitchen where Id=@Id)

    if @IsKitchen>0 begin
        update Kitchen set
			[Name]=@Name,
			Unit=@Unit,
			Stock=@Stock,
		   IsStatus=@Status
            where Id=@Id
        print 'Kitchen Edited Successful'
    end
    else begin
        print 'Not Found Kitchen'
    end
	return @IsKitchen
end
GO
/****** Object:  StoredProcedure [dbo].[EditMenu]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditMenu]
@Id int,
@ProductName  nvarchar(100),
@ProductCategory nvarchar(100),
@Price float,
@Status bit
as
begin
    declare  @IsMenu int
    set @IsMenu=(Select count(Id) from Menu where Id=@Id)

    if @IsMenu>0 begin
        update Menu set
			ProductName=@ProductName,
			ProductCategory=@ProductCategory,
			Price=@Price,
  		   IsStatus=@Status
            where Id=@Id
        print 'Menu Edited Successful'
    end
    else begin
        print 'Not Found Menu'
    end
	return @IsMenu
end
GO
/****** Object:  StoredProcedure [dbo].[EditMovie]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditMovie]
@Id int,
@Name nvarchar(100),
@Description ntext,
@Director nvarchar(250),
@Image nvarchar(500),
@ReleaseDate date,
@MovieTypeId int,
@Status bit
as
begin
    declare  @IsMovie int
    set @IsMovie=(Select count(Id) from Movie where Id=@Id)

    if @IsMovie=1 begin
        update Movie set
            [Name]=@Name,
            Director=@Director,
            [Description]=@Description,
            [Image]=@Image,
            MovieTypeId=@MovieTypeId,
            ReleaseDate=@ReleaseDate,
            IsStatus=@Status
            where Id=@Id
        print 'Movie Edited Successful'
    end
    else begin
        print 'Not Found Movie'
    end

    return @IsMovie
end
GO
/****** Object:  StoredProcedure [dbo].[EditPaymentType]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditPaymentType]
@Id int,
@Name nvarchar(100),
@Status bit
as
begin
    declare  @IsPaymentType int
    set @IsPaymentType=(Select count(Id) from PaymentType where Id=@Id)

    if @IsPaymentType>0 begin
        update PaymentType set
			[Name]=@Name,
  		   IsStatus=@Status
            where Id=@Id
        print 'PaymentType Edited Successful'
    end
    else begin
        print 'Not Found PaymentType'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[EditWaiter]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditWaiter]
@Id  int,
@Name nvarchar(100),
@Surname nvarchar(100),
@Phone nvarchar(14),
@Email nvarchar(250),
@Status bit
as
begin
    declare  @IsWaiter int
    set @IsWaiter=(Select count(Id) from Waiter where Id=@Id)

    if @IsWaiter>0 begin
        update Waiter set
			[Name]=@Name,
			Surname=@Surname,
			Phone=@Phone,
			Email=@Email,
  		   IsStatus=@Status
            where Id=@Id
        print 'Waiter Edited Successful'
    end
    else begin
        print 'Not Found Waiter'
    end
end
GO
/****** Object:  StoredProcedure [dbo].[Total]    Script Date: 26.12.2022 09:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Total]
as 
begin
declare @Total float 
set @Total  = (select sum (TotalPrice) from BillPay)
return @Total
end
GO
USE [master]
GO
ALTER DATABASE [famiLYRestaurantDb] SET  READ_WRITE 
GO
