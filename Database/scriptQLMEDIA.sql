USE [master]
GO
/****** Object:  Database [QLMEDIA]    Script Date: 7/1/2021 11:26:50 AM ******/
CREATE DATABASE [QLMEDIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMEDIA', FILENAME = N'E:\phanmem\SQL sever 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLMEDIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLMEDIA_log', FILENAME = N'E:\phanmem\SQL sever 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLMEDIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLMEDIA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMEDIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMEDIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMEDIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMEDIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMEDIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMEDIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMEDIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMEDIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMEDIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMEDIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMEDIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMEDIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMEDIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMEDIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMEDIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMEDIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMEDIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMEDIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMEDIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMEDIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMEDIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMEDIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMEDIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMEDIA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLMEDIA] SET  MULTI_USER 
GO
ALTER DATABASE [QLMEDIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMEDIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMEDIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMEDIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLMEDIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLMEDIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLMEDIA] SET QUERY_STORE = OFF
GO
USE [QLMEDIA]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/1/2021 11:26:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
	[ModuleAccount] [nvarchar](50) NULL,
	[LevelAccount] [int] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[TaxCode] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classify]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classify](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindOfVideo]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KindOfVideo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeVideo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listclassify_Media]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listclassify_Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMedia] [int] NULL,
	[IdClassify] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListMediaLike]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMediaLike](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
	[Datatime] [datetime] NULL,
 CONSTRAINT [PK_MyPlayList] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListMediaView]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMediaView](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
	[Views] [int] NULL,
	[CompleteTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_ListMediaView] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Describe] [nvarchar](max) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NULL,
	[Directors] [nchar](50) NULL,
	[Source] [nvarchar](max) NULL,
	[PostedDate] [datetime] NULL,
	[Actor] [nvarchar](max) NULL,
	[IMDB] [float] NULL,
	[Likes] [int] NULL,
	[Genre] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Media_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyPlayList]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyPlayList](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
 CONSTRAINT [PK_ListMediaLike] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[IdAccount] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Money] [float] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 7/1/2021 11:26:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[IdAccount] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Profile_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (1, N'sdsadfas', N'dasda', N'gsdgsd', N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (2, N'gdffdmhgbn', N'hdfgfghg', N'dfgdf', N'0', 1, N'32456', N'3w54676', N'dsfghjkl;', N'5467      ')
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (3, N'ddsa', N'dsad', N'dsad', N'0', 1, N'4234', N'424', N'dfertygjthrgefwdertuyu', N'43242     ')
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (4, N'dsad', N'dsad', N'fds', N'0', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (5, N'Huyền bí', N'dsfsd', N'fsd', N'0', 3, N'321456787654321', N'2345678', N'rewtyurewtyurewtyurewtyurewtyurewtyurewtyu', N'432567    ')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Classify] ON 

INSERT [dbo].[Classify] ([Id], [Name]) VALUES (1, N'Kids      ')
INSERT [dbo].[Classify] ([Id], [Name]) VALUES (2, N'Music     ')
INSERT [dbo].[Classify] ([Id], [Name]) VALUES (3, N'G         ')
INSERT [dbo].[Classify] ([Id], [Name]) VALUES (4, N'Hard R    ')
INSERT [dbo].[Classify] ([Id], [Name]) VALUES (5, N'PG-13     ')
SET IDENTITY_INSERT [dbo].[Classify] OFF
GO
SET IDENTITY_INSERT [dbo].[KindOfVideo] ON 

INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (1, N'Tình cảm')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (2, N'Hành Động')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (3, N'Viễn tưởng')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (4, N'Phiêu lưu')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (5, N'Âm nhạc')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (6, N'Hài hước')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (7, N'Lịch sử')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (8, N'Hoạt hình')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (9, N'Kinh dị')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (10, N'Thần thoại')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (11, N'Hình sự')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (12, N'Huyền bí')
SET IDENTITY_INSERT [dbo].[KindOfVideo] OFF
GO
SET IDENTITY_INSERT [dbo].[Listclassify_Media] ON 

INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (2, 21, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (3, 22, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (4, 23, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (5, 24, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (6, 25, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (7, 26, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (8, 27, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (9, 28, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (10, 29, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (11, 30, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (12, 31, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (13, 30, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (14, 31, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (15, 32, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (16, 33, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (17, 34, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (18, 35, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (19, 36, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (20, 37, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (21, 38, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (22, 39, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (23, 40, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (24, 41, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (25, 42, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (26, 43, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (27, 44, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (28, 45, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (29, 46, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (30, 47, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (31, 48, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (32, 49, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (33, 50, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (34, 60, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (35, 61, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (36, 62, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (37, 63, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (38, 64, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (39, 65, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (40, 66, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (41, 67, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (42, 68, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (43, 69, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (44, 70, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (45, 71, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (46, 21, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (47, 22, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (48, 23, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (49, 24, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (50, 25, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (51, 26, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (52, 27, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (53, 28, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (54, 29, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (55, 30, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (56, 31, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (57, 30, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (58, 31, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (59, 32, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (60, 33, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (61, 34, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (62, 35, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (63, 36, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (64, 37, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (65, 38, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (66, 39, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (67, 40, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (68, 41, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (69, 42, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (70, 43, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (71, 44, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (72, 45, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (73, 46, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (74, 47, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (75, 48, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (76, 49, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (77, 50, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (78, 60, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (79, 61, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (80, 62, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (81, 63, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (82, 64, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (83, 65, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (84, 66, 1)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (85, 67, 2)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (86, 68, 3)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (87, 69, 4)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (88, 70, 5)
INSERT [dbo].[Listclassify_Media] ([Id], [IdMedia], [IdClassify]) VALUES (89, 71, 1)
SET IDENTITY_INSERT [dbo].[Listclassify_Media] OFF
GO
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 2, CAST(N'2021-06-17T08:00:52.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 21, CAST(N'2021-06-23T08:41:29.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 22, CAST(N'2021-06-25T08:41:33.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 23, CAST(N'2021-06-25T08:41:38.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 24, CAST(N'2021-06-25T08:41:41.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 25, CAST(N'2021-06-25T08:41:44.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 26, CAST(N'2021-06-25T08:41:47.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 27, CAST(N'2021-06-25T08:41:51.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 28, CAST(N'2021-06-25T08:41:57.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 1, 29, CAST(N'2021-06-25T08:42:01.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 21, CAST(N'2020-06-25T15:22:14.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 22, CAST(N'2020-06-25T15:22:33.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 23, CAST(N'2020-06-25T15:22:56.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 24, CAST(N'2020-05-25T15:23:09.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 25, CAST(N'2020-07-25T15:23:37.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 26, CAST(N'2020-07-25T15:23:43.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 27, CAST(N'2020-07-25T15:23:48.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 28, CAST(N'2020-05-25T15:23:55.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 2, 29, CAST(N'2020-06-25T15:24:01.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 21, CAST(N'2019-06-25T16:09:11.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 22, CAST(N'2019-07-25T16:09:26.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 23, CAST(N'2019-05-25T16:09:38.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 24, CAST(N'2019-05-25T16:09:45.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 25, CAST(N'2019-07-25T16:09:51.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 26, CAST(N'2019-05-25T16:09:58.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 27, CAST(N'2019-07-25T16:10:06.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 28, CAST(N'2019-05-25T16:10:12.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (1, 3, 29, CAST(N'2019-06-25T16:10:19.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 21, CAST(N'2021-06-25T08:42:17.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 22, CAST(N'2021-06-22T08:00:55.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 23, CAST(N'2021-06-25T08:43:33.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 24, CAST(N'2021-06-25T08:43:36.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 25, CAST(N'2021-05-01T08:43:38.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 26, CAST(N'2021-05-01T08:43:44.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 27, CAST(N'2021-05-01T08:43:49.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 28, CAST(N'2021-05-01T08:43:54.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 2, 29, CAST(N'2021-05-01T08:44:01.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 21, CAST(N'2020-05-25T15:24:08.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 22, CAST(N'2020-05-25T15:24:17.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 23, CAST(N'2020-07-25T15:24:25.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 24, CAST(N'2020-05-25T15:24:30.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 25, CAST(N'2021-06-25T15:24:36.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 26, CAST(N'2020-05-25T15:24:40.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 27, CAST(N'2020-07-25T15:24:49.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 28, CAST(N'2020-05-25T15:24:55.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 3, 29, CAST(N'2020-07-25T15:25:01.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 21, CAST(N'2019-07-25T16:10:26.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 22, CAST(N'2019-05-25T16:10:31.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 23, CAST(N'2019-07-25T16:10:39.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 24, CAST(N'2019-05-25T16:10:45.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 25, CAST(N'2019-06-25T16:10:51.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 26, CAST(N'2019-07-25T16:10:58.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 27, CAST(N'2019-05-25T16:11:03.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 28, CAST(N'2019-07-25T16:11:08.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (2, 4, 29, CAST(N'2019-05-25T16:11:12.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 21, CAST(N'2021-06-25T08:44:29.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 22, CAST(N'2021-06-25T08:44:32.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 23, CAST(N'2021-06-25T08:44:35.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 24, CAST(N'2021-06-25T08:44:37.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 25, CAST(N'2021-05-01T08:44:47.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 26, CAST(N'2021-05-01T08:44:51.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 27, CAST(N'2021-05-01T08:44:55.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 28, CAST(N'2021-07-01T08:44:59.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 3, 29, CAST(N'2021-07-01T08:45:03.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 21, CAST(N'2020-05-25T15:25:12.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 22, CAST(N'2020-07-25T15:25:17.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 23, CAST(N'2020-06-25T15:25:25.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 24, CAST(N'2020-05-25T15:25:32.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 25, CAST(N'2020-07-25T15:25:37.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 26, CAST(N'2020-05-25T15:25:46.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 27, CAST(N'2020-07-25T15:25:51.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 28, CAST(N'2020-06-25T15:26:00.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 4, 29, CAST(N'2020-05-25T15:26:05.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 21, CAST(N'2019-06-25T16:11:20.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 22, CAST(N'2019-06-25T16:11:27.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 23, CAST(N'2019-05-25T16:11:32.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 24, CAST(N'2019-07-25T16:11:43.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 25, CAST(N'2019-07-25T16:11:39.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 26, CAST(N'2019-05-25T16:11:48.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 27, CAST(N'2019-06-25T16:11:53.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 28, CAST(N'2019-05-25T16:12:00.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (3, 5, 29, CAST(N'2019-07-25T16:12:06.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 21, CAST(N'2021-06-25T08:46:54.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 22, CAST(N'2021-06-25T08:46:59.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 23, CAST(N'2021-06-25T08:47:03.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 24, CAST(N'2021-06-25T08:47:06.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 25, CAST(N'2021-05-01T08:47:10.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 26, CAST(N'2021-05-01T08:47:14.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 27, CAST(N'2021-05-01T08:47:18.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 28, CAST(N'2021-07-01T08:47:24.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 4, 29, CAST(N'2021-07-01T08:47:33.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 21, CAST(N'2020-05-25T15:26:15.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 22, CAST(N'2020-07-25T15:26:21.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 23, CAST(N'2020-05-25T15:26:28.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 24, CAST(N'2020-05-25T15:26:35.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 25, CAST(N'2020-07-25T15:26:43.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 26, CAST(N'2020-06-25T15:26:50.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 27, CAST(N'2020-05-25T15:26:57.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 28, CAST(N'2020-07-25T15:27:04.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 5, 29, CAST(N'2020-06-25T15:27:12.000' AS DateTime))
GO
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 21, CAST(N'2019-06-25T16:12:14.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 22, CAST(N'2019-07-25T16:12:19.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 23, CAST(N'2019-05-25T16:12:26.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 24, CAST(N'2019-07-25T16:12:31.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 25, CAST(N'2019-05-25T16:12:39.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 26, CAST(N'2019-07-25T16:12:44.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 27, CAST(N'2019-07-25T16:12:49.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 28, CAST(N'2019-05-25T16:12:54.000' AS DateTime))
INSERT [dbo].[ListMediaLike] ([IdAccount], [IdProfile], [IdMedia], [Datatime]) VALUES (4, 6, 29, CAST(N'2019-07-25T16:13:01.000' AS DateTime))
GO
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 21, 3, N'1:34')
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 22, 32, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 24, 3, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 28, 34, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 30, 23, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 2, 21, 2, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 2, 22, 12, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 2, 24, 54, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 2, 29, 12, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 2, 30, 12, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 3, 21, 34, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 3, 22, 5, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 3, 24, 12, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 3, 29, 5, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 3, 30, 10, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (2, 1, 21, 4, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (2, 2, 21, 4, NULL)
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (2, 3, 30, 45, N'2:45')
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Cô Bé Trượt Ván là câu chuyện phát hiện ra đam mê trượt ván có thể thay đổi cuộc đời mình, thiếu nữ ở vùng nông thôn của Ấn Độ đối diện con đường chông gai khi theo đuổi ước mơ thi đấu.', 21, N'2:34', N'Manjari Makijany                                  ', N'Skater Girl - Official Trailer - Netflix.mp4', CAST(N'2021-06-08T07:52:36.000' AS DateTime), N'Amy Maghera, Rachel Saanchita Gupta, Shafin Patel', 6.7, 10, 1, N'Skater Girl  boy                                                                                    ', N'skater-girl1623763175.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Là bộ phim đề tài LGBT đề cập đến một phần ít ai biết đến trong lịch sử Mexico. Vào năm 1901, cảnh sát đã đột kích nhà của một quý tộc ở thành phố Mexico, nơi đang diễn ra vũ hội sang trọng. Bên trong họ nhìn thấy nhóm các nam giới vui chơi một số còn mặc quần áo nữ. Vào thời điểm đó, đồng tính bị khinh thường, vì thế sự kiện này đã trở thành vụ bê bối làm rung chuyển xã hội Mexico, bất chấp chính phủ ra sức nỗ lực ngăn chặn vụ việc bị lan truyền.', 22, N'1:57', N'David Pablos                                      ', N'Dance of the 41 - Official Trailer - Netflix.mp4', CAST(N'2021-06-09T07:55:07.000' AS DateTime), N'Alfonso Herrera, Emiliano Zurita, Mabel', 7.5, 10, 1, N'Dance Of The 41                                                                                     ', N'dance-of-the-411622965225.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Taylor Harris bất ngờ bị sa thải. Không còn cách nào khác Taylor Harris đành phải trở về quê nhà của mình ở Montana. Tại đây cô bắt tay vào việc giúp sức cứu khách sạn của anh trai mình trong thị trấn thoát khỏi bàn tay của gã tài phiệt lắm tiền Joel Sheenan. Anh ta đang lên kế hoạch cải tạo lại hoàn toàn khách sạn, mà đây không phải là điều anh trai và Taylor mong muốn, sau nhiều lần tiếp xúc đấu đá với nhau, Taylor và Joel dần nảy sinh tình cảm đặc biệt dành cho nhau.', 23, N'1:59', N'Bradley Walsh                                     ', N'Colors of Love - Official Trailer.mp4', CAST(N'2021-06-10T07:59:37.000' AS DateTime), N'Dennis Andres, Michael Brown, Jenni Burke', 8.3, 3, 1, N'Colors of love                                                                                      ', N'colors-of-love1620311367.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Mắt Thấy Tai Nghe là câu chuyện sau khi rời Manhattan về cuộc sống ở một thị trấn nhỏ, người phụ nữ trẻ phát hiện cả chồng cô và ngôi nhà mới của họ đều cất giấu những bí mật đáng sợ.', 24, N'2:41', N'Shari Springer Berman, Robert Pulcini             ', N'Things Heard & Seen starring Amanda Seyfried - Official Trailer - Netflix.mp4', CAST(N'2021-06-11T08:01:23.000' AS DateTime), N'Amanda Seyfried, James Norton, Natalia Dyer', 8.3, 8, 1, N'Things Heard & Seen                                                                                 ', N'things-heard-seen1620302745.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Một nhân viên môi giới chứng khoán trẻ tuổi tại một công ty ở Phố Wall do Mob kiểm soát bị phản bội và bị tống vào tù 6 năm. Khi ra ngoài, anh ta tìm cách trả thù.', 25, N'1:58', N'Joseph Mensch                                     ', N'BAD TRIP Official Trailer (Redband) (2020).mp4', CAST(N'2021-06-18T08:03:40.000' AS DateTime), N'Toby Leonard Moore, Rade Serbedzija, Elena Satine, Bill Sage, Ari Barkan, Matt Levett, Anna Baryshnikov, Lev Gorn, Boris Lee Krutonog, David Vadim, Mat Vairo, Alice Sophie Malyukova, Vonia Arslanian, Marc Alan Austen, Joe Cummings', 6, 9, 1, N'Payback                                                                                             ', N'bad-trip.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Dựa trên câu chuyện đời thực phi thường của Chiefess Kapiolani, một người đã nhảy xuống miệng núi lửa phun trào để thể hiện đức tin của cô và đánh dấu một khởi đầu mới tại Hawaii.', 26, N'2:43', N'Timothy A. Chey                                   ', N'Old - Official Trailer [HD].mp4', CAST(N'2021-06-15T08:04:47.000' AS DateTime), N'Mira Sorvino, John Savage, Teuira Shanti Napa, Ricky Sua''ava, Michael Camp, Malia Marquez, Ichiro Tange, Malia Mahi, John Huser, Harry Walia, Lehi Makisi Falepapalangi, Ala''amoe Keolanui, Boyd Lauano, Andrew Sexton Iii, David Galea''i', 6, 3, 1, N'The Islands                                                                                         ', N'the-islands.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Infinite (2021) là một bộ phim hành động khoa học viễn tưởng của Mỹ năm 2021 do Antoine Fuqua làm đạo diễn. Ian Shorr đã chuyển thể kịch bản và Todd Stein đã viết câu chuyện trên màn ảnh từ cuốn tiểu thuyết năm 2009 The Reincaacian Papers của D. Eric Maikranz.', 27, N'2:45', N'Antoine Fuqua                                     ', N'INFINITE Official Trailer (2021).mp4', CAST(N'2021-06-11T08:09:16.000' AS DateTime), N'Mark Wahlberg, Chiwetel Ejiofor, Sophie Cookson', 7, 5, 9, N'Infinite                                                                                            ', N'infinite1623547067.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Khác với phong cách nhà ma ám trong hai phần phim trước, The Conjuring mùa mới mang đến tính hình sự sâu sắc hơn khi khai thác một trong những vụ án kinh điển của lịch sử toà án Mỹ. Đó là Arne Johnson, một kẻ sát nhân máu lạnh tới từ Brookfield mượn có bị quỷ ám để biện hộ cho tội ác đáng kinh tởm của mình. Trên thực tế, Arne đã bị buộc tội ngộ sát trong vụ xét xử năm 1981 và bị kết án 10 năm tù giam. Hắn đã được thả khoan hồng sau 5 năm cải tạo, và đến nay vẫn gây ra nhiều tranh cãi về sự bất công.', 28, N'2:39', N'Michael Chaves                                    ', N'THE CONJURING- THE DEVIL MADE ME DO IT – Official Trailer.mp4', CAST(N'2021-06-12T08:10:29.000' AS DateTime), N'Patrick Wilson, Vera Farmiga, Ruairi O''Connor', 7, 7, 9, N'The Conjuring: The Devil Made Me Do It                                                              ', N'the-conjuring-the-devil-made-me-do-it1623251511.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hung Thần Trắng là phim kinh dị. Một cặp tình nhân và người điều khiển thủy phi cơ, Kaz Fellows ( Katrina Bowden ) và bạn trai của cô ấy Charlie Brody ( Aaron Jakubenko ), cùng với hành khách của họ, Joji Minase ( Tim Kano ), vợ của anh ấy là Michelle ( Kimie Tsukakoshi ), và đầu bếp Benny ( Te Kohe Tuhaka ), đáp chuyến bay đến Rạn san hô địa ngục đẹp như tranh vẽ. Khi hạ cánh, họ bắt gặp một xác chết trôi dạt sau một cuộc tấn công nghi ngờ của cá mập. Họ báo cho lực lượng bảo vệ bờ biển nhưng phát hiện điện thoại của người đàn ông có hình bạn gái.', 29, N'1:57', N'Martin Wilson                                     ', N'GREAT WHITE Trailer (2021).mp4', CAST(N'2021-06-01T08:11:21.000' AS DateTime), N'Aaron Jakubenko, Katrina Bowden, Tatjana Marjanovic', 7, 6, 9, N'Great White                                                                                         ', N'great-white1622358515.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hannah Faber, một thợ hút khói , đang vật lộn sau khi không ngăn được cái chết của ba trại viên trẻ tuổi và một đồng nghiệp hút khói trong một vụ cháy rừng . Hiện cô được đưa lên tháp canh lửa ở Quận Park, Montana . Trong khi đó, Owen Casserly, một nhân viên kế toán pháp y, biết về cái chết của ông chủ và gia đình anh ta trong một vụ nổ khí rõ ràng; họ đã thực sự bị sát hại bởi hai sát thủ Jack và Patrick Blackwell.', 30, N'2:44', N'Taylor Sheridan                                   ', N'Those Who Wish Me Dead Trailer #1 (2021) - Movieclips Trailers.mp4', CAST(N'2021-06-03T08:13:30.000' AS DateTime), N'Angelina Jolie, Finn Little, Nicholas Hoult', 7, 7, 9, N'Those Who Wish Me Dead                                                                              ', N'those-who-wish-me-dead1622050544.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Ấn Quỷ là một phim kinh dị. Phim xoay quanh cô gái khiếm thính Alice tại một thị trấn nhỏ thuộc vùng New England. Một ngày nọ, cô bỗng nhiên có thể nghe, nói như bình thường và có được năng lực chữa bệnh cho mọi người. Hàng trăm nghìn người từ khắp đất nước đổ về chứng kiến phép màu của cô. Trong số này, nhà báo Gerry Fenn muốn thực hiện một phóng sự để cứu vãn sự nghiệp. Song, hàng loạt những sự kiện kinh hoàng xảy ra khiến ông dần nhận ra thế lực ma quỷ thật sự đứng sau lưng cô gái trẻ.', 31, N'2:51', N'Evan Spiliotopoulos                               ', N'THE UNHOLY Official Trailer (2021).mp4', CAST(N'2021-06-03T08:14:28.000' AS DateTime), N'Jeffrey Dean Morgan, Katie Aselton, William Sadler', 7.5, 3, 9, N'The Unholy                                                                                          ', N'the-unholy_1622358090.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Cuộc Chiến Vì Mọi Bé Gái là phim kinh dị. Vị thanh tra kiên trì tìm được điểm chung với một kẻ sát nhân – hắn nhắm một cách có hệ thống vào những kẻ ác điều hành một đường dây buôn bán trẻ em quyền lực.', 32, N'1:41', N'Donovan Marsh                                     ', N'I Am All Girls - Official Trailer - Netflix.mp4', CAST(N'2021-06-04T08:16:12.000' AS DateTime), N'Deon Lotz, Erica Wessels, Masasa Mbangeni', 7.5, 6, 9, N'I Am All Girls                                                                                      ', N'i-am-all-girls1622357874.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry, và David Schwimmer sẽ trở lại phim trường cũ của loạt phim hài biểu tượng, Phim trường 24, tại xưởng phim Warner Bros để tổ chức buổi trò chuyện kỉ niệm bộ phim yêu dấu của họ.', 33, N'2:11', N'Ben Winston                                       ', N'FRIENDS- THE REUNION Official Trailer (NEW 2021).mp4', CAST(N'2021-06-09T08:18:08.000' AS DateTime), N'Jennifer Aniston, David Schwimmer, Courteney Cox, Lisa Kudrow, Matthew Perry, Matt LeBlanc', 5.6, 4, 6, N'Friends : The Reunion                                                                               ', N'friends-the-reunion1622968073.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Nào Mình Cùng Mơ! (Dreambuilders) là tựa phim hoạt hình vô cùng dễ thương và đáng yêu dành cho các bé. Phim xoay quanh câu chuyện của cô bé Minna khi sống chung với mẹ kế và cô em gái khó ưa Jenny.

Mãi đến một ngày Minna phát hiện ra thành phố chuyên xây dựng giấc mơ và từ đó, cô bé đã bắt đầu xâm nhập và điều khiển giấc mơ của Jenny. Bỗng một ngày, Jenny không thể tỉnh dậy, Minna hối hận và quyết định quay lại thành phố giấc mở để cứu lấy người em vô tội của mình.', 34, N'2:22', N'Kim Hagen Jensen, Tonni Zinck                     ', N'DREAMBUILDERS Trailer (2020).mp4', CAST(N'2021-06-07T08:19:44.000' AS DateTime), N'Martin Buch, Rasmus Botoft, Mia Lerdam', 5.5, 55, 6, N'Dreambuilders                                                                                       ', N'dreambuilders_1622966807.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Tác phẩm kể về một gia đình bị rối loạn chức năng, gặp khó khăn khi phải ra tay giải cứu Trái Đất khỏi cuộc nổi dậy của người máy lúc đang đi trên đường.', 35, N'3:02', N'Michael Rianda                                    ', N'The Mitchells vs. The Machines - Official Trailer - Netflix.mp4', CAST(N'2021-06-09T08:21:24.000' AS DateTime), N'Abbi Jacobson, Danny McBride, Maya Rudolph, Eric Andre, Fred Armisen, Beck Bennett, Conan O''Brien, Charlyne Yi', 8.3, 44, 6, N'The Mitchells vs. the Machines                                                                      ', N'the-mitchells-vs-the-machines1620309980.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Tình dục, ma túy và một gia đình hỗn loạn tạo nên một cơn bão hoàn hảo cho Bữa tiệc trưởng thành của Donny. Chúng ta quay ngược thời gian trở lại năm 1998 khi theo dõi một loạt các nhân vật đầy màu sắc dưới góc nhìn của một nhà quay phim được thuê. Donny cố gắng tận hưởng buổi tối trong khi đối phó với người mẹ điên rồ của mình, người đang giận dữ ở tuổi thiếu niên của anh ta, và bạn gái mới của anh ta, Hannah Quay tay. Trong khi đó Gerald, MC của bữa tiệc, đang làm nhiệm vụ ngăn chặn Val Dho đang âm mưu phá hoại bữa tiệc. Tất cả những điều đó, cộng thêm những cuộc tình tai tiếng, mối tình tay ba, quay chai... Nhưng theo truyền thống, tất cả phải được giải quyết trước khi bài hát cuối vang lên.', 36, N'2:26', N'Jonathan Kaufman                                  ', N'DONNY''S BAR MITZVAH (2021) Official Trailer — Redband.mp4', CAST(N'2021-06-11T08:22:32.000' AS DateTime), N'Steele Stebbins, Adrian Ciscato, Wendy Braun, Michael Patrick Mcgill, Adam Herschman, Radek Lord, Jeremy Tardy, Zemyhe Curtis, Joshua Gonzalez, Regan Burns, Jennifer Sorenson, Tricia O''kelley, John Deluca, Jessica Renee Russell, Isabelle Anaya', 7.6, 5, 6, N'Donny''s Bar Mitzvah                                                                                 ', N'donny039s-bar-mitzvah.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Trong chương trình hài chơi khăm có máy quay ẩn, đôi bạn thân gắn kết trong chuyến đi náo loạn đến New York qua việc kéo người thật vào các trò đùa thô tục, bát nháo.', 37, N'2:37', N'Kitao Sakurai                                     ', N'BAD TRIP Official Trailer (Redband) (2020).mp4', CAST(N'2021-06-17T08:25:31.000' AS DateTime), N'Eric André, Michaela Conlin, Tiffany Haddish, Lil Rel Howery, Gerald Espinoza, Kaleila Johnson, Michael Starr, Yvette Tucker, Allan Graf, Kevin Cassidy, Cory Demeyers, Charles Green, Henry Wang, Greg Smithaldridge, Peter A. Chevako', 6.6, 56, 6, N'Bad Trip                                                                                            ', N'bad-trip.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Ở Oʻahu vào mùa hè, hai anh em ruột từ Brooklyn kết nối với di sản Hawaii của họ – và với gia đình – trong một nhiệm vụ táo bạo: tìm kho báu thất lạc từ lâu.', 38, N'2:32', N'Jude Weng  g                                      ', N'FINDING ‘OHANA - Official Trailer - Netflix.mp4', CAST(N'2021-06-22T08:27:14.000' AS DateTime), N'Owen Vaccaro, Kelly Hu, Branscombe Richmond, Marc Evan Jackson, Chris Parnell, Kea Peahu, Alex Aiono, Lindsay Watson, Brad Kalilimoku, Ke Huy Quan, Ricky Garcia, Mapuana Makia, Ryan Higa, Kyndra Sanchez, Stephon Fung', 6.1, 54, 6, N'Finding ''Ohana                                                                                      ', N'finding-039ohana.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Chính tại những khu ổ chuột của thành Luân Đôn thời Trung Cổ, Arthur lớn lên như một kẻ vô danh, tự do và nghèo khổ. Không ai ngờ được, anh là người được định mệnh sắp đặt trở thành chủ nhân của thanh gươm huyền thoại Excalibur. Phát hiện ra dòng máu vương quyền của mình, Arthur nhanh chóng bị cuốn vào cuộc đại chiến ma thuật chống lại tên vua độc tài Vortigern với hi vọng đem lại hoà bình cho vương quốc.', 39, N'2:34', N'Guy Ritchie                                       ', N'King Arthur- Legend of the Sword - Official Comic-Con Trailer [HD].mp4', CAST(N'2021-06-17T08:30:49.000' AS DateTime), N'Charlie Hunnam, Astrid Bergès-Frisbey, Jude Law, Djimon Hounsou, Eric Bana, Aidan Gillen, Freddie Fox, Craig Mcginlay, Tom Wu, Kingsley Ben-Adir, Neil Maskell, Annabelle Wallis, Geoff Bell, Zac Barker', 7.3, 133, 10, N'King Arthur: Legend of the Sword                                                                    ', N'king-arthur-legend-of-the-sword.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Đã 8 năm trôi qua kể từ khi Rick và Evelyn lần đầu tiên gặp nhau. Trong phần hai của loạt phim về xác ướp Ai Cập, họ đã kết hôn và có một câu con trai kháu khỉnh 8 tuổi Alex. Lần trở lại này, cả Evelyn và Alex đều gặp nguy hiểm khi cậu bé nghịch ngợm đeo vào tay chiếc vòng của Vua Bọ Cạp còn Evelyn thì phát hiện ra mình là một công chúa Ai Cập trong thế giới cổ xưa...', 40, N'2:08', N'Stephen Sommers                                   ', N'The Mummy 5 (2021)Trailer Teaser Concept - Dwayne Johnson, Tom Cruise.mp4', CAST(N'2021-06-24T08:32:35.000' AS DateTime), N'Brendan Fraser, Rachel Weisz, John Hannah, Arnold Vosloo, Patricia Velasquez, Alun Armstrong, Dwayne Johnson, Adewale Akinnuoye-Agbaje, Shaun Parkes, Joe Dixon, Tom Fisher, Oded Fehr, Freddie Boath, Bruce Byron, Aharon Ipalé', 6.3, 3, 10, N'The Mummy Returns                                                                                   ', N'the-mummy-returns.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Wrath of Titans (Sự Phẫn Nộ Của Các Vị Thần) nói về Perseus - con trai thần Zeus đang trải qua cuộc sống êm đềm bên làng chai cùng cậu con trai 10 tuổi tên là Helius, nhưng cuộc tranh chấp giữa các vị thần đã phá vỡ khung cảnh yên ả ấy sự trỗi dậy của các Titan và Zeus bị giam cầm đã buộc Perseus phải tham gia vào nhiệm vụ đầy hiểm nguy mới… Bối cảnh của phim được thực hiện rất chân thực, từ cảnh chiến trường, cảnh vật núi rừng cho đến những khung hình nhanh của những trận giao chiến nảy lửa. Diễn xuất của các nhân vật khá tốt nên mặc dù là 1 phim sử dụng nhiều kĩ xảo nhưng các nhân vật vẫn hiện lên chân thực và sống động.', 41, N'2:21', N'Jonathan Liebesman                                ', N'Wrath of the Titans Official Trailer #1 - Sam Worthington Movie (2012) HD.mp4', CAST(N'2021-06-15T08:34:18.000' AS DateTime), N'John Bell, Toby Kebbell, Rosamund Pike, Matt Milne, Danny Huston, Édgar Ramírez, Sam Worthington, Kathryn Carpenter, Lily James, Bill Nighy, Ralph Fiennes, Liam Neeson, Kett Turton, Freddy Drabble, Alejandro Naranjo', 5.7, 66, 10, N'Wrath of the Titans                                                                                 ', N'wrath-of-the-titans.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Rise of the Guardians (Sự Trỗi Dậy Của Các Vệ Thần) kể về một tên ác quỷ có tên là Pitch âm mưu chiếm lĩnh thế giới bằng cách khơi dậy nỗi sợ hãi trong trái tim trẻ con khắp mọi nơi, một nhóm những người hùng - Ông Già Noel, Chú Thỏ Phục Sinh, Người Cát Nàng Tiên Răng và Jack Frost - hợp lực lại để ngăn cản Pitch. Nhưng đây không phải là tập hợp những nhân vật lấy ra từ các câu chuyện kể, The Guardians là một nhóm người hùng với những sức mạnh đặc biệt. Giờ cùng nhau hợp lực chống lại một kẻ thù chung, The Guardians lắng nghe lời kêu gọi và kết hợp sức mạnh để đánh bại Pitch và bảo vệ thế giới khỏi bóng ma sợ hãi…', 42, N'2:31', N'Peter Ramsey                                      ', N'Trollhunters- Rise Of The Titans - Guillermo del Toro - Official Trailer - Netflix.mp4', CAST(N'2021-06-22T08:35:35.000' AS DateTime), N'Isla Fisher, Dakota Goyo, Khamani Griffin, Alec Baldwin, Jude Law, Dominique Grund, Kamil Mcfadden, Chris Pine, Hugh Jackman, Jacob Bertrand, Emily Nordwind, Ryan Crego, April Lawrence, Olivia Mattingly, Georgie Grieve', 7.2, 5, 10, N'Rise Of The Guardians                                                                               ', N'rise-of-the-guardians.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Đại Náo Thiên Cung là câu chuyện về cuộc đời của Tôn Ngộ Không trước chuyến tháp tùng Đường Tăng đi Ấn Độ thỉnh kinh. Ngưu Ma Vương vì muốn đưa người vợ yêu là Thiết phiến công chúa và con trai là Hồng hài nhi lên thiên đàng nên đã xúi giục Tôn Ngộ Không tấn công triều đình. Do phạm tội đại náo thiên cung nên Tôn Ngộ Không bị Phật Tổ Như Lai phạt nhốt dưới Ngũ Hành Sơn 500 năm cho đến khi được Tam Tạng giải thoát và theo ông đi thỉnh kinh.', 43, N'2:31', N'Pou-Soi Cheang                                    ', N'Monkey King- The One and Only (大圣无双, 2021) chinese fantasy trailer.mp4', CAST(N'2021-06-15T08:37:56.000' AS DateTime), N'Chung Tử Đơn, Châu Nhuận Phát, Quách Phú Thành, Trần Kiều Ân, Trần Tuệ Lâm, Gigi Leung, Trương Tử Lâm, Siu-Fai Cheung, Phàn Thiếu Hoàng, Hà Nhuận Đông, La Trọng Khiêm, Hua Liu, Yitian Hai, Calvin Cheng Ka-Sing, Jing Li', 5.4, 1, 10, N'The Monkey King 1                                                                                   ', N'the-monkey-king-1.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Batman: Under The Red Hood (Batman Đối Đầu Mặt Nạ đỏ) kể về cuộc chiến mới giữa Batman và Người mang mặt nạ đỏ, bộ phim hoạt hình dành cho người lớn với nhiều cảnh bạo lực và được giới phê bình đánh giá rất cao...', 44, N'1:53', N'Brandon Vietti                                    ', N'The Batman- Under the Red Hood - Movie Trailer Concept.mp4', CAST(N'2021-06-17T08:39:17.000' AS DateTime), N'Jim Piddock, Kelly Hu, Jensen Ackles, Carlos Alazraqui, John Dimaggio, Vincent Martella, Wade Williams, Phil Lamarr, Gary Cole, Bruce Greenwood, Brian George, Alexander Martella, Jason Isaacs, Robert Clotworthy, Neil Patrick Harris', 7.8, 67, 10, N'Batman: Under The Red Hood                                                                          ', N'batman-under-the-red-hood.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Loki kể về khi Steve Rogers, Tony Stark và Scott Lang quay trở về cột mốc 2012, ngay khi trận chiến ở New York kết thúc, để “mượn tạm” quyền trượng của Loki. Nhưng một tai nạn bất ngờ xảy đến, khiến Loki nhặt được khối lặp phương Tesseract và tiện thể tẩu thoát. Cuộc trốn thoát này đã dẫn đến dòng thời gian bị rối loạn. Cục TVA – tổ chức bảo vệ tính nguyên vẹn của dòng chảy thời gian, buộc phải can thiệp, đi gô cổ ông thần này về làm việc. Tại đây, Loki có hai lựa chọn, một là giúp TVA ổn định lại thời gian, không thì bị tiêu hủy. Dĩ nhiên Loki chọn lựa chọn thứ nhất. Nhưng đây là nước đi vô cùng mạo hiểm, vì ông thần này thường lọc lừa, “lươn lẹo”, chuyên đâm lén như bản tính tự nhiên của gã.', 45, N'2:16', N'Kate Herron                                       ', N'Marvel Studios'' Loki - Official Trailer - Disney+.mp4', CAST(N'2021-06-10T08:42:49.000' AS DateTime), N'Tom Hiddleston, Owen Wilson, Sophia Di Martino, Wunmi Mosaku, Eugene Cordero, Tara Strong', 7, 32, 3, N'Loki                                                                                                ', N'loki_1623740387.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Dominic Toretto đang có một cuộc sống yên tĩnh ngoài lưới điện với Letty và con trai của anh ta, cậu bé Brian, nhưng họ biết rằng nguy hiểm luôn rình rập ngay phía chân trời yên bình của họ. Lần này, mối đe dọa đó sẽ buộc Dom phải đối mặt với tội lỗi trong quá khứ của mình nếu anh ấy định cứu những người anh ấy yêu thương nhất. Phi hành đoàn của anh ấy tham gia cùng nhau để ngăn chặn một âm mưu kinh hoàng thế giới được dẫn dắt bởi sát thủ lành nghề nhất và người lái xe hiệu suất cao nhất mà họ từng gặp: một người đàn ông cũng là người anh trai bị bỏ rơi của Dom, Jakob.', 46, N'3:50', N'Justin Lin                                        ', N'FAST AND FURIOUS 9 Trailer (2021).mp4', CAST(N'2021-06-16T08:44:16.000' AS DateTime), N'Vin Diesel, Tyrese Gibson, Cody Rain Murray, Krzysztof Mardula, John Cena', 8.5, 100, 3, N'Fast & Furious 9                                                                                    ', N'fast-furious-91622477760.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Một nhóm thanh thiếu niên bắt đầu một chuyến hành trình khai phá sự sống ở một hành tinh xa xôi khác. Tuy nhiên, họ phát hiện ra bí mật được che giấu đằng sau nhiệm vụ cao cả này, tất cả bắt đầu kháng cự lại việc huấn luyện và để bản năng nguyên thuỷ lấn chiếm cảm xúc. Khi vận mệnh của cả phi đoàn rơi vào hỗn loạn, họ bị chôn vùi trong sợ hãi, ham muốn và cơn khao khát quyền lực.', 47, N'2:26', N'Neil Burger                                       ', N'Voyagers (2021 Movie) Official Trailer – Tye Sheridan, Lily-Rose Depp.mp4', CAST(N'2021-05-30T08:45:47.000' AS DateTime), N'Colin Farrell, Tye Sheridan, Lily-Rose Depp', 8.3, 23, 3, N'Voyagers                                                                                            ', N'voyagers1620311197.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Todd Hewwitt (Tom Holland) tình cờ phát hiện ra Viola (Daisy Ridley)- một cô gái sống sót sau khi phi thuyền của cô gặp nạn và rơi xuống hành tinh của cậu. Hành tinh này không hề có bóng dáng phụ nữ, còn đàn ông thì bị ảnh hưởng bởi ''Tiếng Ồn'' - một thế lực thể hiện toàn bộ suy nghĩ của họ ra bên ngoài. Vì là cô gái duy nhất trên hành tinh kì lạ này, tính mạng của Viola bị đe dọa. Todd quyết tâm bảo vệ Viola và cả hai bị cuốn vào cuộc phiêu lưu nguy hiểm. Từ đó, Todd dần khám phá ra năng lực đặc biệt của mình, và phát hiện ra những bí mật đen tối của hành tinh mà cậu đang sống.', 48, N'2:30', N'Doug Liman                                        ', N'Chaos Walking (2021 Movie) Official Trailer – Daisy Ridley, Tom Holland, Nick Jonas.mp4', CAST(N'2021-06-08T08:47:37.000' AS DateTime), N'Tom Holland, Daisy Ridley, Demian Bichir, David Oyelowo, Cynthia Erivo, Bethany Anne Lind, Mads Mikkelsen, Nick Jonas, Ray Mckinnon, Vincent Leclerc, Frank Fontaine, Kurt Sutter, Blane Crockarell, François Gauthier, Tyrone Benskin', 5.8, 5, 3, N'Chaos Walking                                                                                       ', N'chaos-walking.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Khi Snyder rời dự án vì cái chết của con gái Autumn vào năm 2017, Hãng Warner Bros. tuyển đạo diễn Joss Whedon, người từng làm The Avengers và Avengers: Age of Ultron của Marvel, thay thế. Rốt cuộc, đó là một trong những bộ phim "tệ hại nhất thập niên 2010" với các tuyến nhân vật mỏng, hình ảnh âm u và những pha hành động hỗn loạn.

Bản dựng Justice League dài 4 tiếng của đạo diễn Zack Snyder là bản dựng mang đúng phong cách Snyder - một trong những nhà sáng tạo quan trọng của vũ trụ siêu anh hùng DC với tầm nhìn xa và giọng kể riêng biệt.

Khán giả sẽ thấy Victor Stone - siêu anh hùng Cyborg đã có một thời trung học thiếu vắng tình cha, mất đi người mẹ, và nguyên do anh trở thành một siêu anh hùng "nửa người nửa máy" với bộ óc siêu việt, khả năng thao túng công nghệ và thích ứng với người ngoài hành tinh.

Khán giả sẽ thấy sự kết hợp giữa các siêu anh hùng lừng lẫy nhất vũ trụ DC - Batman, Superman, Wonder Woman, Flash, Cyborg, Aquaman - diễn ra đầy thuyết phục, vừa đủ để tôn vinh mỗi người nhưng vừa đoàn kết, cân bằng để không ai "một mình cân tất".', 49, N'2:26', N'Zack Snyder                                       ', N'Zack Snyder''s Justice League - Official Trailer - HBO Max.mp4', CAST(N'2021-04-15T08:50:33.000' AS DateTime), N'Ben Affleck, Henry Cavill, Amy Adams, Gal Gadot, Ray Fisher, Jason Momoa, Ezra Miller, Willem Dafoe, Jesse Eisenberg, Jeremy Irons, Diane Lane, Connie Nielsen, J.k. Simmons, Ciarán Hinds, Trịnh Khải, Jared Leto, Robin Wright, Kiersey Clemons, Karen B', 8.4, 56, 3, N'Zack Snyder''s Justice League                                                                        ', N'zack-snyder039s-justice-league.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hậu Duệ Thần Sấm là câu chuyện phiêu lưu giả tưởng về một chàng trai trẻ tên Eric (Nat Wolff), người phát hiện ra mình có sức mạnh giống như “Thần Sấm” trong thần thoại Na Uy cổ đại. Trong khi ẩn náu ở vùng hoang dã phía tây Na Uy, Eric vô tình giết chết một thiếu niên theo cách khó giải thích và không lâu sau cậu bị bắt.

Trước khi bị thẩm vấn, anh gặp Christine, một nhà tâm lý học trẻ tuổi đang cố gắng tìm hiểu thực sự đã có điều gì xảy ra. Cô tin vào Eric và cảm thấy đồng cảm với anh. Ngay sau đó, đại sứ quán Mỹ xuất hiện, ông ta muốn dẫn độ Eric, nhưng Eric đã nhanh chóng chạy trốn cùng Christine. Trên đường chạy trốn, theo sau là những nhà chức trách của Na Uy và Mỹ theo đuổi, Eric cuối cùng đã phát hiện ra anh ta thực sự là ai, hay là cái gì đó mà trước nay anh luôn muốn biết….', 50, N'2:17', N'André Øvredal                                     ', N'Mortal Kombat Movie - Official Hindi Trailer.mp4', CAST(N'2021-06-07T08:52:21.000' AS DateTime), N'Nat Wolff, Priyanka Bose, Iben Akerlie, Arthur Hakalahti, Ania Nova, Oddrun Valestrand, Ravdeep Singh Bajwa, Sunniva Lind Høverstad, Martin Grid Toennesen, Per Frisch, Per Egil Aske, Sveinung Augestad, Inger Berit Grøterud, Craig Narveson, Torunn Lød', 5.8, 2, 3, N'Mortal                                                                                              ', N'mortal.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Thời Khắc Thanh Trừng - The Cleansing Hour 2019 - HD VietSub Thời Khắc Thanh Trừng kể về Các doanh nhân ngàn năm, Drew và Max, điều hành một webcast truyền trực tiếp các hoạt động trừ tà, trên thực tế, là những trò lừa bịp được dàn dựng công phu. Nhưng họ có được sự xuất hiện của mình khi nữ diễn viên ngày nay bị chiếm hữu một cách bí ẩn bởi một con quỷ thực sự đang giam giữ con tin phi hành đoàn. Để làm cho vấn đề tồi tệ hơn– nạn nhân bị chiếm hữu là vị hôn thê của Drew, Lane. Trước một lượng khán giả toàn cầu đang tăng nhanh, con quỷ khiến Max phải chịu một loạt các thử thách bạo lực và nhục nhã nhằm trừng phạt anh ta vì trò chơi đố chữ trực tuyến của anh ta. Trong khi đó, trong nỗ lực cứu vãn tình yêu của đời mình, Drew phát hiện ra rằng động cơ độc ác của con quỷ không chỉ là để trả thù, ...', 60, N'1:07', N'Damien LeVeck                                     ', N'The Cleansing Hour - Official Trailer [HD] - A Shudder Original.mp4', CAST(N'2021-06-09T10:48:31.000' AS DateTime), N'Alix Angelis, Chris Lew Kum Hoi, Daniel Hoffmann-Gill, Emma Holzer, Ionut Grama, Joanna David, Kyle Gallner, Lidy Aurora Meza, Ryan Guzman', 5.6, 3, 1, N'The Cleansing Hour ', N'the-cleansing-hour1610180438.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Trong bộ phim hài này, tài xế vận tải y tế Vic đã mạo hiểm công việc của mình để đưa đón một nhóm cao niên ồn ào và một võ sĩ quyền anh người Nga đến đám tang. Anh kéo theo những khách hàng như Tracy, một phụ nữ trẻ mắc bệnh ALS, cùng đi.
', 61, N'2:24', N'Kirill Mikhanovsky                                ', N'Give Me Liberty - Official Trailer.mp4', CAST(N'2021-06-16T10:50:46.000' AS DateTime), N'Chris Galust, Lauren ''lolo'' Spencer, Maxim Stoyanov, Steve Wolski, Michelle Caspar, Ben Derfel, Arkady Basin, Zoya Makhlina, Darya Ekamasova, Sheryl Sims-Daniels, John Day, Atavia Gold Star, Jehonathan Guzman, Josette Daniels, Michael Ervin', 7.8, 2, 1, N'Give Me Liberty', N'give-me-liberty.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Đám người Mông Cổ, do Khan Burunda chỉ huy, di chuyển về phía tây, phá hủy mọi thứ trên đường đi của nó và bắt giữ các tù nhân. Đã đến dãy núi Carpathian cao, đội quân dừng lại dưới chân. Vào ban đêm, một số thợ săn địa phương, anh em nhà Berkut, lẻn vào trại và giải thoát các tù nhân. Khi biết được điều này, Burunda trở nên tức giận và quyết định trả thù bằng cách phá hủy các khu định cư địa phương. Để làm điều này, anh ta tìm thấy một kẻ phản bội trong số những người dân địa phương, người này đã mở cho anh ta một lối đi bí mật trên núi. Tuy nhiên, những thợ săn trên núi dưới sự lãnh đạo của Zakhar Berkut có kế hoạch riêng của họ để ngăn chặn kẻ thù một lần và mãi mãi.', 62, N'1:56', N'John Wynn, Akhtem Seitablaev                      ', N'The Rising Hawk - Trailer [Exclusive].mp4', CAST(N'2021-06-15T10:52:40.000' AS DateTime), N'Alison Doody, Robert Patrick, Tommy Flanagan, Poppy Drayton, Rocky Myers, Oleh Voloschenko, Alex Macnicoll, Alina Kovalenko, Oliver Trevena, Tserenbold Tsegmid, Andrey Isaenko, Oleg Karpenko, Erzhan Nurymbet, Viktor Zhdanov, Maryna Koshkina', 7.9, 4, 9, N'The Rising Hawk', N'the-rising-hawk.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Nellie Bly là một nhà báo, cô sinh ra và lớn lên trong khó khăn, luôn có mong muốn giúp đỡ những người có hoàn cảnh éo le hơn mình. Cô đã đột nhập vào một trại tị nạn tâm thần – nơi chưa từng có ai dám khám phá, để tự trải nghiệm đồng thời viết nên câu chuyện của mình…', 64, N'1:43', N'Karen Moncrieff                                   ', N'Escaping the Madhouse- The Nellie Bly Story - Official Trailer - Lifetime.mp4', CAST(N'2021-06-08T10:54:29.000' AS DateTime), N'Christina Ricci, Josh Bowman, Anja Savcic, Mark Hildreth, Nikki Duval, Judith Light, Tamara Gorski, Paul Essiembre, Sharon Bajer, Lauren Cochrane, Muriel Hogue, Johise Namwira, Joyce Krenz, Harry Nelken, Chris Sigurdson', 4.5, 4, 9, N'Escaping the Madhouse: The Nellie Bly Story', N'escaping-the-madhouse-the-nellie-bly-story.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Sau khi được tuyển mộ bởi một nhóm trộm độc đáo, tên tội phạm nổi tiếng Richard Pace thấy mình bị cuốn vào một vụ trộm vàng phức tạp hứa hẹn sẽ có những tác động sâu rộng đến cuộc sống của anh ta và cuộc sống của vô số người khác.', 66, N'3:03', N'Renny Harlin                                      ', N'THE MISFITS Official Trailer (2021).mp4', CAST(N'2021-06-16T10:57:04.000' AS DateTime), N'Pierce Brosnan, Tim Roth, Nick Cannon', 7, 2, 6, N'The Misfits', N'60d013003d126_di-435_627.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Vào đầu những năm 1980, đại dịch vết nứt đã xé toạc các thành phố nội đô của Mỹ như một cơn sóng thần, tàn phá tất cả ngay sau khi nó bùng phát.', 67, N'2:10', N'Stanley Nelson                                    ', N'Crack- Cocaine, Corruption & Conspiracy - Official Trailer - Netflix.mp4', CAST(N'2021-06-08T11:01:45.000' AS DateTime), N'Mitch Credle, Noveen Crumbie, Koe Rodriguez', 6.7, 3, 6, N'Crack: Cocaine, Corruption & Conspiracy ', N'crack-cocaine-corruption-conspiracy1620373236.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Cuộc Chiến Vì Con xoay quanh câu chuyện của một người mẹ từng buôn bán, vận chuyển ma túy tại Nga đang muốn xóa bỏ đi quá khứ của mình tên là Victoria. Nhưng cảnh sát về hưu tên Damon vì muốn cô đối đầu với mình trong một cuộc chiến, để khiêu khích và ép buộc Victoria ra mặt hắn đã bắt cóc con gái cô. Để cứu con gái, Victoria bắt buộc phải bước vào trận chiến này.', 68, N'2:30', N'George Gallo                                      ', N'Vanquish Trailer #1 (2021) - Movieclips Trailers.mp4', CAST(N'2021-06-10T11:03:39.000' AS DateTime), N'Ruby Rose, Morgan Freeman, Patrick Muldoon', 7.9, 45, 10, N'Vanquish', N'vanquish1620314739.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Taylor Harris bất ngờ bị sa thải. Không còn cách nào khác Taylor Harris đành phải trở về quê nhà của mình ở Montana. Tại đây cô bắt tay vào việc giúp sức cứu khách sạn của anh trai mình trong thị trấn thoát khỏi bàn tay của gã tài phiệt lắm tiền Joel Sheenan. Anh ta đang lên kế hoạch cải tạo lại hoàn toàn khách sạn, mà đây không phải là điều anh trai và Taylor mong muốn, sau nhiều lần tiếp xúc đấu đá với nhau, Taylor và Joel dần nảy sinh tình cảm đặc biệt dành cho nhau.', 69, N'2:10', N'Bradley Walsh                                     ', N'COLOURS OF LOVE - Official Trailer [HD] - Paramount Movies.mp4', CAST(N'2021-06-09T11:05:17.000' AS DateTime), N'Dennis Andres, Michael Brown, Jenni Burke', 8.6, 56, 10, N'Colors of love', N'colors-of-love1620311367 (1).jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Tom Clancy''s Without Remorse (2021) là một bộ phim kinh dị hành động của Mỹ năm 2021 dựa trên phiên bản hiện đại hóa những năm 2010 của cuốn tiểu thuyết cùng tên năm 1993 của Tom Clancy và là phần ngoại truyện của loạt phim Jack Ryan. Phim có sự tham gia của các diễn viên Michael B. Jordan, Jodie Turner-Smith, Jamie Bell, Guy Pearce…', 70, N'2:19', N'Stefano Sollima                                   ', N'Without Remorse - Official Trailer - Prime Video.mp4', CAST(N'2021-06-24T11:07:10.000' AS DateTime), N'Michael B. Jordan', 5.5, 4, 3, N'Without Remorse', N'without-remorse1620308564.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Sau khi chứng kiến con trai mình mất mạng vì sử dụng thuốc giảm đau, một người đàn ông đã bắt đầu dấn thân vào công cuộc tìm diệt các "ông trùm" tài phiệt đứng sau các thương hiệu thuốc giảm đau lớn...', 71, N'2:02', N'Mark Savage                                       ', N'PAINKILLER (2021) Movie Trailer.mp4', CAST(N'2021-06-24T11:09:00.000' AS DateTime), N'Michael Paré, Bill Oberst Jr., Alexander Pennecke', 3.4, 3, 3, N'Painkiller', N'painkiller1620308017.jpg')
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentHistory] ON 

INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-06-06T00:00:00.000' AS DateTime), 5435, 1)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-03-12T00:00:00.000' AS DateTime), 4535, 2)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-01-09T14:57:06.000' AS DateTime), 3245, 3)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-11-24T14:57:30.000' AS DateTime), 10, 4)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (3, CAST(N'2021-08-30T14:57:39.000' AS DateTime), 65423, 5)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (3, CAST(N'2021-05-10T14:57:46.000' AS DateTime), 54453, 6)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (5, CAST(N'2021-07-09T14:58:04.000' AS DateTime), 435454, 7)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (5, CAST(N'2021-03-08T14:58:15.000' AS DateTime), 534534, 8)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-04-30T16:19:28.000' AS DateTime), 34534, 10)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-12-29T16:19:57.000' AS DateTime), 4324, 11)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2020-02-13T16:27:24.000' AS DateTime), 545, 12)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-01-30T19:21:18.000' AS DateTime), 4343, 13)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-11-11T19:45:34.000' AS DateTime), 5, 14)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-11-18T19:56:02.000' AS DateTime), 45, 15)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-11-15T19:56:20.000' AS DateTime), 67, 16)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (2, CAST(N'2021-11-11T19:56:35.000' AS DateTime), 34, 17)
SET IDENTITY_INSERT [dbo].[PaymentHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (1, 1, N'profile', NULL)
INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (2, 3, N'dssf', 45)
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT (NULL) FOR [Name]
GO
USE [master]
GO
ALTER DATABASE [QLMEDIA] SET  READ_WRITE 
GO
