USE [master]
GO
/****** Object:  Database [Kramse_Staging_Area]    Script Date: 30-3-2023 16:00:36 ******/
CREATE DATABASE [Kramse_Staging_Area]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_Staging_Area', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_Staging_Area.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_Staging_Area_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_Staging_Area_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse_Staging_Area] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_Staging_Area].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_Staging_Area] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_Staging_Area] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_Staging_Area] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_Staging_Area] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_Staging_Area] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_Staging_Area] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_Staging_Area] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_Staging_Area] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_Staging_Area] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_Staging_Area] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_Staging_Area] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_Staging_Area] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_Staging_Area', N'ON'
GO
ALTER DATABASE [Kramse_Staging_Area] SET QUERY_STORE = OFF
GO
USE [Kramse_Staging_Area]
GO
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[ConsignorId] [int] NOT NULL,
	[Discount] [float] NULL,
	[Consignor] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dim_Consignor] PRIMARY KEY CLUSTERED 
(
	[ConsignorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Container](
	[ContainerId] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Costs_Per_Mile_Km] [float] NULL,
	[RefrigerationFlag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Container] PRIMARY KEY CLUSTERED 
(
	[ContainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[Year] [int] NOT NULL,
	[Season] [nvarchar](20) NULL,
 CONSTRAINT [PK__Dim_Date__40DF45E3D0D43D26] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Items]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Items](
	[ItemId] [int] NOT NULL,
	[Item_Storage] [nvarchar](50) NULL,
	[Item_Catagory] [nvarchar](50) NULL,
	[Item_Description] [nvarchar](50) NULL,
	[Item_Hazard_level] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[PortId] [int] NOT NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Port] PRIMARY KEY CLUSTERED 
(
	[PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ship](
	[ShipId] [int] NOT NULL,
	[Sh_Name] [nvarchar](50) NULL,
	[Sh_Yearly_Costs] [float] NULL,
	[Sh_ShipType] [nvarchar](50) NULL,
	[Sh_Co2Emissions] [float] NULL,
	[SpeedKnots] [int] NULL,
	[Sh_MaxTEU] [int] NULL,
	[Sh_Lenght] [int] NULL,
 CONSTRAINT [PK_Dim_Ship] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_VoyageRoutes]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_VoyageRoutes](
	[VoyageId] [int] NOT NULL,
	[DeparturePortName] [nvarchar](50) NULL,
	[DestinationPortName] [nvarchar](50) NULL,
	[DeparturePortId] [int] NOT NULL,
	[DestinationPortId] [int] NOT NULL,
	[Main_Route_Name] [nvarchar](255) NULL,
	[Sub_DeparturePortId] [int] NOT NULL,
	[Sub_ArrivalPortId] [int] NOT NULL,
	[Sub_Route_Name] [nvarchar](255) NULL,
	[Distance] [int] NULL,
 CONSTRAINT [PK_Dim_VoyageRoutes] PRIMARY KEY CLUSTERED 
(
	[VoyageId] ASC,
	[Sub_DeparturePortId] ASC,
	[Sub_ArrivalPortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Fuel_Consumption_Ships]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Fuel_Consumption_Ships](
	[ShipId] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[Annual Emissions(Co2)] [float] NULL,
	[PortDepartureId] [int] NOT NULL,
	[PortArrivalId] [int] NOT NULL,
	[Distance] [int] NULL,
	[ShipSpeedKnots] [float] NULL,
	[ArrivalDateKey] [int] NULL,
	[Fuel_Consumption_Voyage] [int] NULL,
	[Fuel_Consumption_Tonnage_Mile] [float] NULL,
	[Co2_Consumption_Tonnage_Mile] [float] NULL,
	[Co2_Consumption_Voyage] [int] NULL,
	[Days_On_Sea] [int] NULL,
 CONSTRAINT [PK_Fact_Fuel_Consumption_Ships] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC,
	[VoyageId] ASC,
	[DateId] ASC,
	[PortDepartureId] ASC,
	[PortArrivalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Shipment_Operations]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Shipment_Operations](
	[ShipmentId] [int] NOT NULL,
	[ContainerId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ConsignorId] [int] NOT NULL,
	[ShipId] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[Revenue] [float] NULL,
	[DiscountPercentage] [float] NULL,
	[DiscountPrice] [float] NULL,
	[Gross_Profit] [float] NULL,
	[PricePerMile] [float] NULL,
	[Discount_Tonnage] [numeric](18, 2) NULL,
	[TEU] [int] NULL,
	[NumberContainers] [int] NULL,
	[DeparturePort] [int] NOT NULL,
	[ArrivalPort] [int] NOT NULL,
	[Max_TEU] [int] NULL,
	[Total_Fuel_Consumption_Ton] [int] NULL,
	[Fuel_Consumption_Tonnage_Mile] [float] NULL,
	[DepartDateKey] [int] NOT NULL,
	[ArrivalDateKey] [int] NOT NULL,
	[Cargo_Load_Percentage] [int] NULL,
	[Cargo_Load_Factor] [numeric](18, 2) NULL,
	[Sh_Cost_Tonnage] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Fact_Revenue_Cost] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC,
	[ContainerId] ASC,
	[ItemId] ASC,
	[ConsignorId] ASC,
	[ShipId] ASC,
	[VoyageId] ASC,
	[DeparturePort] ASC,
	[ArrivalPort] ASC,
	[DepartDateKey] ASC,
	[ArrivalDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Waiting_Time]    Script Date: 30-3-2023 16:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Waiting_Time](
	[WaitingTime (days)] [float] NULL,
	[ShipId] [int] NOT NULL,
	[PortArrival] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[ArrivalDateId] [int] NOT NULL,
	[DepartureDateId] [int] NOT NULL,
	[PortDeparture] [int] NOT NULL,
	[Port_Stay_Costs] [money] NULL,
 CONSTRAINT [PK_Fact_Waiting_Time] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC,
	[PortArrival] ASC,
	[VoyageId] ASC,
	[ArrivalDateId] ASC,
	[DepartureDateId] ASC,
	[PortDeparture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port] FOREIGN KEY([Sub_ArrivalPortId])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port1] FOREIGN KEY([Sub_DeparturePortId])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port1]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port2] FOREIGN KEY([DestinationPortId])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port2]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port3] FOREIGN KEY([DeparturePortId])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port3]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([ShipId])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Ship]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_VoyageRoutes] FOREIGN KEY([VoyageId], [PortDepartureId], [PortArrivalId])
REFERENCES [dbo].[Dim_VoyageRoutes] ([VoyageId], [Sub_DeparturePortId], [Sub_ArrivalPortId])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_VoyageRoutes]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Dim_Consignor] ([ConsignorId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Consignor]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Dim_Container] ([ContainerId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Container]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Date] FOREIGN KEY([DepartDateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Date1] FOREIGN KEY([ArrivalDateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Date1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Dim_Items] ([ItemId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Items]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port] FOREIGN KEY([ArrivalPort])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port1] FOREIGN KEY([DeparturePort])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([ShipId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Ship]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_VoyageRoutes] FOREIGN KEY([VoyageId], [DeparturePort], [ArrivalPort])
REFERENCES [dbo].[Dim_VoyageRoutes] ([VoyageId], [Sub_DeparturePortId], [Sub_ArrivalPortId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_VoyageRoutes]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Date] FOREIGN KEY([ArrivalDateId])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Date1] FOREIGN KEY([DepartureDateId])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Date1]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port] FOREIGN KEY([PortArrival])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port1] FOREIGN KEY([PortDeparture])
REFERENCES [dbo].[Dim_Port] ([PortId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port1]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([ShipId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Ship]
GO
USE [master]
GO
ALTER DATABASE [Kramse_Staging_Area] SET  READ_WRITE 
GO
