USE [master]
GO
/****** Object:  Database [restoran]    Script Date: 30.11.2020. 18:53:11 ******/
CREATE DATABASE [restoran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restoran', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restoran.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restoran_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restoran_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [restoran] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restoran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restoran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restoran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restoran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restoran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restoran] SET ARITHABORT OFF 
GO
ALTER DATABASE [restoran] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restoran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restoran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restoran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restoran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restoran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restoran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restoran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restoran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restoran] SET  DISABLE_BROKER 
GO
ALTER DATABASE [restoran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restoran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restoran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restoran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restoran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restoran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restoran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restoran] SET RECOVERY FULL 
GO
ALTER DATABASE [restoran] SET  MULTI_USER 
GO
ALTER DATABASE [restoran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restoran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restoran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restoran] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restoran] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [restoran] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'restoran', N'ON'
GO
ALTER DATABASE [restoran] SET QUERY_STORE = OFF
GO
USE [restoran]
GO
/****** Object:  Table [dbo].[category]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[hire_date] [date] NOT NULL,
	[contract_number] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[manager_id] [int] NOT NULL,
	[job_title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [int] NOT NULL,
	[street_address] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
 CONSTRAINT [PK_locations] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[item_id] [int] NOT NULL,
	[item_name] [varchar](50) NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[menucol] [varchar](50) NOT NULL,
	[categories_category_id] [int] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu_has_order]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_has_order](
	[item_id] [int] NOT NULL,
	[order_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[table_number] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservations]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[reservation_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[table_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[restaurant_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[location] [int] NOT NULL,
	[number_of_employees] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[stock_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_has_menu]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_has_menu](
	[stock_id] [int] NOT NULL,
	[item_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table]    Script Date: 30.11.2020. 18:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table](
	[table_number] [int] NOT NULL,
	[availability] [varchar](50) NOT NULL,
	[number_of_seats] [int] NOT NULL,
	[table_id] [int] NULL,
 CONSTRAINT [PK_table] PRIMARY KEY CLUSTERED 
(
	[table_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_employees] FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_employees]
GO
ALTER TABLE [dbo].[menu_has_order]  WITH CHECK ADD  CONSTRAINT [FK_menu_has_order_menu] FOREIGN KEY([item_id])
REFERENCES [dbo].[menu] ([item_id])
GO
ALTER TABLE [dbo].[menu_has_order] CHECK CONSTRAINT [FK_menu_has_order_menu]
GO
ALTER TABLE [dbo].[menu_has_order]  WITH CHECK ADD  CONSTRAINT [FK_menu_has_order_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[menu_has_order] CHECK CONSTRAINT [FK_menu_has_order_order]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_employees]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_menu] FOREIGN KEY([item_id])
REFERENCES [dbo].[menu] ([item_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_menu]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_table] FOREIGN KEY([table_number])
REFERENCES [dbo].[table] ([table_number])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_table]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_customer1] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_customer1]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_employees]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_table] FOREIGN KEY([table_id])
REFERENCES [dbo].[table] ([table_number])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_table]
GO
ALTER TABLE [dbo].[restaurant]  WITH CHECK ADD  CONSTRAINT [FK_restaurant_locations] FOREIGN KEY([location])
REFERENCES [dbo].[locations] ([location_id])
GO
ALTER TABLE [dbo].[restaurant] CHECK CONSTRAINT [FK_restaurant_locations]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_menu] FOREIGN KEY([item_id])
REFERENCES [dbo].[menu] ([item_id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_menu]
GO
ALTER TABLE [dbo].[stock_has_menu]  WITH CHECK ADD  CONSTRAINT [FK_stock_has_menu_menu] FOREIGN KEY([item_id])
REFERENCES [dbo].[menu] ([item_id])
GO
ALTER TABLE [dbo].[stock_has_menu] CHECK CONSTRAINT [FK_stock_has_menu_menu]
GO
ALTER TABLE [dbo].[stock_has_menu]  WITH CHECK ADD  CONSTRAINT [FK_stock_has_menu_stock] FOREIGN KEY([stock_id])
REFERENCES [dbo].[stock] ([stock_id])
GO
ALTER TABLE [dbo].[stock_has_menu] CHECK CONSTRAINT [FK_stock_has_menu_stock]
GO
USE [master]
GO
ALTER DATABASE [restoran] SET  READ_WRITE 
GO
