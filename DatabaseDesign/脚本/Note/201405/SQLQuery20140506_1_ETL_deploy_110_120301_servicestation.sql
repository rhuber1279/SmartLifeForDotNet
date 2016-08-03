/*******************************************************************************/
/*  SP_DBA_ImportServiceStation                                                */
/*  �������ϻ���������                                                         */
/*ǰ�������� Temp_ServiceStation$ ��������    */
/*******************************************************************************/
create procedure [dbo].[SP_DBA_ImportServiceStation]
as
begin
------------------------------------------================================================begin
insert into Pub_ServiceStation (StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId)
select f1 StationName,f2 Address,f3 LinkMan,cast(cast (f4 as bigint) as varchar(15)) LinkManMobile,''  remark,newid() StationId,1 Status,
'00003' Stationtype,'00003' DataSource,'01189' AreaId
from Temp_ServiceStation$ where F1 not in (select stationName from Pub_ServiceStation);


 update Pub_ServiceStation set AreaId2=d.areaid2,AreaId3=d.areaid3
 from Pub_ServiceStation c , (select a.F1 stationname,
(select AreaId from pub_area where Levels=4 and areaname=a.F5) areaid2 ,
(select AreaId from pub_area where Levels=5 and areaname=a.F6+'����') areaid3 
--,[��ַ] address,[��ϵ��ʽ] mobile,[��������] areaid3,[����������] linkman
 from Temp_ServiceStation$ a)d
 where  c.AreaId3 is null and c.StationName=d.stationname;
END
---------------------------------===========================end

select * from Pub_Area;
select * from remote_dbo.[smartlife-120301].dbo.pub_area;
select * from Temp_ServiceStation$ where F1='���ϻ�������' and F2='��ַ';
--delete from Temp_ServiceStation$ where F1='���ϻ�������' and F2='��ַ';
exec SP_DBA_ImportServiceStation;

select * from Pub_ServiceStation;
--drop table Pub_ServiceStation ;

CREATE TABLE [dbo].[Pub_ServiceStation](
	[StationId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CheckInTime] [datetime] NOT NULL,
	[OperatedBy] [uniqueidentifier] NULL,
	[OperatedOn] [datetime] NULL,
	[StationCode] [varchar](30) NULL,
	[StationName] [nvarchar](30) NOT NULL,
	[StationType] [char](5) NOT NULL,
	[StationType2] [char](5) NULL,
	[DataSource] [char](5) NULL,
	[AreaId] [char](5) NULL,
	[AreaId2] [varchar](40) NULL,
	[AreaId3] [varchar](40) NULL,
	[Address] [nvarchar](200) NULL,
	[LongitudeS] [varchar](20) NULL,
	[LatitudeS] [varchar](20) NULL,
	[Hotline] [varchar](30) NULL,
	[Tel] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[Email] [varchar](200) NULL,
	[PostCode] [char](6) NULL,
	[LinkMan] [varchar](30) NULL,
	[LinkManMobile] [varchar](20) NULL,
	[Intro] [nvarchar](400) NULL,
	[Remark] [nvarchar](400) NULL,
	[InputCode1] [varchar](30) NULL,
	[InputCode2] [varchar](30) NULL,
 CONSTRAINT [PK_Pub_ServiceStation] PRIMARY KEY CLUSTERED 
(
	[StationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'StationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'¼��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'CheckInTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'OperatedBy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'OperatedOn'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'StationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'StationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'StationType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'StationType2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'DataSource'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ͻ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'AreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ֵ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'AreaId2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'AreaId3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ��ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ��ַ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'LongitudeS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ��ַγ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'LatitudeS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Hotline'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Tel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Email'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ�ʱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'PostCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ��ϵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'LinkMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ��ϵ���ֻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'LinkManMobile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����վ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Intro'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ƴ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'InputCode1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation', @level2type=N'COLUMN',@level2name=N'InputCode2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����_��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pub_ServiceStation'
GO

ALTER TABLE [dbo].[Pub_ServiceStation] ADD  CONSTRAINT [DF__Pub_Servi__Statu__71F1E3A2]  DEFAULT ('1') FOR [Status]
GO

ALTER TABLE [dbo].[Pub_ServiceStation] ADD  CONSTRAINT [DF__Pub_Servi__Check__72E607DB]  DEFAULT (getdate()) FOR [CheckInTime]
GO
