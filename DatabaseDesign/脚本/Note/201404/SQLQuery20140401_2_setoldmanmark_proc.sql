
alter table cfg_bridge add LinkServerName varchar(100) null;

select * from sys_dictionaryitem where ItemName='���';

select * from Cfg_Bridge;
update Cfg_Bridge set LinkServerName='remote_dbo'
where NodeIp='115.236.175.110'


select name,user_type_id from sys.types;

select name,user_type_id from sys.all_columns
where object_id='1698821114'

select name,(select name from sys.types where user_type_id=a.user_type_id) typename from sys.all_columns a
where object_id='1698821114'

select   dbo.joinStr(name)
from    [smartlife-1203].sys.all_columns 
where  object_id   in 
            (   select  object_id 
                from    [smartlife-1203].sys.tables 
               where  name='Bas_ResidentBaseInfo'
             )
             
insert into  Bas_ResidentBaseInfo(   id,checkintime, ResidentId,Status,OperatedBy,OperatedOn,DataSource,ResidentName,
ResidentStatus,IDNo,Gender,AreaId,AreaId2)
select ID,CheckInTime,
OldManId,Status,OperatedBy,OperatedOn,DataSource,OldManName,
'00001' ResidentStatus,IDNo,Gender,AreaId,AreaId2
from remote_dbo.[smartlife-120303].dbo.Oca_OldManBaseInfo 
where AreaId2 is not  null;

insert into  Bas_ResidentBaseInfo(   id,checkintime, ResidentId,Status,OperatedBy,OperatedOn,DataSource,ResidentName,
ResidentStatus,IDNo,Gender,AreaId,AreaId2)
select ID,CheckInTime,
OldManId,Status,OperatedBy,OperatedOn,DataSource,OldManName,
'00001' ResidentStatus,IDNo,Gender,AreaId,AreaId2
from remote_dbo.[smartlife-120304].dbo.Oca_OldManBaseInfo 
where AreaId2 is not  null;


select residentname,idno,residentbizid
/*substring(idno,7,8),
substring(idno,7,8),
convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112),
convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112)*/

from Bas_ResidentBaseInfo
where idno <>'999999999999999999'
and ( substring(idno,7,8) between convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112) and convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112))
and len(idno)=18;
----------------------------------------------------
select residentname,idno,residentbizid,
'19'+substring(idno,7,6)
/*substring(idno,7,8),
substring(idno,7,8),
convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112),
convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112)*/

from Bas_ResidentBaseInfo
where idno <>'999999999999999999'
--and ( '19'+substring(idno,7,6) between convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112) and convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112))
and len(idno)=15;

/*****************************************************************/
/* SP_DBA_SetOldManMark                                          */
/* �������֤�ϵĳ�����Ϣ���ж��ڹ�ȥ�İ����У�����Ϊ���˵ļ�¼  */
/* ��¼����Ӧ�ı�ʶ,����Ϊ����                                   */
/*****************************************************************/
alter  procedure SP_DBA_SetOldManMark
as 
begin
        -------------���֤Ϊ18λ�����
		update Bas_ResidentBaseInfo
		set residentbizid='00001'
		where idno <>'999999999999999999'
		and ( substring(idno,7,8) between convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112) and convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112))
		and len(idno)=18 and residentbizid is null;

        -------------���֤Ϊ15λ�����
		update Bas_ResidentBaseInfo
		set residentbizid='00001'
		where idno <>'999999999999999999'
		and ( '19'+substring(idno,7,6) between convert(varchar(8),dateadd(MONTH,-726,GETDATE()),112) and convert(varchar(8),dateadd(YEAR,-60,GETDATE()),112))
		and len(idno)=15 and residentbizid is null;

end

exec SP_DBA_SetOldManMark
select * from Bas_ResidentBaseInfo where residentbizid is not null

select * from Bas_ResidentBaseInfo where $partition.OldManBaseInfoPS1(areaid)='01191'

select * 
from sys.partition_functions;
select *
from sys.partitions;

select * from Bas_ResidentBaseInfo where ID='23548'
update Bas_ResidentBaseInfo set areaid='01193'
where ID='23548'