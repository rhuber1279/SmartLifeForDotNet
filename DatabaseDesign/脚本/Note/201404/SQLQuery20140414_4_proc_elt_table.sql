USE [Leblue-Etl]
GO
/****** Object:  StoredProcedure [dbo].[SP_ETL_Table]    Script Date: 04/14/2014 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************/
/* SP_ETL_Table */
/* 更新表 */
/* 依赖 Cfg_ETL_TranslateRule  */
/************************************************************/
ALTER procedure [dbo].[SP_ETL_Table]
@sourcetabname varchar(100),
@desttabname   varchar(100),

@sourcejoincolname varchar(100),
@destjoincolname   varchar(100)
as 
begin
		declare @sqlStr nvarchar(4000),@expression varchar(1000),@sourcecolname varchar(100),
		@destcolname   varchar(100),@columnstr varchar(max),@destcolumnname varchar(max)
		
		
		set @sqlStr=' select @columnstr=dbo.JoinStr(name) from Cfg_ETL_TranslateRule 
            where  sourcetablename=@sourcetabname '
           exec sp_executesql @sqlStr,'@sourcetabname varchar(100),@columnstr  varchar(max) output ',@sourcetabname,@columnstr output 
		----------step 1
			set @sqlStr='insert into '+@desttabname+'('+@columnstr+')
			select 
			'+@columnstr+'
			from  dbo.'+@sourcetabname+' where (LEN(f4)=18 or LEN(f4)=15)
			and f4 not in (select IdNo from '+@desttabname+')
			;'
			
		DECLARE create_table_cursor CURSOR FOR 
		select distinct destcolumnname  from Cfg_ETL_TranslateRule ;
		 
		OPEN create_table_cursor
		 
		FETCH NEXT FROM create_table_cursor 
		INTO  @destcolumnname
		 
		WHILE @@FETCH_STATUS = 0
		 BEGIN
		exec sp_executesql @sqlStr
				--set @sqlStr='update '+@desttabname
				--print '--'+@sqlStr
				--exec sp_executesql @sqlStr
		        exec sp_etl_column @sourcetabname=@sourcetabname,@desttabname=@desttabname,
		        @sourcecolname=@destcolname,@destcolname=@destcolumnname,@sourcejoincolname=@sourcejoincolname,
		        @destjoincolname=@destjoincolname
			 FETCH NEXT FROM create_table_cursor 
			INTO  @destcolumnname
		 END 
		CLOSE create_table_cursor
		 DEALLOCATE create_table_cursor
end