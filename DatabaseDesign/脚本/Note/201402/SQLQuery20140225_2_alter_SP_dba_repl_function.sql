USE [smartlife-120301]
GO
/****** Object:  StoredProcedure [dbo].[SP_dba_repl_function]    Script Date: 02/25/2014 09:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SP_dba_repl_function]
@source_db_name nvarchar(50)='Smartlife-120300',
@update_type  nvarchar(40)='function'
 AS
 BEGIN
SET NOCOUNT ON
 
DECLARE  @id nvarchar(50)
declare @str nvarchar(max)
declare @str_drop nvarchar(max)
declare @str_select nvarchar(max)
declare @type nvarchar(max)

DECLARE id_cursor CURSOR FOR 
select e.name id
from (
select a.name,LEN(b.definition) lengths
 from sys.all_objects a,sys.all_sql_modules b 
where a.type in ('AF','TF','FN') and a.object_id>0 and a.object_id=b.object_id) e,
 (
select a.name,LEN(b.definition) lengths
 from [Smartlife-120300].sys.all_objects a,[Smartlife-120300].sys.all_sql_modules b 
where a.type in ('AF','TF','FN') and a.object_id>0 and a.object_id=b.object_id) f
where  e.name=f.name and e.lengths<>f.lengths;
 
 if (@update_type='function')
 begin
 set @type='''AF'',''TF'',''FN'''
 end
 
 if (@update_type='procedure')
 begin
 set @type='''P'''
 end
 
OPEN id_cursor
 
FETCH NEXT FROM id_cursor 
INTO  @id
 
WHILE @@FETCH_STATUS = 0
 BEGIN
    
 --select top 1 @str=b.definition,@str_drop='drop function '+a.name+';'  from [Smartlife-120300].sys.all_objects a,[Smartlife-120300].sys.all_sql_modules b  
 -- where a.type in ('AF','TF','FN') and a.object_id>0 and a.object_id=b.object_id   and a.name=@id 
  --and  len(b.definition)>4000;  
  set @str_select= 'select top 1 @str=b.definition,@str_drop=''drop '+@update_type+' ''+a.name+'';'' 
  from ['+@source_db_name+'].sys.all_objects a,['+@source_db_name+'].sys.all_sql_modules b  
  where a.type in ('+@type+') and a.object_id>0 and a.object_id=b.object_id   and a.name=@id' 
  exec sp_executesql @str_select;
  exec sp_executesql @str_drop;
  exec sp_executesql @str;
   --print @str
     FETCH NEXT FROM id_cursor 
    INTO  @id
 END 
CLOSE id_cursor
 DEALLOCATE id_cursor
 END