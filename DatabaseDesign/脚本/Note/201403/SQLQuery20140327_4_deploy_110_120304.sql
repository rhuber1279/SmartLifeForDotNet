USE [Leblue-Configuration]
GO
/****** Object:  StoredProcedure [dbo].[SP_Dey_CreateTableScript]    Script Date: 03/27/2014 09:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SP_Dey_CreateTableScript]
@sync_type  char(1)='2'
 AS
 BEGIN
SET NOCOUNT ON
 
PRINT 'sync_type:'+@sync_type
DECLARE  @table_name nvarchar(50),@ProcessTrackingTableName varchar(4000),@primarykey varchar(4000)
 
PRINT '-------- make create table script --------'
set @ProcessTrackingTableName=''
set @primarykey=''
 
DECLARE create_table_cursor CURSOR FOR 
select name from remote_dbo.[smartlife-120300].sys.tables where name not in (select name from remote_dbo.[smartlife-120395].sys.tables ) and is_ms_shipped=0 and name not in(select TableName from Cfg_Object where ObjectType='table' and ChangeType='not');
---select name from $(source_db_name).sys.tables order by name desc ;
 
OPEN create_table_cursor
 
FETCH NEXT FROM create_table_cursor 
INTO  @table_name
 
WHILE @@FETCH_STATUS = 0
     BEGIN
    
         set @ProcessTrackingTableName=''
        select @ProcessTrackingTableName =@ProcessTrackingTableName+ b.columname+'' 
        from 
        ( 
           select a.ordinal_position,a.table_schema+'.'+a.table_name as tablename,a.column_name+' '+a.data_type+
           case a.DATA_TYPE when 'varchar' then replace('('+CAST (a.character_octet_length as nvarchar(32))+')','-1','max')
	                    when 'varbinary' then replace('('+CAST (a.character_octet_length as nvarchar(32))+')','-1','max')
                            when 'char' then '('+CAST (a.character_octet_length as nvarchar(32))+')'
                            when 'nvarchar' then  '('+replace(left(cast(a.CHARACTER_OCTET_LENGTH/2 as nvarchar(32)),1),'0','max')+
           SUBSTRING(cast(a.CHARACTER_OCTET_LENGTH/2 as nvarchar(32)),2,LEN(cast(a.CHARACTER_OCTET_LENGTH/2 as nvarchar(32))))+')' else '' end +
          ' ' +case a.is_nullable when 'NO' then ' not null' when 'YES' then ' null' else '' end +' '+case  when d.COLUMN_NAME IS NULL then '' 
          else '  identity (1,1) ' end +',' as columname
          from (select * from remote_dbo.[smartlife-120300].INFORMATION_SCHEMA.COLUMNS where table_name = @table_name
         ) a 
        left join (
             -- select constraint_schema, table_name,column_name from $(source_db_name).INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
             -- where upper(constraint_name) like 'PK%' 

	       select user_name() constraint_schema,a.name table_name,b.name column_name
              from remote_dbo.[smartlife-120300].sys.tables  a,
	           remote_dbo.[smartlife-120300].sys.identity_columns b
               where a.object_id =b.object_id
          )d
         on  a.TABLE_SCHEMA = d.constraint_schema   and a.column_name = d.column_name and a.TABLE_NAME=d.TABLE_NAME) b

        set @primarykey=''
        if (EXISTS (select constraint_schema, table_name,column_name+',' columnname from remote_dbo.[smartlife-120300].INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
         where upper(constraint_name) like 'PK%'  and table_name=@table_name))
                BEGIN
                    select @primarykey=@primarykey+ e.columnname+' '
                    from ( select constraint_schema, table_name,column_name+',' columnname from remote_dbo.[smartlife-120300].INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
                    where upper(constraint_name) like 'PK%'  and table_name=@table_name ) e
                    set @primarykey='CONSTRAINT  PK_'+@table_name+'  PRIMARY KEY CLUSTERED  ('+left(@primarykey,LEN(@primarykey)-1)+'),'
                END

        set @ProcessTrackingTableName =@ProcessTrackingTableName+@primarykey

         IF (NOT EXISTS (select * from Cfg_Object where ChangeType='create' and TableName=@table_name))
                insert into Dey_Script (VersionId,ObjectName,UpdateScript,RecoverScript,UpdateValidateScript,RecoverValidateScript)
               select 3,@table_name  object_name,'
              IF (OBJECT_ID(N''dbo.'+@table_name+''', ''U'') IS NULL)
              BEGIN
                   PRINT ''''
                   PRINT ''Creating table '+@table_name+' ...''
                   create table [dbo].'+@table_name+' ('+left(@ProcessTrackingTableName,LEN(@ProcessTrackingTableName)-1)+');
               END   
              go',
              'drop table [dbo].'+@table_name,
            'select COUNT(object_id) from sys.tables where name='''+@table_name+''';  
           go','select COUNT(object_id) from sys.tables where name='''+@table_name+''';  
          go'
 
       
     FETCH NEXT FROM create_table_cursor 
    INTO  @table_name
 END 
CLOSE create_table_cursor
 DEALLOCATE create_table_cursor
 END
