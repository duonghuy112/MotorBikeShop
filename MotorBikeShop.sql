USE [master]
GO
/****** Object:  Database [MotorBikeShop]    Script Date: 26-Jul-21 01:11:15 ******/
CREATE DATABASE [MotorBikeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'G1_SE1409_TromicShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DUONGHUY112\MSSQL\DATA\G1_SE1409_TromicShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'G1_SE1409_TromicShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DUONGHUY112\MSSQL\DATA\G1_SE1409_TromicShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MotorBikeShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MotorBikeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MotorBikeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MotorBikeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MotorBikeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MotorBikeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MotorBikeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MotorBikeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MotorBikeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MotorBikeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MotorBikeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MotorBikeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MotorBikeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MotorBikeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MotorBikeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MotorBikeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MotorBikeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MotorBikeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MotorBikeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MotorBikeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MotorBikeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MotorBikeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MotorBikeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MotorBikeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MotorBikeShop] SET RECOVERY FULL 
GO
ALTER DATABASE [MotorBikeShop] SET  MULTI_USER 
GO
ALTER DATABASE [MotorBikeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MotorBikeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MotorBikeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MotorBikeShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MotorBikeShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MotorBikeShop', N'ON'
GO
USE [MotorBikeShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[IsActive] [int] NULL,
	[IsAdmin] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NULL,
	[Account_id] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NULL,
	[Shipping_id] [int] NULL,
	[TotalPrice] [float] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[Order_id] [int] NULL,
	[Product_id] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_id] [int] NULL,
	[Supplier_id] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[Profile_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NULL,
	[Fullname] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Gender] [int] NULL,
	[DoB] [date] NULL,
	[Avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[Profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Review_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[isPublish] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[Shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[Shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Desciption] [nvarchar](max) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (1, N'duonghuy', N'123', 1, 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (2, N'huy112', N'huy123huy', 1, 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (21, N'chien123', N'123123', 1, 0, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (22, N'admin', N'1', 1, 1, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (23, N'user ', N'1', 1, 0, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (25, N'huy123', N'123123', 0, 0, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (26, N'mrson', N'1', 1, 1, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (27, N'uservip', N'123456', 1, 0, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (29, N'de140155', N'123123', 0, 0, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (30, N'testuser', N'123', 1, 0, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (31, N'duonghuyvippro', N'123123', 1, 0, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (32, N'duonghuy123123123123', N'123123', 0, 0, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (33, N'123123123123', N'123123', 1, 0, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (34, N'admin123123123', N'123123', 1, 0, CAST(N'2021-07-26' AS Date))
INSERT [dbo].[Account] ([Account_id], [Username], [Password], [IsActive], [IsAdmin], [CreateDate]) VALUES (35, N'admin123', N'123123', 1, 0, CAST(N'2021-07-26' AS Date))
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (1, N'Helmets')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (2, N'Eyewear')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (3, N'Boots')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (4, N'Jacket & Vets')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (5, N'Oil & Fluids')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (6, N'Camping')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (7, N'Electrics & Mounts')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (8, N'Tool Kits')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (9, N'Lighting')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (10, N'Engine')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (11, N'Mirror')
INSERT [dbo].[Category] ([Category_id], [Name]) VALUES (12, N'Exhaust')
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (4, 1, 1, N'hay lam
', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (5, 1, 2, N'chat luong tot', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (7, 4, 21, N'tuyet voi', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (9, 3, 26, N'tot', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (10, 2, 23, N'tot lam em', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (12, 5, 1, N'hay lam em', CAST(N'2021-06-10' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (13, 2, 27, N'ok em
', CAST(N'2021-06-17' AS Date))
INSERT [dbo].[Comment] ([Comment_id], [Product_id], [Account_id], [Content], [CreateDate]) VALUES (14, 2, 21, N'hay lắm', CAST(N'2021-06-25' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (1, 1, 1, 447, N'giao nhanh len', 3, CAST(N'2021-06-10' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (2, 1, 2, 149, N'ok ok', 3, CAST(N'2021-06-10' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (3, 1, 3, 180, N'can than', 0, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (4, 2, 4, 145, N'ok', 0, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (5, 22, 5, 189, N'ook', 1, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (6, 25, 6, 65, N'', 2, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (7, 22, 7, 280, N'giao nhanh dum cai', 2, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (8, 23, 8, 76, N'giao gap', 1, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (9, 2, 9, 299, N'qwe', 1, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (10, 1, 10, 120, N'qwe', 3, CAST(N'2021-06-11' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (11, 23, 11, 120, N'', 3, CAST(N'2021-06-12' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (12, 25, 12, 149, N'123123', 3, CAST(N'2021-06-14' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (13, 27, 13, 491, N'giỏi', 0, CAST(N'2021-06-17' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (14, 2, 14, 495, N'giao nhanh dùm tôi nhé', 3, CAST(N'2021-06-17' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (15, 29, 15, 1084, N'giao lẹ lẹ', 3, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (16, 25, 16, 120, N'giao lẹ nhé', 2, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (17, 21, 17, 40, N'', 0, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (18, 26, 18, 149, N'', 1, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (19, 29, 19, 120, N'', 1, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (20, 26, 20, 299, N'', 0, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (21, 26, 21, 445, N'síp lẹ lẹ nha sốp', 1, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (22, 1, 27, 197.1, N'123', 1, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (23, 1, 28, 149, N'asd', 1, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (24, 1, 29, 40, N'qwe', 1, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (25, 1, 30, 298, N'123', 0, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (26, 1, 32, 25, N'123123', 1, CAST(N'2021-07-26' AS Date))
INSERT [dbo].[Order] ([Order_id], [Account_id], [Shipping_id], [TotalPrice], [Note], [Status], [CreateDate]) VALUES (27, 1, 33, 1864.3, N'asdasd', 1, CAST(N'2021-07-26' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (1, 1, 1, 3)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (2, 2, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (3, 3, 8, 4)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (4, 4, 9, 2)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (5, 4, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (6, 4, 8, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (7, 5, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (8, 5, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (9, 6, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (10, 6, 8, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (11, 7, 7, 2)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (12, 7, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (13, 8, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (14, 8, 10, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (15, 8, 12, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (16, 9, 5, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (17, 10, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (18, 11, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (19, 12, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (20, 13, 6, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (21, 13, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (22, 13, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (23, 13, 10, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (24, 13, 12, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (25, 14, 8, 2)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (26, 14, 4, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (27, 14, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (28, 15, 2, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (29, 15, 6, 3)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (30, 16, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (31, 17, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (32, 18, 3, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (33, 19, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (34, 20, 5, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (35, 21, 4, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (36, 21, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (37, 26, 8, 1)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (38, 27, 21, 3)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (39, 27, 6, 4)
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [Order_id], [Product_id], [Quantity]) VALUES (40, 27, 7, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (1, 1, 1, N'EXO-R420 Helmet', 149, N'The Scorpion EXO-R420 isn''t some half-baked race-inspired helmet. This is the real deal, with an advanced LG polycarbonate shell that is SNELL approved. The Ellip-Tec 2 face shield pulls the shield snug, making the EXO-R420 aerodynamic. Cheek pads have an emergency release system and are washable if needed. Take the Scorpion EXO-R420 to the track or to the twisties.', N'assets\images\product\product-01', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (2, 1, 1, N'EXO VX-R70 Helmet', 199.95, N'The VX-R70 with Scorpion’s advanced TCT Composite shell construction and a dual density EPS system has created a light weight, feature-rich performance MX helmet that refuses to compromise. Details include titanium D-Rings, a tool-less quick-change chin vent system, EXOLON shatter resistant peak and a large goggle eyeport. Not to mention Scorpion EXO standards: KwikWick II liner for extreme moisture control, AirFit cheek pad system for a custom snug fit, and vents for maximum breathability. The VX-R70 has been engineered, tested and built to meet the elevated demands of the serious off road rider.', N'assets\images\product\product-02', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (3, 1, 3, N'EXO-AT950 Helmet', 149, N'Scorpion has redefined a segment, melding the best features of touring helmets with the versatility of an off-road lid. Scorpion EXO-AT950 Neocon Helmet is the all-in-one swiss army knife of the helmet world. The modular chin bar allows you to relieve your claustrophobia or ask for directions while the off-road style peak and large eye port deflects roost, blocks the sun and allows you to wear goggles when tearing up the trails. Additional features such as a Everclear anti-fog faceshield and Speedview drop-down internal sun visor keeps your vision clear and ready for whatever is around the next corner. If you''re going to be hitting the highway, the peak visor is easily removed to give you an aerodynamic profile so you can bug out at speed. Eyeglass compatible cheek pads and a KwikWick II liner ensures total comfort. ', N'assets\images\product\product-03', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (4, 1, 2, N'Pro Construct', 325, N'The Icon Variant Pro Construct Helmet is an all-terrain terror that can hunt on the urban landscapes or prowl off the beaten path. Its composite shell is lightweight and stiff. A sculpted neckroll interfaces with your jacket so you can lean forward into a tuck without binding. A modular liner wicks sweat away so you can focus on choosing your line or the SUV that''s about to drift into your lane. The off-road inspired peak is wind tunnel tested for stability at speed. The Icon Variant Pro Construct Helmet is ready for any adventure be it in the concrete jungle, logging roads or other mind altering journeys. ', N'assets\images\product\product-04', 0, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (5, 1, 2, N'Pro Barong', 299.99, N'Barong, king of the spirits. The Icon Airframe Pro Barong gives tribute to this lion-like deity, fighting for all that is good against the evil Rangda. The Icon Airframe Pro Helmet is straight space age insanity. Engineered to be in precise harmony with you, your bike and the environment, the aerodynamically sound handmade composite shell has been designed to promote stability in the sport riding position. Truly a classic in the making, the Airframe Pro is worthy of the top shelf, serving up ultra refined goodness for your dome.', N'assets\images\product\product-05', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (6, 1, 4, N'Airflite Crosslink', 295, N'Don''t be pigeonholed into a certain type of riding. You may not fit into a neat little riding category so rock a helmet that doesn''t either. The Icon Airflite Helmet can attack corners on the weekends and battle against traffic on the weekdays. It doesn''t matter if you''re looking through ape hangers or gripping clip-ons. The Icon Air Flite Helmet doesn''t care what you ride. It just wants to go fast and look threatening. Its chin vent is functional to flow air and terrify à la a Hannibal Lecter face mask. Intake vents snort in so much fresh air that you can smell pedestrian''s fear as you''re rolling down the block. They will not jaywalk in front of you. A drop down internal sun visor allows you to manage the sun or go to incognito mode at the flip of a switch.', N'assets\images\product\product-06', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (7, 2, 3, N'HiPER Mirrored Lens', 120, N'The Armega Goggles offer unparalleled dominance for the modern racer, bringing ULTRA HD lens technology to motocross. Experience definition and clarity never before viewed through the lens of MX goggles. Add to that the 100% proprietary HiPER contrast-enhancing lens and you’ll feel the depth of terrain as you’re commanding past the competition.', N'assets\images\product\product-07', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (8, 2, 1, N'Replacement Lens', 25, N'The signature 100% ULTRA HD lenses are the result of decades of passion, design, craftsmanship and research. Through extensive development and testing, 100% engineered category defining technology bringing unmatched optical clarity to motocross. As the lens of choice for the worlds best racers, ULTRA HD integrates a shatterproof and impact resistant polycarbonate material molded specifically for zero optical distortion. The result is a lens that’s engineered to maximize protection while maintaining the clearest, most accurate vision on the track. ULTRA HD. The next revolution in motocross vision technology.', N'assets\images\product\product-08', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (9, 2, 3, N'2 Sand Goggle', 40, N'The revised Strata 2 Sand Goggles from 100% add a series of improvements to the original Strata predecessors. The dual-layer closed-cell foam eyeport seal adds comfort and manages sweat with an absorbent, quick-drying foam formulation. Ready to battle rain and mud, the goggle strap''s 40mm width is lined silicon grippers to guarantee no-slip placement. The Strata 2 goggle frame itself is designed with a degree of flex for a better fit. ', N'assets\images\product\product-09', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (10, 2, 4, N'Minty Sunglasses', 19, N'Zan Headgear has put a classy twist on a classic style, with unique colors and subtle lines. The timeless wayfarer styling has never looked better.Stylish oversize frame with metal accents. Feature polycarbonate frame and mirror-coated lens. Lenses are shatter-resistant and provide 100% UVA/UVB protection', N'assets\images\product\product-10', 0, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (11, 2, 2, N'Arizona Sunglasses', 21, N'Zan Headgear has put a classy twist on a classic style, with unique colors and subtle lines. The timeless wayfarer styling has never looked better.Stylish oversize frame with metal accents. Feature polycarbonate frame and mirror-coated lens. Lenses are shatter-resistant and provide 100% UVA/UVB protection', N'assets\images\product\product-11', 0, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (12, 2, 4, N'Florida Sunglasses', 17.57, N'Zan Headgear has put a classy twist on a classic style, with unique colors and subtle lines. The timeless wayfarer styling has never looked better.Stylish oversize frame with metal accents. Feature polycarbonate frame and mirror-coated lens. Lenses are shatter-resistant and provide 100% UVA/UVB protection', N'assets\images\product\product-12', 1, CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (13, 3, 1, N'Street Air Shoes', 129.99, N'Your warm weather riding ace in the hole, the TCX Street Ace Shoes feature a two-tone leather upper with fully perforated panels down each side to promote excellent air flow across the foot. Medial and lateral malleolus cups and heel and toe counters provide peace of mind in case things go sideways. With an Air Tech breathable interior lining and contemporary sneaker styling, the TCX Street Ace Air Shoes will make sure you keep your cool.', N'assets\images\product\product-13', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (14, 3, 2, N'Adventure Gore Boots', 499.49, N'Most salient of the improvements Sidi has made with the redesign of the Adventure 2 Gore-Tex Boots is the full-height 14 inch Gore-Tex gaiter, which now extends 3 inches higher up the shaft for increased waterproofing - especially useful when fording water crossings. With additional stretch at the back of the calf, there is now more space and flexibility in the shaft to accommodate a wider range of rider’s calf-sizes. SIDI has also increased the area of split-grain leather grip paneling on the inside of the calf as well as the instep for better feel when standing on the pegs off road.', N'assets\images\product\product-14', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (15, 4, 1, N'Viper Air Jacket', 199.95, N'The Alpinestars Viper V2 Air Jacket concentrates air flow on the torso with large mesh panels on the chest and back. Adjusters on the waist and sleeves help ensure a proper fit for multiple body types. A low profile collar keeps you from feeling suffocated in the heat with microfiber edges for comfort. Pre-curved sleeves are ready to reach for your controls to reduce riding fatigue. Add or remove the windbreaker liner to control the amount of air flowing through the jacket. CE level 2 armor at the shoulders and elbows absorb impact energy. Pockets for chest and back armor allow you to upgrade the impact protection. ', N'assets\images\product\product-15', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (16, 4, 3, N'Vertex Air Jacket', 199.99, N'̈The Spidi Solar is a 3-season jacket with a waterproof lining and removal thermal liner. Constructed from poly fabric, the Solar has waterproof pockets inside and outside, for those items you need to keep dry. The adjustable waist provides a personalized fit, A connection clip lets you attach the Spidi Solar Jacket to riding jeans.', N'assets\images\product\product-16', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (17, 5, 4, N'Chain Care Kit', 33.99, N'Complete chain care for wherever the road takes you by Motul. Kits available in "on road" or "off road" formulations. ', N'assets\images\product\product-17', 0, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (18, 5, 3, N'Racing Square Gas Can', 27.95, N'VP Racing Square Jerry Cans are made with the premium high-density polyethylene. The containers feature an ergonomically contoured handle, bottom grip for easy pouring and a non-breakable multipurpose cap with rubber gaskets. To withstand transit, truck beds and trailering, the containers feature 30% more material in their construction than standard containers. Each jug is subjected to a 15-point quality test by VP. Pouring hose is not included. 

', N'assets\images\product\product-18', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (19, 6, 2, N'Radama Hub Tent', 185.99, N'With DAC Pressfit poles and a simple cross-pole configuration, the Peregrine Radama promises an easy setup with a tall dome height. A full coverage rain fly features a pair of large roof vents to keep air circulating when it''s hot and humid. In Fast Flight Mode, the tent can set up with just the rain fly and floor to provide a minimalist shelter from light rain and the sun; perfect for creating shade at the beach or a festival.

', N'assets\images\product\product-19', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (20, 6, 4, N'Mountaineering Lynx Tent', 159.99, N'The Lynx is packed with features and high quality. The tent is easy to set up: 2 pole rectangular dome style tent with pole clips that easily fit over the poles for quick assembly. Alps has not cut any corners in this model. Between the factory sealed fly and floor seams, weatherproof fly buckles, 2 doors for easy entering and leaving, 2 vestibules for extra gear storage and weather protection, and extra-large #8 zippers, you''re sure to find everything you could want in a tent.

', N'assets\images\product\product-20', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (21, 7, 1, N'Bluetooth Headset', 188.1, N'The SMH10 is a Bluetooth v3.0+EDR Class 1 Stereo Headset with long-range Bluetooth Intercom designed specifically for motorcycles. With the SMH10, you can call hands-free on your Bluetooth mobile phone, listen to stereo music or voice instructions of GPS navigations by Bluetooth wirelessly, and have intercom conversations in full duplex with a passenger or other motorcycle riders. Thanks to the latest Bluetooth v3.0+EDR and the advanced digital processing technology, the Sena SMH10 bluetooth 3.0 offers the best sound quality for both incoming and outgoing sound in its class. Also, the easy-to-access and intuitive button operations make the SMH10 a perfect companion for motorcycles.

', N'assets\images\product\product-21', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (22, 7, 4, N'Bluetooth Intercom', 197.1, N'The Sena SPH10H-FM is a Bluetooth Headset & Intercom designed for Half Helmets. By simply attaching the SPH10H-FM to your half helmet, you can call handsfree on your Bluetooth mobile phone and listen to stereo music by Bluetooth wirelessly, and have intercom conversations in full duplex with other users.

', N'assets\images\product\product-22', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (23, 8, 2, N'Speedkit Tool Kits', 34.99, N'Who said tool kits needed to be bulky? This new Speedkit provides unprecedented capability in an ultra-compact 7" x 2" x 2" pouch. They will fit into small spaces, but with more content and technician-grade tools. Included are wrenches, hex keys, a spark plug socket, pliers, tire gauge, and more - all housed in a sturdy zip-up pouch.

', N'assets\images\product\product-23', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (24, 9, 3, N'LED Lighting Kit', 611.99, N'This is a complete kit that includes a set of Denali LED driving lights, a bike specific mount and a Denali CANsmart Controller that enables you to control your Denali lights using your OEM switches. Denali 2.0 series lamps are THE most premium LED lamps on the market with beam patterns engineered specifically for motorcycling. The CANsmart Controller allows you to fully integrate these aftermarket lamps with the existing handlebar switches on your bike and it can support additional accessories like another set of driving lights, an auxiliary horn and an additional brake light should you want to go farkle-crazy in the future. 

', N'assets\images\product\product-24', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (25, 9, 2, N'LED Light Kit', 399.99, N'The Denali 2.0 LED series is designed to deliver maximum light output from an extremely small package. These motorcycle-specific LEDs are powerful enough to function as primary driving lights but are small enough to mount anywhere on your bike as auxiliary back ups.  

', N'assets\images\product\product-25', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (26, 10, 1, N'Power Package', 859.96, N'Everything you need to boost your 107" M8 motor up to a mind blowing 124 cubic inches! In addition to the increased bore, you also receive the perfect package of parts tailor made to work together for boosted performance like no other, and reliability to boot, thanks to the high quality oil pump and cam plate.

', N'assets\images\product\product-26', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (27, 10, 2, N'Cam Kit', 317.66, N'S&S has been in the business of making Harley-Davidson motorcycles go fast for a very long time, and their innovation in the world of bumpsticks is not exactly a secret. If you''re looking for more power from your bike, a cam is a wonderful place to start - especially if you''ve already done most of the easy ''bolt-on'' modifications. Installing an S&S cam is a surefire way to make your mill suit your riding style while getting maximum output.

', N'assets\images\product\product-27', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (28, 11, 3, N'Arrow Bar Mirror', 119.95, N'The CRG Arrow Bar End Mirror is the ideal application for modern performance sportbikes and naked sportbikes. Aerodynamic styling in billet aluminum construction gives a superior, unobstructed view of the road behind. In keeping with the exceptional quality of all CRG products, the Arrow Bar End Mirror is an eloquent and minimalist design. 

', N'assets\images\product\product-28', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (29, 12, 4, N'Slip-On Exhaust', 287.06, N'The Akrapovic GP-styled Slip-On is a high-performance exhaust that takes design cues from the exhaust found on the factory Yamaha M1 MotoGP bike. Made from titanium, a race-proven material, this exhaust system results in a boost in performance and noticeable weight reduction.

', N'assets\images\product\product-29', 1, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Product] ([Product_id], [Category_id], [Supplier_id], [Name], [Price], [Description], [Image], [Status], [CreateDate]) VALUES (30, 12, 3, N'System Exhaust', 293.36, N'The Yoshimura RS-2 full system exhaust is a potent and versatile pipe that was engineered to provide useful power gains throughout the entire rpm range. The pyramidal shape of the canister offers increased durability and allows for greater packing volume which lowers sound levels. Working in conjunction with factory race teams has allowed Yoshimura to increase performance, keep sound levels to a minimum and centralize mass. The end result is a sound compliant exhaust system that gives you an unparalleled competitive advantage.

', N'assets\images\product\product-30', 1, CAST(N'2021-06-25' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (1, 1, N'NGUYEN DUONG HUY', N'duoonghuy1123@mail.com.vn', N'0906403966', 1, CAST(N'2000-01-23' AS Date), N'pic3.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (2, 2, N'dương huy', N'mai@gmail.com', N'0123456789', 2, CAST(N'2020-09-23' AS Date), N'pic3.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (21, 21, N'Chiến Thắng', N'thangtran369369@gmail.com', NULL, NULL, NULL, N'pic9.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (22, 22, N'Admin Pro', N'admin@gmail.com', N'0123455678', 1, CAST(N'2000-02-11' AS Date), N'pic1.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (23, 23, N'User Vip', N'user@gmail.com', N'0987654321', 2, CAST(N'2020-01-02' AS Date), N'1.png')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (25, 25, N'Nguyễn Dương Huy', N'huy@123.com', N'123123123', 1, CAST(N'2020-09-23' AS Date), N'pic2.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (26, 26, N'Đoàn Thanh Sơn', N'son123@gmail.com', N'123123123', 2, CAST(N'2000-02-11' AS Date), N'pic8.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (27, 27, N'User víp prồ', N'mail@gmail.com', N'123123123', 2, CAST(N'2000-02-11' AS Date), N'pic9.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (29, 29, N'duonghuy', N'123123', N'123123', 2, CAST(N'2000-11-02' AS Date), N'pic7.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (30, 30, N'Test User', N'huy@123.com', N'0987654321', 1, CAST(N'2020-12-24' AS Date), N'pic4.jpg')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (31, 31, N'Nguyễn Dương Huy', N'duoonghuy1123@gmail.com.com', NULL, NULL, NULL, N'1.png')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (32, 32, N'Nguyễn Dương Huy', N'duoonghuy1123@gmail.com.vn', NULL, NULL, NULL, N'1.png')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (33, 33, N'asdasdasdaad ', N'duoonghuy1123@gmail.comsssss', NULL, NULL, NULL, N'1.png')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (34, 34, N'Nguyễn Dương Huy', N'duoonghuy1123@gmail.comssssss', NULL, NULL, NULL, N'1.png')
INSERT [dbo].[Profile] ([Profile_id], [Account_id], [Fullname], [Email], [Phone], [Gender], [DoB], [Avatar]) VALUES (35, 35, N'Nguyễn Dương Huy', N'duoonghuy1123@gmail.com', NULL, NULL, NULL, N'1.png')
SET IDENTITY_INSERT [dbo].[Profile] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (29, 1, N'I love the way this looks. I got it mostly because it matches my bike but in general it’s just a great looking helmet. I have heard it is pretty loud but I wear earplugs when I ride so I can’t tell. There is some DIY to add the top portion on to the helmet. ', 1, CAST(N'2021-06-12' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (30, 2, N'Was bought as a Christmas present for my boyfriend. He loves it! It’s been awhile since he has had a new helmet and says this one feels secure and is great for riding. It includes an inner sun visor which he loves for riding in the evening when the sun is setting.', 1, CAST(N'2021-06-12' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (31, 26, N'Great product! Only two complaints. One: its difficult to find a BT comm system but icon makes one specifically for this helmet so no big deal. Two: it doesnt come pinlock ready but you can buy aftermarket visors', 1, CAST(N'2021-06-12' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (32, 23, N'shop nay tot lam nha moi nguoi', 0, CAST(N'2021-06-14' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (37, 22, N'sốp này tốt lắm nha mọi người. mọi người ủng hộ sốp nhé', 1, CAST(N'2021-06-19' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (47, 1, N'hay lắm em nhé', 1, CAST(N'2021-07-26' AS Date))
INSERT [dbo].[Review] ([Review_id], [Account_id], [Content], [isPublish], [CreateDate]) VALUES (48, 1, N'hay lắm em nhé', 1, CAST(N'2021-07-26' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (1, N'duonghuy', N'0906403966', N'da nang', 447)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (2, N'chien thang', N'123123123', N'fpt', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (3, N'duonghuy', N'0123', N'da nang', 180)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (4, N'Nguy&#7877;n D&#432;&#417;ng Huy', N'1233333', N'fpt shop', 145)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (5, N'huy', N'12123', N'okokk', 189)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (6, N'duonghuy', N'0123', N'123', 65)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (7, N'ngan', N'123123123', N'hoa son ', 280)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (8, N'ngan khung', N'0123123', N'hoa son', 76)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (9, N'ngan', N'qwe', N'qwe', 299)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (10, N'qwe', N'qwe', N'qwe', 120)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (11, N'', N'', N'', 120)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (12, N'duonghuy', N'0906403966', N'123', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (13, N'Nguyễn Dương Huy', N'0906403966', N'Đà Nẵng
', 491)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (14, N'Nguyễn Dương Huy', N'0905323925', N'đà nẵng việt nam', 495)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (15, N'Nguyễn Dương Huy', N'123123123', N'đà nẵng việt nam', 1084)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (16, N'Nguyễn Dương Huy', N'0906403966', N'Đà Nẵng Việt Nam', 120)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (17, N'Nguyễn Dương Huy', N'', N'', 40)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (18, N'Nguyễn Dương Huy', N'', N'', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (19, N'Nguyễn Dương Huy', N'', N'', 120)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (20, N'Nguyễn Dương Huy', N'', N'', 299)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (21, N'Nguyễn Dương Huy', N'0906403966', N'Đà Nẵng, Việt Nam, Trái Đất', 445)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (22, N'Nguyễn Dương Huy', N'0906403966', N'đà nẵng', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (23, N'Nguyễn Dương Huy', N'0906403966', N'qưe', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (24, N'Nguyễn Dương Huy', N'0906403966', N'Đà Nẵng', 1104.85)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (25, N'Nguyễn Dương Huy', N'0906403966', N'123', 40)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (26, N'qwe', N'qwe', N'qwe', 299.99)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (27, N'123', N'123', N'123', 197.1)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (28, N'Nguyễn Dương Huy', N'0906403966', N'vn', 149)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (29, N'Nguyễn Dương Huy', N'0906403966', N'qwe', 40)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (30, N'123', N'123', N'123', 298)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (31, N'okokokok', N'okokoko', N'okokokokok', 123123)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (32, N'123123', N'123123', N'123123', 25)
INSERT [dbo].[Shipping] ([Shipping_id], [Fullname], [Phone], [Address], [TotalPrice]) VALUES (33, N'Nguyễn Dương Huy', N'0905323925', N'vn', 1864.3)
SET IDENTITY_INSERT [dbo].[Shipping] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Supplier_id], [Name], [Desciption]) VALUES (1, N'Scorpion', N'ScorpionExo is the next wave in motorcycle helmet and protective gear design and manufacturing. ScorpionExo helmets are engineered by some of the most sought-after helmet designers, with creative, innovative graphic designers. The Scorpion Sports factory is a state-of -the-art, 810,000 square foot campus located in Strausburg, FR. Almost every operation needed to create world-class Motorcycle Accessories is located at this one amazing facility, including both fiberglass/Kevlar and polycarbonate shell molding, EPS liner manufacturing, liner sewing, water decal production, clean room paint booths, drying rooms, assembly, packaging and shipping. The North America headquarters is located in Lake Forest, CA, plus in 2007 a new distribution center was opened in Louisville, KY.
')
INSERT [dbo].[Supplier] ([Supplier_id], [Name], [Desciption]) VALUES (2, N'ICON ', N'ICON burst onto the moto scene with clothing, gear and helmets that are designed for sport bike riders by sport bike riders. Whether you are looking for skulls, tribal designs and demons or more subtle "stealth" or retro gear, ICON gear fits the bill for both men and women without cutting any corners that aren''t made of asphalt. ICON is at the forefront of functional gear which also speaks to the personality and lifestyle of the knee-dragging crowd. ICON motorcycle jackets provide a great option, combining motorcycle functionality with an edgy style that, to date, only Icon has been able to pull off. If you are in the looking to "rideICON," you''ve come to the right place, either with new motorcycle jacket or with some of the most absurd helmet graphics you''ve ever seen - visit our ICON Motorcycle Helmets page for more!
')
INSERT [dbo].[Supplier] ([Supplier_id], [Name], [Desciption]) VALUES (3, N'Armega ', N'The Armega Goggles offer unparalleled dominance for the modern racer, bringing ULTRA HD lens technology to motocross. Experience definition and clarity never before viewed through the lens of MX goggles. Add to that the 100% proprietary HiPER contrast-enhancing lens and you’ll feel the depth of terrain as you’re commanding past the competition. This premium HiPER technology is injection-molded into a shatterproof lens that boasts enhanced field of vision and impact protection. The 6-point locking-tab integration secures the lens and works in unison with a quick-change system enabling you to switch between lenses with a couple of simple clicks.
')
INSERT [dbo].[Supplier] ([Supplier_id], [Name], [Desciption]) VALUES (4, N'ZANheadgear ', N'Created out of passion for motorcycles and the thrill of finding the next great outdoor adventure, ZANheadgear has developed a wide array of headwear that range from headwraps to face masks. Every headwear product ZANheadgear creates serves as a reminder as to why we began this venture over 20 years ago, to develop high quality headwear products that provide protection from the elements. With every challenge and adventure becoming more daring than the last, we realized that performance driven headwear was no longer just an option, but a necessity. Our performance headwear features the use of technologically enhanced fabrics willing to work as hard as that athlete that lives inside of us all.')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipping] FOREIGN KEY([Shipping_id])
REFERENCES [dbo].[Shipping] ([Shipping_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipping]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Order] ([Order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([Supplier_id])
REFERENCES [dbo].[Supplier] ([Supplier_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 26-Jul-21 01:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Register]
@fullName nvarchar(100), @username nvarchar(100), @email nvarchar(100), @password nvarchar(100)
AS
INSERT INTO [Account] ([Username],[Password],[IsActive], [IsAdmin], [CreateDate])
VALUES (@username, @password, 1, 0, GETDATE())
DECLARE @accountId  AS int 
SET @accountId = SCOPE_IDENTITY()
INSERT INTO Profile ([Account_id],[Email],[Fullname],[Avatar])
VAlUES (@accountId, @email, @fullName, '1.png')

GO
USE [master]
GO
ALTER DATABASE [MotorBikeShop] SET  READ_WRITE 
GO
