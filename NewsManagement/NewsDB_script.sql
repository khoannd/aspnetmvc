/****** Object:  Database [News]    Script Date: 11/28/2019 9:20:54 AM ******/
CREATE DATABASE [News]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'News', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\News.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'News_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\News_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [News] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [News] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [News] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [News] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [News] SET ARITHABORT OFF 
GO
ALTER DATABASE [News] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [News] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [News] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [News] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [News] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [News] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [News] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [News] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [News] SET  DISABLE_BROKER 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [News] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [News] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [News] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [News] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [News] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [News] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [News] SET RECOVERY FULL 
GO
ALTER DATABASE [News] SET  MULTI_USER 
GO
ALTER DATABASE [News] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [News] SET DB_CHAINING OFF 
GO
ALTER DATABASE [News] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [News] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [News] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'News', N'ON'
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/28/2019 9:20:54 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 11/28/2019 9:20:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[Approval] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/28/2019 9:20:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Published] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 11/28/2019 9:20:55 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/28/2019 9:20:55 AM ******/
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
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'Sport')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (1, 1, N'HoaHong_Plan', N'ad <span style="font-weight: bold;">jkahdkasjdh </span>akdf sfdsf sdfsd', CAST(N'2019-11-27T12:09:06.080' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (2, 1, N'Manager', N'<p><strong>aaaaaaaaaaa</strong> aa aaaa aaaa</p>', CAST(N'2019-11-27T12:00:00.000' AS DateTime), N'adsadas', N'/url/image.png', 1)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (3, 1, N'Test category', N'<p>bbbbb</p>', CAST(N'2019-11-27T12:00:00.000' AS DateTime), N'aaaa', N'/url/image.png', 1)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (4, 1, N'SampleProject1', N'<p>aaa</p>', CAST(N'2019-11-27T12:00:00.000' AS DateTime), N'aaa', NULL, 1)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (5, 1, N'SampleProject1', N'<p>b</p>', CAST(N'2019-11-27T12:00:00.000' AS DateTime), N'a', NULL, 1)
INSERT [dbo].[News] ([NewsID], [UserID], [Title], [Content], [CreatedTime], [ShortDesc], [ImageUrl], [Published]) VALUES (6, 1, N'HoaHong_Plan111', N'3', CAST(N'2019-11-27T12:00:00.000' AS DateTime), N'2', NULL, 1)
SET IDENTITY_INSERT [dbo].[News] OFF
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (1, 3)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (3, 2)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (3, 3)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (4, 2)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (4, 3)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (5, 2)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (5, 3)
INSERT [dbo].[NewsCategory] ([NewsID], [CategoryID]) VALUES (6, 2)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [FullName], [Active]) VALUES (1, N'khoan', N'123', N'Khoan Nguyen', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [FullName], [Active]) VALUES (2, N'user1', N'202cb962ac59075b964b07152d234b70', N'User One', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [FullName], [Active]) VALUES (3, N'test1', N'f3b4f33e942ed038209b75664d5c0135', N'Test One', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Pulished]  DEFAULT ((0)) FOR [Published]
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
ALTER DATABASE [News] SET  READ_WRITE 
GO
