USE [smartlife-120399]
GO
/****** Object:  StoredProcedure [dbo].[sp_dba_times_stat_for_hour]    Script Date: 03/07/2014 10:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_dba_times_stat_for_hour] 
as 
declare @str_sql nvarchar(3000)
set @str_sql='select datename(HH,dateadd(MI,-5*item,getdate()))+'':''+cast(datename(MI,dateadd(MI,-5*item,getdate()))-datename(MI,dateadd(MI,-5*item,getdate()))%5 as nvarchar(32))
 +''-''+datename(HH,dateadd(MI,-5*item,getdate()))+'':''+cast(datename(MI,dateadd(MI,-5*item,getdate()))-datename(MI,dateadd(MI,-5*item,getdate()))%5+5 as nvarchar(32))  items,ceiling(ratio*(select value'+cast(DATENAME(hh,dateadd(HH,-1,getdate()))+1 as nvarchar(32))+' from oca_call_service_stat_report where 
 convert(varchar(10),dates,120)=convert(varchar(10),dateadd(HH,-1,getdate()),120))) times
from ratio where item between DATENAME(mi,getdate())/5+1 and 11
union 
select datename(HH,dateadd(MI,-5*item,getdate()))+'':''+cast(datename(MI,dateadd(MI,-5*item,getdate()))-datename(MI,dateadd(MI,-5*item,getdate()))%5 as nvarchar(32))
 +''-''+datename(HH,dateadd(MI,-5*item,getdate()))+'':''+cast(datename(MI,dateadd(MI,-5*item,getdate()))-datename(MI,dateadd(MI,-5*item,getdate()))%5+5 as nvarchar(32))  items,ceiling(ratio*(  select value'+cast(DATENAME(HH,getdate())+1 as nvarchar(32)) +' from oca_call_service_stat_report where 
 convert(varchar(10),dates,120)=convert(varchar(10),getdate(),120))) times
from ratio where item between 0 and DATENAME(mi,getdate())/5 ;'
--select @str_sql
exec sp_executesql @str_sql

-------------------------------=============================
declare @dateStr datetime
set @dateStr=dateadd(HH,-246,getdate())
--select @dateStr,dateadd(HH,-1,@dateStr)
select 
datename(HH,dateadd(MI,-5*item,@dateStr))+':'+cast(datename(MI,dateadd(MI,-5*item,@dateStr))-datename(MI,dateadd(MI,-5*item,@dateStr))%5 as nvarchar(32))
 +'-'+datename(HH,dateadd(MI,-5*item,@dateStr))+':'+cast(datename(MI,dateadd(MI,-5*item,@dateStr))-datename(MI,dateadd(MI,-5*item,@dateStr))%5+5 as nvarchar(32)) items,times
from 
(
select b.id item,isnull(a.times,0) times
from (
select datename(mi,checkintime)/5 item,COUNT(*) times from dbo.Oca_CallService 
where 
--datename(hh,CheckInTime)=2 and DATENAME(day,checkintime)=25
--convert(varchar(10),CheckInTime,120)=convert(varchar(10),@dateStr,120)
--and datename(hh,CheckInTime)=DATENAME(hh,@dateStr)
checkintime between dateadd(HH,-1,@dateStr) and @dateStr
group by datename(mi,checkintime)/5) a right join 
(select  top 12 ROW_NUMBER() OVER(ORDER BY id aSC)-1 AS id from Oca_CallService) b on 
a.item=b.id )  aa
where item between DATENAME(mi,@dateStr)/5+1 and 11
union
select 
datename(HH,dateadd(MI,-5*item,@dateStr))+':'+cast(datename(MI,dateadd(MI,-5*item,@dateStr))-datename(MI,dateadd(MI,-5*item,@dateStr))%5 as nvarchar(32))
 +'-'+datename(HH,dateadd(MI,-5*item,@dateStr))+':'+cast(datename(MI,dateadd(MI,-5*item,@dateStr))-datename(MI,dateadd(MI,-5*item,@dateStr))%5+5 as nvarchar(32))
items,times
from 
(
select b.id item,isnull(a.times,0) times
from (
select datename(mi,checkintime)/5 item,COUNT(*) times from dbo.Oca_CallService 
where 
--datename(hh,CheckInTime)=2 and DATENAME(day,checkintime)=25
--convert(varchar(10),CheckInTime,120)=convert(varchar(10),@dateStr,120)
--and datename(hh,CheckInTime)=DATENAME(hh,@dateStr)
checkintime between dateadd(HH,-1,@dateStr) and @dateStr
group by datename(mi,checkintime)/5) a right join 
(select  top 12 ROW_NUMBER() OVER(ORDER BY id aSC)-1 AS id from Oca_CallService) b on 
a.item=b.id )  bb
where item between 0 and DATENAME(mi,getdate())/5  
;

select MONTH(getdate())

------生成 0-11的系列。
select  top 12 ROW_NUMBER() OVER(ORDER BY id aSC)-1 AS id from Oca_CallService;

exec dbo.SP_DBA_TimesStatForHour getdate() @dateStr='2014-02-25 03:02:50'
convert(varchar(20),getdate(),120)
dateadd('HH',-246,getdate())
