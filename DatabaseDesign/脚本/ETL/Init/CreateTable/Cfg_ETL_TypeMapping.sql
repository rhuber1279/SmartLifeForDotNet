USE [Leblue-Etl]
GO

/****** Object:  Table [dbo].[Cfg_ETL_TypeMapping]    Script Date: 05/20/2014 09:24:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cfg_ETL_TypeMapping](
	[SourceDataType] [varchar](100) NULL,
	[DestinationDataType] [varchar](100) NULL,
	[FromToDatabaseId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

