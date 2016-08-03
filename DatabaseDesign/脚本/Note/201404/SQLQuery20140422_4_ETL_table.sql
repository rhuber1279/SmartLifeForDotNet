create table Cfg_ConnectManager
(
  Name nvarchar(100) not null,
  ID   int identity(1,1) not null,
  Description nvarchar(400) null,
  ConnectString nvarchar(max) not null,
  Abbr nvarchar(30) not null
)

create table Cfg_Directory
(
  Name nvarchar(100) not null,
  Path nvarchar(max) not null,
  Description nvarchar(400) null
)

alter table 
;
EXEC sp_rename 'Cfg_ConnectManager', 'Cfg_ETL_ConnectManager';
EXEC sp_rename 'Cfg_Directory', 'Cfg_ETL_Directory';

insert into Cfg_ETL_Directory (Name,Path,Description)values('bcp����Ŀ¼','e:\','bcp����Ŀ¼');
insert into Cfg_ETL_Directory (Name,Path,Description)values('dataĿ¼','e:\','dataĿ¼');
insert into Cfg_ETL_Directory (Name,Path,Description)values('logĿ¼','e:\','��־����Ŀ¼');
insert into Cfg_ETL_Directory (Name,Path,Description)values('errorĿ¼','e:\','����Ŀ¼');

select * from Cfg_ETL_Directory;

select * from oca_step1oldmanbaseinfo;

select name from sys.all_columns where object_id>0;

select * from sys.sql_dependencies;


 use [SmartLife-120307]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120311]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120395]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120396]
          go
          exec master..xp_cmdshell 'sqlcmd -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120397]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120398]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 
 use [SmartLife-120399]
          go
          exec master..xp_cmdshell 'osql -E -i e:\wangwei\20140422_execute.sql' 