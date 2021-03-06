USE [smartlife-120303]
GO
/****** Object:  StoredProcedure [dbo].[SP_DBA_MergeTempExcelSource]    Script Date: 03/26/2014 15:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************/
/* SP_DBA_MergeTempExcelSource                                        */
/* 前提条件 ：temp_excelsource 存在                                   */
/* 参数 : @UpdateTableName 需要更新的表，@TableName 更新的数据来源表  */
/**********************************************************************/

ALTER procedure  [dbo].[SP_DBA_MergeTempExcelSource]
@TableName varchar(100),
@UpdateTableName varchar(100)
as
declare @sqlStr nvarchar(4000)
begin

----------step 1
set @sqlStr='insert into '+@UpdateTableName+'(oldmanid,oldmanname,IdNo)
select 
newid() oldmanid,
f1
,f4
from  dbo.'+@TableName+' where LEN(f4)=18 or LEN(f4)=15;'

exec sp_executesql @sqlStr
--------step 2 

set @sqlStr='update dbo.'+@UpdateTableName+'
set gender=(case b.f2 when ''男'' then ''M'' when ''女'' then ''F'' else  ''M'' end)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'

exec sp_executesql @sqlStr

---------step 3 
/* update dbo.'+@UpdateTableName+'
set birthday=cast(SUBSTRING(b.f4,7,8) as datetime)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4 and len(b.f4)=18 and substring(b.f4,7,8)  like '19%' ;*/

 /*update dbo.'+@UpdateTableName+'
set birthday=cast('19'+SUBSTRING(f4,7,6) as datetime)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4 and len(f4)=15;*/
 
 set @sqlStr=' update dbo.'+@UpdateTableName+'
set HealthInsuranceFlag=(case ISNULL(b.f6,''0'') when ''0'' then 0 else 1 end)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr


set @sqlStr='  update dbo.'+@UpdateTableName+'
set SocialInsuranceFlag=(case ISNULL(b.f7,''0'') when ''0'' then 0 else 1 end)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr


set @sqlStr='  update dbo.'+@UpdateTableName+'
set livingstate=(select itemid from Sys_DictionaryItem where dictionaryid=''11001'' and ItemName=b.f8)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr


set @sqlStr='update dbo.'+@UpdateTableName+'
set  areaid=''01191'' ,status=1,checkintime=GETDATE(),DataSource=''00003''
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr

 set @sqlStr=' update dbo.'+@UpdateTableName+'
set areaid2=(select areaid from Pub_Area where AreaName=b.f16)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr

 set @sqlStr=' update dbo.'+@UpdateTableName+'
set areaid3=(select areaid from Pub_Area where AreaName=b.f17)
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr

set @sqlStr='  update dbo.'+@UpdateTableName+'
set address=b.f10
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr

set @sqlStr='  update dbo.'+@UpdateTableName+'
set tel=cast(cast (b.f12 as bigint) as varchar(20))
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr

set @sqlStr='  update dbo.'+@UpdateTableName+'
set mobile=cast(cast (b.f5 as bigint) as varchar(20))
from dbo.'+@UpdateTableName+' a,dbo.'+@TableName+' b
where a.idno=b.f4;'
exec sp_executesql @sqlStr


----------------------------- 删除重复记录中的一条
set @sqlStr='delete from '+@UpdateTableName+' 
where id in(
			select MAX(ID) id
			from '+@UpdateTableName+'
			group by OldManName,IDNo
			having COUNT(*)>1
           )'
exec sp_executesql @sqlStr           
--------------------------------
------------------------------------=========end
END