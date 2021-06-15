USE [master]
GO
/****** Object:  Database [QLMEDIA]    Script Date: 6/15/2021 7:45:02 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/15/2021 7:45:03 PM ******/
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
	[Address] [nvarchar](50) NULL,
	[TaxCode] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindOfVideo]    Script Date: 6/15/2021 7:45:03 PM ******/
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
/****** Object:  Table [dbo].[ListMediaLike]    Script Date: 6/15/2021 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMediaLike](
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
/****** Object:  Table [dbo].[ListMediaView]    Script Date: 6/15/2021 7:45:03 PM ******/
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
/****** Object:  Table [dbo].[Media]    Script Date: 6/15/2021 7:45:03 PM ******/
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
	[TypeMedia] [int] NULL,
	[Actor] [nvarchar](max) NULL,
	[IMDB] [float] NULL,
	[FileFormat] [nvarchar](50) NULL,
	[Likes] [int] NULL,
	[Genre] [int] NULL,
	[Name] [nchar](100) NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Media_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyPlayList]    Script Date: 6/15/2021 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyPlayList](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
 CONSTRAINT [PK_MyPlayList] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 6/15/2021 7:45:03 PM ******/
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
/****** Object:  Table [dbo].[Profile]    Script Date: 6/15/2021 7:45:03 PM ******/
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
/****** Object:  Table [dbo].[TypeMedia]    Script Date: 6/15/2021 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMedia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeMedia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (1, N'sdsadfas', N'dasda', N'gsdgsd', N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (2, N'gdffdmhgbn', N'hdfgfghg', N'dfgdf', N'0', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[KindOfVideo] ON 

INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (1, N'18+')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (2, N'Tâm lý')
SET IDENTITY_INSERT [dbo].[KindOfVideo] OFF
GO
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 2, 3, N'1:34')
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (2, 3, 3, 45, N'2:45')
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'das  das  dasdas  das  dasdas  das  dasdas  das  dasdas  das  dasdas  das  dasdas  das  dasdas  das  das', 1, N'4:55', N'Martin Scorsese                                   ', N'https://www.youtube.com/watch?v=Eqah3g7BFjY', CAST(N'2021-06-23T00:00:00.000' AS DateTime), 2, N'Gael García Bernal', 4.5, N'MEDIA', 10, 1, N'dsafdsdghfjjhjghfgdfd                                                                               ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'tinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗtinh yêu bến đỗ', 2, N'10:34', N'David Lynch                                       ', N'https://www.youtube.com/watch?v=dd-kUF_tcMw', CAST(N'2021-06-21T07:05:05.000' AS DateTime), 1, N'Sônia Braga', 3.4, N'MEDIA', 10, 2, N'tinh yêu bến đỗ                                                                                     ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'hai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơnghai phựơng', 3, N'3:45', N'Joel and Ethan Coen                               ', N'https://www.youtube.com/watch?v=duszzjvhglo', CAST(N'2021-06-16T07:05:07.000' AS DateTime), 1, N'Mahershala Ali', 9, N'MEDIA', 20, 1, N'hai phựơng                                                                                          ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  fsdfd fsdfd  ', 4, N'4:56', N'dfdgxcgvh                                         ', N'czczx', CAST(N'2013-07-19T00:00:00.000' AS DateTime), 2, N'Melissa McCarthy', 7, N'MEDIA', 4, 1, N'dssdsssssss  d                                                                                      ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'ewq', 15, N'ew', N'ewq                                               ', N'ew', CAST(N'2021-06-11T10:36:10.770' AS DateTime), 0, N'ew', 4, N'MEDIA', 0, 1, N'swe                                                                                                 ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'rwe', 16, N'rew', N'rwe                                               ', N'rew', CAST(N'2021-06-11T10:36:35.347' AS DateTime), 0, N'wer', 4, N'MEDIA', 0, 2, N'fgdtfyu                                                                                             ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'das', 17, N'dsas', N'dsaf                                              ', N'dsasf', CAST(N'2021-06-11T10:36:50.780' AS DateTime), 0, N'sad', 4, N'MEDIA', 0, 2, N'sdass                                                                                               ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (N'dasfgd', 18, N'fdsg', N'dfs                                               ', N'dfs', CAST(N'2021-06-11T10:37:22.373' AS DateTime), 0, N'dsfg', 9, N'MEDIA', 0, 2, N'fgh                                                                                                 ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (NULL, 19, NULL, N'cxc                                               ', NULL, CAST(N'2025-01-16T10:54:55.000' AS DateTime), 2, N'trt', NULL, N'SOUND', 5, NULL, N'am thnah                                                                                            ', NULL)
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [TypeMedia], [Actor], [IMDB], [FileFormat], [Likes], [Genre], [Name], [Poster]) VALUES (NULL, 20, NULL, N'dsad                                              ', N'dsad', CAST(N'2021-06-29T10:57:00.000' AS DateTime), 1, N'das', NULL, N'IMAGE', 5, NULL, N'hinh anh                                                                                            ', NULL)
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
INSERT [dbo].[MyPlayList] ([IdAccount], [IdProfile], [IdMedia]) VALUES (1, 1, 2)
INSERT [dbo].[MyPlayList] ([IdAccount], [IdProfile], [IdMedia]) VALUES (2, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[PaymentHistory] ON 

INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 324123.22, 1)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 45354654, 2)
SET IDENTITY_INSERT [dbo].[PaymentHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (1, 1, N'profile', NULL)
INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (2, 3, N'dssf', 45)
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMedia] ON 

INSERT [dbo].[TypeMedia] ([Id], [Name]) VALUES (1, N'kich tinh')
INSERT [dbo].[TypeMedia] ([Id], [Name]) VALUES (2, N'hành động')
SET IDENTITY_INSERT [dbo].[TypeMedia] OFF
GO
USE [master]
GO
ALTER DATABASE [QLMEDIA] SET  READ_WRITE 
GO
