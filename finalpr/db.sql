USE [master]
GO
/****** Object:  Database [SalesFood]    Script Date: 1/7/2019 8:00:03 AM ******/
CREATE DATABASE [SalesFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesFood', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\SalesFood.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalesFood_log', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\SalesFood_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalesFood] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalesFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SalesFood] SET  MULTI_USER 
GO
ALTER DATABASE [SalesFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesFood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SalesFood] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SalesFood]
GO
/****** Object:  UserDefinedFunction [dbo].[f_NextID]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[f_NextID]() RETURNS INT as
BEGIN
 
 RETURN ISNULL(IDENT_CURRENT('PRODUCTS'),0) + 1
 END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[Id] [varchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK__CATEGORY__3214EC07E6A9AC36] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[PId] [int] NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HighlightP]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighlightP](
	[Pid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Usename] [varchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Orders_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 1/7/2019 8:00:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [ntext] NULL,
	[Img] [nvarchar](max) NULL,
	[Cate_id] [varchar](100) NULL,
 CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role]) VALUES (N'abcpower123', N'1', N'Dang thanh hao', 1)
INSERT [dbo].[CATEGORY] ([Id], [Name]) VALUES (N'DR', N'Thức uống')
INSERT [dbo].[CATEGORY] ([Id], [Name]) VALUES (N'FF', N'Thức ăn nhanh')
INSERT [dbo].[CATEGORY] ([Id], [Name]) VALUES (N'JP', N'Đồ ăn Nhật')
INSERT [dbo].[CATEGORY] ([Id], [Name]) VALUES (N'KR', N'Đồ ăn Hàn')
INSERT [dbo].[CATEGORY] ([Id], [Name]) VALUES (N'VN', N'Đồ ăn Việt')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [Username], [PId], [Comment]) VALUES (1, N'abcpower123', 2, N'Dở ẹc')
INSERT [dbo].[Feedback] ([Id], [Username], [PId], [Comment]) VALUES (10, N'abcpower123', 2, N'1123')
INSERT [dbo].[Feedback] ([Id], [Username], [PId], [Comment]) VALUES (12, N'abcpower123', 13, N'ngon')
INSERT [dbo].[Feedback] ([Id], [Username], [PId], [Comment]) VALUES (11, N'abcpower123', 2, N'1123')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[HighlightP] ([Pid]) VALUES (1)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [Usename], [ProductID], [Date], [Quantity], [Price]) VALUES (1, N'abcpower123', 8, CAST(N'2018-06-28' AS Date), 4, 5000.0000)
INSERT [dbo].[Orders] ([OrderID], [Usename], [ProductID], [Date], [Quantity], [Price]) VALUES (2, N'abcpower123', 1, CAST(N'2018-06-29' AS Date), 2, 15000.0000)
INSERT [dbo].[Orders] ([OrderID], [Usename], [ProductID], [Date], [Quantity], [Price]) VALUES (3, N'abcpower123', 14, CAST(N'2018-06-29' AS Date), 5, 80000.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (1, N'Cà phê', 15000.0000, N'Cà phê đen đậm đà. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'1caphe.jpg', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (2, N'Chim cút nướng', 30000.0000, N'Ngon bổ rẻ. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'2chimcutnuong.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (3, N'Coca cola', 70000.0000, N'Coca 1 ly. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'3coca.png', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (4, N'Ếch xào xả ớt', 50000.0000, N'Ếch xào xả ớt nóng hổi thơm ngon không thể cưỡng lại', N'4echxaoxaot.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (5, N'Gỏi cá', 50000.0000, N'ngon ngon. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'5goica.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (6, N'Kimbap', 2000.0000, N'Nhiều bạn trẻ ưa chuộng. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'6kimbap.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (7, N'Mỳ cay', 35000.0000, N'Cay cay nóng nóng ngon ngon. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'7mycay.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (8, N'Nước lọc', 5000.0000, N'Nước uống lavie. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'8nuocloc.jpg', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (9, N'Sushi', 50000.0000, N'Lạ miệng+ hấp dẫn.Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'9sushi.jpg', N'JP')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (10, N'Toboki', 40000.0000, N'Bánh gạo cay - món ăn truyền thống xứ Hàn. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'10toboki.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (11, N'Pizza hải sản', 80000.0000, N'abc xyz. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'11pizza.jpg', N'JP')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (13, N'Lẩu hải sản', 100000.0000, N'3 người ăn. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'13lauhaisan.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (14, N'Banh trang cuon thit heo', 80000.0000, N'Dac san. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'14banhtrangcuonthitheo.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (17, N'Cà phê loại 2', 20000.0000, N'Cà phê đậm đà. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'1caphe.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (18, N'Cà phê', 15000.0000, N'Cà phê đen đậm đà. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'1caphe.jpg', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (19, N'Chim cút nướng', 30000.0000, N'Ngon bổ rẻ. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'2chimcutnuong.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (20, N'Coca cola', 70000.0000, N'Coca 1 ly. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'3coca.png', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (21, N'Ếch xào xả ớt', 50000.0000, N'Ếch xào xả ớt nóng hổi thơm ngon không thể cưỡng lại. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'4echxaoxaot.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (22, N'Gỏi cá', 50000.0000, N'ngon ngon. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'5goica.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (23, N'Kimbap', 2000.0000, N'Nhiều bạn trẻ ưa chuộng.Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'6kimbap.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (24, N'Mỳ cay', 35000.0000, N'Cay cay nóng nóng ngon ngon. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'7mycay.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (25, N'Nước lọc', 5000.0000, N'Nước uống lavie. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Modi ducimus temporibus ipsam unde iusto illo veniam aperiam consectetur. Recusandae natus eligendi non libero vitae vero dicta nihil sed eius temporibus!', N'8nuocloc.jpg', N'DR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (27, N'Toboki2', 40000.0000, N'Bánh gạo cay - món ăn truyền thống xứ Hàn', N'10toboki.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (120, N'mon an moi', 1.0000, N'1', N'button2.png', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (121, N'Xanh đỏ tím vàng', 1000.0000, N'Nhiều màu sắc', N'c1.jpg', N'VN')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (122, N'Bitten khoai tây', 20000.0000, N'Nhiều dầu mỡ', N'c2.jpg', N'KR')
INSERT [dbo].[PRODUCTS] ([Id], [Name], [Price], [Description], [Img], [Cate_id]) VALUES (123, N'Gà rán cục', 20000.0000, N'loremmmmmmmmmmmmmmmmmmmmm', N'c3.jpg', N'FF')
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([Usename])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PRODUCTS] FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCTS] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PRODUCTS]
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK__PRODDUCT__Cate_i__117F9D94] FOREIGN KEY([Cate_id])
REFERENCES [dbo].[CATEGORY] ([Id])
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK__PRODDUCT__Cate_i__117F9D94]
GO
USE [master]
GO
ALTER DATABASE [SalesFood] SET  READ_WRITE 
GO
