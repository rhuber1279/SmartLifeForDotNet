--insert into Pub_ServiceStationOld0324
select * into  Pub_ServiceStationOld0324
from Pub_ServiceStation;

exec dbo.SP_DBA_ImportServiceStation

select * 
from  Pub_ServiceStation;


update Pub_ServiceStation set AreaId2=b.ParentId,AreaId3=b.AreaId
from Pub_ServiceStation a, Pub_Area b
where Address like '%������' and AreaId3 is null and b.AreaName=substring(stationname,1,CHARINDEX('����',stationname,1)+1);

update Pub_ServiceStation set AreaId2=b.ParentId,AreaId3=b.AreaId
from Pub_ServiceStation a, Pub_Area b
where Address like '%����' 
and AreaId3 is not null 
and b.AreaName=substring(Address,1,CHARINDEX('����',address,1)+1);