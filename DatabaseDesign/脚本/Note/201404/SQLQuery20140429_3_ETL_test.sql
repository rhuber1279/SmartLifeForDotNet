USE [Leblue-Etl]
GO
/****** Object:  StoredProcedure [dbo].[SP_ETL_DataStreamTask]    Script Date: 04/29/2014 09:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SP_ETL_DataStreamTask]
as 
begin
exec SP_ETL_ExpData @tablename='[Smartlife-1203].dbo.Bas_ResidentBaseInfo'
exec sp_etl_setmapexpression
exec SP_ETL_Table @sourcetabname='Bas_ResidentBaseInfostep1',@desttabname='Bas_ResidentBaseInfoStep2',@sourcejoincolname='ResidentId',@destjoincolname='OldManId'
exec SP_ETL_ImpData @tableName='Bas_ResidentBaseInfoStep2'
end


exec SP_ETL_ExpData @tablename='[Smartlife-120303].dbo.Oca_CallService'
exec sp_etl_setmapexpression
exec SP_ETL_Table @sourcetabname='Oca_CallServicestep1',@desttabname='Oca_CallServiceStep2',@sourcejoincolname='CallServiceId',@destjoincolname='CallServiceId'
exec SP_ETL_ImpData @tableName='Oca_CallServiceStep2'


exec SP_ETL_ExpData @tablename='[Smartlife-120301].dbo.Oca_ServiceWorkOrder'
exec sp_etl_setmapexpression
exec SP_ETL_Table @sourcetabname='Oca_ServiceWorkOrderstep1',@desttabname='Oca_ServiceWorkOrderStep2',@sourcejoincolname='WorkOrderId',@destjoincolname='WorkOrderId'
exec SP_ETL_ImpData @tableName='Oca_ServiceWorkOrderStep2'

insert into remote_109.[WeiXin-12].dbo.Oca_CallService
select * from Oca_CallServiceStep2

insert into remote_109.[WeiXin-12].dbo.Oca_ServiceWorkOrder
select * from Oca_ServiceWorkOrderStep2

select * from remote_109.[WeiXin-12].dbo.Oca_ServiceWorkOrder

select * from sys.tables

select oldmanid from dbo.oca_callserivce;

insert into oca_oldman(OldManId,Name,IDNo,Gender,CheckInTime,Status,Mobile,Remark)
select OldManId,OldManName,IDNo,Gender,CheckInTime,Status,Mobile,Remark
 from remote_dbo.[smartlife-120301].dbo.oca_oldmanbaseinfo;
 
 insert into remote_109.[WeiXin-12].dbo.Oca_OldMan
 select * from Oca_OldMan;


