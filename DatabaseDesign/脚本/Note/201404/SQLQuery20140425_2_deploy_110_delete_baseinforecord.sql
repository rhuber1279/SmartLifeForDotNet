use msdb
go
if (NOT EXISTS  (select * from sys.login_token where Name='job' and Type='SQL LOGIN'))
begin
CREATE LOGIN [job] WITH PASSWORD=N'leblue@2014', DEFAULT_DATABASE=[msdb], DEFAULT_LANGUAGE=[��������], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
create user job;
EXEC sys.sp_addrolemember  @roleName = N'SQLAgentOperatorRole',@membername='job'
end
GO
ALTER LOGIN [job] WITH PASSWORD = 'leblue@2013' 
exec sp_help_jobschedule @job_name='MakeCallServiceRecord'

/***************************************************************************************/
/* ���µĴ洢���̵ĵ��� ��Ϊ���޸���ҵִ�еļ��                                       */
/* @job_name ��ҵ�� ,@name ��ҵ�ļƻ�ʱ�̱������ ,                                    */
/* @fre_subday_type ����ĵ�λ, 2 Ϊ�� ,4Ϊ �� 8 Ϊ Сʱ                               */
/* @freq_subday_interval �������ֵ ���ڵ���1�������������λΪ��ʱ���Ǵ��ڵ���10������*/
/***************************************************************************************/
exec sp_update_jobschedule @job_name='MakeCallServiceRecord',@name='plan',@freq_subday_type='2',@freq_subday_interval='12'

select top 10 * from bas_residentbaseinfo order by checkintime desc ;
-----------------------------------------------------------------------------------------
select * from dbo.oca_oldmanbaseinfo where len(oldmanname)<4; ---19229
select * from dbo.oca_oldmanbaseinfo where oldmanname like '%δ֪%' ---9308
select * from dbo.oca_oldmanbaseinfo where oldmanname like '%����%' ---4258 

 
 select * from dbo.oca_oldmanbaseinfo 
 where oldmanid not in 
 (
 select oldmanid from dbo.oca_oldmanbaseinfo where len(oldmanname)<4 or  oldmanname like '%δ֪%' or oldmanname like '%����%'
 )
 ----------------------------------========================================================
 select * into Oca_OldmanbaseinfoOld0425 from  dbo.oca_oldmanbaseinfo;
 
 select * from dbo.oca_oldmanbaseinfo where len(oldmanname)<4
 and oldmanid not in (select oldmanid from dbo.oca_oldmanconfiginfo where callno is Not null);  ---3212
 
 --delete from dbo.oca_oldmanbaseinfo where len(oldmanname)<4
 and oldmanid not in (select oldmanid from dbo.oca_oldmanconfiginfo where callno is Not null);
 
 select * from dbo.oca_oldmanbaseinfo where oldmanname like '%δ֪%' ---9308
 -- delete from dbo.oca_oldmanbaseinfo where oldmanname like '%δ֪%'
  
 insert into bas_residentbaseinfo (residentid,residentname,idno,gender,checkintime,status,mobile,remark,areaid,areaid2)
  select top 10 NEWID() residentid,residentname,idno,gender,getdate() checkintime,status,mobile,remark,'01191' areaid,'AAA01191-0001-0000-0000-000000000000' areaid2
   from bas_residentbaseinfo order by NEWID();
  