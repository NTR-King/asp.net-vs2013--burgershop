USE [master]
GO
/****** Object:  Database [burgerDatabase]    Script Date: 3/5/2017 3:01:08 PM ******/
CREATE DATABASE [burgerDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'burgerDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER1\MSSQL\DATA\burgerDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'burgerDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER1\MSSQL\DATA\burgerDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [burgerDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [burgerDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [burgerDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [burgerDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [burgerDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [burgerDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [burgerDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [burgerDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [burgerDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [burgerDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [burgerDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [burgerDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [burgerDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [burgerDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [burgerDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [burgerDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [burgerDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [burgerDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [burgerDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [burgerDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [burgerDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [burgerDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [burgerDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [burgerDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [burgerDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [burgerDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [burgerDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [burgerDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [burgerDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [burgerDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [burgerDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'burgerDatabase', N'ON'
GO
ALTER DATABASE [burgerDatabase] SET QUERY_STORE = OFF
GO
USE [burgerDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [burgerDatabase]
GO
/****** Object:  Table [dbo].[burgers]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[burgers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[price] [decimal](18, 2) NULL,
	[imgurl] [text] NULL,
	[isfeatured] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_burgers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customburgers]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customburgers](
	[name] [varchar](50) NULL,
	[buns] [text] NULL,
	[cheese] [text] NULL,
	[patty] [text] NULL,
	[sides] [text] NULL,
	[id] [int] IDENTITY(1000000,100) NOT NULL,
 CONSTRAINT [PK_customburgers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customercontact]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customercontact](
	[email] [varchar](50) NULL,
	[feedback] [text] NULL,
	[date] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_customercontact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[delivery]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery](
	[orderlist] [text] NULL,
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[address] [text] NULL,
	[status] [text] NULL,
	[custname] [text] NULL,
	[contactnum] [text] NULL,
 CONSTRAINT [PK_delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discounts]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[code] [varchar](50) NOT NULL,
	[percentage] [decimal](18, 2) NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usercart]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usercart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[burgID] [int] NULL,
	[email] [varchar](50) NULL,
	[BurgPrice] [decimal](18, 2) NULL,
	[burgName] [varchar](50) NULL,
 CONSTRAINT [PK_usercart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userinfo](
	[email] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[addressline1] [text] NULL,
	[addressline2] [text] NULL,
	[password] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[isadmin] [int] NULL,
	[userid] [int] IDENTITY(1000,1) NOT NULL,
 CONSTRAINT [PK_userinfo] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[burgers] ON 

INSERT [dbo].[burgers] ([id], [name], [price], [imgurl], [isfeatured], [quantity]) VALUES (2, N'Bacon Cheeseburger', CAST(125.00 AS Decimal(18, 2)), N'img/bacon.png', 0, 20)
INSERT [dbo].[burgers] ([id], [name], [price], [imgurl], [isfeatured], [quantity]) VALUES (3, N'Double Cheeseburger', CAST(145.00 AS Decimal(18, 2)), N'img/doublecheeseburger.png', 0, 20)
INSERT [dbo].[burgers] ([id], [name], [price], [imgurl], [isfeatured], [quantity]) VALUES (5, N'Bacon & Cheese WHOPPER® Sandwich', CAST(199.00 AS Decimal(18, 2)), N'img/baconcheesewhooper.png', 1, 20)
INSERT [dbo].[burgers] ([id], [name], [price], [imgurl], [isfeatured], [quantity]) VALUES (6, N'DOUBLE WHOPPER® Sandwich', CAST(199.00 AS Decimal(18, 2)), N'img/doublewhooper.jpg', 1, 20)
SET IDENTITY_INSERT [dbo].[burgers] OFF
SET IDENTITY_INSERT [dbo].[customburgers] ON 

INSERT [dbo].[customburgers] ([name], [buns], [cheese], [patty], [sides], [id]) VALUES (N'rak na itu', N'Brioche Bun', N'American Cheese', N'100% Beef Patty', N'Bacon Cheddar Tots ', 1000000)
INSERT [dbo].[customburgers] ([name], [buns], [cheese], [patty], [sides], [id]) VALUES (N'boom punet', N'Brioche Bun', N'American Cheese', N'100% Beef Patty', N'Seasoned Fries', 1000100)
INSERT [dbo].[customburgers] ([name], [buns], [cheese], [patty], [sides], [id]) VALUES (N'', N'Brioche Bun', N'American Cheese', N'100% Beef Patty', N'Bacon Cheddar Tots ', 1000300)
INSERT [dbo].[customburgers] ([name], [buns], [cheese], [patty], [sides], [id]) VALUES (N'pudge', N'Brioche Bun', N'American Cheese', N'100% Beef Patty', N'Bacon Cheddar Tots ', 1000400)
SET IDENTITY_INSERT [dbo].[customburgers] OFF
SET IDENTITY_INSERT [dbo].[customercontact] ON 

INSERT [dbo].[customercontact] ([email], [feedback], [date], [id]) VALUES (N'emman', N'testing
asd', CAST(N'2017-03-03T23:54:57.547' AS DateTime), 1)
INSERT [dbo].[customercontact] ([email], [feedback], [date], [id]) VALUES (N'test', N'test', CAST(N'2017-03-03T23:55:42.957' AS DateTime), 2)
INSERT [dbo].[customercontact] ([email], [feedback], [date], [id]) VALUES (N'test', N'hello', CAST(N'2017-03-04T08:34:03.520' AS DateTime), 3)
INSERT [dbo].[customercontact] ([email], [feedback], [date], [id]) VALUES (N'emailmen', N'asd123', CAST(N'2017-03-04T08:38:28.000' AS DateTime), 7)
INSERT [dbo].[customercontact] ([email], [feedback], [date], [id]) VALUES (N'test', N'check', CAST(N'2017-03-04T08:41:29.703' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[customercontact] OFF
SET IDENTITY_INSERT [dbo].[delivery] ON 

INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - ?199.00<br/>pudge - ?220.00<br/><br/>Total Price: ? 419.00', 10003, N'wea fsf', N'I came', N'waw', N'7435')
INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - ?199.00<br/>pudge - ?220.00<br/><br/>Total Price: ? 419.00', 10004, N'as asd', N'In Queue', N'6234', N'523')
INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - P199.00<br/>pudge - P220.00<br/><br/>Total Price: P 419.00', 10005, N'235 213as', N'In Queue', N'jtr', N'asd2t')
INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - P199.00<br/>pudge - P220.00<br/><br/>Total Price: P 419.00', 10006, N'123a ', N'In Queue', N'wew', N'32312')
INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - P199.00<br/>pudge - P220.00<br/><br/>Total Price: P 419.00', 10007, N'asd 24sa', N'In Queue', N'weq42', N'2314')
INSERT [dbo].[delivery] ([orderlist], [id], [address], [status], [custname], [contactnum]) VALUES (N'Bacon King Sandwich - P199.00<br/>pudge - P220.00<br/><br/>Total Price: P 419.00', 10008, N'asd ', N'In Queue', N'asd', N'123')
SET IDENTITY_INSERT [dbo].[delivery] OFF
INSERT [dbo].[discounts] ([code], [percentage]) VALUES (N'PogiAko', CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[discounts] ([code], [percentage]) VALUES (N'redvelvet', CAST(10.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[userinfo] ON 

INSERT [dbo].[userinfo] ([email], [name], [addressline1], [addressline2], [password], [contact], [isadmin], [userid]) VALUES (N'pogi@gmail.com', N'Johnny Manuel', N'321-B Barangka Drive', N'Mandaluyong City', N'asd123', N'09496558298', 0, 1000)
INSERT [dbo].[userinfo] ([email], [name], [addressline1], [addressline2], [password], [contact], [isadmin], [userid]) VALUES (N'admin@admin.com', N'admin', N'null', N'null', N'asd123', N'149089025', 1, 1001)
SET IDENTITY_INSERT [dbo].[userinfo] OFF
ALTER TABLE [dbo].[burgers] ADD  CONSTRAINT [DF_burgers_isfeatured]  DEFAULT ((0)) FOR [isfeatured]
GO
ALTER TABLE [dbo].[burgers] ADD  CONSTRAINT [DF_burgers_quantity]  DEFAULT ((20)) FOR [quantity]
GO
ALTER TABLE [dbo].[customercontact] ADD  CONSTRAINT [DF_customercontact_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[delivery] ADD  CONSTRAINT [DF_delivery_status]  DEFAULT ('In Queue') FOR [status]
GO
ALTER TABLE [dbo].[userinfo] ADD  CONSTRAINT [DF_userinfo_isadmin]  DEFAULT ((0)) FOR [isadmin]
GO
/****** Object:  StoredProcedure [dbo].[AddBurger]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddBurger]
(@name text,
@price decimal,
@imgurl text,
@isfeatured int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into burgers (name,price,imgurl,isfeatured)
	values (@name,@price,@imgurl,@isfeatured)
END

GO
/****** Object:  StoredProcedure [dbo].[AddDiscount]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddDiscount]
(@code varchar(50), @percentage decimal)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into discounts (code, percentage)
	values (@code, @percentage);
END

GO
/****** Object:  StoredProcedure [dbo].[AddtoCart]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[AddtoCart]
(@email varchar(50),@burgID int, 
@burgName varchar(50), @burgPrice decimal,
@ret int output)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@@ROWCOUNT = 0)
	begin

		INSERT INTO usercart (email,burgID,burgName,burgPrice)
		VALUES (@email,@burgID,@burgName,@burgPrice)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
/****** Object:  StoredProcedure [dbo].[AddtoCustom]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddtoCustom]
(@name varchar(50),@buns text,@cheese text,@patty text,@sides text)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into customburgers (name, buns, cheese, patty, sides)
	values (@name,@buns,@cheese,@patty,@sides)

END

GO
/****** Object:  StoredProcedure [dbo].[AddtoCustomerContact]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddtoCustomerContact]
(@email varchar(50),
@feedback text)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		INSERT INTO customercontact (email, feedback)
		VALUES (@email,@feedback)
END

GO
/****** Object:  StoredProcedure [dbo].[AddtoDelivery]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddtoDelivery]
(@orderlist text, @address text,@custname text,@contactnum text,@ret int output)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


		INSERT INTO delivery (orderlist,address,custname,contactnum)
		VALUES (@orderlist,@address,@custname,@contactnum)
		select @ret = SCOPE_IDENTITY() 


END

GO
/****** Object:  StoredProcedure [dbo].[DeleteBurger]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteBurger]
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE from burgers where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCartUser]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCartUser]
(@email varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from usercart where email = @email;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustom]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustom] 
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from customburgers where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDiscounts]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[DeleteDiscounts]
(@code varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from discounts where code = @code
	
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteFromCart]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteFromCart] 
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	delete from usercart where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMessage]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMessage]
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE from customercontact where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteOrders]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOrders]
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from delivery where id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[registerUser]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registerUser]
(
@name varchar(50),
@email varchar(50),
@password varchar(50),
@addressline1 text,
@addressline2 text,
@contact varchar(50),
@ret int output
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
if(@@ROWCOUNT = 0)
	begin

		INSERT INTO [userinfo] (name,email,password,contact, addressline1, addressline2)
		VALUES (@name,@email,@password,@contact,@addressline1,@addressline2)
			set @ret=1;
	end
	else
		set @ret=0;

END

GO
/****** Object:  StoredProcedure [dbo].[SelectBurgerID]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBurgerID]
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from burgers where id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[SelectBurgers]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBurgers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from burgers
END

GO
/****** Object:  StoredProcedure [dbo].[SelectBurgerSearch]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBurgerSearch]
(@search varchar(50)) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from
	 burgers
	  where	   
	   name like '%' + @search + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SelectContact]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectContact]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from customercontact
END

GO
/****** Object:  StoredProcedure [dbo].[SelectCustom]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectCustom] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from customburgers
END

GO
/****** Object:  StoredProcedure [dbo].[SelectDelivery]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectDelivery]
(@id int)

AS
BEGIN

	select * from delivery where id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[SelectDiscount]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectDiscount]
(@code varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from discounts where code = @code;
END

GO
/****** Object:  StoredProcedure [dbo].[SelectDiscounts]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectDiscounts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		select * from discounts;
END

GO
/****** Object:  StoredProcedure [dbo].[SelectFeatured]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectFeatured]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from burgers where isfeatured=1
END

GO
/****** Object:  StoredProcedure [dbo].[selectLogin]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectLogin]
(@email varchar(50),
@password varchar(50),
@login int output)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		if ((select password from [userinfo] where email=@email) = @password)
	begin
		set @login = 1;
		select * from [userinfo] where email=@email;
	end
else
		set @login=0;
END

GO
/****** Object:  StoredProcedure [dbo].[SelectOrders]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectOrders]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from delivery
END

GO
/****** Object:  StoredProcedure [dbo].[SelectUserCart]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectUserCart]
(@email varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from usercart where email = @email
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateBurger]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBurger]
(
@id int,
@name text,
@price decimal,
@imgurl text,
@isfeatured int,
@quantity int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update burgers
		set
	name = @name,
	price = @price,
	imgurl = @imgurl,
	isfeatured = @isfeatured,
	quantity = @quantity
	where
	id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrders]    Script Date: 3/5/2017 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrders]
(@status text, @id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update delivery
	set
	status = @status
	where
	id = @id
END

GO
USE [master]
GO
ALTER DATABASE [burgerDatabase] SET  READ_WRITE 
GO
