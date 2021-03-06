USE [smartlife-120303]
GO
/****** Object:  StoredProcedure [dbo].[SP_DBA_MergeTempExcelSource]    Script Date: 03/26/2014 15:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure  [dbo].[SP_DBA_MergeTempExcelSource]
@tablename varchar(100)
as
begin
----------step 1
insert into temp_excelsource(oldmanid,oldmanname,IdNo)
select 
newid() oldmanid,
f1
,f4
from  dbo.Sheet41$ where LEN(f4)=18 or LEN(f4)=15

--------step 2 
update dbo.temp_excelsource
set gender=(case b.f2 when '男' then 'M' when '女' then 'F' else  'M' end)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4

---------step 3 
/* update dbo.temp_excelsource
set birthday=cast(SUBSTRING(b.f4,7,8) as datetime)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4 and len(b.f4)=18 and substring(b.f4,7,8)  like '19%' ;*/

 update dbo.temp_excelsource
set birthday=cast('19'+SUBSTRING(f4,7,6) as datetime)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4 and len(f4)=15;
 
  update dbo.temp_excelsource
set HealthInsuranceFlag=(case ISNULL(b.f6,'0') when '0' then 0 else 1 end)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set SocialInsuranceFlag=(case ISNULL(b.f7,'0') when '0' then 0 else 1 end)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set livingstate=(select itemid from Sys_DictionaryItem where dictionaryid='11001' and ItemName=b.f8)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

update dbo.Temp_excelsource
set  areaid='01191' ,status=1,checkintime=GETDATE(),DataSource='00003'
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set areaid2=(select areaid from Pub_Area where AreaName=b.f16)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set areaid3=(select areaid from Pub_Area where AreaName=b.f17)
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set address=b.f10
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set tel=cast(cast (b.f12 as bigint) as varchar(20))
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;

  update dbo.temp_excelsource
set mobile=cast(cast (b.f5 as bigint) as varchar(20))
from dbo.temp_excelsource a,dbo.Sheet41$ b
where a.idno=b.f4;


----------------------------- 删除重复记录中的一条
delete from Temp_ExcelSource 
where id in(
			select MAX(ID) id
			from Temp_ExcelSource
			group by OldManName,IDNo
			having COUNT(*)>1
           )
--------------------------------
------------------------------------=========end
END