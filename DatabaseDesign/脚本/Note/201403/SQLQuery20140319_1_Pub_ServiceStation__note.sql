select StationName ,REPLACE(Address,'��','')
--StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId
from Pub_ServiceStation
where Address like '%������' and AreaId2 is null;


select * into Temp_ServiceStation$ 
from Sheet47$;

insert into Sheet47$
select *  
from Sheet43$;

insert into Sheet47$
select *  
from Sheet44$;

insert into Sheet47$
select *  
from Sheet45$;

delete from Sheet47$ where f1 is null;
insert into Sheet47$ (f1,f2,f3,f4,f5,f6,f7,f8,f9,f10)
select f1,f2,f3,f4,f6,f5,f7,f8,f9,f10
from Sheet46$  where f1 is not null;

select * from Sheet53$;

select * 
from Temp_ServiceStation$
update Sheet47$ set f10='���ϻ���'  where f10 is null;

select * into Temp_ServiceStationPatch$ 
from Sheet53$;

-----------------------------
select f2,f3,f8,f9,f10 
from Sheet47$;
delete from Pub_ServiceStation where len(Remark)>1;

select StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId
from Pub_ServiceStation
order by linkman
 where len(Remark)>1;

go
/*******************************************************************************/
/*  SP_DBA_ImportServiceStation                                                */
/*  �������ϻ���������                                                         */
/*ǰ�������� Temp_ServiceStation$ �� Temp_ServiceStationPatch$ �����������    */
/*******************************************************************************/
alter procedure SP_DBA_ImportServiceStation
as
begin
------------------------------------------================================================begin
insert into Pub_ServiceStation (StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId)
select f2 StationName,f3 Address,f8 LinkMan,cast(cast (f9 as bigint) as varchar(15)) LinkManMobile,f10  remark,newid() StationId,1 Status,
'00003' Stationtype,'00003' DataSource,'01191' AreaId
from Temp_ServiceStation$;

/*select StationName,substring(stationname,1,CHARINDEX('�ֵ�',stationname,1)+1) ,b.AreaId,a.Remark,a.areaid2
from Pub_ServiceStation a ,Pub_Area b
where CHARINDEX('�ֵ�',stationname,1)>0
and b.AreaName=substring(stationname,1,CHARINDEX('�ֵ�',stationname,1)+1)
;*/

update Pub_ServiceStation set AreaId2=b.AreaId
from Pub_ServiceStation a ,Pub_Area b
where CHARINDEX('�ֵ�',stationname,1)>0
and b.AreaName=substring(stationname,1,CHARINDEX('�ֵ�',stationname,1)+1)

/*select StationName,substring(stationname,1,CHARINDEX('��',stationname,1)-1) ,b.AreaId,a.Remark,a.areaid2
from Pub_ServiceStation a ,Pub_Area b
where CHARINDEX('��',stationname,1)>0
and b.AreaName=substring(stationname,1,CHARINDEX('��',stationname,1)-1)+'�ֵ�'
;*/

update Pub_ServiceStation set AreaId2=b.AreaId
from Pub_ServiceStation a ,Pub_Area b
where CHARINDEX('��',stationname,1)>0
and b.AreaName=substring(stationname,1,CHARINDEX('��',stationname,1)-1)+'�ֵ�';

/*select StationName ,REPLACE(Address,'��',''),b.AreaId,a.Remark,a.areaid2,
--StationName,Address,LinkMan,LinkManMobile,remark ,StationId,Status,Stationtype,DataSource,AreaId
from Pub_ServiceStation a, Pub_Area b
where Address like '%������' and AreaId2 is null and b.AreaName=substring(stationname,1,CHARINDEX('����',stationname,1)+1);
*/

update Pub_ServiceStation set AreaId2=b.ParentId,AreaId3=b.AreaId
from Pub_ServiceStation a, Pub_Area b
where Address like '%������' and AreaId3 is null and b.AreaName=substring(stationname,1,CHARINDEX('����',stationname,1)+1);

update Pub_ServiceStation set AreaId2=b.ParentId,AreaId3=b.AreaId
from Pub_ServiceStation a, Pub_Area b
where Address like '%����' 
and AreaId3 is not null 
and b.AreaName=substring(Address,1,CHARINDEX('����',address,1)+1);


update Pub_ServiceStation set  AreaId2=b.ParentId,AreaId3=b.AreaId
--select StationName ,b.AreaId,a.Remark,a.areaid2
from Pub_ServiceStation a ,Pub_Area b
where CHARINDEX('����',stationname,1)>0 and a.AreaId2 is null 
and b.AreaName=substring(stationname,1,CHARINDEX('����',stationname,1)+1);

update Pub_ServiceStation set  AreaId2=b.ParentId,AreaId3=b.AreaId
--select StationName ,b.AreaId,a.Remark,a.areaid2
from Pub_ServiceStation a ,Pub_Area b
where AreaId2 is  null and stationname like '����%'  and stationname not like '������%'
and b.AreaName=substring(stationname,CHARINDEX('����',stationname,1)+2,CHARINDEX('����',stationname,1)-1);

/*select c.*,d.*
from (
select StationName,Address,LinkMan,LinkManMobile ,areaid2,areaid3
 from Pub_ServiceStation where AreaId2 is null )c,
 (select [���ϻ�������] stationname,
(select AreaId from pub_area where Levels=4 and areaname=a.�����ֵ�) areaid2 ,
(select AreaId from pub_area where Levels=5 and areaname=a.��������) areaid3 
--,[��ַ] address,[��ϵ��ʽ] mobile,[��������] areaid3,[����������] linkman
 from Temp_ServiceStationPatch$ a)d
 where c.StationName=d.stationname
 */
 
 update Pub_ServiceStation set AreaId2=d.areaid2,AreaId3=d.areaid3
 from Pub_ServiceStation c , (select [���ϻ�������] stationname,
(select AreaId from pub_area where Levels=4 and areaname=a.�����ֵ�) areaid2 ,
(select AreaId from pub_area where Levels=5 and areaname=a.��������) areaid3 
--,[��ַ] address,[��ϵ��ʽ] mobile,[��������] areaid3,[����������] linkman
 from Temp_ServiceStationPatch$ a)d
 where  c.AreaId3 is null and c.StationName=d.stationname;
END
---------------------------------===========================end




select max(areacode) areacode,MAX(levels) levels,
max(endflag) endflag,max(orderno) orderno ,parentid
from Pub_Area 
group by parentid
where ParentId='AAA01191-0001-0000-0000-000000000000'

select (select areaid from Pub_Area where AreaName=f1) parentid,f2,
ROW_NUMBER() OVER(ORDER BY f1 aSC) AS id
 from dbo.pub_areapatch$
where f2 not in (select areaname from pub_area);

select * from Oca_OldManBaseInfo order by CheckInTime desc ;