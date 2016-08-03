USE [smartlife-120301]
GO

/****** Object:  User [test]    Script Date: 05/12/2014 15:22:56 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'test')
DROP USER [test]
GO

USE [smartlife-120301]
GO

/****** Object:  User [test]    Script Date: 05/12/2014 15:22:56 ******/
GO

CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
grant db_owner to test;
GO

if (NOT EXISTS  (select * from sys.login_token where Name='wangwei' and Type='SQL LOGIN'))
begin
CREATE LOGIN [wangwei] WITH PASSWORD=N'leblue@2014', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
EXEC sys.sp_addsrvrolemember @logiName = N'wangwei', @roleName = N'sysadmin'
end
GO
ALTER LOGIN [SmartCare120395] DISABLE
revoke backup database from wangwei;

select * from sys.sql_logins;

select 'drop user '+name+';
alter authorization on Database::['+DB_NAME()+'] to '+name+';
go' 
from sys.sysusers where islogin=1 and hasdbaccess=1 and name <>'dbo';

SELECT * FROM sys.database_principals WHERE name = N'guest'
select * from sys.user_token;

alter authorization on Database::[Smartlife-120396] to SmartCare120396;
alter authorization on Database::[Smartlife-120395] to SmartCare120396;

CREATE LOGIN [SmartCare120396] WITH PASSWORD=N'SmartCare120396@2013', DEFAULT_DATABASE=[Smartlife-120395],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

select name,default_database_name,default_language_name,is_policy_checked,is_expiration_checked
 from sys.sql_logins;
 
 select 'CREATE LOGIN ['+name+'] WITH PASSWORD=N'''+name+'@2013'', DEFAULT_DATABASE=['+default_database_name+'],
 DEFAULT_LANGUAGE=['+default_language_name+'], CHECK_EXPIRATION='+case is_expiration_checked when 0 then 'OFF' when 1 then 'ON' else 'ON' end +', CHECK_POLICY='+case is_policy_checked
 when 0 then 'OFF' when 1 then 'ON' else 'ON' end +'
 Go'
 from remote_dbo.[master].sys.sql_logins 
 where name not in (select name
 from sys.sql_logins);
 
 
 CREATE LOGIN [CitizensServiceSystem] WITH PASSWORD=N'CitizensServiceSystem@2013', DEFAULT_DATABASE=[CitizensServiceSystem],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [IPCC1203] WITH PASSWORD=N'IPCC1203@2013', DEFAULT_DATABASE=[IPCC-1203],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [IPCC1207] WITH PASSWORD=N'IPCC1207@2013', DEFAULT_DATABASE=[IPCC-1207],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare1203] WITH PASSWORD=N'SmartCare1203@2013', DEFAULT_DATABASE=[SmartLife-1203],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120300] WITH PASSWORD=N'SmartCare120300@2013', DEFAULT_DATABASE=[SmartLife-120300],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120301] WITH PASSWORD=N'SmartCare120301@2013', DEFAULT_DATABASE=[SmartLife-120301],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120302] WITH PASSWORD=N'SmartCare120302@2013', DEFAULT_DATABASE=[SmartLife-120302],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120303] WITH PASSWORD=N'SmartCare120303@2013', DEFAULT_DATABASE=[SmartLife-120303],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120304] WITH PASSWORD=N'SmartCare120304@2013', DEFAULT_DATABASE=[SmartLife-120304],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120305] WITH PASSWORD=N'SmartCare120305@2013', DEFAULT_DATABASE=[SmartLife-120305],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120306] WITH PASSWORD=N'SmartCare120306@2013', DEFAULT_DATABASE=[SmartLife-120306],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120307] WITH PASSWORD=N'SmartCare120307@2013', DEFAULT_DATABASE=[SmartLife-120307],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120311] WITH PASSWORD=N'SmartCare120311@2013', DEFAULT_DATABASE=[SmartLife-120311],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120397] WITH PASSWORD=N'SmartCare120397@2013', DEFAULT_DATABASE=[SmartLife-120397],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120398] WITH PASSWORD=N'SmartCare120398@2013', DEFAULT_DATABASE=[SmartLife-120398],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120399] WITH PASSWORD=N'SmartCare120399@2013', DEFAULT_DATABASE=[SmartLife-120399],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCare120701] WITH PASSWORD=N'SmartCare120701@2013', DEFAULT_DATABASE=[SmartLife-120701],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartCert120304] WITH PASSWORD=N'SmartCert120304@2013', DEFAULT_DATABASE=[SmartLife-120304],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go
CREATE LOGIN [SmartLife] WITH PASSWORD=N'SmartLife@2013', DEFAULT_DATABASE=[SmartLife-120304],
 DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
 Go

view any database
grant view database state on Database::[Smartlife-120304] to SmartCare120304;
grant view definition on Database::[Smartlife-120304] to SmartCare120304;
drop user SmartCare120304;
alter authorization on Database::[Smartlife-120304] to SmartCare120304;

CREATE USER [SmartLife] FOR LOGIN [SmartLife] WITH DEFAULT_SCHEMA=[dbo]  
 GO
CREATE USER [SmartCert120304] FOR LOGIN [SmartCert120304] WITH DEFAULT_SCHEMA=[dbo]
   GO
CREATE USER [SmartCare120304] FOR LOGIN [SmartCare120304] WITH DEFAULT_SCHEMA=[dbo]   
GO
CREATE USER [IPCC1203] FOR LOGIN [IPCC1203] WITH DEFAULT_SCHEMA=[dbo]   
GO
CREATE USER [SmartCare1203] FOR LOGIN [SmartCare1203] WITH DEFAULT_SCHEMA=[dbo]  
 GO
CREATE USER [job] FOR LOGIN [job] WITH DEFAULT_SCHEMA=[dbo] 
 GO