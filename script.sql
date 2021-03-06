USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 12/12/2015 5:46:06 PM ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Hotel.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Hotel_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[AccountName] [nvarchar](50) NULL,
	[AccountPass] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookedRooms]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookedRooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[RoomID] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_BookedRoomList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingRoom]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[NumOfChildren] [int] NULL,
	[NumOfAdult] [int] NULL,
	[DateIn] [datetime] NULL,
	[DateOut] [datetime] NULL,
	[Advance] [decimal](18, 2) NULL,
 CONSTRAINT [PK_BookingRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryOfProduct]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryOfProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_CategoryOfProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryOfRoom]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryOfRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CateRoomName] [nchar](10) NULL,
	[NumOfBed] [int] NULL,
	[Size] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_CategoryOfRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerOrderService]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerOrderService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerNumber] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerOrderService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerOrderTable]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerOrderTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerNumber] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerOrderTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[IdentityCard] [varchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diary]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diary](
	[DiaryID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[DateTime] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Diary] PRIMARY KEY CLUSTERED 
(
	[DiaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelOrderDish]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOrderDish](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_OrderDish] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelOrderService]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOrderService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NULL,
	[Quantity] [int] NULL,
	[RoomID] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderedDishes]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedDishes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderedDishes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderedService]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ServiceID] [int] NULL,
	[Quantity] [int] NULL,
	[SellerID] [int] NULL,
	[CustomerID] [int] NULL,
	[DateOrder] [datetime] NULL,
 CONSTRAINT [PK_OrderedService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderForSupplier]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderForSupplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[SupplierID] [int] NULL,
	[DateOrder] [date] NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderLineForSupplier]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLineForSupplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderLineForSupplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableID] [int] NULL,
	[StaffID] [int] NULL,
	[DateOrder] [datetime] NULL,
	[DateIn] [datetime] NULL,
	[CustomerID] [int] NULL,
	[orderID] [int] NULL,
 CONSTRAINT [PK_OrderTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[ImportDate] [datetime] NULL,
	[CateID] [int] NULL,
	[SupplierID] [int] NULL,
	[UnitID] [int] NULL,
	[isActive] [bit] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RestaurantBill]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[TableID] [int] NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_RestaurantBill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RestaurantTable]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantTable](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[isActive] [bit] NULL,
	[NumOfChairs] [int] NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_RestaurantTable] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role_Function]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Function](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[FunctionID] [int] NULL,
 CONSTRAINT [PK_Role_Function_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NULL,
	[Floor] [int] NULL,
	[CateID] [int] NULL,
	[Status] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Units]    Script Date: 12/12/2015 5:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (1, 1, N'admin', N'21232f297a57a5a743894ae4a801fc3', 1)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (2, 1, N'ghite', N'', 0)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (3, 2, N'baoan', N'96e2b4ef48f070a02028b25b65d975', 1)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (4, 3, N'lam', N'1c6d6ca22cc31cb79e6e1f5277ef6e0', 1)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (5, 4, N'loan', N'8b9c2bba829069d84f1e77c3f25cb5ca', 1)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (6, 5, N'an', N'18b049cc8d8535787929df716f9f4e68', 1)
INSERT [dbo].[Accounts] ([AccountID], [RoleID], [AccountName], [AccountPass], [isActive]) VALUES (7, 6, N'volam', N'e7cfee346a5ae35db3c9350bb1838bf', 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[BookingRoom] ON 

INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (3, 1, 1, 2, 2, CAST(0x0000A54F00000000 AS DateTime), CAST(0x0000A55700000000 AS DateTime), CAST(222.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (4, 1, 1, 2, 2, CAST(0x0000A54500000000 AS DateTime), CAST(0x0000A55000000000 AS DateTime), CAST(323.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (5, 1, 1, 2, 2, CAST(0x0000A54C00000000 AS DateTime), CAST(0x0000A54C00000000 AS DateTime), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (6, 1, 1, 2, 3, CAST(0x0000A55000000000 AS DateTime), CAST(0x0000A55300000000 AS DateTime), CAST(2323.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (7, 1, 1, 3, 2, CAST(0x0000A55A00000000 AS DateTime), CAST(0x0000A55C00000000 AS DateTime), CAST(12121.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (8, 1, 1, 5, 5, CAST(0x0000A55B00000000 AS DateTime), CAST(0x0000A55E00000000 AS DateTime), CAST(5555.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (9, 1, 1, 2, 3, CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A56B00000000 AS DateTime), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (10, 1, 1, 0, 2, CAST(0x0000A56900000000 AS DateTime), CAST(0x0000A57A00000000 AS DateTime), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (11, 1, 1, 0, 2, CAST(0x0000A57200000000 AS DateTime), CAST(0x0000A57A00000000 AS DateTime), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (12, 1, 1, 0, 2, CAST(0x0000A57F00000000 AS DateTime), CAST(0x0000A59300000000 AS DateTime), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (13, 1, 1, 0, 3, CAST(0x0000A57A00000000 AS DateTime), CAST(0x0000A59D00000000 AS DateTime), CAST(3333.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (14, 1, 1, 0, 3, CAST(0x0000A57A00000000 AS DateTime), CAST(0x0000A59D00000000 AS DateTime), CAST(3333.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (15, 1, 1, 0, 3, CAST(0x0000A57A00000000 AS DateTime), CAST(0x0000A59D00000000 AS DateTime), CAST(3333.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (16, 1, 1, 5, 0, CAST(0x0000A57200000000 AS DateTime), CAST(0x0000A59D00000000 AS DateTime), CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (17, 1, 1, 1, 2, CAST(0x0000A57100000000 AS DateTime), CAST(0x0000A58F00000000 AS DateTime), CAST(1234.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (18, 1, 1, 2, 1, CAST(0x0000A56800000000 AS DateTime), CAST(0x0000A59600000000 AS DateTime), CAST(12321.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (19, 1, 1, 2, 2, CAST(0x0000A57D00000000 AS DateTime), CAST(0x0000A57800000000 AS DateTime), CAST(2313.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (20, 1, 1, 0, 2, CAST(0x0000A56F00000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (21, 1, 1, 2, 1, CAST(0x0000A57F00000000 AS DateTime), CAST(0x0000A57A00000000 AS DateTime), CAST(13212.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (22, 1, 1, 2, 2, CAST(0x0000A57700000000 AS DateTime), CAST(0x0000A57A00000000 AS DateTime), CAST(1212.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (23, 1, 1, 1, 2, CAST(0x0000A57D00000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(12313.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (24, 1, 1, 2, 2, CAST(0x0000A57900000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(2222.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (25, 1, 1, 3, 3, CAST(0x0000A57900000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(1212.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (26, 1, 1, 2, 0, CAST(0x0000A57000000000 AS DateTime), CAST(0x0000A57700000000 AS DateTime), CAST(12540.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (27, 1, 1, 2, 2, CAST(0x0000A57800000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(232322.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (28, 1, 1, 2, 2, CAST(0x0000A57800000000 AS DateTime), CAST(0x0000A57000000000 AS DateTime), CAST(2113.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (29, 1, 1, 2, 2, CAST(0x0000A56F00000000 AS DateTime), CAST(0x0000A57700000000 AS DateTime), CAST(22222.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (30, 1, 1, 2, 222, CAST(0x0000A56F00000000 AS DateTime), CAST(0x0000A57700000000 AS DateTime), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (31, 1, 1, 0, 1, CAST(0x0000A57000000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (32, 1, 1, 0, 1, CAST(0x0000A57600000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime), CAST(11111.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (33, 1, 1, 22, 22, CAST(0x0000A56B00000000 AS DateTime), CAST(0x0000A56B00000000 AS DateTime), CAST(98765.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (34, 1, 1, 1, 1, CAST(0x0000A56B00000000 AS DateTime), CAST(0x0000A56C00000000 AS DateTime), CAST(1111.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (35, 1, 1, 2, 2, CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57F00000000 AS DateTime), CAST(22222.00 AS Decimal(18, 2)))
INSERT [dbo].[BookingRoom] ([ID], [SellerID], [CustomerID], [NumOfChildren], [NumOfAdult], [DateIn], [DateOut], [Advance]) VALUES (36, 1, 1, 1, 1, CAST(0x0000A56D00000000 AS DateTime), CAST(0x0000A57D00000000 AS DateTime), CAST(1111.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[BookingRoom] OFF
SET IDENTITY_INSERT [dbo].[CategoryOfProduct] ON 

INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (1, N'Drink', 1)
INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (2, N'Food', 1)
INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (3, N'Wine', 1)
INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (4, N'Shampoo', 1)
INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (5, N'Furniture', 1)
INSERT [dbo].[CategoryOfProduct] ([ID], [CateName], [isActive]) VALUES (6, N'card', 1)
SET IDENTITY_INSERT [dbo].[CategoryOfProduct] OFF
SET IDENTITY_INSERT [dbo].[CategoryOfRoom] ON 

INSERT [dbo].[CategoryOfRoom] ([ID], [CateRoomName], [NumOfBed], [Size], [Price], [isActive]) VALUES (1, N'luxury    ', 4, CAST(50 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), 1)
INSERT [dbo].[CategoryOfRoom] ([ID], [CateRoomName], [NumOfBed], [Size], [Price], [isActive]) VALUES (2, N'normal    ', 4, CAST(50 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[CategoryOfRoom] OFF
SET IDENTITY_INSERT [dbo].[CustomerOrderService] ON 

INSERT [dbo].[CustomerOrderService] ([ID], [CustomerName], [CustomerNumber]) VALUES (1, N'NguoiDatDV', N'0923837284')
INSERT [dbo].[CustomerOrderService] ([ID], [CustomerName], [CustomerNumber]) VALUES (2, N'NguoiDatDV1', N'0923837284')
INSERT [dbo].[CustomerOrderService] ([ID], [CustomerName], [CustomerNumber]) VALUES (3, N'NguoiDatDV2', N'0302384282')
INSERT [dbo].[CustomerOrderService] ([ID], [CustomerName], [CustomerNumber]) VALUES (4, N'NguoiDatDV3', N'0928429382')
INSERT [dbo].[CustomerOrderService] ([ID], [CustomerName], [CustomerNumber]) VALUES (5, N'Nguyen Hong Vinh', N'0123466898')
SET IDENTITY_INSERT [dbo].[CustomerOrderService] OFF
SET IDENTITY_INSERT [dbo].[CustomerOrderTable] ON 

INSERT [dbo].[CustomerOrderTable] ([ID], [CustomerName], [CustomerNumber]) VALUES (1, N'NguoiDatBan', N'0923837284')
INSERT [dbo].[CustomerOrderTable] ([ID], [CustomerName], [CustomerNumber]) VALUES (2, N'NguoiDatBan1', N'0923837284')
INSERT [dbo].[CustomerOrderTable] ([ID], [CustomerName], [CustomerNumber]) VALUES (3, N'NguoiDatBan2', N'0923837284')
INSERT [dbo].[CustomerOrderTable] ([ID], [CustomerName], [CustomerNumber]) VALUES (4, N'NguoiDatBan3', N'0923837284')
SET IDENTITY_INSERT [dbo].[CustomerOrderTable] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (1, N'a', N'a', N'365489845')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (2, N'Nguyen Hai Ha', N'12 Truong Chinh', N'123242323')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (3, N'lam', N'123 ', N'123456889')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (4, N'Nguyen Nhan', N'123 DienBien Phu', N'291827328')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (5, N'Phuong Mi', N'123 DienBien Phu', N'238218301')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerAddress], [IdentityCard]) VALUES (6, N'George Bush', N'54 DC', N'238218301')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Diary] ON 

INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (12, 1, CAST(0x0000A5490080D79D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (13, 1, CAST(0x0000A5490081459F AS DateTime), N'Edited role "manager"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (14, 1, CAST(0x0000A54900815F54 AS DateTime), N'Edited role "staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (15, 1, CAST(0x0000A5490081C992 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (16, 1, CAST(0x0000A5490081D80E AS DateTime), N'Edited role "admin"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (17, 1, CAST(0x0000A549008215CA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (18, 1, CAST(0x0000A54900822056 AS DateTime), N'Edited role "admin"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (19, 1, CAST(0x0000A54900822953 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (20, 1, CAST(0x0000A54900823991 AS DateTime), N'Updated employee "baoan"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (21, 3, CAST(0x0000A54900824D10 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (22, 1, CAST(0x0000A54900826111 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (23, 1, CAST(0x0000A54900827690 AS DateTime), N'Edited function "Sell Product"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (24, 1, CAST(0x0000A5490183C0F0 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (25, 1, CAST(0x0000A54901849A61 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (26, 1, CAST(0x0000A54901877072 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (27, 1, CAST(0x0000A54A0089EC91 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (28, 1, CAST(0x0000A54A00F88633 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (29, 1, CAST(0x0000A54A0105837D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (30, 1, CAST(0x0000A54A01059C63 AS DateTime), N'Edited category "BigC Hue"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (31, 1, CAST(0x0000A54A01060D1D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (32, 1, CAST(0x0000A54A010640ED AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (33, 1, CAST(0x0000A54A010662F4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (34, 1, CAST(0x0000A54A017A56F4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (35, 1, CAST(0x0000A54A017E0B22 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (36, 1, CAST(0x0000A54A017E3FB2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (37, 1, CAST(0x0000A54A017E5CB7 AS DateTime), N'Created product "Lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (38, 1, CAST(0x0000A54A01864306 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (39, 1, CAST(0x0000A54A01881474 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (40, 1, CAST(0x0000A54A0188AD59 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (41, 1, CAST(0x0000A54A01890291 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (42, 1, CAST(0x0000A54A01897834 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (43, 1, CAST(0x0000A54A018A116D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (44, 1, CAST(0x0000A54B00035715 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (45, 1, CAST(0x0000A54B0003684C AS DateTime), N'Created product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (46, 1, CAST(0x0000A54B00038882 AS DateTime), N'Created product "bread"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (47, 1, CAST(0x0000A54B0003A998 AS DateTime), N'Edited product "bread"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (48, 1, CAST(0x0000A54B0003BBB2 AS DateTime), N'Edited product "bread"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (49, 1, CAST(0x0000A54B0003D3C9 AS DateTime), N'Deleted product "bread"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (50, 1, CAST(0x0000A54B0003FD13 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (51, 1, CAST(0x0000A54B00042136 AS DateTime), N'Created category "Shampoo"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (52, 1, CAST(0x0000A54B00042B68 AS DateTime), N'Created product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (53, 1, CAST(0x0000A54B0004969A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (54, 1, CAST(0x0000A54B0025F70F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (55, 1, CAST(0x0000A54B00260FA2 AS DateTime), N'Added new Customer "a"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (56, 1, CAST(0x0000A54C001103A5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (57, 1, CAST(0x0000A54C00113C0D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (58, 1, CAST(0x0000A54C00119BA3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (59, 1, CAST(0x0000A54C0012D5A1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (60, 1, CAST(0x0000A54C0013B0E4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (61, 1, CAST(0x0000A54C0014D271 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (62, 1, CAST(0x0000A54C00152A7C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (63, 1, CAST(0x0000A54C002070C1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (64, 1, CAST(0x0000A54C00235DFF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (65, 1, CAST(0x0000A54C0026639E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (66, 1, CAST(0x0000A54C00854620 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1066, 1, CAST(0x0000A54D009A93A8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1067, 1, CAST(0x0000A54D009DA8EA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1068, 1, CAST(0x0000A54D009FF037 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1069, 1, CAST(0x0000A54D00F03D2A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1070, 1, CAST(0x0000A54D00F08AD8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1071, 1, CAST(0x0000A54D00F11976 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1072, 1, CAST(0x0000A54D00F1F2EE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1073, 1, CAST(0x0000A54D0101DBDF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1074, 1, CAST(0x0000A54D0103DB85 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1075, 1, CAST(0x0000A54D0106603D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1076, 1, CAST(0x0000A54D010789C9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1077, 1, CAST(0x0000A54D01082FFE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1078, 1, CAST(0x0000A54D013467E3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1079, 1, CAST(0x0000A54D013483F3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1080, 1, CAST(0x0000A54D013518FE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1081, 1, CAST(0x0000A54D01358F79 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1082, 1, CAST(0x0000A54D0135C409 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1083, 1, CAST(0x0000A54D013685F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1084, 1, CAST(0x0000A54D01402050 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1085, 1, CAST(0x0000A54D0140D47B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1086, 1, CAST(0x0000A54D01410DD3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1087, 1, CAST(0x0000A54D01414500 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1088, 1, CAST(0x0000A54D0149C9E7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1089, 1, CAST(0x0000A54D014A12DA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1090, 1, CAST(0x0000A54D014AF0B3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1091, 1, CAST(0x0000A54D014B1A13 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1092, 1, CAST(0x0000A54D014B6098 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1093, 1, CAST(0x0000A54D014C5842 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1094, 1, CAST(0x0000A54D014C79B2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1095, 1, CAST(0x0000A54D0160C21C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1096, 1, CAST(0x0000A54D0160F467 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1097, 1, CAST(0x0000A54D0162E8AF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1098, 1, CAST(0x0000A54D01634B5F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1099, 1, CAST(0x0000A54D01637C9C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1100, 1, CAST(0x0000A54D0163ADCF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1101, 1, CAST(0x0000A54D01656618 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1102, 1, CAST(0x0000A54D0165C9E2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1103, 1, CAST(0x0000A54D0168F79E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1104, 1, CAST(0x0000A54D016957E5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1105, 1, CAST(0x0000A54D0169A4A1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1106, 1, CAST(0x0000A54D0169D05C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1107, 1, CAST(0x0000A54D016C6D51 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1108, 1, CAST(0x0000A54D016C8A58 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1109, 1, CAST(0x0000A54D0174A975 AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1110, 1, CAST(0x0000A54D01754A93 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1111, 1, CAST(0x0000A54D0175E2E8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1112, 1, CAST(0x0000A54D01764439 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1113, 1, CAST(0x0000A54D01765472 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1114, 1, CAST(0x0000A54D017664C6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1115, 1, CAST(0x0000A54D017C0404 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1116, 1, CAST(0x0000A54D01811DEF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1117, 1, CAST(0x0000A54E0018D378 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1118, 1, CAST(0x0000A54E001932D6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1119, 1, CAST(0x0000A54E00197A04 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1120, 1, CAST(0x0000A54E00ACA7E9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1121, 1, CAST(0x0000A54E00AD2DD3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1122, 1, CAST(0x0000A54E00AD83EA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1123, 1, CAST(0x0000A54E00AE3BC8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1124, 1, CAST(0x0000A54E00B746A1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1125, 1, CAST(0x0000A54E00B773F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1126, 1, CAST(0x0000A54E00B7BCED AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1127, 1, CAST(0x0000A54E00B7F1BC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1128, 1, CAST(0x0000A54E00B80AF8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1129, 1, CAST(0x0000A54E00B88AC6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1130, 1, CAST(0x0000A54E00B8CB9F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1131, 1, CAST(0x0000A54E01867A86 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1132, 1, CAST(0x0000A54E01872B78 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1133, 1, CAST(0x0000A54E0187A573 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1134, 1, CAST(0x0000A54E0187F314 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1135, 1, CAST(0x0000A54E018893B1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1136, 1, CAST(0x0000A54E0188C87E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1137, 1, CAST(0x0000A54E01891D30 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1138, 1, CAST(0x0000A54E018971FF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1139, 1, CAST(0x0000A54E018A1C81 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1140, 1, CAST(0x0000A54E018A7633 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1141, 1, CAST(0x0000A54F000CBF97 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1142, 1, CAST(0x0000A54F000D1682 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1143, 1, CAST(0x0000A54F00116AFC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1144, 1, CAST(0x0000A54F00131023 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1145, 1, CAST(0x0000A54F00144793 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1146, 1, CAST(0x0000A54F0015B626 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1147, 1, CAST(0x0000A54F001653D7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1148, 1, CAST(0x0000A54F0016A197 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1149, 1, CAST(0x0000A54F001782DD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1150, 1, CAST(0x0000A54F0017A6FE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1151, 1, CAST(0x0000A54F00E19DDF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1152, 1, CAST(0x0000A54F00E1CD24 AS DateTime), N'Created category "Furniture"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1153, 1, CAST(0x0000A54F00E51B25 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1154, 1, CAST(0x0000A54F00E53466 AS DateTime), N'Created product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1155, 1, CAST(0x0000A54F00E5AF97 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1156, 1, CAST(0x0000A54F00E5C2C5 AS DateTime), N'Created bill #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1157, 1, CAST(0x0000A54F00E5F79D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1158, 1, CAST(0x0000A54F00E6BB1F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1159, 1, CAST(0x0000A54F00E6D1CD AS DateTime), N'Created bill #4')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1160, 1, CAST(0x0000A54F00E6D1F5 AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1161, 1, CAST(0x0000A54F00E6D1FA AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1162, 1, CAST(0x0000A54F00E6DE69 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1163, 1, CAST(0x0000A54F00E8943E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1164, 1, CAST(0x0000A54F00E9E15F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1165, 1, CAST(0x0000A54F00EAC1CE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1166, 1, CAST(0x0000A54F00EC3679 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1167, 1, CAST(0x0000A54F00EC93C7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1168, 1, CAST(0x0000A54F00EFD02C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1169, 1, CAST(0x0000A54F0168E39C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1170, 1, CAST(0x0000A54F01695F05 AS DateTime), N'Added new Customer "Nguyen Hai Ha"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1171, 1, CAST(0x0000A54F0172947E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1172, 1, CAST(0x0000A54F0172B03A AS DateTime), N'Added new Customer "NguoiDatBan"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1173, 1, CAST(0x0000A54F0172B4A0 AS DateTime), N'Added new Customer "NguoiDatBan1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1174, 1, CAST(0x0000A54F0172B89F AS DateTime), N'Added new Customer "NguoiDatBan2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1175, 1, CAST(0x0000A54F0172BC44 AS DateTime), N'Added new Customer "NguoiDatBan3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1176, 1, CAST(0x0000A54F0172C726 AS DateTime), N'Added new Customer "NguoiDatDV"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1177, 1, CAST(0x0000A54F0172D10D AS DateTime), N'Added new Customer "NguoiDatDV1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1178, 1, CAST(0x0000A54F017360FD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1179, 1, CAST(0x0000A54F017374BA AS DateTime), N'Added new Customer "NguoiDatDV2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1180, 1, CAST(0x0000A54F0173957F AS DateTime), N'Added new Customer "NguoiDatDV3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1181, 1, CAST(0x0000A54F017D8B4C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1182, 1, CAST(0x0000A54F017EE6B1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1183, 1, CAST(0x0000A54F018130EF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1184, 1, CAST(0x0000A550000093AE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1185, 1, CAST(0x0000A5500000F8C7 AS DateTime), N'Created bill #5')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1186, 1, CAST(0x0000A5500000F8E5 AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1187, 1, CAST(0x0000A5500000F8EA AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1188, 1, CAST(0x0000A5500002D666 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1189, 1, CAST(0x0000A55000030208 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1190, 1, CAST(0x0000A550000315BC AS DateTime), N'Created bill #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1191, 1, CAST(0x0000A550000315D5 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1192, 1, CAST(0x0000A550000315DB AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1193, 1, CAST(0x0000A550000DDA4A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1194, 1, CAST(0x0000A550000E1DB9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1195, 1, CAST(0x0000A550000EEF76 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1196, 1, CAST(0x0000A550000F8736 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1197, 1, CAST(0x0000A5500010534F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1198, 1, CAST(0x0000A5500011102F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1199, 1, CAST(0x0000A55000115B2B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1200, 1, CAST(0x0000A5500011D8E1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1201, 1, CAST(0x0000A55000122B8F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1202, 1, CAST(0x0000A5500013A428 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1203, 1, CAST(0x0000A5500014557E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1204, 1, CAST(0x0000A5500014744D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1205, 1, CAST(0x0000A5500014A10F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1206, 1, CAST(0x0000A55000152E69 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1207, 1, CAST(0x0000A55000159B62 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1208, 1, CAST(0x0000A5500016440C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1209, 1, CAST(0x0000A5500016ACEC AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1210, 1, CAST(0x0000A55000178CFE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1211, 1, CAST(0x0000A550001803D9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1212, 1, CAST(0x0000A55000182110 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1213, 1, CAST(0x0000A55000183085 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1214, 1, CAST(0x0000A55000193F0D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1215, 1, CAST(0x0000A550001AFCAC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1216, 1, CAST(0x0000A550001BAD86 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1217, 1, CAST(0x0000A550001BEF80 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1218, 1, CAST(0x0000A550001C96FC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1219, 1, CAST(0x0000A550001E8773 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1220, 1, CAST(0x0000A5500021443A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1221, 1, CAST(0x0000A55000274C6B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1222, 1, CAST(0x0000A5500027B733 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1223, 1, CAST(0x0000A5500028B0BB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1224, 1, CAST(0x0000A5500029E866 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1225, 1, CAST(0x0000A550002C1AB8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1226, 1, CAST(0x0000A550002D6B5D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1227, 1, CAST(0x0000A550002DF990 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1228, 1, CAST(0x0000A550002F01E7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1229, 1, CAST(0x0000A550003230C8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1230, 1, CAST(0x0000A55000325FB1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1231, 1, CAST(0x0000A550003290FF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1232, 1, CAST(0x0000A5500033697C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1233, 1, CAST(0x0000A5500033B7A9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1234, 1, CAST(0x0000A55000341F51 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1235, 1, CAST(0x0000A5500034B11C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1236, 1, CAST(0x0000A5500078F1FE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1237, 1, CAST(0x0000A5500079424F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1238, 1, CAST(0x0000A550007AD3F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1239, 1, CAST(0x0000A550007BF010 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1240, 1, CAST(0x0000A550007C060E AS DateTime), N'Added new employee "lam"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1241, 4, CAST(0x0000A550007C0D5C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1242, 1, CAST(0x0000A550007C1F51 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1243, 1, CAST(0x0000A550007CC6EB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1244, 1, CAST(0x0000A550008072F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1245, 1, CAST(0x0000A550008094B9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1246, 1, CAST(0x0000A5500080A18C AS DateTime), N'Created bill #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1247, 1, CAST(0x0000A5500080A1D3 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1248, 1, CAST(0x0000A55000815CAE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1249, 1, CAST(0x0000A5500081701E AS DateTime), N'Created bill #4')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1250, 1, CAST(0x0000A55000817028 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1251, 1, CAST(0x0000A5500081D190 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1252, 1, CAST(0x0000A5500084E137 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1253, 1, CAST(0x0000A550008ACE6B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1254, 1, CAST(0x0000A5500092579C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1255, 1, CAST(0x0000A550009302DB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1256, 1, CAST(0x0000A5500093E063 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1257, 1, CAST(0x0000A5500093F32F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1258, 1, CAST(0x0000A550009407EB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1259, 1, CAST(0x0000A55000944D56 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1260, 1, CAST(0x0000A5500094A907 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1261, 1, CAST(0x0000A5500095436D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1262, 1, CAST(0x0000A55000964B64 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1263, 4, CAST(0x0000A55000968C1B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1264, 1, CAST(0x0000A5500096934F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1265, 1, CAST(0x0000A5500096BA60 AS DateTime), N'Added new employee "loan"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1266, 1, CAST(0x0000A5500097F840 AS DateTime), N'Added new Customer "lam"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1267, 1, CAST(0x0000A552018AEBCC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1268, 1, CAST(0x0000A552018B26C9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1269, 1, CAST(0x0000A55300003ED5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1270, 4, CAST(0x0000A5530001D326 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1271, 1, CAST(0x0000A5530001DC50 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1272, 1, CAST(0x0000A553000236EB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1273, 1, CAST(0x0000A55300F382A1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1274, 1, CAST(0x0000A55300F4F1EE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1275, 1, CAST(0x0000A55300F54C3E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1276, 1, CAST(0x0000A55300F59726 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1277, 1, CAST(0x0000A55300F5CCA2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1278, 1, CAST(0x0000A55300F63BCC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1279, 1, CAST(0x0000A55300F6A040 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1280, 1, CAST(0x0000A55300F7EA45 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1281, 1, CAST(0x0000A55300F8167C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1282, 1, CAST(0x0000A55300F8410A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1283, 1, CAST(0x0000A55300F878BE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1284, 1, CAST(0x0000A55300F8B3C0 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1285, 1, CAST(0x0000A55300F8D638 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1286, 1, CAST(0x0000A5530171ECBB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1287, 1, CAST(0x0000A553017C94C3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1288, 1, CAST(0x0000A553018094BC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1289, 1, CAST(0x0000A5530180E7A3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1290, 1, CAST(0x0000A55301811B03 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1291, 1, CAST(0x0000A55301818559 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1292, 1, CAST(0x0000A55301822672 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1293, 1, CAST(0x0000A55301856717 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1294, 1, CAST(0x0000A55301877A0D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1295, 1, CAST(0x0000A5530187CCB8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1296, 1, CAST(0x0000A55301890CA5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1297, 1, CAST(0x0000A5530189676A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1298, 1, CAST(0x0000A553018A0A75 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1299, 1, CAST(0x0000A553018ACE83 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1300, 1, CAST(0x0000A5540000D94E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1301, 1, CAST(0x0000A5540003C450 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1302, 1, CAST(0x0000A5540084FF2E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1303, 1, CAST(0x0000A55400857F1E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1304, 1, CAST(0x0000A5540085D8EF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1305, 1, CAST(0x0000A55400864866 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1306, 1, CAST(0x0000A55400891FD5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1307, 1, CAST(0x0000A55400894496 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1308, 1, CAST(0x0000A554008978EE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1309, 1, CAST(0x0000A554008AA6CB AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1310, 1, CAST(0x0000A554008BA4FB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1311, 1, CAST(0x0000A554008CE28E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1312, 1, CAST(0x0000A554008D2641 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1313, 1, CAST(0x0000A554008D4F8A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1314, 1, CAST(0x0000A554008DDC41 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1315, 1, CAST(0x0000A554008E385F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1316, 1, CAST(0x0000A554008E6DDB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1317, 1, CAST(0x0000A554008E9AB9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1318, 1, CAST(0x0000A554008F3390 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1319, 1, CAST(0x0000A55400909EA5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1320, 1, CAST(0x0000A5540097DF92 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1321, 1, CAST(0x0000A5540147B2AB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1322, 1, CAST(0x0000A55401484340 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1323, 1, CAST(0x0000A554014883EE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1324, 1, CAST(0x0000A5540148E776 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1325, 1, CAST(0x0000A554014A717E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1326, 1, CAST(0x0000A554014B3FC9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1327, 1, CAST(0x0000A554014B8D44 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1328, 1, CAST(0x0000A554014BF07F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (1329, 1, CAST(0x0000A5550008EC65 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2321, 1, CAST(0x0000A555016F1998 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2322, 1, CAST(0x0000A55600144CC2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2323, 1, CAST(0x0000A5560016B279 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2324, 1, CAST(0x0000A5560016BE78 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2325, 1, CAST(0x0000A5560016BEAE AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2326, 1, CAST(0x0000A5560016BEB7 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2327, 1, CAST(0x0000A5560016BEBA AS DateTime), N'Edited Customer "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2328, 1, CAST(0x0000A556001717BC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2329, 1, CAST(0x0000A5560019A57D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2330, 1, CAST(0x0000A556001AF654 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2331, 1, CAST(0x0000A556001B24B1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2332, 1, CAST(0x0000A556001B5EF5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2333, 1, CAST(0x0000A556001D698F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2334, 1, CAST(0x0000A556001DBA25 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2335, 1, CAST(0x0000A556001E1680 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2336, 1, CAST(0x0000A556001E2238 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2337, 1, CAST(0x0000A556001FEC7E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2338, 1, CAST(0x0000A55600206D92 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2339, 1, CAST(0x0000A556013B8CE3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2340, 1, CAST(0x0000A556013C6EFC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2341, 1, CAST(0x0000A556013E7F25 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2342, 1, CAST(0x0000A556013E922D AS DateTime), N'Created bill #5')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2343, 1, CAST(0x0000A556013E9257 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2344, 1, CAST(0x0000A556013E925C AS DateTime), N'Edited Customer "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2345, 1, CAST(0x0000A5560140C7E8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2346, 1, CAST(0x0000A556014EB389 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2347, 1, CAST(0x0000A556014F06C8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2348, 1, CAST(0x0000A55601619E61 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2349, 1, CAST(0x0000A556016337A9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2350, 1, CAST(0x0000A556017934F5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2351, 1, CAST(0x0000A556017FF077 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2352, 1, CAST(0x0000A5570084C70A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2353, 1, CAST(0x0000A5570084D1DC AS DateTime), N'Created bill #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2354, 1, CAST(0x0000A5570084D1EA AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2355, 1, CAST(0x0000A5570084D1EF AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2356, 1, CAST(0x0000A5570084D1F4 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2357, 1, CAST(0x0000A5570084D1F8 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2358, 1, CAST(0x0000A5570084F3BE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2359, 1, CAST(0x0000A5570084FB25 AS DateTime), N'Created bill #7')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2360, 1, CAST(0x0000A5570084FB3D AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2361, 1, CAST(0x0000A5570084FB41 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2362, 1, CAST(0x0000A5570084FB41 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2363, 1, CAST(0x0000A5570084FB4B AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2364, 1, CAST(0x0000A557008536F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2365, 1, CAST(0x0000A55700853F7B AS DateTime), N'Created bill #8')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2366, 1, CAST(0x0000A55700853F85 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2367, 1, CAST(0x0000A55700853F85 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2368, 1, CAST(0x0000A55700853F89 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2369, 1, CAST(0x0000A55700853F8E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2370, 1, CAST(0x0000A5570085E761 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2371, 1, CAST(0x0000A5570085F1E0 AS DateTime), N'Created bill #9')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2372, 1, CAST(0x0000A5570085F1F7 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2373, 1, CAST(0x0000A5570085F1FC AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2374, 1, CAST(0x0000A5570085F200 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2375, 1, CAST(0x0000A5570085F205 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2376, 1, CAST(0x0000A5570085F20A AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (2377, 1, CAST(0x0000A5570085F20E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3352, 1, CAST(0x0000A557008D3754 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3353, 1, CAST(0x0000A557008D41AD AS DateTime), N'Created bill #1006')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3354, 1, CAST(0x0000A557008D41C5 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3355, 1, CAST(0x0000A557008D41C9 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3356, 1, CAST(0x0000A557008D551D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3357, 1, CAST(0x0000A5570095B862 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3358, 1, CAST(0x0000A5570095C140 AS DateTime), N'Created bill #1007')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3359, 1, CAST(0x0000A5570095C14A AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3360, 1, CAST(0x0000A5570095C14E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3361, 1, CAST(0x0000A55700962EDA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3362, 1, CAST(0x0000A55700963F11 AS DateTime), N'Created bill #1008')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3363, 1, CAST(0x0000A55700963F1B AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3364, 1, CAST(0x0000A55700963F1F AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3365, 1, CAST(0x0000A55700963F24 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3366, 1, CAST(0x0000A55700963F29 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3367, 1, CAST(0x0000A55700968A09 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3368, 1, CAST(0x0000A55700969615 AS DateTime), N'Created bill #1009')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3369, 1, CAST(0x0000A5570096961E AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3370, 1, CAST(0x0000A5570096961E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3371, 1, CAST(0x0000A55700969623 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3372, 1, CAST(0x0000A55700969628 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3373, 1, CAST(0x0000A557009719FD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3374, 1, CAST(0x0000A5570097563B AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3375, 1, CAST(0x0000A5570098091E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3376, 1, CAST(0x0000A5570098109C AS DateTime), N'Created bill #1010')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3377, 1, CAST(0x0000A557009810B4 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3378, 1, CAST(0x0000A557009810B4 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3379, 1, CAST(0x0000A557009810BD AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3380, 1, CAST(0x0000A557009810C2 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3381, 1, CAST(0x0000A55700992039 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3382, 1, CAST(0x0000A557009939E8 AS DateTime), N'Created bill #1011')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3383, 1, CAST(0x0000A557009939F6 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3384, 1, CAST(0x0000A557009939FB AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3385, 1, CAST(0x0000A55700993A00 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3386, 1, CAST(0x0000A55700993A04 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3387, 1, CAST(0x0000A55700997EE2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3388, 1, CAST(0x0000A5570099882B AS DateTime), N'Created bill #1012')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3389, 1, CAST(0x0000A55700998834 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3390, 1, CAST(0x0000A55700998834 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3391, 1, CAST(0x0000A55700998839 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3392, 1, CAST(0x0000A5570099883E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3393, 1, CAST(0x0000A557009BC47A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3394, 1, CAST(0x0000A557009C1869 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3395, 1, CAST(0x0000A557009C2A0E AS DateTime), N'Created bill #1013')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3396, 1, CAST(0x0000A557009C2A1C AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3397, 1, CAST(0x0000A557009C2A20 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3398, 1, CAST(0x0000A557009C2A25 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3399, 1, CAST(0x0000A557009C2A29 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3400, 1, CAST(0x0000A557009C2A2E AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3401, 1, CAST(0x0000A557009C2A2E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3402, 1, CAST(0x0000A55900A7A077 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3403, 1, CAST(0x0000A55900A8AD0F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3404, 1, CAST(0x0000A55900AB125A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3405, 1, CAST(0x0000A55900ABCD1D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3406, 1, CAST(0x0000A55900AC219B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3407, 1, CAST(0x0000A55900AC7EC6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3408, 1, CAST(0x0000A55900AD6508 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3409, 1, CAST(0x0000A55901669F59 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3410, 1, CAST(0x0000A559016789A3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3411, 1, CAST(0x0000A5590172CB0E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3412, 4, CAST(0x0000A55901737683 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3413, 1, CAST(0x0000A5590173950B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3414, 1, CAST(0x0000A5590173BE20 AS DateTime), N'Edited role "staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3415, 4, CAST(0x0000A5590173D332 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3416, 1, CAST(0x0000A5590173FB5F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3417, 1, CAST(0x0000A559017C0C4C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3418, 1, CAST(0x0000A559017C20DA AS DateTime), N'Edited role "admin"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3419, 1, CAST(0x0000A559017C2CDE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3420, 1, CAST(0x0000A559017E6A7F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3421, 1, CAST(0x0000A559017E8BA8 AS DateTime), N'Edited role "admin"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3422, 1, CAST(0x0000A559017EF9F9 AS DateTime), N'Edited role "manager restaurant"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3423, 1, CAST(0x0000A559017F43B1 AS DateTime), N'Edited role "restaurant staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3424, 1, CAST(0x0000A559017F5839 AS DateTime), N'Created role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3425, 1, CAST(0x0000A559017F5839 AS DateTime), N'Grant "Report" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3426, 1, CAST(0x0000A559017F5839 AS DateTime), N'Grant "Restaurant Supplier" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3427, 1, CAST(0x0000A559017F583D AS DateTime), N'Grant "Table" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3428, 1, CAST(0x0000A559017F5842 AS DateTime), N'Grant "Service Order" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3429, 1, CAST(0x0000A559017F5842 AS DateTime), N'Grant "Account Permission" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3430, 1, CAST(0x0000A559017F5842 AS DateTime), N'Grant "Bill Overview" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3431, 1, CAST(0x0000A559017F5847 AS DateTime), N'Grant "Product Management" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3432, 1, CAST(0x0000A559017F5847 AS DateTime), N'Grant "Restaurant Checkout" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3433, 1, CAST(0x0000A559017F5847 AS DateTime), N'Grant "Account Management" permission to role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3434, 1, CAST(0x0000A559017F680F AS DateTime), N'Edited role "services manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3435, 1, CAST(0x0000A559017F7EE1 AS DateTime), N'Edited role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3436, 1, CAST(0x0000A559017FA1F4 AS DateTime), N'Edited role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3437, 1, CAST(0x0000A559017FE05B AS DateTime), N'Edited role "restaurant manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3438, 1, CAST(0x0000A55901800D9D AS DateTime), N'Edited role "services manager "')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3439, 1, CAST(0x0000A559018035EB AS DateTime), N'Created role "services staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3440, 1, CAST(0x0000A559018035EB AS DateTime), N'Grant "Change Password" permission to role "services staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3441, 1, CAST(0x0000A559018035F0 AS DateTime), N'Grant "Service Order" permission to role "services staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3442, 1, CAST(0x0000A559018035F0 AS DateTime), N'Grant "Customer Management" permission to role "services staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3443, 1, CAST(0x0000A55901809BF4 AS DateTime), N'Created role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3444, 1, CAST(0x0000A55901809BF9 AS DateTime), N'Grant "Hotel Checkin" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3445, 1, CAST(0x0000A55901809BF9 AS DateTime), N'Grant "Hotel Checkout" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3446, 1, CAST(0x0000A55901809BF9 AS DateTime), N'Grant "Change Password" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3447, 1, CAST(0x0000A55901809C02 AS DateTime), N'Grant "Room" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3448, 1, CAST(0x0000A55901809C07 AS DateTime), N'Grant "Hotel Customer" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3449, 1, CAST(0x0000A55901809C07 AS DateTime), N'Grant "Report" permission to role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3450, 1, CAST(0x0000A5590180AF1E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3451, 1, CAST(0x0000A5590180E83E AS DateTime), N'Edited role "restaurant staff"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3452, 1, CAST(0x0000A55901811C98 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3453, 1, CAST(0x0000A55901812F72 AS DateTime), N'Deleted employee "ghite"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3454, 1, CAST(0x0000A55901814563 AS DateTime), N'Updated employee "loan"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3455, 1, CAST(0x0000A559018165EC AS DateTime), N'Added new employee "an"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3456, 1, CAST(0x0000A55901817E58 AS DateTime), N'Added new employee "volam"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3457, 7, CAST(0x0000A559018198B4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3458, 1, CAST(0x0000A55901851D7F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3459, 1, CAST(0x0000A5590185952B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3460, 1, CAST(0x0000A5590185B09C AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3461, 1, CAST(0x0000A5590185B0A0 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3462, 1, CAST(0x0000A5590185F01F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3463, 1, CAST(0x0000A55901860064 AS DateTime), N'Created bill #1014')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3464, 1, CAST(0x0000A55901860072 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3465, 1, CAST(0x0000A55901860077 AS DateTime), N'Edited Customer "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3466, 1, CAST(0x0000A55901860077 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3467, 1, CAST(0x0000A5590186007C AS DateTime), N'Edited Customer "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3468, 1, CAST(0x0000A55901860085 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3469, 1, CAST(0x0000A55901860089 AS DateTime), N'Edited Customer "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3470, 1, CAST(0x0000A559018A276E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3471, 1, CAST(0x0000A559018A33DD AS DateTime), N'Created bill #1015')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3472, 1, CAST(0x0000A559018A33EC AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3473, 1, CAST(0x0000A559018A33EF AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3474, 1, CAST(0x0000A559018A33F2 AS DateTime), N'Edited product "bed"')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3475, 1, CAST(0x0000A559018A33F8 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3476, 1, CAST(0x0000A559018A33FE AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3477, 1, CAST(0x0000A559018A3401 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3478, 1, CAST(0x0000A559018AA4A0 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3479, 1, CAST(0x0000A559018AAF60 AS DateTime), N'Created bill #1016')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3480, 1, CAST(0x0000A559018AAF75 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3481, 1, CAST(0x0000A559018AAF7B AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3482, 1, CAST(0x0000A559018AAF7E AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3483, 1, CAST(0x0000A559018AAF81 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3484, 1, CAST(0x0000A559018AAF87 AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3485, 1, CAST(0x0000A559018AAF8A AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3486, 1, CAST(0x0000A559018B4457 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3487, 1, CAST(0x0000A559018B4EEC AS DateTime), N'Created bill #1017')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3488, 1, CAST(0x0000A559018B4F04 AS DateTime), N'Edited product "dove"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3489, 1, CAST(0x0000A559018B4F07 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3490, 1, CAST(0x0000A559018B4F0A AS DateTime), N'Edited product "lavie"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3491, 1, CAST(0x0000A559018B4F10 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3492, 1, CAST(0x0000A559018B4F13 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3493, 1, CAST(0x0000A559018B4F16 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3494, 1, CAST(0x0000A55A00018557 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3495, 1, CAST(0x0000A55A00035905 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3496, 1, CAST(0x0000A55A00038DBB AS DateTime), N'Created bill #7')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3497, 1, CAST(0x0000A55A00038DD3 AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3498, 1, CAST(0x0000A55A00038DDC AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3499, 1, CAST(0x0000A55A00043910 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3500, 1, CAST(0x0000A55A0005842F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3501, 1, CAST(0x0000A55A0006039F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3502, 1, CAST(0x0000A55A00067CCB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3503, 1, CAST(0x0000A55A0006F20A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3504, 1, CAST(0x0000A55A000719B8 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3505, 1, CAST(0x0000A55A00071CF9 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3506, 1, CAST(0x0000A55A00072883 AS DateTime), N'Created bill #8')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3507, 1, CAST(0x0000A55A0007289F AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3508, 1, CAST(0x0000A55A000728A4 AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3509, 1, CAST(0x0000A55A000728A8 AS DateTime), N'Edited product "401"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3510, 1, CAST(0x0000A55A01019F1E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3511, 1, CAST(0x0000A55A013A3D85 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3512, 1, CAST(0x0000A55A013C33AE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3513, 1, CAST(0x0000A55A013D02A6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3514, 1, CAST(0x0000A55A01424A71 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3515, 1, CAST(0x0000A55A014266C8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3516, 1, CAST(0x0000A55A0142BD05 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3517, 1, CAST(0x0000A55A0142FC16 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3518, 1, CAST(0x0000A55A0148DFFB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3519, 1, CAST(0x0000A55A01499AEF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3520, 1, CAST(0x0000A55A015418D8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3521, 1, CAST(0x0000A55A01545FF8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3522, 1, CAST(0x0000A55A01546A77 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3523, 1, CAST(0x0000A55A0154C4D8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3524, 1, CAST(0x0000A55A01550DD7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3525, 1, CAST(0x0000A55A01552D3C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3526, 1, CAST(0x0000A55A0180AB94 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3527, 1, CAST(0x0000A55A0180D0A6 AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3528, 1, CAST(0x0000A55A0180E275 AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3529, 1, CAST(0x0000A55A0180FB23 AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3530, 1, CAST(0x0000A55A01851248 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3531, 1, CAST(0x0000A55A0185291C AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3532, 1, CAST(0x0000A55A01853ABE AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3533, 1, CAST(0x0000A55A01856A66 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3534, 1, CAST(0x0000A55A0185FA38 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3535, 1, CAST(0x0000A55A01860786 AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3536, 1, CAST(0x0000A55A018616C0 AS DateTime), N'Edited HOTEL ORDER SER #4')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3537, 1, CAST(0x0000A55A0187714D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3538, 1, CAST(0x0000A55B000044BA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3539, 1, CAST(0x0000A55B00005A1C AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3540, 1, CAST(0x0000A55B00008FBF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3541, 1, CAST(0x0000A55B00011BB6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3542, 1, CAST(0x0000A55B0001ABF0 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3543, 1, CAST(0x0000A55B0002232D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3544, 1, CAST(0x0000A55B000280F3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3545, 1, CAST(0x0000A55B0002994B AS DateTime), N'Edited HOTEL ORDER SER #4')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3546, 1, CAST(0x0000A55B00039434 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3547, 1, CAST(0x0000A55B00039F5A AS DateTime), N'Edited HOTEL ORDER SER #4')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3548, 1, CAST(0x0000A55B0003D82A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3549, 1, CAST(0x0000A55B0003E899 AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3550, 1, CAST(0x0000A55B0003F239 AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3551, 1, CAST(0x0000A55B00040A03 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3552, 1, CAST(0x0000A55B000456FB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3553, 1, CAST(0x0000A55B0004E576 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3554, 1, CAST(0x0000A55B00054E80 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3555, 1, CAST(0x0000A55B0005BE68 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3556, 1, CAST(0x0000A55B0005E49F AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3557, 1, CAST(0x0000A55B00082588 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3558, 1, CAST(0x0000A55B00083513 AS DateTime), N'Deleted order table "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3559, 1, CAST(0x0000A55B00089F2F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3560, 1, CAST(0x0000A55B0008B3D1 AS DateTime), N'Edited HOTEL ORDER SER #3')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3561, 1, CAST(0x0000A55B0009AF17 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3562, 1, CAST(0x0000A55B0009C69D AS DateTime), N'Created product "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3563, 1, CAST(0x0000A55B0009D6EB AS DateTime), N'Deleted order table "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3564, 1, CAST(0x0000A55B000BA681 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3565, 1, CAST(0x0000A55B000CB3CB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3566, 1, CAST(0x0000A55B000D2A85 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3567, 1, CAST(0x0000A55B000DCAE0 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3568, 1, CAST(0x0000A55B000E104B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3569, 1, CAST(0x0000A55B000E6B99 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3570, 1, CAST(0x0000A55B000EA2A5 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3571, 1, CAST(0x0000A55B000FAF19 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3572, 1, CAST(0x0000A55B000FBB0D AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3573, 1, CAST(0x0000A55B00104DB6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3574, 1, CAST(0x0000A55B00105C67 AS DateTime), N'Edited HOTEL ORDER SER #6')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3575, 1, CAST(0x0000A55B0081379A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3576, 1, CAST(0x0000A55B008162BB AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3577, 1, CAST(0x0000A55B00842FBB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3578, 1, CAST(0x0000A55B00843C33 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3579, 1, CAST(0x0000A55B0084F5A6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3580, 1, CAST(0x0000A55B00850985 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3581, 1, CAST(0x0000A55B00851D64 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3582, 1, CAST(0x0000A55B0085354F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3583, 1, CAST(0x0000A55B00857737 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3584, 1, CAST(0x0000A55B00858403 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3585, 1, CAST(0x0000A55B00861787 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3586, 1, CAST(0x0000A55B008623CB AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3587, 1, CAST(0x0000A55B00864C0E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3588, 1, CAST(0x0000A55B0086C4C2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3589, 1, CAST(0x0000A55B0087C1CB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3590, 1, CAST(0x0000A55B0087E130 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3591, 1, CAST(0x0000A55B0087EEF4 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3592, 1, CAST(0x0000A55B00882857 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3593, 1, CAST(0x0000A55B00884551 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3594, 1, CAST(0x0000A55B00885170 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3595, 1, CAST(0x0000A55B00885766 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3596, 1, CAST(0x0000A55B008A432C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3597, 1, CAST(0x0000A55B008A8571 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3598, 1, CAST(0x0000A55B008AD2A2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3599, 1, CAST(0x0000A55B008AE9DF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3600, 1, CAST(0x0000A55B008B0602 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3601, 1, CAST(0x0000A55B008BC78E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3602, 1, CAST(0x0000A55B008BE1B7 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3603, 1, CAST(0x0000A55B008C8D90 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3604, 1, CAST(0x0000A55B008C995B AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3605, 1, CAST(0x0000A55B008D033E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3606, 1, CAST(0x0000A55B008D15A2 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3607, 1, CAST(0x0000A55B008D4341 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3608, 1, CAST(0x0000A55B008D4E6C AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3609, 1, CAST(0x0000A55B008DA14C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3610, 1, CAST(0x0000A55B008EBDAF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3611, 1, CAST(0x0000A55B008ECFDF AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3612, 1, CAST(0x0000A55B008FEDAB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3613, 1, CAST(0x0000A55B0090048A AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3614, 1, CAST(0x0000A55B00901B23 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3615, 1, CAST(0x0000A55B00921275 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3616, 1, CAST(0x0000A55B00921B04 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3617, 1, CAST(0x0000A55B00923198 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3618, 1, CAST(0x0000A55B00923DBC AS DateTime), N'Edited HOTEL ORDER SER #null')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3619, 1, CAST(0x0000A55B0092732C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3620, 1, CAST(0x0000A55B0092AAF7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3621, 1, CAST(0x0000A55B00936A89 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3622, 1, CAST(0x0000A55B0094CFD9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3623, 1, CAST(0x0000A55B00952FA9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3624, 1, CAST(0x0000A55B0095BDFC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3625, 1, CAST(0x0000A55B0095EEC8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3626, 1, CAST(0x0000A55B0096BBA8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3627, 1, CAST(0x0000A55B00974303 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3628, 1, CAST(0x0000A55B00975C89 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3629, 1, CAST(0x0000A55B00A56142 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3630, 1, CAST(0x0000A55B00A66326 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3631, 1, CAST(0x0000A55B00A6BFB1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3632, 1, CAST(0x0000A55B00A713AB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3633, 1, CAST(0x0000A55B00A95152 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3634, 1, CAST(0x0000A55B00EF987C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3635, 1, CAST(0x0000A55B00EFA6B6 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3636, 1, CAST(0x0000A55B00EFE364 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3637, 1, CAST(0x0000A55B00F0C002 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3638, 1, CAST(0x0000A55B00F0CB6F AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3639, 1, CAST(0x0000A55B00F14955 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3640, 1, CAST(0x0000A55B00F156E5 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3641, 1, CAST(0x0000A55B01494071 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3642, 1, CAST(0x0000A55B014C754D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3643, 1, CAST(0x0000A55B014F3209 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3644, 1, CAST(0x0000A55B014F45E4 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3645, 1, CAST(0x0000A55B01504E1A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3646, 1, CAST(0x0000A55B015112F6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3647, 1, CAST(0x0000A55B01518474 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3648, 1, CAST(0x0000A55B0152527A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3649, 1, CAST(0x0000A55B0153CD57 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3650, 1, CAST(0x0000A55B0153E010 AS DateTime), N'Edited HOTEL ORDER SER #2')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3651, 1, CAST(0x0000A55B0154B8BD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3652, 1, CAST(0x0000A55B01557433 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3653, 1, CAST(0x0000A55B01559091 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3654, 1, CAST(0x0000A55B0155E253 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3655, 1, CAST(0x0000A55B01561BA6 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3656, 1, CAST(0x0000A55B01568652 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3657, 1, CAST(0x0000A55B015940B8 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3658, 1, CAST(0x0000A55B01596E28 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3659, 1, CAST(0x0000A55B0159BEF0 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3660, 1, CAST(0x0000A55B015A7577 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3661, 1, CAST(0x0000A55B015AA101 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3662, 1, CAST(0x0000A55B015FE497 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3663, 1, CAST(0x0000A55B01601A96 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3664, 1, CAST(0x0000A55B01606FFB AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3665, 1, CAST(0x0000A55B016101C2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3666, 1, CAST(0x0000A55B01615B0C AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3667, 1, CAST(0x0000A55B0161D1D1 AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3668, 1, CAST(0x0000A55B0161F36E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3669, 1, CAST(0x0000A55B0161FC95 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3670, 1, CAST(0x0000A55B01630F49 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3671, 1, CAST(0x0000A55B01631E81 AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3672, 1, CAST(0x0000A55B0163839D AS DateTime), N'Edited HOTEL ORDER SER #1')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3673, 1, CAST(0x0000A55B01652AD1 AS DateTime), N'Created product "8"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3674, 1, CAST(0x0000A55B01653299 AS DateTime), N'Edited HOTEL ORDER SER #8')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3675, 1, CAST(0x0000A55B0166F6A4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3676, 1, CAST(0x0000A55B0178FE42 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3677, 1, CAST(0x0000A55B01793435 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3678, 1, CAST(0x0000A55B0179AD2D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3679, 1, CAST(0x0000A55B0179D1CE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3680, 1, CAST(0x0000A55B017B139F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3681, 1, CAST(0x0000A55B017BBD34 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3682, 1, CAST(0x0000A55B017BE3CC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3683, 1, CAST(0x0000A55B017C8159 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3684, 1, CAST(0x0000A55B017CC28F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3685, 1, CAST(0x0000A55C00879F64 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3686, 4, CAST(0x0000A55C0089E495 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3687, 1, CAST(0x0000A55C008A3451 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3688, 1, CAST(0x0000A55C008AA969 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3689, 1, CAST(0x0000A55C008CA5D7 AS DateTime), N'Created product "towel"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3690, 1, CAST(0x0000A55C008D1E54 AS DateTime), N'Edited product "towel"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3691, 1, CAST(0x0000A55C008D50B2 AS DateTime), N'Created product "champane"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3692, 1, CAST(0x0000A55C008D9399 AS DateTime), N'Created product "sandwich"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3693, 1, CAST(0x0000A55C008DAF4D AS DateTime), N'Created product "O2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3694, 1, CAST(0x0000A55C008DEF63 AS DateTime), N'Created category "Lazada"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3695, 1, CAST(0x0000A55C008E0097 AS DateTime), N'Created category "Đông Ba"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3696, 1, CAST(0x0000A55C008E55D5 AS DateTime), N'Created product "Lemonade"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3697, 1, CAST(0x0000A55C008EF969 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3698, 1, CAST(0x0000A55C009094C7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3699, 1, CAST(0x0000A55C0090C8DE AS DateTime), N'Added new Customer "Nguyen Hong Vinh"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3700, 1, CAST(0x0000A55C0090F500 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3701, 1, CAST(0x0000A55C00910EA2 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3702, 1, CAST(0x0000A55F01753C46 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3703, 1, CAST(0x0000A55F01757EE4 AS DateTime), N'Created product "head and shoulder H&S"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3704, 1, CAST(0x0000A55F0175A9F0 AS DateTime), N'Created product "mini hand light"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3705, 1, CAST(0x0000A55F0175D132 AS DateTime), N'Created category "card"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3706, 1, CAST(0x0000A55F0175DCAF AS DateTime), N'Created product "mobi card 20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3707, 1, CAST(0x0000A55F0175F3A7 AS DateTime), N'Created product "mobi card 50"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3708, 1, CAST(0x0000A55F01760B19 AS DateTime), N'Created product "mobi card 100"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3709, 1, CAST(0x0000A55F0178A265 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3710, 1, CAST(0x0000A55F01897305 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3711, 1, CAST(0x0000A55F018AFE33 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3712, 1, CAST(0x0000A5600001ABBA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3713, 1, CAST(0x0000A560000599A6 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3714, 1, CAST(0x0000A5600011C20A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3715, 1, CAST(0x0000A56000121503 AS DateTime), N'Created bill #9')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3716, 1, CAST(0x0000A56000121536 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3717, 1, CAST(0x0000A5600012153B AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3718, 1, CAST(0x0000A56000121541 AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3719, 1, CAST(0x0000A56000123405 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3720, 1, CAST(0x0000A560001690C4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3721, 1, CAST(0x0000A560001759EB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3722, 1, CAST(0x0000A56000187C8A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3723, 1, CAST(0x0000A560001A5B9C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3724, 1, CAST(0x0000A560001ADFC5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3725, 1, CAST(0x0000A5600105C698 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3726, 4, CAST(0x0000A5600113E281 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3727, 1, CAST(0x0000A5600114A3FF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3728, 1, CAST(0x0000A56001162B80 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3729, 1, CAST(0x0000A560013FD417 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3730, 1, CAST(0x0000A5600141481A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3731, 1, CAST(0x0000A56001416CFD AS DateTime), N'Created bill #1018')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3732, 1, CAST(0x0000A56001416D27 AS DateTime), N'Edited product "champane"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3733, 1, CAST(0x0000A56001416D3C AS DateTime), N'Edited Customer "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3734, 1, CAST(0x0000A56001416D45 AS DateTime), N'Edited product "mobi card 20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3735, 1, CAST(0x0000A56001416D48 AS DateTime), N'Edited Customer "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3736, 1, CAST(0x0000A56001416D4E AS DateTime), N'Edited product "towel"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3737, 1, CAST(0x0000A56001416D51 AS DateTime), N'Edited Customer "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3738, 1, CAST(0x0000A5600147125E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3739, 1, CAST(0x0000A56001545788 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3740, 1, CAST(0x0000A561007CEE33 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3741, 4, CAST(0x0000A561007E10AC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3742, 1, CAST(0x0000A561007E201F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3743, 4, CAST(0x0000A561007E4351 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3744, 1, CAST(0x0000A561007E5403 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3745, 1, CAST(0x0000A561007E6521 AS DateTime), N'Created role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3746, 1, CAST(0x0000A561007E6524 AS DateTime), N'Grant "Service Order" permission to role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3747, 1, CAST(0x0000A561007E6527 AS DateTime), N'Grant "Report" permission to role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3748, 1, CAST(0x0000A561007E6528 AS DateTime), N'Grant "Bill Overview" permission to role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3749, 1, CAST(0x0000A561007E652A AS DateTime), N'Grant "Customer Management" permission to role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3750, 1, CAST(0x0000A561007E652E AS DateTime), N'Grant "Change Password" permission to role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3751, 1, CAST(0x0000A561007E6B12 AS DateTime), N'Deleted role "blabla"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3752, 1, CAST(0x0000A561007EF161 AS DateTime), N'Created category "Ng Hong Vinh"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3753, 1, CAST(0x0000A561007F2604 AS DateTime), N'Deleted category "Ng Hong Vinh"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3754, 1, CAST(0x0000A5610080AA6F AS DateTime), N'Created bill #1019')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3755, 1, CAST(0x0000A5610080AA77 AS DateTime), N'Edited product "mini hand light"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3756, 1, CAST(0x0000A5610080AA80 AS DateTime), N'Edited Customer "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3757, 1, CAST(0x0000A5610080AA85 AS DateTime), N'Edited product "head and shoulder H&S"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3758, 1, CAST(0x0000A5610080AA89 AS DateTime), N'Edited Customer "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3759, 1, CAST(0x0000A5610081B60D AS DateTime), N'Edited Customer "lam"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3760, 1, CAST(0x0000A5610081C5F6 AS DateTime), N'Edited Customer "a"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3761, 1, CAST(0x0000A5610081CC81 AS DateTime), N'Edited Customer "Nguyen Hai Ha"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3762, 1, CAST(0x0000A56100862D9C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3763, 1, CAST(0x0000A56100863A64 AS DateTime), N'Created bill #1020')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3764, 1, CAST(0x0000A56100863A7B AS DateTime), N'Edited product "champane"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3765, 1, CAST(0x0000A56100863A80 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3766, 1, CAST(0x0000A56100863A84 AS DateTime), N'Edited product "mini hand light"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3767, 1, CAST(0x0000A56100863A89 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3768, 1, CAST(0x0000A56100863A8E AS DateTime), N'Edited product "Lemonade"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3769, 1, CAST(0x0000A56100863A92 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3770, 1, CAST(0x0000A56100982D70 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3771, 1, CAST(0x0000A56100E562F3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3772, 1, CAST(0x0000A56100E5A97C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3773, 1, CAST(0x0000A56100EB6DB4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3774, 1, CAST(0x0000A56100EBEE20 AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3775, 1, CAST(0x0000A56100ED300C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3776, 1, CAST(0x0000A56100ED3EE5 AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3777, 1, CAST(0x0000A56100ED45BE AS DateTime), N'Created product "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3778, 1, CAST(0x0000A56100ED8991 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3779, 1, CAST(0x0000A56100ED9BF9 AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3780, 1, CAST(0x0000A56100EDB25F AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3781, 1, CAST(0x0000A56100EE9364 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3782, 1, CAST(0x0000A56100EEB30B AS DateTime), N'Created product "8"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3783, 1, CAST(0x0000A56100EEBCD8 AS DateTime), N'Created product "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3784, 1, CAST(0x0000A56100EED4C1 AS DateTime), N'Created product "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3785, 1, CAST(0x0000A56100EEDF8E AS DateTime), N'Edited HOTEL ORDER SER #6')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3786, 1, CAST(0x0000A5610108C6C2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3787, 1, CAST(0x0000A5610108D538 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3788, 1, CAST(0x0000A5610109F25E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3789, 1, CAST(0x0000A5610109FA7B AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3790, 1, CAST(0x0000A561010A22AD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3791, 1, CAST(0x0000A561010A2DBC AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3792, 1, CAST(0x0000A561010AB6B5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3793, 1, CAST(0x0000A561010AC5F8 AS DateTime), N'Created product "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3794, 1, CAST(0x0000A561010B0149 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3795, 1, CAST(0x0000A561010B0A06 AS DateTime), N'Created product "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3796, 1, CAST(0x0000A561010B3775 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3797, 1, CAST(0x0000A561010B4EEF AS DateTime), N'Created product "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3798, 1, CAST(0x0000A561017344F4 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3799, 1, CAST(0x0000A56101735235 AS DateTime), N'Created product "8"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3800, 1, CAST(0x0000A56101736A3E AS DateTime), N'Created product "9"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3801, 1, CAST(0x0000A561017402E1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3802, 1, CAST(0x0000A561017437A2 AS DateTime), N'Created product "10"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3803, 1, CAST(0x0000A56101749421 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3804, 1, CAST(0x0000A5610174A6B0 AS DateTime), N'Created product "11"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3805, 1, CAST(0x0000A56101754EE8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3806, 1, CAST(0x0000A56101755F0C AS DateTime), N'Created product "12"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3807, 1, CAST(0x0000A5610176803D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3808, 1, CAST(0x0000A56101768D1E AS DateTime), N'Created product "13"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3809, 1, CAST(0x0000A5610178AA14 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3810, 1, CAST(0x0000A5610178BCD7 AS DateTime), N'Created product "14"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3811, 1, CAST(0x0000A56101798A35 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3812, 1, CAST(0x0000A56101799751 AS DateTime), N'Created product "15"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3813, 1, CAST(0x0000A561017A01D7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3814, 1, CAST(0x0000A561017A0CC6 AS DateTime), N'Created product "16"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3815, 1, CAST(0x0000A561017A56C9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3816, 1, CAST(0x0000A561017A61C1 AS DateTime), N'Created product "17"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3817, 1, CAST(0x0000A56200F18AC3 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3818, 1, CAST(0x0000A56200F25A47 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3819, 1, CAST(0x0000A562013D9F2B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3820, 1, CAST(0x0000A562013DB3CC AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3821, 1, CAST(0x0000A562013E2682 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3822, 1, CAST(0x0000A562013E9907 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3823, 1, CAST(0x0000A562013EF4B0 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3824, 1, CAST(0x0000A562013F78D7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3825, 1, CAST(0x0000A562013FEF52 AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3826, 1, CAST(0x0000A562014D5D6C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3827, 1, CAST(0x0000A562014D7024 AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3828, 1, CAST(0x0000A562014E0561 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3829, 1, CAST(0x0000A562014E124E AS DateTime), N'Created product "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3830, 1, CAST(0x0000A562014E23B3 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3831, 1, CAST(0x0000A562014E2401 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3832, 1, CAST(0x0000A5620153B09D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3833, 1, CAST(0x0000A5620153BC8D AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3834, 1, CAST(0x0000A5620153BC91 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3835, 1, CAST(0x0000A5620153D601 AS DateTime), N'Created product "6"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3836, 1, CAST(0x0000A5620153E5DC AS DateTime), N'Created bill #1021')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3837, 1, CAST(0x0000A5620153E60A AS DateTime), N'Edited product "sandwich"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3838, 1, CAST(0x0000A5620153E610 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3839, 1, CAST(0x0000A5620153E614 AS DateTime), N'Edited product "mini hand light"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3840, 1, CAST(0x0000A5620153E617 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3841, 1, CAST(0x0000A56201555A53 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3842, 1, CAST(0x0000A5620155682C AS DateTime), N'Created bill #1022')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3843, 1, CAST(0x0000A56201556849 AS DateTime), N'Edited product "mini hand light"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3844, 1, CAST(0x0000A5620155684C AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3845, 1, CAST(0x0000A56201556851 AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3846, 1, CAST(0x0000A56201556856 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3847, 1, CAST(0x0000A5620155685B AS DateTime), N'Edited product "O2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3848, 1, CAST(0x0000A5620155685E AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3849, 1, CAST(0x0000A562015615D1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3850, 1, CAST(0x0000A56201562038 AS DateTime), N'Created product "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3851, 1, CAST(0x0000A5620156203D AS DateTime), N'Created product "8"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3852, 1, CAST(0x0000A562015675AB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3853, 1, CAST(0x0000A56201567E6A AS DateTime), N'Created product "9"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3854, 1, CAST(0x0000A562015DAC33 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3855, 1, CAST(0x0000A562015DB401 AS DateTime), N'Created product "10"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3856, 1, CAST(0x0000A56201628783 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3857, 1, CAST(0x0000A56201629727 AS DateTime), N'Created product "11"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3858, 1, CAST(0x0000A5620162D639 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3859, 1, CAST(0x0000A5620162DF1C AS DateTime), N'Created product "12"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3860, 1, CAST(0x0000A5620163941F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3861, 1, CAST(0x0000A56201639BCA AS DateTime), N'Created product "13"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3862, 1, CAST(0x0000A56201770933 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3863, 1, CAST(0x0000A562017714D1 AS DateTime), N'Created product "14"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3864, 1, CAST(0x0000A5620177B132 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3865, 1, CAST(0x0000A5620177B726 AS DateTime), N'Created product "15"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3866, 1, CAST(0x0000A562017A52C8 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3867, 1, CAST(0x0000A562017A5DE9 AS DateTime), N'Created product "16"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3868, 1, CAST(0x0000A562017AAF50 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3869, 1, CAST(0x0000A562017AB631 AS DateTime), N'Created product "17"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3870, 1, CAST(0x0000A56201821F7E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3871, 1, CAST(0x0000A5620182274F AS DateTime), N'Created product "18"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3872, 1, CAST(0x0000A5620186CAF9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3873, 1, CAST(0x0000A56201879DB1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3874, 1, CAST(0x0000A5630008EFEA AS DateTime), N'Logged in to the system.')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3875, 1, CAST(0x0000A563000A2171 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3876, 1, CAST(0x0000A563000B42A5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3877, 1, CAST(0x0000A563000B4EF1 AS DateTime), N'Created product "19"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3878, 1, CAST(0x0000A5630018D45A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3879, 1, CAST(0x0000A56300192A12 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3880, 1, CAST(0x0000A5630019B2AB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3881, 1, CAST(0x0000A5630022107B AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3882, 1, CAST(0x0000A56300221EC2 AS DateTime), N'Created product "20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3883, 1, CAST(0x0000A563008884E5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3884, 1, CAST(0x0000A5630088E3FB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3885, 1, CAST(0x0000A56300899B66 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3886, 1, CAST(0x0000A563008B467D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3887, 1, CAST(0x0000A563008BB32D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3888, 1, CAST(0x0000A563008D4495 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3889, 1, CAST(0x0000A563008DAD66 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3890, 1, CAST(0x0000A5630092CEEA AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3891, 1, CAST(0x0000A56400E35A58 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3892, 1, CAST(0x0000A56400E3866F AS DateTime), N'Created product "9"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3893, 1, CAST(0x0000A56400E3898E AS DateTime), N'Created product "7"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3894, 1, CAST(0x0000A56400E38994 AS DateTime), N'Created product "8"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3895, 1, CAST(0x0000A56400E38F7A AS DateTime), N'Created bill #10')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3896, 1, CAST(0x0000A56400E38FA6 AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3897, 1, CAST(0x0000A56400E38FAC AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3898, 1, CAST(0x0000A56400E38FB0 AS DateTime), N'Edited product "303"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3899, 1, CAST(0x0000A56400E3CAE9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3900, 1, CAST(0x0000A56400E3E713 AS DateTime), N'Created product "10"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3901, 1, CAST(0x0000A56400E3EA37 AS DateTime), N'Created bill #11')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3902, 1, CAST(0x0000A56400E3EA41 AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3903, 1, CAST(0x0000A56400E473A2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3904, 1, CAST(0x0000A56400E491DC AS DateTime), N'Created bill #12')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3905, 1, CAST(0x0000A56400E491F8 AS DateTime), N'Edited product "104"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3906, 1, CAST(0x0000A56400E51849 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3907, 1, CAST(0x0000A56400E52B13 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3908, 1, CAST(0x0000A56400E54640 AS DateTime), N'Created bill #13')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3909, 1, CAST(0x0000A56400E54649 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3910, 1, CAST(0x0000A56400E54650 AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3911, 1, CAST(0x0000A56400E569F3 AS DateTime), N'Created bill #14')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3912, 1, CAST(0x0000A56400E569F9 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3913, 1, CAST(0x0000A56400E569FE AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3914, 1, CAST(0x0000A56400E585BA AS DateTime), N'Created bill #15')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3915, 1, CAST(0x0000A56400E585C1 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3916, 1, CAST(0x0000A56400E585C6 AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3917, 1, CAST(0x0000A56400E5CFAD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3918, 1, CAST(0x0000A56400E5EE37 AS DateTime), N'Created bill #16')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3919, 1, CAST(0x0000A56400E5EE56 AS DateTime), N'Edited product "204"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3920, 1, CAST(0x0000A56400E5EE5D AS DateTime), N'Edited product "105"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3921, 1, CAST(0x0000A56400E5EE64 AS DateTime), N'Edited product "404"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3922, 1, CAST(0x0000A56400E5EE6C AS DateTime), N'Edited product "403"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3923, 1, CAST(0x0000A56400EBAF36 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3924, 1, CAST(0x0000A56400F22CBE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3925, 1, CAST(0x0000A56400F23981 AS DateTime), N'Created product "21"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3926, 1, CAST(0x0000A56400F256BD AS DateTime), N'Created bill #1023')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3927, 1, CAST(0x0000A56400F256D5 AS DateTime), N'Edited product "mobi card 20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3928, 1, CAST(0x0000A56400F256D9 AS DateTime), N'Edited Customer "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3929, 1, CAST(0x0000A56400F256DE AS DateTime), N'Edited product "O2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3930, 1, CAST(0x0000A56400F256E3 AS DateTime), N'Edited Customer "5"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3931, 1, CAST(0x0000A56400F43F25 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3932, 1, CAST(0x0000A5640171CFCE AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3933, 1, CAST(0x0000A5640171F29A AS DateTime), N'Created product "11"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3934, 1, CAST(0x0000A5640171FB19 AS DateTime), N'Created product "9"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3935, 1, CAST(0x0000A56401720333 AS DateTime), N'Created bill #17')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3936, 1, CAST(0x0000A5640172035D AS DateTime), N'Edited product "205"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3937, 1, CAST(0x0000A56401720366 AS DateTime), N'Edited product "402"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3938, 1, CAST(0x0000A564017388F9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3939, 1, CAST(0x0000A56401753588 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3940, 1, CAST(0x0000A56401755B3C AS DateTime), N'Created product "12"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3941, 1, CAST(0x0000A56401756331 AS DateTime), N'Created product "10"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3942, 1, CAST(0x0000A56401756BEF AS DateTime), N'Created bill #18')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3943, 1, CAST(0x0000A56401756C08 AS DateTime), N'Edited product "401"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3944, 1, CAST(0x0000A56401756C0E AS DateTime), N'Edited product "304"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3945, 1, CAST(0x0000A5640175E749 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3946, 1, CAST(0x0000A56401760151 AS DateTime), N'Created product "13"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3947, 1, CAST(0x0000A56401760EA6 AS DateTime), N'Created bill #19')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3948, 1, CAST(0x0000A56401760EB2 AS DateTime), N'Edited product "305"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3949, 1, CAST(0x0000A56401760EB7 AS DateTime), N'Edited product "405"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3950, 1, CAST(0x0000A5640177F110 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3951, 1, CAST(0x0000A564017AC856 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3952, 1, CAST(0x0000A564017AE898 AS DateTime), N'Created product "14"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3953, 1, CAST(0x0000A564017AF235 AS DateTime), N'Created product "11"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3954, 1, CAST(0x0000A564017AF554 AS DateTime), N'Created bill #20')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3955, 1, CAST(0x0000A564017AF56B AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3956, 1, CAST(0x0000A564017AF575 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3957, 1, CAST(0x0000A564017AF579 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3958, 1, CAST(0x0000A564017FFA18 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3959, 1, CAST(0x0000A564018014CB AS DateTime), N'Created product "15"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3960, 1, CAST(0x0000A56401801EFE AS DateTime), N'Created bill #21')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3961, 1, CAST(0x0000A56401801F0D AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3962, 1, CAST(0x0000A56401801F1B AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3963, 1, CAST(0x0000A5640180E603 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3964, 1, CAST(0x0000A5640180FB84 AS DateTime), N'Created product "16"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3965, 1, CAST(0x0000A5640180FE55 AS DateTime), N'Created bill #22')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3966, 1, CAST(0x0000A5640180FE63 AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3967, 1, CAST(0x0000A5640180FE68 AS DateTime), N'Edited product "104"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3968, 1, CAST(0x0000A56401814AB2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3969, 1, CAST(0x0000A56401816813 AS DateTime), N'Created product "17"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3970, 1, CAST(0x0000A56401816A9B AS DateTime), N'Created bill #23')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3971, 1, CAST(0x0000A56401816AA9 AS DateTime), N'Edited product "204"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3972, 1, CAST(0x0000A56401816AAE AS DateTime), N'Edited product "105"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3973, 1, CAST(0x0000A5640182F63C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3974, 1, CAST(0x0000A5640183096A AS DateTime), N'Created product "18"')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3975, 1, CAST(0x0000A56401830BD8 AS DateTime), N'Created bill #24')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3976, 1, CAST(0x0000A56401830BF0 AS DateTime), N'Edited product "205"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3977, 1, CAST(0x0000A5640183214B AS DateTime), N'Created bill #25')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3978, 1, CAST(0x0000A56401832154 AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3979, 1, CAST(0x0000A56401832159 AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3980, 1, CAST(0x0000A565000766E7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3981, 1, CAST(0x0000A565000E0B1E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3982, 1, CAST(0x0000A56500152B23 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3983, 1, CAST(0x0000A565001629ED AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3984, 1, CAST(0x0000A56500824264 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3985, 1, CAST(0x0000A56500825141 AS DateTime), N'Created product "22"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3986, 1, CAST(0x0000A5650082795A AS DateTime), N'Edited role "admin"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3987, 1, CAST(0x0000A56500828FDF AS DateTime), N'Edited role "receptionist"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3988, 1, CAST(0x0000A5650086D37D AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3989, 1, CAST(0x0000A565008710F1 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3990, 1, CAST(0x0000A56500876100 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3991, 1, CAST(0x0000A565008F84D7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3992, 1, CAST(0x0000A5650092128E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3993, 1, CAST(0x0000A56500924AE6 AS DateTime), N'Created product "23"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3994, 1, CAST(0x0000A56500929C4E AS DateTime), N'Created product "19"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3995, 1, CAST(0x0000A5650092BB50 AS DateTime), N'Created bill #1024')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3996, 1, CAST(0x0000A5650092BB6C AS DateTime), N'Edited product "bed"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3997, 1, CAST(0x0000A5650092BB6C AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3998, 1, CAST(0x0000A5650092BB70 AS DateTime), N'Edited product "mobi card 20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (3999, 1, CAST(0x0000A5650092BB75 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4000, 1, CAST(0x0000A5680133C122 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4001, 1, CAST(0x0000A5680134C400 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4002, 1, CAST(0x0000A56901404466 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4003, 1, CAST(0x0000A569014053DA AS DateTime), N'Created product "24"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4004, 1, CAST(0x0000A569014D1F06 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4005, 1, CAST(0x0000A569014D7688 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4006, 1, CAST(0x0000A569014D942D AS DateTime), N'Created bill #1025')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4007, 1, CAST(0x0000A569014D944C AS DateTime), N'Edited product "towel"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4008, 1, CAST(0x0000A569014D9451 AS DateTime), N'Edited Customer "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4009, 1, CAST(0x0000A56A00DEA17E AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4010, 1, CAST(0x0000A56B013AE4C2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4011, 1, CAST(0x0000A56B013AF5B0 AS DateTime), N'Created product "25"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4012, 1, CAST(0x0000A56B0141E3F7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4013, 1, CAST(0x0000A56B014202DE AS DateTime), N'Created product "20"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4014, 1, CAST(0x0000A56B01421118 AS DateTime), N'Created product "12"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4015, 1, CAST(0x0000A56B0142148D AS DateTime), N'Created bill #26')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4016, 1, CAST(0x0000A56B014214B2 AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4017, 1, CAST(0x0000A56B014214B7 AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4018, 1, CAST(0x0000A56B01422191 AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4019, 1, CAST(0x0000A56B0142268A AS DateTime), N'Edited product "203"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4020, 1, CAST(0x0000A56B0142C57F AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4021, 1, CAST(0x0000A56B014531AC AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4022, 1, CAST(0x0000A56B0145522C AS DateTime), N'Created bill #27')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4023, 1, CAST(0x0000A56B01455243 AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4024, 1, CAST(0x0000A56B01455248 AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4025, 1, CAST(0x0000A56B01458879 AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4026, 1, CAST(0x0000A56B01466F72 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4027, 1, CAST(0x0000A56B0146767C AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4028, 1, CAST(0x0000A56B0146C80A AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4029, 1, CAST(0x0000A56B0149D236 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4030, 1, CAST(0x0000A56B0149DF33 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4031, 1, CAST(0x0000A56B014A4CB2 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4032, 1, CAST(0x0000A56B014A7AEB AS DateTime), N'Created product "21"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4033, 1, CAST(0x0000A56B014B9A9C AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4034, 1, CAST(0x0000A56B014BD8A2 AS DateTime), N'Created bill #28')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4035, 1, CAST(0x0000A56B014BD8BA AS DateTime), N'Edited product "501"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4036, 1, CAST(0x0000A56B014BD8C3 AS DateTime), N'Edited product "401"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4037, 1, CAST(0x0000A56B014D35EB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4038, 1, CAST(0x0000A56B014E0CA9 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4039, 1, CAST(0x0000A56B014E1963 AS DateTime), N'Edited product "401"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4040, 1, CAST(0x0000A56B0151BBAD AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4041, 1, CAST(0x0000A56B0151CD80 AS DateTime), N'Edited product "501"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4042, 1, CAST(0x0000A56B01547C80 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4043, 1, CAST(0x0000A56B0154992D AS DateTime), N'Created bill #29')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4044, 1, CAST(0x0000A56B01549936 AS DateTime), N'Edited product "202"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4045, 1, CAST(0x0000A56B0154993C AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4046, 1, CAST(0x0000A56B01549942 AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4047, 1, CAST(0x0000A56B0154BD96 AS DateTime), N'Created bill #30')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4048, 1, CAST(0x0000A56B0154BDA4 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4049, 1, CAST(0x0000A56B0154BDAD AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4050, 1, CAST(0x0000A56B0154BDB7 AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4051, 1, CAST(0x0000A56B0154BDB7 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4052, 1, CAST(0x0000A56B0154E31A AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4053, 1, CAST(0x0000A56B015509D5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4054, 1, CAST(0x0000A56B0155D0EF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4055, 1, CAST(0x0000A56B015DE0EF AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4056, 1, CAST(0x0000A56B015DEE8A AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4057, 1, CAST(0x0000A56B015E2E2E AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4058, 1, CAST(0x0000A56B015E4A21 AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4059, 1, CAST(0x0000A56B015ECA4B AS DateTime), N'Created bill #31')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4060, 1, CAST(0x0000A56B015ECA56 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4061, 1, CAST(0x0000A56B015F00B7 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4062, 1, CAST(0x0000A56B015F1553 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4063, 1, CAST(0x0000A56B017E60BB AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4064, 1, CAST(0x0000A56B017E84D6 AS DateTime), N'Added new Customer "Nguyen Nhan"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4065, 1, CAST(0x0000A56B017E9FA8 AS DateTime), N'Added new Customer "Phuong Mi"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4066, 1, CAST(0x0000A56B017ED935 AS DateTime), N'Added new Customer "George Bush"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4067, 1, CAST(0x0000A56B017EFD88 AS DateTime), N'Created bill #32')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4068, 1, CAST(0x0000A56B017EFDA9 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4069, 1, CAST(0x0000A56B017F1106 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4070, 1, CAST(0x0000A56B017F115F AS DateTime), N'Deleted booked room "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4071, 1, CAST(0x0000A56B0180CC32 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4072, 1, CAST(0x0000A56B0180F2E1 AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4073, 1, CAST(0x0000A56B0180F702 AS DateTime), N'Created bill #33')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4074, 1, CAST(0x0000A56B0180F71E AS DateTime), N'Edited product "201"')
GO
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4075, 1, CAST(0x0000A56B018125BB AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4076, 1, CAST(0x0000A56B0183A985 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4077, 1, CAST(0x0000A56B01840E50 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4078, 1, CAST(0x0000A56B01842EA3 AS DateTime), N'Created product "2"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4079, 1, CAST(0x0000A56B018444F9 AS DateTime), N'Created bill #34')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4080, 1, CAST(0x0000A56B01844514 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4081, 1, CAST(0x0000A56B0184451A AS DateTime), N'Edited product "302"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4082, 1, CAST(0x0000A56C01227EC5 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4083, 1, CAST(0x0000A56C01229D95 AS DateTime), N'Created product "3"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4084, 1, CAST(0x0000A56C0122A4EC AS DateTime), N'Created product "1"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4085, 1, CAST(0x0000A56C0122A876 AS DateTime), N'Created bill #35')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4086, 1, CAST(0x0000A56C0122A894 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4087, 1, CAST(0x0000A56C0122A899 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4088, 1, CAST(0x0000A56C0122A89E AS DateTime), N'Edited product "103"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4089, 1, CAST(0x0000A56C0123102F AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4090, 1, CAST(0x0000A56C01235342 AS DateTime), N'Logged in to the system.')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4091, 1, CAST(0x0000A56C012398DB AS DateTime), N'Created product "4"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4092, 1, CAST(0x0000A56C0123A2BB AS DateTime), N'Created bill #36')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4093, 1, CAST(0x0000A56C0123A2C2 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4094, 1, CAST(0x0000A56C0123A2C6 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4095, 1, CAST(0x0000A56C0123A2CB AS DateTime), N'Edited product "301"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4096, 1, CAST(0x0000A56C0123A2D0 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4097, 1, CAST(0x0000A56C0123A2D3 AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4098, 1, CAST(0x0000A56C0123B0AB AS DateTime), N'Edited product "201"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4099, 1, CAST(0x0000A56C0123BF36 AS DateTime), N'Edited product "101"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4100, 1, CAST(0x0000A56C0123C583 AS DateTime), N'Edited product "102"')
INSERT [dbo].[Diary] ([DiaryID], [AccountID], [DateTime], [Description]) VALUES (4101, 1, CAST(0x0000A56C0123CC43 AS DateTime), N'Edited product "301"')
SET IDENTITY_INSERT [dbo].[Diary] OFF
SET IDENTITY_INSERT [dbo].[Functions] ON 

INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (1, N'Account Management', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (2, N'Account Permission', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (3, N'Product Management', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (4, N'Restaurant Checkout', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (5, N'Bill Overview', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (6, N'Change Password', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (7, N'Category Management', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (8, N'Customer Management', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (9, N'Report', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (10, N'Backup', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (11, N'Restore', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (12, N'Diary', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (13, N'Restaurant Supplier', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (14, N'Service Order', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (15, N'Table', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (16, N'Room', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (17, N'Hotel Checkin', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (18, N'Hotel Checkout', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (19, N'Hotel Customer', 1)
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [isActive]) VALUES (20, N'Hotel Order Service', 1)
SET IDENTITY_INSERT [dbo].[Functions] OFF
SET IDENTITY_INSERT [dbo].[OrderedDishes] ON 

INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (1, 1018, 9, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (2, 1018, 15, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (3, 1018, 8, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (4, 1019, 14, 6)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (5, 1019, 13, 3)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (6, 1020, 9, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (7, 1020, 14, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (8, 1020, 12, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (9, 1021, 10, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (10, 1021, 14, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (11, 1022, 14, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (12, 1022, 7, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (13, 1022, 11, 2)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (14, 1023, 15, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (15, 1023, 11, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (16, 1024, 7, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (17, 1024, 15, 1)
INSERT [dbo].[OrderedDishes] ([ID], [BillID], [ProductID], [Quantity]) VALUES (18, 1025, 8, 1)
SET IDENTITY_INSERT [dbo].[OrderedDishes] OFF
SET IDENTITY_INSERT [dbo].[OrderedService] ON 

INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (1, 1, 1, 1, 1, 5, CAST(0x0000A56F00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (2, 2, 3, 1, 1, 1, CAST(0x0000A58600000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (3, 3, 4, 1, 1, 1, CAST(0x0000A59300000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (4, 4, 4, 1, 1, 1, CAST(0x0000A58E00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (5, 5, 3, 1, 1, 1, CAST(0x0000A57D00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (6, 6, 5, 1, 1, 1, CAST(0x0000A57700000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (7, 7, 4, 1, 1, 1, CAST(0x0000A57700000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (8, 7, 6, 1, 1, 1, CAST(0x0000A57700000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (9, 8, 5, 1, 1, 1, CAST(0x0000A56F00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (10, 9, 4, 1, 1, 1, CAST(0x0000A57000000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (11, 10, 5, 2, 1, 5, CAST(0x0000A57800000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (12, 11, 2, 1, 1, 1, CAST(0x0000A57600000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (13, 12, 4, 1, 1, 1, CAST(0x0000A57000000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (14, 13, 3, 1, 1, 1, CAST(0x0000A59600000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (15, 14, 5, 1, 1, 1, NULL)
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (16, 15, 2, 1, 1, 1, CAST(0x0000A57A00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (17, 16, 4, 1, 1, 1, CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (18, 17, 4, 1, 1, 1, CAST(0x0000A57200000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (19, 18, 4, 1, 1, 1, CAST(0x0000A5B000000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (20, 19, 2, 1, 1, 1, CAST(0x0000A57700000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (21, 20, 4, 1, 1, 1, CAST(0x0000A57F00000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (22, 21, 1, 1, 1, 1, CAST(0x0000A57000000000 AS DateTime))
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (23, 22, 6, 1, 1, 1, NULL)
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (24, 23, 2, 1, 1, 4, NULL)
INSERT [dbo].[OrderedService] ([ID], [OrderID], [ServiceID], [Quantity], [SellerID], [CustomerID], [DateOrder]) VALUES (25, 24, 6, 1, 1, 1, CAST(0x0000A57D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderedService] OFF
SET IDENTITY_INSERT [dbo].[OrderTable] ON 

INSERT [dbo].[OrderTable] ([ID], [TableID], [StaffID], [DateOrder], [DateIn], [CustomerID], [orderID]) VALUES (1, 1, 1, CAST(0x0000A5620153BC82 AS DateTime), CAST(0x0000A57700000000 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[OrderTable] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (3, N'lavie', 20, CAST(0x0000A51000000000 AS DateTime), 1, NULL, NULL, 1, CAST(3990.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (4, N'bread', 90, CAST(0x0000A51000000000 AS DateTime), 2, NULL, NULL, 0, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (5, N'dove', 65, CAST(0x0000A51000000000 AS DateTime), 4, NULL, NULL, 1, CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (7, N'bed', 8, CAST(0x0000A55000000000 AS DateTime), 5, NULL, NULL, 1, CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (8, N'towel', 93, CAST(0x0000A55C00000000 AS DateTime), 5, NULL, NULL, 1, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (9, N'champane', 98, CAST(0x0000A55C00000000 AS DateTime), 3, NULL, NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (10, N'sandwich', 499, CAST(0x0000A55C00000000 AS DateTime), 2, NULL, NULL, 1, CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (11, N'O2', 497, CAST(0x0000A55C00000000 AS DateTime), 1, NULL, NULL, 1, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (12, N'Lemonade', 499, CAST(0x0000A55C00000000 AS DateTime), 1, NULL, NULL, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (13, N'head and shoulder H&S', 497, CAST(0x0000A55F00000000 AS DateTime), 4, NULL, NULL, 1, CAST(60000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (14, N'mini hand light', 491, CAST(0x0000A55F00000000 AS DateTime), 5, NULL, NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (15, N'mobi card 20', 497, CAST(0x0000A55F00000000 AS DateTime), 6, NULL, NULL, 1, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (16, N'mobi card 50', 500, CAST(0x0000A55F00000000 AS DateTime), 6, NULL, NULL, 1, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ProductID], [ProductName], [Quantity], [ImportDate], [CateID], [SupplierID], [UnitID], [isActive], [Price]) VALUES (17, N'mobi card 100', 500, CAST(0x0000A55F00000000 AS DateTime), 6, NULL, NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RestaurantBill] ON 

INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (3, 1, 1, NULL, CAST(0x0000A5500080A13C AS DateTime), CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (4, 1, 1, NULL, CAST(0x0000A5500081701A AS DateTime), CAST(90000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (5, 1, 4, NULL, CAST(0x0000A556013E9216 AS DateTime), CAST(45000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (6, 1, 1, NULL, CAST(0x0000A5570084D1CE AS DateTime), CAST(295000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (7, 1, 1, NULL, CAST(0x0000A5570084FB21 AS DateTime), CAST(295000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (8, 1, 1, NULL, CAST(0x0000A55700853F72 AS DateTime), CAST(253990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (9, 1, 1, NULL, CAST(0x0000A5570085F1DB AS DateTime), CAST(298990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1006, 1, 1, NULL, CAST(0x0000A557008D41A4 AS DateTime), CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1007, 1, 1, NULL, CAST(0x0000A5570095C137 AS DateTime), CAST(180000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1008, 1, 1, NULL, CAST(0x0000A55700963F0D AS DateTime), CAST(590000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1009, 1, 1, NULL, CAST(0x0000A5570096960B AS DateTime), CAST(93990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1010, 1, 1, NULL, CAST(0x0000A55700981093 AS DateTime), CAST(253990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1011, 1, 1, NULL, CAST(0x0000A557009939E4 AS DateTime), CAST(48990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1012, 1, 1, NULL, CAST(0x0000A55700998826 AS DateTime), CAST(295000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1013, 1, 1, NULL, CAST(0x0000A557009C2A09 AS DateTime), CAST(298990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1014, 1, 7, NULL, CAST(0x0000A55901860051 AS DateTime), CAST(298990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1015, 1, 1, NULL, CAST(0x0000A559018A33D4 AS DateTime), CAST(343990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1016, 1, 1, NULL, CAST(0x0000A559018AAF57 AS DateTime), CAST(343990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1017, 1, 1, NULL, CAST(0x0000A559018B4EE9 AS DateTime), CAST(343990.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1018, 1, 3, NULL, CAST(0x0000A56001416CEB AS DateTime), CAST(155000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1019, 1, 6, NULL, CAST(0x0000A5610080AA5C AS DateTime), CAST(780000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1020, 1, 1, NULL, CAST(0x0000A56100863A5A AS DateTime), CAST(210000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1021, 1, 1, NULL, CAST(0x0000A5620153E5D5 AS DateTime), CAST(135000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1022, 1, 1, NULL, CAST(0x0000A56201556823 AS DateTime), CAST(362000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1023, 1, 5, NULL, CAST(0x0000A56400F256B8 AS DateTime), CAST(26000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1024, 1, 1, NULL, CAST(0x0000A5650092BAF2 AS DateTime), CAST(270000.00 AS Decimal(18, 2)))
INSERT [dbo].[RestaurantBill] ([ID], [StaffID], [TableID], [CustomerName], [Date], [Total]) VALUES (1025, 1, 1, NULL, CAST(0x0000A569014D940E AS DateTime), CAST(35000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[RestaurantBill] OFF
SET IDENTITY_INSERT [dbo].[RestaurantTable] ON 

INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (1, 2, 1, 4, N'window table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (2, 1, 1, 2, N'garden table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (3, 1, 1, 4, N'window table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (4, 1, 1, 8, N'garden table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (5, 2, 1, 2, N'garden table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (6, 1, 1, 3, N'window table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (7, 1, 1, 2, N'window table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (8, 1, 1, 4, N'garden table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (9, 1, 1, 8, N'garden table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (10, 1, 1, 20, N'royal table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (11, 1, 1, 10, N'royal table')
INSERT [dbo].[RestaurantTable] ([TableID], [Status], [isActive], [NumOfChairs], [Description]) VALUES (12, 1, 1, 10, N'royal table')
SET IDENTITY_INSERT [dbo].[RestaurantTable] OFF
SET IDENTITY_INSERT [dbo].[Role_Function] ON 

INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (128, 2, 7)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (129, 2, 13)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (130, 2, 9)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (131, 2, 3)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (132, 2, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (133, 2, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (134, 2, 15)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (135, 2, 4)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (136, 4, 5)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (137, 4, 9)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (138, 4, 8)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (139, 4, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (140, 4, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (141, 5, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (142, 5, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (143, 5, 8)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (150, 3, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (151, 3, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (152, 3, 4)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (153, 3, 15)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (154, 7, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (155, 7, 9)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (156, 7, 5)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (157, 7, 8)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (158, 7, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (159, 1, 1)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (160, 1, 18)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (161, 1, 19)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (162, 1, 14)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (163, 1, 20)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (164, 1, 5)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (165, 1, 13)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (166, 1, 8)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (167, 1, 4)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (168, 1, 11)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (169, 1, 7)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (170, 1, 12)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (171, 1, 2)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (172, 1, 9)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (173, 1, 15)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (174, 1, 17)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (175, 1, 3)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (176, 1, 10)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (177, 1, 16)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (178, 6, 17)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (179, 6, 9)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (180, 6, 20)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (181, 6, 19)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (182, 6, 16)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (183, 6, 6)
INSERT [dbo].[Role_Function] ([ID], [RoleID], [FunctionID]) VALUES (184, 6, 18)
SET IDENTITY_INSERT [dbo].[Role_Function] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (1, N'admin', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (2, N'restaurant manager ', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (3, N'restaurant staff', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (4, N'services manager ', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (5, N'services staff', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (6, N'receptionist', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [isActive]) VALUES (7, N'blabla', 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (3, N'101', 1, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (4, N'102', 1, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (5, N'103', 1, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (6, N'104', 1, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (7, N'105', 1, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (8, N'201', 2, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (9, N'202', 2, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (10, N'203', 2, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (11, N'204', 2, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (12, N'205', 2, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (14, N'301', 3, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (15, N'302', 3, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (16, N'303', 3, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (17, N'304', 3, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (18, N'305', 3, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (19, N'401', 4, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (20, N'402', 4, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (21, N'403', 4, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (22, N'404', 4, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (23, N'405', 4, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (24, N'501', 5, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (25, N'502', 5, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (26, N'503', 5, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (27, N'504', 5, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (28, N'505', 5, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (29, N'601', 6, 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (30, N'602', 6, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (31, N'603', 6, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (32, N'604', 6, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (33, N'605', 6, 2, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [Floor], [CateID], [Status], [isActive]) VALUES (34, N'temp', 99, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (1, N'GYM 3M', 1, CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (2, N'SPA 1 hours', 1, CAST(360000.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (3, N'GYM 6M', 1, CAST(450000.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (4, N'GYM 1Y', 1, CAST(850000.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (5, N'SPA WEEK', 1, CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [isActive], [Price]) VALUES (6, N'SPA YEAR', 1, CAST(2000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (1, N'CoopMart', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (2, N'BigC Hue', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (3, N'Unilever', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (4, N'Lazada', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (5, N'Đông Ba', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [isActive]) VALUES (6, N'Ng Hong Vinh', 0)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[BookedRooms]  WITH CHECK ADD  CONSTRAINT [FK_BookedRoomList_BookingRoom] FOREIGN KEY([BookingID])
REFERENCES [dbo].[BookingRoom] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookedRooms] CHECK CONSTRAINT [FK_BookedRoomList_BookingRoom]
GO
ALTER TABLE [dbo].[BookedRooms]  WITH CHECK ADD  CONSTRAINT [FK_BookedRoomList_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookedRooms] CHECK CONSTRAINT [FK_BookedRoomList_Rooms]
GO
ALTER TABLE [dbo].[BookingRoom]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoom_Accounts] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingRoom] CHECK CONSTRAINT [FK_BookingRoom_Accounts]
GO
ALTER TABLE [dbo].[BookingRoom]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoom_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingRoom] CHECK CONSTRAINT [FK_BookingRoom_Customers]
GO
ALTER TABLE [dbo].[Diary]  WITH CHECK ADD  CONSTRAINT [FK_Diary_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Diary] CHECK CONSTRAINT [FK_Diary_Accounts]
GO
ALTER TABLE [dbo].[HotelOrderDish]  WITH CHECK ADD  CONSTRAINT [FK_HotelOrderDish_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HotelOrderDish] CHECK CONSTRAINT [FK_HotelOrderDish_Products]
GO
ALTER TABLE [dbo].[HotelOrderDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderDish_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HotelOrderDish] CHECK CONSTRAINT [FK_OrderDish_Rooms]
GO
ALTER TABLE [dbo].[HotelOrderService]  WITH CHECK ADD  CONSTRAINT [FK_HotelOrderService_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HotelOrderService] CHECK CONSTRAINT [FK_HotelOrderService_Rooms]
GO
ALTER TABLE [dbo].[HotelOrderService]  WITH CHECK ADD  CONSTRAINT [FK_HotelOrderService_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HotelOrderService] CHECK CONSTRAINT [FK_HotelOrderService_Services]
GO
ALTER TABLE [dbo].[OrderedDishes]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDishes_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderedDishes] CHECK CONSTRAINT [FK_OrderedDishes_Products]
GO
ALTER TABLE [dbo].[OrderedDishes]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDishes_RestaurantBill] FOREIGN KEY([BillID])
REFERENCES [dbo].[RestaurantBill] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderedDishes] CHECK CONSTRAINT [FK_OrderedDishes_RestaurantBill]
GO
ALTER TABLE [dbo].[OrderedService]  WITH CHECK ADD  CONSTRAINT [FK_OrderedService_Accounts] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderedService] CHECK CONSTRAINT [FK_OrderedService_Accounts]
GO
ALTER TABLE [dbo].[OrderedService]  WITH CHECK ADD  CONSTRAINT [FK_OrderedService_CustomerOrderService] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerOrderService] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderedService] CHECK CONSTRAINT [FK_OrderedService_CustomerOrderService]
GO
ALTER TABLE [dbo].[OrderedService]  WITH CHECK ADD  CONSTRAINT [FK_OrderedService_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderedService] CHECK CONSTRAINT [FK_OrderedService_Services]
GO
ALTER TABLE [dbo].[OrderForSupplier]  WITH CHECK ADD  CONSTRAINT [FK_OrderForSupplier_Accounts] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderForSupplier] CHECK CONSTRAINT [FK_OrderForSupplier_Accounts]
GO
ALTER TABLE [dbo].[OrderForSupplier]  WITH CHECK ADD  CONSTRAINT [FK_OrderForSupplier_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[OrderForSupplier] CHECK CONSTRAINT [FK_OrderForSupplier_Suppliers]
GO
ALTER TABLE [dbo].[OrderLineForSupplier]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineForSupplier_OrderForSupplier] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderForSupplier] ([ID])
GO
ALTER TABLE [dbo].[OrderLineForSupplier] CHECK CONSTRAINT [FK_OrderLineForSupplier_OrderForSupplier]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_OrderTable_Accounts] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_OrderTable_Accounts]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_OrderTable_CustomerOrderTable] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerOrderTable] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_OrderTable_CustomerOrderTable]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_OrderTable_RestaurantTable] FOREIGN KEY([TableID])
REFERENCES [dbo].[RestaurantTable] ([TableID])
GO
ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_OrderTable_RestaurantTable]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CategoryOfProduct] FOREIGN KEY([CateID])
REFERENCES [dbo].[CategoryOfProduct] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CategoryOfProduct]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers1] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Units]
GO
ALTER TABLE [dbo].[RestaurantBill]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantBill_Accounts] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RestaurantBill] CHECK CONSTRAINT [FK_RestaurantBill_Accounts]
GO
ALTER TABLE [dbo].[RestaurantBill]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantBill_RestaurantTable] FOREIGN KEY([TableID])
REFERENCES [dbo].[RestaurantTable] ([TableID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RestaurantBill] CHECK CONSTRAINT [FK_RestaurantBill_RestaurantTable]
GO
ALTER TABLE [dbo].[Role_Function]  WITH CHECK ADD  CONSTRAINT [FK_Role_Function_Functions] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Functions] ([FunctionID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Role_Function] CHECK CONSTRAINT [FK_Role_Function_Functions]
GO
ALTER TABLE [dbo].[Role_Function]  WITH CHECK ADD  CONSTRAINT [FK_Role_Function_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_Function] CHECK CONSTRAINT [FK_Role_Function_Roles]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_CategoryOfRoom] FOREIGN KEY([CateID])
REFERENCES [dbo].[CategoryOfRoom] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_CategoryOfRoom]
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
