USE [smartlife-120303]
GO
/****** Object:  StoredProcedure [dbo].[SP_Dey_OutputData]    Script Date: 04/14/2014 18:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------

--@存储过程：SP_Dey_OutputData导出表数据
ALTER PROCEDURE [dbo].[SP_Dey_OutputData] 
@TableName sysname ,
@Where  varchar(max)=''--,
--@ResultScript nvarchar(max) output
AS 
declare @column varchar(1000) 
declare @columndata varchar(1000) 
declare @sql nvarchar(4000) 
declare @xtype tinyint 
declare @name sysname 
declare @objectId int 
declare @objectname sysname 
declare @ident int 
declare @ResultMessage nvarchar(max)
declare @TableScript Table(updatescript varchar(max),targetscript varchar(max))

set nocount on 
set @objectId=object_id(@Tablename) 

if @objectId is null -- 判斷對象是否存在 
begin 
		print 'The object not exists' 
		return 
end 
set @objectname=rtrim(object_name(@objectId)) 

if @objectname is null or charindex(@objectname,@Tablename)=0 --此判断不严密 
begin 
		print 'object not in current database' 
		return 
end 

if OBJECTPROPERTY(@objectId,'IsTable') < > 1 -- 判斷對象是否是table 
begin 
		print 'The object is not table' 
		return 
end 

select @ident=status&0x80 from syscolumns where id=@objectid and status&0x80=0x80 

if @ident is not null 
		print 'SET IDENTITY_INSERT '+@TableName+' ON' 

declare syscolumns_cursor cursor
for select c.name,c.xtype from syscolumns c 
where c.id=@objectid and c.name <>'id'
order by c.colid 

open syscolumns_cursor 
set @column='' 
set @columndata='' 

fetch next from syscolumns_cursor into @name,@xtype 
while @@fetch_status < >-1 
begin 
		if @@fetch_status < >-2 
		begin 
				if @xtype not in(189,34,35,99,98) and @name <>'Id' --timestamp不需处理，image,text,ntext,sql_variant 暂时不处理 
				begin 
						set @column=@column+case when len(@column)=0 then'' else ','end+@name 
						
						set @columndata=@columndata+case when len(@columndata)=0 then '' else '+'',''+'end 
						+case when @xtype in(167,175) then '''''''''+isnull('+@name+',''null'')+''''''''' --varchar,char 
						when @xtype in(231,239) then '''''''''+isnull('+@name+',''null'')+''''''''' --nvarchar,nchar 
						when @xtype=61 then '''''''''+isnull(convert(varchar(23),'+@name+',121),''null'')+''''''''' --datetime 
						when @xtype=58 then '''''''''+isnull(convert(varchar(16),'+@name+',120),''null'')+''''''''' --smalldatetime 
						when @xtype=36 then '''''''''+isnull(convert(varchar(40),'+@name+'),''null'')+''''''''' --uniqueidentifier 
						when @xtype=48 then 'isnull(cast('+@name+' as varchar(10)),''null'')' --int 
						when @xtype=52 then 'isnull(cast('+@name+' as varchar(10)),''null'')' --int 
						when @xtype=56 then 'isnull(cast('+@name+' as varchar(30)),''null'')' --int 
						when @xtype=104 then 'isnull(cast('+@name+' as varchar(1)),''null'')' --bit
						else 'isnull('+@name+',''null'')' end 
				end 
		end 
		fetch next from syscolumns_cursor into @name,@xtype 
end 
close syscolumns_cursor 
deallocate syscolumns_cursor 

/*set @sql=N'set nocount on select @ResultMessage = dbo.JoinStrEx(''insert '+@tablename+'('+@column+') values(''+'+@columndata+'+'')'','';'')  from '+@tablename +' '+@where

print '--'+@sql 
--exec(@sql) 

 exec sp_executesql @sql,N'@ResultMessage nvarchar(max) output',@ResultMessage output
	set  @ResultScript=replace(@ResultMessage,'''null''','null')*/
	
	set @sql=N'set nocount on select ''insert '+@tablename+'('+@column+') values(''+'+@columndata+'+'')'' updatescript,'''' targetscript  from '+@tablename +' '+@where

print '--'+@sql 
--exec(@sql) 

  insert into  @TableScript
 exec sp_executesql @sql
	--set  @ResultScript=replace(@ResultMessage,'''null''','null')
	update @TableScript set targetscript=replace(updatescript,'''null''','null')
	update @TableScript set targetscript=replace(updatescript,'''null ''','null')
   select * from @TableScript
if @ident is not null 
print 'SET IDENTITY_INSERT '+@TableName+' OFF' 

exec SP_Dey_OutputData @tablename='Oca_OldManBaseInfo',@Where=''

insert Oca_OldManBaseInfo(OldManId,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,OldManName,Gender,Birthday,IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,SocialInsuranceNumber,LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,LatitudeS,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2) values('E289445B-C0C2-44C5-ADCD-000065DA17A1','2014-01-13 16:38:26.660',1,null,null,'00003',N'未知号码(13486195776)','N',null,'999999999999999999',0,null,0,null,'null ','null ','01191','AAA01191-0001-0000-0000-000000000000',null,Nnull,'null)

'go

insert Oca_OldManBaseInfo(OldManId,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,OldManName,Gender,Birthday,IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,SocialInsuranceNumber,LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,LatitudeS,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2) values('E289445B-C0C2-44C5-ADCD-000065DA17A1','2014-01-13 16:38:26.660',1,'null','null','00003','未知号码(13486195776)','N','null','999999999999999999',0,'null',0,'null','null ','null ','01191','AAA01191-0001-0000-0000-000000000000','null','null','null')
insert Oca_OldManBaseInfo(OldManId,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,OldManName,Gender,Birthday,IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,SocialInsuranceNumber,LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,LatitudeS,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2) values('E289445B-C0C2-44C5-ADCD-000065DA17A1','2014-01-13 16:38:26.660',1,null,null,'00003','未知号码(13486195776)','N',null,'999999999999999999',0,null,0,null,'null ','null ','01191','AAA01191-0001-0000-0000-000000000000',null,null,null)