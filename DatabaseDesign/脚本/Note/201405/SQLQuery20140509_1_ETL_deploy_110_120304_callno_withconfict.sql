/*****************************************/
/*SP_DBA_SolveConfictOfCallNo            */
/*�޸�������δ֪���˵ĺ����ͻ����       */
/*ǰ��������temp_callrecord����          */
/*****************************************/
ALTER procedure [dbo].[SP_DBA_SolveConfictOfCallNo]
as 
BEGIN
------------------------------step 1 ��callservice ���У��� δ֪���˵�oldmanid,��Ϊ �¼Ӻ�������˵�oldmanid. 24726
update Oca_CallService 
set OldManId=o.oldmanidnew
from Oca_CallService a,(
    select a.oldmanid,a.oldmanidnew,b.CallServiceId 
    from temp_callrecord a,Oca_CallService b  
    where a.TYPE='2' and a.oldmanid=b.OldManId
    )  o
where a.CallServiceId=o.CallServiceId and a.CallServiceId in 
(
   select b.CallServiceId 
   from temp_callrecord a,Oca_CallService b  
   where a.TYPE='2' and a.oldmanid=b.OldManId
);

----------------------------step 2 �����ñ��У�����Ҫ��ӵ绰��������˵ĺ��� �ɿ�ֵ��Ϊʵ�ʵ���ʵֵ��

if (not exists (select * from Oca_OldManConfigInfo where OldManId in(select OldManId from Temp_CallRecord where type='add')))
begin
      insert into   Oca_OldManConfigInfo  (OldManId,CheckInTime,CallNo,LocateFlag,GovTurnkeyFlag)
      select oldmanid,GETDATE() checkintime,tel callno,0 locateflag,0 govturnkeyflag
      from Temp_CallRecord 
      where type='add' and tel not in(select distinct callno from Oca_OldManConfigInfo where CallNo  is not  null and CallNo<>'' );
end

------------------------------step 3 ��δ֪���˵ĵ绰�ţ����¼����ϵĵ绰�ŵĳ�ͻ������£������ñ��У���δ֪���˵ĵ绰�������ñ�����ա�
/*update  Oca_OldManConfigInfo  set  CallNo=''
 from  Oca_OldManConfigInfo  b
where b.OldManId in 
                   (
                      select oldmanid
                      from Temp_CallRecord
                      where type='2'
                   )*/
------------------------------step 3 ��δ֪���˵ĵ绰�ţ����¼����ϵĵ绰�ŵĳ�ͻ������£������ñ��У��ѳ�ͻ�ĵ绰�������ñ���δ֪���˵�ID �޸�Ϊ��ʵ���˵�ID.��                   
update  Oca_OldManConfigInfo  set  OldManId=c.oldmanidnew
 from  Oca_OldManConfigInfo  b ,(
                      select *
                      from Temp_CallRecord
                      where type='2'
                   ) c 
where b.CallNo in 
                   (
                      select tel
                      from Temp_CallRecord
                      where type='2'
                   )                   
                   
END  


/************************************************/
/*������ʱ��Temp_CallRecord                     */
/*ǰ�������ǣ�Sheet1$_filterdatabase ����             */
/************************************************/
ALTER PROCEDURE  [dbo].[SP_DBA_InsertCallNoChange]
AS 
BEGIN

IF (NOT EXISTS (select * from sys.tables where name='Temp_CallRecord'))
BEGIN
CREATE TABLE [dbo].[Temp_CallRecord](
	[idno] [char](18) NOT NULL,
	[OldManName] [nvarchar](20) NOT NULL,
	[oldmanid] [uniqueidentifier] NOT NULL,
	[tel] [nvarchar](11) NULL,
	[IdNoNew] [nvarchar](255) NULL,
	[OldManNameNew] [nvarchar](255) NULL,
	[type] [varchar](3) NOT NULL,
	[oldmanidnew] [uniqueidentifier] NULL
);

END
-----------------------=================��Ҫ��ӵ绰�ŵ��������ü�¼  8170
IF (EXISTS (select * from Temp_CallRecord ))
BEGIN
   delete from Temp_CallRecord;
END

insert into Temp_CallRecord (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select m.idno,m.OldManName,m.oldmanid ,n.tel,n.idno IdNoNew,n.oldmanname OldManNameNew,null OldManIdNew,'add' type 
from (
      select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
      from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
           on a.OldManId=b.OldManId
       where  b.CallNo is null and len(a.OldManName )<=3
       ) m,
      (
         select  oldmanname,idno,mobile tel--,areaid2 
        from dbo.Sheet1$_filterdatabase
      )n
where m.OldManName=n.oldmanname and m.IDNo=n.idno;

----------------------------------------==========���� 2786
insert into Temp_CallRecord  (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select m.idno,m.OldManName,m.oldmanid,n.tel,n.idno IdNoNew,n.oldmanname OldManNameNew,null OldManIdNew,'0' TYPE
from (
       select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
       from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
            on a.OldManId=b.OldManId 
       where b.CallNo is not null and  len(a.OldManName )<=3
       ) m,
      (
        select  oldmanname,idno,mobile tel--,areaid2 
        from dbo.Sheet1$_filterdatabase
      )n
where m.OldManName=n.oldmanname and m.IDNo=n.idno and m.CallNo=n.tel;

--------------------=============================oca_callservice �������з���� ��Ҫ�޸�����ID�ļ�¼��
insert into Temp_CallRecord  (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select k.idno,k.oldmanname ,k.OldManId,k.CallNo,p.IDNo IdNoNew,p.OldManName OldManNameNew,p.OldManId OldManIdNew,'2' type
from (
       select b.CallNo,a.OldManId,a.OldManName,a.IDNo 
       from dbo.Oca_OldManBaseInfo a inner join Oca_OldManConfigInfo b
            on a.OldManId=b.OldManId 
      where a.OldManName like '����%' or a.OldManName like 'δ֪%' or len(a.oldmanname)<=3
     ) k,
     (
        select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid
        from (
                select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
                from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
                     on a.OldManId=b.OldManId 
                where   b.CallNo is null and   len(a.OldManName )<=3
              ) m,
             (
                 select  oldmanname,idno,mobile tel--,areaid2 
                 from Sheet1$_filterdatabase
             )n
        where m.OldManName=n.oldmanname and m.IDNo=n.idno
      ) p
where k.CallNo=p.tel;

END

 select * from Temp_CallRecord;
 --delete from temp_callrecord;
         exec SP_DBA_InsertCallNoChange;
         exec SP_DBA_SolveConfictOfCallNo;
         
         select * into oca_callserviceOld0509 from Oca_CallService;
         select * into Oca_OldManConfigInfoOld0509 from Oca_OldManConfigInfo;
         
         select COUNT(*) from Oca_OldManConfigInfoOld0509; ---15108
          select COUNT(*) from Oca_OldManConfigInfo; --16125