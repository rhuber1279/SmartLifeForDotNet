USE [smartlife-120305]
GO
/****** Object:  StoredProcedure [dbo].[SP_Tol_UspOutputData]    Script Date: 04/08/2014 10:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------

--@存储过程：SP_Dey_OutputData导出表数据
alter PROCEDURE [dbo].[SP_Dey_OutputData] 
@tablename sysname 
AS 
declare @column varchar(1000) 
declare @columndata varchar(1000) 
declare @sql varchar(4000) 
declare @xtype tinyint 
declare @name sysname 
declare @objectId int 
declare @objectname sysname 
declare @ident int 

set nocount on 
set @objectId=object_id(@tablename) 

if @objectId is null -- 判斷對象是否存在 
begin 
		print 'The object not exists' 
		return 
end 
set @objectname=rtrim(object_name(@objectId)) 

if @objectname is null or charindex(@objectname,@tablename)=0 --此判断不严密 
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
where c.id=@objectid 
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
						+case when @xtype in(167,175) then '''''''''+'+@name+'+''''''''' --varchar,char 
						when @xtype in(231,239) then '''N''''''+'+@name+'+''''''''' --nvarchar,nchar 
						when @xtype=61 then '''''''''+convert(char(23),'+@name+',121)+''''''''' --datetime 
						when @xtype=58 then '''''''''+convert(char(16),'+@name+',120)+''''''''' --smalldatetime 
						when @xtype=36 then '''''''''+convert(char(36),'+@name+')+''''''''' --uniqueidentifier 
						when @xtype=48 then 'cast('+@name+' as varchar(10))' --int 
						when @xtype=52 then 'cast('+@name+' as varchar(10))' --int 
						when @xtype=56 then 'cast('+@name+' as varchar(30))' --int 
						when @xtype=104 then 'cast('+@name+' as varchar(1))' --bit
						else @name end 
				end 
		end 
		fetch next from syscolumns_cursor into @name,@xtype 
end 
close syscolumns_cursor 
deallocate syscolumns_cursor 

set @sql='set nocount on select ''insert '+@tablename+'('+@column+') values(''+'+@columndata+'+'')'' updateScript from '+@tablename 

print '--'+@sql 
exec(@sql) 

if @ident is not null 
print 'SET IDENTITY_INSERT '+@TableName+' OFF' 


exec SP_Dey_OutputData @tablename='Cfg_Bridge'

select 'insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values('as '--',VersionId,',',''''
+ObjectName+'''',',','N'''+UpdateScript+'''',',','N'''+RecoverScript+'''',',','N'''+UpdateValIdateScript+'''',',','N'''
+RecoverValIdateScript+'''',',','N'''+Type+'''',')' from Dey_Script


select 'insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values('+cast(VersionId as varchar(30))+','+''''
+ObjectName+''''+','+'N'''+UpdateScript+''''+','+'N'''+RecoverScript+''''+','+'N'''+UpdateValIdateScript+''''+','+'N'''
+RecoverValIdateScript+''''+','+'N'''+Type+''''+')' from Dey_Script


select 'insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values('+VersionId+','+''''+ObjectName
+''''+','+'N'''+UpdateScript+''''+','+'N'''+RecoverScript+''''+','+'N'''+UpdateValIdateScript+''''+','+
'N'''+RecoverValIdateScript+''''+','+'N'''+Type+''''+')' from Dey_Script


select 'insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values('++cast(VersionId as varchar(30))++','
+''''+ObjectName+''''+','+'N'''+UpdateScript+''''+','+'N'''+RecoverScript+''''+','+'N'''
+UpdateValIdateScript+''''+','+'N'''+RecoverValIdateScript+''''+','+'N'''+Type+''''+')' from Dey_Script

insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values(3,'Sys_Menu',N'delete from Sys_Menu;                                insert into Sys_Menu (CodeClass,CanFullScreenFlag,Description,ApplicationId,EndFlag,Levels,Status,SelectOnRefreshFlag,MenuId,MenuName,MenuCode,Picture,ParentId,PageUrl,OrderNo,OpenInFrameFlag) select CodeClass,CanFullScreenFlag,Description,ApplicationId,EndFlag,Levels,Status,SelectOnRefreshFlag,MenuId,MenuName,MenuCode,Picture,ParentId,PageUrl,OrderNo,OpenInFrameFlag  from [smartlife-120301].dbo.Sys_Menu;                ',N'delete from  dbo.Sys_Menu;',N'select COUNT(*) from Sys_Menu;',N'select COUNT(*) from Sys_Menu;',N'D')

insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values(3,'sp_helpdiagramdefinition',N'                              IF (EXISTS (SELECT *                                         FROM dbo.sysobjects                                          WHERE (Name = N'sp_helpdiagramdefinition')                                         AND (Type = 'P')))                              begin                                       drop procedure sp_helpdiagramdefinition;                              end                             CREATE PROCEDURE dbo.sp_helpdiagramdefinition   (    @diagramname  sysname,    @owner_id int = null      )   WITH EXECUTE AS N'dbo'   AS   BEGIN    set nocount on      declare @theId   int    declare @IsDbo   int    declare @DiagId  int    declare @UIDFound int       if(@diagramname is null)    begin     RAISERROR (N'E_INVALIDARG', 16, 1);     return -1    end       execute as caller;    select @theId = DATABASE_PRINCIPAL_ID();    select @IsDbo = IS_MEMBER(N'db_owner');    if(@owner_id is null)     select @owner_id = @theId;    revert;        select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;    if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))    begin     RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);     return -3    end      select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ;     return 0   END   ;                            print 'create procedure sp_helpdiagramdefinition.... '                             go                    ',N'drop procedure sp_helpdiagramdefinition;',N'select count(c.Name)  from sys.all_objects c where c.Name='sp_helpdiagramdefinition'',N'select count(d.Name)  from sys.all_objects d where d.Name='sp_helpdiagramdefinition'',N'P')

insert Dey_Script(VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValIdateScript,RecoverValIdateScript,Type) values(3,'Sys_MenuBehavior',N'delete from Sys_MenuBehavior;                                insert into Sys_MenuBehavior (MenuId,BehaviorCode) select MenuId,BehaviorCode  from [smartlife-120301].dbo.Sys_MenuBehavior;                ',N'delete from  dbo.Sys_MenuBehavior;',N'select COUNT(*) from Sys_MenuBehavior;',N'select COUNT(*) from Sys_MenuBehavior;',N'D')

select cast(issourcedb as varchar(1)) from cfg_bridge;

select * from sys.types;

insert Cfg_Bridge(City,NodeIp,DateTimes,NodeId,VersionId,DatabaseName,Port,IsSourceDb,LinkServerName,UserName,Pass) values(N'杭州西湖区','115.236.175.110','2014-03-21 14:34:18.353',1,1,'smartlife-120300','10017',1,'remote_dbo','dbo','345,336,343,345,320,336,373,263,261,260,257,')