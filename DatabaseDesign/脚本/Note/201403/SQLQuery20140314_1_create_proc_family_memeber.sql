select 
--OldManId
--,OldManName
--,mobile,datasource
--,LEN(oldmanname),replace(SPACE(len(oldmanname)),' ','*')
--,REPLICATE('*',LEN(oldmanname))
*
 from  Oca_OldManBaseInfo 
 where --convert(varchar(10),CheckInTime ,120)=CONVERT(varchar(10),dateadd(day,-1,getdate()),120)
 --and 
 OldManName='����ϼ'
 select f1 ����,f4+'' ���֤��,'������ݳ���19**������' ����ԭ�� 
from dbo.Sheet41$ where len(f4)=18 and substring(f4,7,8) not like '19%'
 select * from dbo.Sheet41$;
 
 select COUNT(*) from Temp_ExcelSource;
 select COUNT(*) from oca_oldmanbaseinfo where idno='330121941010100817'
------------------------
select * from Temp_ExcelSource where len(idno)=18 and (((substring(IDNo,7,8)  like '19%') 
and( SUBSTRING(idno,13,1)>3 or SUBSTRING(idno,11,1)>1 )) or substring(IDNo,7,8) not like '19%')

select oldmanname ����,IDno+'' ���֤��,'������ݳ���19**������' ����ԭ�� 
from Temp_ExcelSource where len(idno)=18 and substring(IDNo,7,8) not like '19%'
union
select oldmanname ����,IDno+'' ���֤��,'�����·ݳ���12������' ����ԭ�� 
from Temp_ExcelSource where len(idno)=18 and substring(IDNo,7,8)  like '19%' and SUBSTRING(idno,11,1)>1 
union
select oldmanname ����,IDno+'' ���֤��,'�������ڳ���31������' ����ԭ�� 
from Temp_ExcelSource where len(idno)=18 and substring(IDNo,7,8)  like '19%' and SUBSTRING(idno,13,1)>3
union
select f1 ����,F4+'' ���֤��,'���֤��λ�����Լ�����15λҲ����18λ'  ����ԭ��
from sheetsource where len(f4)<>18 and  len(f4)<>15

 select  oldmanname,idno,callno tel,areaid2 
        from dbo.temp_mutisheets
   select  oldmanname,idno,mobile tel,areaid2 
        from dbo.temp_excelsource      
        
select COUNT(*) ,callno from Oca_OldManConfigInfo group by callno having COUNT(*)>1;
substring(IDNo,7,8)  like '19%';

 update dbo.temp_excelsource
set birthday=cast(SUBSTRING(b.f4,7,8) as datetime)
from dbo.temp_excelsource a,dbo.sheetSource b
where a.idno=b.f4 and len(b.f4)=18 and substring(b.f4,7,8)  like '19%' ;

update dbo.Temp_excelsource
set DataSource='00003'

update Oca_OldManBaseInfo 
set   DataSource='00003'
 where convert(varchar(10),CheckInTime ,120)=CONVERT(varchar(10),dateadd(day,-1,getdate()),120)
δ֪���� *****************

exec SP_DBA_ImportOldManBaseInfo
---------------------------��� ����ֶ������ַ�����
select dbo.joinStr(name) from sys.all_columns 
where object_id in (select object_id from sys.tables where name='Oca_OldManBaseInfo')

OldManId,Id,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,OldManName,Gender,Birthday,
IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,SocialInsuranceNumber,
LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,LatitudeS,PostCode,Tel,
Mobile,Remark,InputCode1,InputCode2

----------------------------------------
alter procedure SP_DBA_ImportOldManBaseInfo
as 
BEGIN
if (exists (select *
            from  temp_excelsource 
            where idno not in (select idno from Oca_OldManBaseInfo)))
   begin 
         insert into   Oca_OldManConfigInfo  (OldManId,CheckInTime,DataSource,CallNo,LocateFlag,GovTurnkeyFlag)
         select oldmanid,GETDATE() checkintime,'00003' DataSource,mobile callno,0 locateflag,0 govturnkeyflag
         from  temp_excelsource 
         where idno not in (select idno from Oca_OldManBaseInfo);
   
         insert into Oca_OldManBaseInfo(OldManId,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,
         OldManName,Gender,Birthday,IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,
         SocialInsuranceNumber,LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,
         LatitudeS,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2)

         select OldManId,getdate() CheckInTime,Status,OperatedBy,OperatedOn,DataSource,OldManName,Gender,Birthday,
               IDNo,HealthInsuranceFlag,HealthInsuranceNumber,SocialInsuranceFlag,SocialInsuranceNumber,
               LivingState,OldManIdentity,AreaId,AreaId2,AreaId3,Address,LongitudeS,LatitudeS,PostCode,Tel,
               Mobile,Remark,InputCode1,InputCode2
         from  temp_excelsource 
         where idno not in (select idno from Oca_OldManBaseInfo);
         
        
  end 
END 
 --------------------------
 select f4,f19 from sheetSource where LEN(f4)>18;
 select LEN(f4) from sheetSource where F4='330125192003060913  '
 select * from sheetSource;
 select * from Sys_DictionaryItem where ItemName='����һ';
 --------------------merge
 insert into sheetsource (f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23)
 select f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23
 from sheet41$ where LEN(f4)=18 or LEN(f4)=15 
 and f4 not in(select f4 from sheetSource);
 
 -------------------------------------
  select *  from Oca_FamilyMember where FamilyMemberName='Ǯ��Ƽ' Remark is not null;
   
   select * from Oca_OldManFamilyInfo;
 ---------------------------------------------------------------------------------------------
 
 /************************************************************************/
 /*  SP_DBA_ImportOldManFamilyInfo                                       */
 /*  �������˵����˵���Ϣ�������������˵Ĺ���������ݡ�                  */
 /************************************************************************/
create procedure SP_DBA_ImportOldManFamilyInfo
as 
BEGIN  

   ---------------��������һ������ 
   insert into Oca_FamilyMember (FamilyMemberId,CheckInTime,Status,DataSource,gender,FamilyMemberName,IDNo,Mobile,AreaId,Remark)
   select NEWID() FamilyMemberId,GETDATE() CheckInTime ,1 Status,'00003' DataSource,'N' gender,
          f18 FamilyMemberName,f4 IDNo,cast(cast(f19 as bigint) as varchar(20)) Mobile,'01191' AreaId,'99999' Remark
    from sheetSource 
    where F18<>'����һ' and F19 is not null and (LEN(f4)=18 or LEN(f4)=15)
     and F4 not in (select idno from Oca_FamilyMember where Remark='99999') ; 
     
    ---------------�������˶������� 
       insert into Oca_FamilyMember (FamilyMemberId,CheckInTime,Status,DataSource,gender,FamilyMemberName,IDNo,Mobile,AreaId,Remark)
   select NEWID() FamilyMemberId,GETDATE() CheckInTime ,1 Status,'00003' DataSource,'N' gender,
          f20 FamilyMemberName,f4 IDNo,cast(cast(f21 as bigint) as varchar(20)) Mobile,'01191' AreaId,'99998' Remark
    from sheetSource 
    where F20<>'���˶�' and F21 is not null and (LEN(f4)=18 or LEN(f4)=15)
     and F4 not in (select idno from Oca_FamilyMember where Remark='99998'); 
 
    ---------------���������������� 
       insert into Oca_FamilyMember (FamilyMemberId,CheckInTime,Status,DataSource,gender,FamilyMemberName,IDNo,Mobile,AreaId,Remark)
   select NEWID() FamilyMemberId,GETDATE() CheckInTime ,1 Status,'00003' DataSource,'N' gender,
          f22 FamilyMemberName,f4 IDNo,cast(cast(f23 as bigint) as varchar(20)) Mobile,'01191' AreaId,'99997' Remark
    from sheetSource 
    where F22<>'������' and F23 is not null and (LEN(f4)=18 or LEN(f4)=15)
    and F4 not in (select idno from Oca_FamilyMember where Remark='99997'); 
    
    ---------------��ʶ���˻�����Ϣ���е��쳣������ 
     update  Oca_OldManBaseInfo set remark='���֤���벻Ψһ'
    where IDNo in( select idno from Oca_OldManBaseInfo
    group by IDNo
    having COUNT(*)>1) and Remark<>'���֤���벻Ψһ';
    
    --------------
    insert into Oca_OldManFamilyInfo (CheckInTime,Status,DataSource,OldManId,FamilyMemberId,RelationIdOfFamily,RelationIdOfOldMan)
    select getdate() checkintime,1 Status,'00003' DataSource,
   b.oldmanid,
    familymemberid,a.remark relationidofoldman, a.remark relationidoffamily
    from Oca_FamilyMember a
    ,Oca_OldManBaseInfo b
    where 
    a.IDNo=b.IDNo and  ( b.Remark<>'���֤���벻Ψһ' or b.Remark is null)
    and a.Remark is not null
    and a.FamilyMemberId not in (select FamilyMemberId from Oca_OldManFamilyInfo);
 end   
    --------------------------------------------------------------------------------------------
    select idno from Oca_OldManBaseInfo
    group by IDNo
    having COUNT(*)>1
    
    select Remark from Oca_OldManBaseInfo where Remark<>'���֤���벻Ψһ' or Remark is null;
    
   
    
         