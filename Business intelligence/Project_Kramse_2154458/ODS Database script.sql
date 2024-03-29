USE [master]
GO
/****** Object:  Database [Kramse_ODS_2154458]    Script Date: 30-3-2023 16:01:25 ******/
CREATE DATABASE [Kramse_ODS_2154458]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_ODS_2154458', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_ODS_2154458.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_ODS_2154458_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_ODS_2154458_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse_ODS_2154458] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_ODS_2154458].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_ODS_2154458] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_ODS_2154458] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_ODS_2154458', N'ON'
GO
ALTER DATABASE [Kramse_ODS_2154458] SET QUERY_STORE = OFF
GO
USE [Kramse_ODS_2154458]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 30-3-2023 16:01:26 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 30-3-2023 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[ConsignorId] [int] NOT NULL,
	[Discount] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Dim_Row_Consignor] [int] IDENTITY(1,1) NOT NULL,
	[Consignor] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dim_Consignor] PRIMARY KEY CLUSTERED 
(
	[Dim_Row_Consignor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 30-3-2023 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Container](
	[ContainerId] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Costs_Per_Mile_Km] [float] NULL,
	[RefrigerationFlag] [nvarchar](50) NULL,
	[Dim_Row_Container] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Container] PRIMARY KEY CLUSTERED 
(
	[Dim_Row_Container] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 30-3-2023 16:01:26 ******/
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
/****** Object:  Table [dbo].[Dim_Items]    Script Date: 30-3-2023 16:01:26 ******/
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
	[Dim_Row_Item] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Items] PRIMARY KEY CLUSTERED 
(
	[Dim_Row_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 30-3-2023 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[PortId] [int] NOT NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[D_Row_PortId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Port] PRIMARY KEY CLUSTERED 
(
	[D_Row_PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 30-3-2023 16:01:26 ******/
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
	[D_Row_ShipId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Sh_Max_TEU] [int] NULL,
	[Sh_Length] [int] NULL,
 CONSTRAINT [PK_Dim_Ship] PRIMARY KEY CLUSTERED 
(
	[D_Row_ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_VoyageRoutes]    Script Date: 30-3-2023 16:01:26 ******/
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
	[Sub_Route_Departport] [int] NULL,
	[Sub_Route_Arrivalport] [int] NULL,
	[Sub_Route_Name] [nvarchar](255) NULL,
	[Distance] [int] NULL,
	[Dim_Voyage_Row] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_VoyageRoutes_1] PRIMARY KEY CLUSTERED 
(
	[Dim_Voyage_Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Fuel_Consumption_Ships]    Script Date: 30-3-2023 16:01:26 ******/
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
	[ArrivalDateKey] [int] NOT NULL,
	[Fuel_Consumption_Voyage] [int] NULL,
	[Fuel_Consumption_Tonnage_Mile] [float] NULL,
	[Co2_Consumption_Voyage] [int] NULL,
	[Co2_Consumption_Tonnage_Mile] [float] NULL,
	[Days_On_Sea] [int] NULL,
 CONSTRAINT [PK_Fact_Fuel_Consumption_Ships] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC,
	[VoyageId] ASC,
	[DateId] ASC,
	[PortDepartureId] ASC,
	[PortArrivalId] ASC,
	[ArrivalDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Shipment_Operations]    Script Date: 30-3-2023 16:01:26 ******/
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
	[DiscountPerTonnage] [float] NULL,
	[TEU] [int] NULL,
	[NumberContainers] [int] NULL,
	[DeparturePort] [int] NOT NULL,
	[ArrivalPort] [int] NOT NULL,
	[Max_TEU] [int] NULL,
	[Total_Fuel_Consumption_Ton] [float] NULL,
	[Fuel_Consumption_Tonnage_Mile] [float] NULL,
	[DepartDateKey] [int] NOT NULL,
	[ArrivalDateKey] [int] NOT NULL,
	[Cargo_Load_Percentage] [int] NULL,
	[Cargo_Load_Factor] [numeric](18, 2) NULL,
	[ShipCost_Tonnage] [numeric](18, 2) NULL,
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
/****** Object:  Table [dbo].[Fact_Waiting_Time]    Script Date: 30-3-2023 16:01:26 ******/
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
	[Port_Stay_Costs] [numeric](18, 2) NULL,
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
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Items] ADD  CONSTRAINT [DF_Dim_Items_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Items] ADD  CONSTRAINT [DF_Dim_Items_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Port] ADD  CONSTRAINT [DF_Dim_Port_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Port] ADD  CONSTRAINT [DF_Dim_Port_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] ADD  CONSTRAINT [DF_Dim_VoyageRoutes_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] ADD  CONSTRAINT [DF_Dim_VoyageRoutes_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port] FOREIGN KEY([Sub_Route_Arrivalport])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port1] FOREIGN KEY([Sub_Route_Departport])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port1]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port2] FOREIGN KEY([DeparturePortId])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port2]
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port3] FOREIGN KEY([DestinationPortId])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Dim_VoyageRoutes] CHECK CONSTRAINT [FK_Dim_VoyageRoutes_Dim_Port3]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date1] FOREIGN KEY([ArrivalDateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Date1]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Ship1] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([D_Row_ShipId])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_Ship1]
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_VoyageRoutes] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Dim_VoyageRoutes] ([Dim_Voyage_Row])
GO
ALTER TABLE [dbo].[Fact_Fuel_Consumption_Ships] CHECK CONSTRAINT [FK_Fact_Fuel_Consumption_Ships_Dim_VoyageRoutes]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Consignor1] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Dim_Consignor] ([Dim_Row_Consignor])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Consignor1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Container1] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Dim_Container] ([Dim_Row_Container])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Container1]
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
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Items1] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Dim_Items] ([Dim_Row_Item])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Items1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port] FOREIGN KEY([DeparturePort])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port1] FOREIGN KEY([ArrivalPort])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Port1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Ship1] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([D_Row_ShipId])
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations] CHECK CONSTRAINT [FK_Fact_Revenue_Cost_Dim_Ship1]
GO
ALTER TABLE [dbo].[Fact_Shipment_Operations]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Revenue_Cost_Dim_VoyageRoutes] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Dim_VoyageRoutes] ([Dim_Voyage_Row])
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
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port2] FOREIGN KEY([PortArrival])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port2]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port3] FOREIGN KEY([PortDeparture])
REFERENCES [dbo].[Dim_Port] ([D_Row_PortId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Port3]
GO
ALTER TABLE [dbo].[Fact_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Waiting_Time_Dim_Ship1] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Dim_Ship] ([D_Row_ShipId])
GO
ALTER TABLE [dbo].[Fact_Waiting_Time] CHECK CONSTRAINT [FK_Fact_Waiting_Time_Dim_Ship1]
GO
USE [master]
GO
ALTER DATABASE [Kramse_ODS_2154458] SET  READ_WRITE 
GO
