select --cast (SUBSTRING(IDNo,7,8) as datetime),
oldmanname ��������,case gender when 'M' then '��' when 'F' then 'Ů' else  'δ֪' end �Ա�,SUBSTRING(IDNo,7,4)+'-'+SUBSTRING(IDNo,11,2)+'-'+SUBSTRING(IDNo,13,2) ��������,''''+idno ���֤,
(select callno from Oca_OldManConfigInfo where OldManId=a.OldManId) ���к�,
HealthInsuranceNumber ҽ����,SocialInsuranceNumber �籣��,
( select ItemName from dbo.sys_dictionaryitem where dictionaryid ='11001' and itemid=a.LivingState) ��ס���,
OldManIdentity ������,
address ��ַ,PostCode �ʱ�,tel �绰,mobile �ֻ�,LongitudeS ����,LatitudeS γ��,
(select areaname from Pub_Area where AreaId=a.AreaId2) �ֵ�,
(select areaname from Pub_Area where AreaId=a.AreaId3) ���� ,
 (select top 1 (select familymembername from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99999' and OldManId=a.oldmanid) ��������1,
  (select top 1(select isnull(mobile,tel) from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99999' and OldManId=a.oldmanid) ���˺���1,
  (select top 1 (select familymembername from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99998' and OldManId=a.oldmanid) ��������2,
  (select top 1 (select isnull(mobile,tel) from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99998' and OldManId=a.oldmanid) ���˺���2,
  (select top 1  (select familymembername from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99997' and OldManId=a.oldmanid) ��������3,
  (select top 1  (select isnull(mobile,tel) from Oca_FamilyMember where familymemberid=b.FamilyMemberId) FamilyMemberId from Oca_OldManFamilyInfo b where RelationIdOfOldMan='99997' and OldManId=a.oldmanid) ���˺���3,
remark ��ע
from Oca_OldManBaseInfo  a
where SUBSTRING(IDNo,7,4) between 1934 and 1944
--and Remark='-'
  and (len(Mobile)>8 or len(Remark)>8 )
  
  
  --4591
  --5694
  --968
  
  select ItemName from dbo.sys_dictionaryitem where itemid='99998' dictionaryid ='11001' and itemid ItemName like '����';
  
  select FamilyMemberId from Oca_OldManFamilyInfo where RelationIdOfOldMan='99999' and OldManId;
  
  select * from Oca_FamilyMember;
  
  select idno,--SUBSTRING(idno,1,8)+cast(SUBSTRING(idno,9,1)-1 as varchar(1))+SUBSTRING(idno,10,9) ,
  cast(substring(idno,7,8) as datetime),checkintime,
  BIrthday
  from Oca_OldManBaseInfo where Remark='-' --and  SUBSTRING(idno,7,4)=1926
  order by  SUBSTRING(idno,7,8)desc
  
  update Oca_OldManBaseInfo set idno=SUBSTRING(idno,1,8)+cast(SUBSTRING(idno,9,1)-1 as varchar(1))+SUBSTRING(idno,10,9)
    where Remark='-'
    
     update Oca_OldManBaseInfo set idno=REPLACE(idno,'0229','0228')
    where Remark='-' and substring(idno,11,4)='0229'
  
   update Oca_OldManBaseInfo set birthday= cast(substring(idno,7,8) as datetime)
    where Remark='-'  
    
    33010519260229063X
    
  
  select *  into Oca_OldManBaseInfoOld0512 from Oca_OldManBaseInfo;
  
   select *  into Oca_OldManBaseInfoOld0512_2 from Oca_OldManBaseInfo;
    select *  into Oca_OldManConfigInfoOld0512 from Oca_OldManConfigInfo;
     select *  into Oca_OldManConfigInfoOld0512_2 from Oca_OldManConfigInfo;
  select * into temp_excelsourceOld0508 from temp_excelsource;
  --delete from  temp_excelsource;
   exec   SP_DBA_ImportOldManBaseInfo
   
   
   select b.oldmanid,b.govturnkeyflag
from Oca_OldManConfigInfo b,(select  a.OldManId,c.[����]+c.[���֤��] mark
from Oca_OldManConfigInfo a,Oca_OldManBaseInfo b,temp_govserviceoldman$  c
where a.OldManId=b.OldManId and b.OldManName+b.IDNo=c.[����]+c.[���֤��])m
where b.OldManId=m.OldManId and GovTurnkeyFlag=0

update    Oca_OldManConfigInfo set GovTurnkeyFlag=1
from Oca_OldManConfigInfo b,(select  a.OldManId,c.[����]+c.[���֤��] mark
from Oca_OldManConfigInfo a,Oca_OldManBaseInfo b,temp_govserviceoldman$  c
where a.OldManId=b.OldManId and b.OldManName+b.IDNo=c.[����]+c.[���֤��])m
where b.OldManId=m.OldManId and GovTurnkeyFlag=0

select * into temp_govserviceoldmanNoMatch$ from temp_govserviceoldman$
where [����]+[���֤��] not in
(select  c.[����]+c.[���֤��] mark
from Oca_OldManConfigInfo a,Oca_OldManBaseInfo b,temp_govserviceoldman$  c
where a.OldManId=b.OldManId and b.OldManName+b.IDNo=c.[����]+c.[���֤��])

select name,default_database_name,default_language_name,is_policy_checked,is_expiration_checked
 from sys.sql_logins;
 
-- CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
 select 'CREATE USER ['+name+'] FOR LOGIN ['+name+'] WITH DEFAULT_SCHEMA=[dbo]
 GO' from sys.sysusers where islogin=1 and hasdbaccess=1 and name<>'dbo';
 
 select * into temp_result from (
 select *,'��' �Ƿ���� from temp_govserviceoldman$ c
 where  c.[����]+c.[���֤��] not in
 ( select [����]+[���֤��] from temp_govserviceoldmanNoMatch$)
 union
 select *,'��' �Ƿ���� from temp_govserviceoldmanNoMatch$) a
 
 select * from sys.sys_locks;
 
  select ���	,��������,	����,	''''+���֤�� ���֤��	,�Ա�,	��������,	
  ����,	����״��,	��ס��ַ,	�����ȼ�,	������,	������׼,	
  ��ʼ��������,	������������,	��������,	�����н�,	�Ƿ����
   from temp_result where �Ƿ����='��' 