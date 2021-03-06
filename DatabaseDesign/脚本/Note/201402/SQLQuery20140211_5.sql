USE [SmartLife-120301]
GO
/****** Object:  StoredProcedure [dbo].[SP_Oca_RefreshOldmanLocate]    Script Date: 02/11/2014 14:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SP_Oca_RefreshOldmanLocate]
 AS
 BEGIN
SET NOCOUNT ON
 
DECLARE  @id nvarchar(50)
 
DECLARE id_cursor CURSOR FOR 
select ID from dbo.Oca_OldManBaseInfo where  OldManId in (select b.OldManId from oca_oldmanconfiginfo b where  b.LocateFlag=1) order by id;
 
OPEN id_cursor
 
FETCH NEXT FROM id_cursor 
INTO  @id
 
WHILE @@FETCH_STATUS = 0
 BEGIN
 
insert into dbo.Oca_OldManLocateInfo  (oldmanid,homelongitudeS,homelatitudes,locatetime,locatelongitudeS,locatelatitudes)
select oldmanid ,120.18246899999997 homelongitudeS,30.234391 homelatitudes,getdate() locatetime,
(select cast(a.aa as varchar(32))+cast(a.aa*1000000000-CAST(a.aa*1000 as bigint)*1000000 as varchar(32)) locatelongitudeS
from (select round((select top 1 LocateLongitudeS from dbo.Oca_OldManLocateInfo  where 
 checkintime in(select top 30 checkintime from dbo.Oca_OldManLocateInfo 
 order by checkintime desc) and OldManId =(select OldManId from dbo.Oca_OldManBaseInfo where ID=@id))+(RAND(right(SYSDATETIME(),7))-0.25*(@id-@id/4*4))*0.001,9) aa) a
) locatelongitudeS,
(select cast(b.bb as varchar(32))+cast(b.bb*1000000000-CAST(b.bb*1000 as bigint)*1000000 as varchar(32)) locatelatitudes
from (select round((select top 1 LocateLatitudeS from dbo.Oca_OldManLocateInfo  where 
 checkintime in(select top 30 checkintime from dbo.Oca_OldManLocateInfo 
 order by checkintime desc) and OldManId =(select OldManId from dbo.Oca_OldManBaseInfo where ID=@id))+(RAND(right(SYSDATETIME(),7))-0.25*(@id-@id/4*4))*0.001,9) bb) b
) locatelatitudes 
from dbo.oca_oldmanbaseinfo where ID=@id 
and cast(DATENAME(HH,GETDATE()) as int)< 22 and cast(DATENAME(HH,GETDATE()) as int)>7;
    
     FETCH NEXT FROM id_cursor 
    INTO  @id
 END 
CLOSE id_cursor
 DEALLOCATE id_cursor
 
insert into dbo.Oca_OldManLocateInfo (oldmanid,homelongitudeS,homelatitudes,locatetime,locatelongitudeS,locatelatitudes)
select  OldManId,  homelongitudeS,HomeLatitudeS,GETDATE() locatetime,LocateLongitudeS,LocateLatitudeS
 from dbo.Oca_OldManLocateInfo 
 where 
 (cast(DATENAME(HH,GETDATE()) as int)> 22 or cast(DATENAME(HH,GETDATE()) as int)<7 ) and 
 cast(DATENAME(HH,checkintime) as int)= 22 and CheckInTime > dateadd(day,-1,GETDATE()) and cast(DATENAME(n,checkintime) as int)= 0
 
 insert into dbo.Pub_Reminder(sourcetable,sourcecolumn,sourcekey,sourcetype,remindtime,remindcontent)
select 'Oca_OldManConfigInfo' sourcetable, 'OldManId' sourcecolumn,c.OldManId sourcekey,'004' sourcetype,c.LocateTime remindtime,'围栏报警' remindcontent from (
select sqrt(power((cast(a.locatelongitudes as float)-cast(a.homelongitudes as float))*111.111,2)+
power((cast(a.locatelatitudes as float)-cast(a.homelatitudes as float))*111.111,2)) *1000-b.FenceRadius  isAlert,a.OldManId,a.LocateTime
 from dbo.Oca_OldManLocateInfo a ,dbo.Oca_OldManConfigInfo b
 where a.OldManId=b.OldManId and b.LocateFlag=1 and a.LocateTime>(select MAX(CheckInTime) from Pub_Reminder) ) c
 where c.isAlert>0;
 
 END