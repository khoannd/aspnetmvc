/****** Object:  Database [NewsFri]    Script Date: 11/30/2019 10:28:34 AM ******/
CREATE DATABASE [NewsFri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewsFri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NewsFri.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NewsFri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NewsFri_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsFri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsFri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsFri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsFri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsFri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsFri] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsFri] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewsFri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsFri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsFri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsFri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsFri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsFri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsFri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsFri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsFri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NewsFri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsFri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsFri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsFri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsFri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsFri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewsFri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsFri] SET RECOVERY FULL 
GO
ALTER DATABASE [NewsFri] SET  MULTI_USER 
GO
ALTER DATABASE [NewsFri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsFri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsFri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsFri] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NewsFri', N'ON'
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2019 10:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/30/2019 10:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/30/2019 10:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ShortDesc] [varchar](500) NOT NULL,
	[LongDesc] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Published] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 11/30/2019 10:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[NewsID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_NewsCategory] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/30/2019 10:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'Hot')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'Entertainment')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'Art')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (4, N'Sport')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [UserID], [Title], [ShortDesc], [LongDesc], [CreatedDate], [ImageUrl], [Published]) VALUES (1, 1, N'HoaHong_Plan', N'dadsa', N'<div>dads</div>', CAST(N'2019-11-29T15:53:22.000' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [ShortDesc], [LongDesc], [CreatedDate], [ImageUrl], [Published]) VALUES (2, 1, N'SampleProject1', N'asdasd', N'<div>dasda</div>', CAST(N'2019-11-29T15:54:03.000' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [ShortDesc], [LongDesc], [CreatedDate], [ImageUrl], [Published]) VALUES (3, 1, N'SampleProject1', N'aaa', N'<div>aaa</div>', CAST(N'2019-11-29T16:06:56.000' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [ShortDesc], [LongDesc], [CreatedDate], [ImageUrl], [Published]) VALUES (4, 1, N'Test file', N'Adsah', N'<div>das <b>adasd </b>ad</div>', CAST(N'2019-11-29T16:14:40.000' AS DateTime), N'/NewsImages/img2E.jpg', 0)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [FullName], [Active]) VALUES (1, N'khoan', N'khoan', N'khoan', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [FullName], [Active]) VALUES (2, N'admin', N'admin', N'admin', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Published]  DEFAULT ((0)) FOR [Published]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_News]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[NewsCategory]  WITH CHECK ADD  CONSTRAINT [FK_NewsCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[NewsCategory] CHECK CONSTRAINT [FK_NewsCategory_Category]
GO
ALTER TABLE [dbo].[NewsCategory]  WITH CHECK ADD  CONSTRAINT [FK_NewsCategory_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[NewsCategory] CHECK CONSTRAINT [FK_NewsCategory_News]
GO
ALTER DATABASE [NewsFri] SET  READ_WRITE 
GO
