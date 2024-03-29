USE [master]
GO
/****** Object:  Database [Kramse_RDBS]    Script Date: 30-3-2023 16:07:02 ******/
CREATE DATABASE [Kramse_RDBS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_PSA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_PSA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_PSA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERDEV2021\MSSQL\DATA\Kramse_PSA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse_RDBS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_RDBS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_RDBS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_RDBS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_RDBS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_RDBS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_RDBS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_RDBS] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_RDBS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_RDBS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_RDBS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_RDBS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_RDBS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_RDBS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_RDBS', N'ON'
GO
ALTER DATABASE [Kramse_RDBS] SET QUERY_STORE = OFF
GO
USE [Kramse_RDBS]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_key] [int] NOT NULL,
	[item_category] [nvarchar](50) NULL,
	[item_storage_type] [nvarchar](50) NULL,
	[item_hazard_flag] [nvarchar](50) NULL,
	[item_description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[RefrigerationFlag] [nvarchar](50) NULL,
	[Cubes] [float] NULL,
	[EuroPricePerKm] [float] NULL,
	[EuroPricePerMile] [float] NULL,
 CONSTRAINT [PK_Container_v2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[ContainertypeId] [int] NOT NULL,
	[StartContainerNr] [nvarchar](10) NULL,
	[EndContainerNr] [nvarchar](10) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_ShipmentDetail] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC,
	[Item] ASC,
	[ContainertypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShipmentItem_Container]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[ShipmentItem_Container] as 
  SELECT ShipmentId,Item.item_category,  UPPER(Type) as 'containerType', UPPER(item_storage_type)as 'item_storage', ContainertypeId, RefrigerationFlag FROM ShipmentDetail 
  JOIN Container ON Container.Id = ShipmentDetail.ContainertypeId
  JOIN Item on Item.item_key = ShipmentDetail.Item
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [int] NOT NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Discount] [float] NULL,
	[Consignor] [nvarchar](100) NULL,
 CONSTRAINT [PK_Consignor$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emission]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emission](
	[IMO Number] [float] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Ship type] [nvarchar](50) NULL,
	[Total fuel consumption (m tonnes)] [float] NULL,
	[Total CO₂ emissions (m tonnes)] [float] NULL,
	[ShipId] [int] NULL,
	[Fuel_Consumption_Kg_Miles] [float] NULL,
	[Annual_Time_On_Sea_Hours] [int] NULL,
	[Annual_Co2_Consumptions] [float] NULL,
 CONSTRAINT [PK_Publication$] PRIMARY KEY CLUSTERED 
(
	[IMO Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[P_PortOrder] [int] NOT NULL,
	[VPS_PortId] [int] NOT NULL,
	[P_PortName] [nvarchar](50) NULL,
	[P_Country] [nvarchar](50) NULL,
	[P_DistanceFromOslo] [int] NULL,
	[P_DistanceFromPiraeus] [int] NULL,
 CONSTRAINT [PK_Port_1] PRIMARY KEY CLUSTERED 
(
	[VPS_PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NOT NULL,
	[Sh_Shipname] [nvarchar](50) NULL,
	[Sh_MaxTEU] [int] NULL,
	[Sh_SpeedInKnots] [int] NULL,
	[Sh_SpeedInKm_H] [int] NULL,
	[Sh_Yearcost] [money] NULL,
	[Sh_Length] [float] NULL,
	[Sh_Width] [float] NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[VS_Shipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] NOT NULL,
	[VoyageId] [int] NULL,
	[ConsignorId] [int] NULL,
	[PortIdFrom] [int] NULL,
	[PortIdTo] [int] NULL,
	[Distance] [int] NULL,
	[NumberContainers] [int] NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NOT NULL,
	[VS_ShipId] [int] NULL,
	[V_DateDepartVoyage] [datetime] NULL,
	[VPS_PortIdStart] [int] NULL,
	[V_PortIdEnd] [int] NULL,
 CONSTRAINT [PK_Voyage] PRIMARY KEY CLUSTERED 
(
	[VV_VoyageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 30-3-2023 16:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VV_VoyageId] [int] NOT NULL,
	[VP_PortIdCurrent] [int] NOT NULL,
	[Vp_PortIdNext] [int] NOT NULL,
	[Vp_LegDateDepart] [datetime] NULL,
	[Vp_LegDateArrival] [datetime] NULL,
	[Vp_Traject_Distance] [int] NULL,
 CONSTRAINT [PK_VoyagePort] PRIMARY KEY CLUSTERED 
(
	[VV_VoyageId] ASC,
	[VP_PortIdCurrent] ASC,
	[Vp_PortIdNext] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort Query]    Script Date: 30-3-2023 16:07:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort Query](
	[Vp_LegDateArrival] [datetime] NULL,
	[Vp_LegDateDepart] [datetime] NULL,
	[VV_VoyageId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Emission]  WITH CHECK ADD  CONSTRAINT [FK_Emission_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[Emission] CHECK CONSTRAINT [FK_Emission_Ship]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Consignor] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Consignor]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Voyage] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Voyage] ([VV_VoyageId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Voyage]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Container] FOREIGN KEY([ContainertypeId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Container]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Item] FOREIGN KEY([Item])
REFERENCES [dbo].[Item] ([item_key])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Item]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([ShipmentId])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Shipment]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port] FOREIGN KEY([VPS_PortIdStart])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port1] FOREIGN KEY([V_PortIdEnd])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port1]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Ship] FOREIGN KEY([VS_ShipId])
REFERENCES [dbo].[Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Ship]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port] FOREIGN KEY([Vp_PortIdNext])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port1] FOREIGN KEY([VP_PortIdCurrent])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port1]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Voyage] FOREIGN KEY([VV_VoyageId])
REFERENCES [dbo].[Voyage] ([VV_VoyageId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Voyage]
GO
ALTER TABLE [dbo].[VoyagePort Query]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort Query_Voyage] FOREIGN KEY([VV_VoyageId])
REFERENCES [dbo].[Voyage] ([VV_VoyageId])
GO
ALTER TABLE [dbo].[VoyagePort Query] CHECK CONSTRAINT [FK_VoyagePort Query_Voyage]
GO
USE [master]
GO
ALTER DATABASE [Kramse_RDBS] SET  READ_WRITE 
GO
