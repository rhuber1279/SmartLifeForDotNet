/*******************************************************************************/
/*  SP_DBA_ImportServiceStation                                                */
/*  �������ϻ���������                                                         */
/*ǰ�������� Temp_ServiceStation$ �� Temp_ServiceStationPatch$ �����������    */
/*******************************************************************************/
create procedure [dbo].[SP_DBA_ImportServiceStation]
as
begin
------------------------------------------================================================begin
insert into Pub_ServiceStation (id,StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId)
select ROW_NUMBER() OVER(ORDER BY f1 aSC) AS id
,f1 StationName,f2 Address,f3 LinkMan,cast(cast (f4 as bigint) as varchar(15)) LinkManMobile,'0'  remark,newid() StationId,1 Status,
'00003' Stationtype,'00003' DataSource,'01192' AreaId
from Temp_ServiceStation$ where f1 is not null;

 
 update Pub_ServiceStation set AreaId2=d.areaid2,AreaId3=d.areaid3
 from Pub_ServiceStation c , (select a.F1 stationname,
(select AreaId from pub_area where Levels=4 and areaname=a.f5) areaid2 ,
(select AreaId from pub_area where Levels=5 and areaname=a.f6) areaid3 
--,[��ַ] address,[��ϵ��ʽ] mobile,[��������] areaid3,[����������] linkman
 from Temp_ServiceStation$ a)d
 where  c.AreaId3 is null and c.StationName=d.stationname;
END
---------------------------------===========================end

select * from Temp_ServiceStation$;
select * from Pub_ServiceStation;

select * into Pub_ServiceStationOld0331
from Pub_ServiceStation;

exec SP_DBA_ImportServiceStation