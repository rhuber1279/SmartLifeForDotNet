----step 3 ��δ֪���˵ĵ绰�ţ����¼����ϵĵ绰�ŵĳ�ͻ������£������ñ��У���δ֪���˵ĵ绰�������ñ�����ա�
update  Oca_OldManConfigInfo  set  CallNo=''
 from  Oca_OldManConfigInfo  b
where b.OldManId in 
                   (
                    select a.OldManId from dbo.Oca_OldManBaseInfo a where a.OldManName like 'δ֪%' 
                   ) 
     and  b.CallNo in 
                  (
                   select n.tel 
                   from (
                          select b.CallNo,a.OldManName,a.IDNo 
                          from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
                              on a.OldManId=b.OldManId 
                          where  b.CallNo is null and  a.OldManName not like 'δ֪%' 
                          ) m,
                         ( select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets
                         )n
                   where m.OldManName=n.oldmanname and m.IDNo=n.idno
                   )
-----------------step 1 end

----------step 2 �����ñ��У�����Ҫ��ӵ绰��������˵ĺ��� �ɿ�ֵ��Ϊʵ�ʵ���ʵֵ��
insert into   Oca_OldManConfigInfo  (OldManId,CheckInTime,CallNo,LocateFlag,GovTurnkeyFlag)
select m.oldmanid,GETDATE() checkintime,n.tel callno,0 locateflag,0 govturnkeyflag
from  (
        select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
        from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
             on a.OldManId=b.OldManId 
        where b.CallNo is null and  a.OldManName not like 'δ֪%' 
       ) m,
      (
         select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets
      )n
where m.OldManName=n.oldmanname and m.IDNo=n.idno;

select oldmanid,GETDATE() checkintime,tel callno,0 locateflag,0 govturnkeyflag
from Temp_CallRecord 
where type='add';
-----------------------step 2 insert end 
select * from Oca_OldManConfigInfo where OldManId in
(
select m.oldmanid
from (
select b.CallNo,a.IDNo,a.OldManName,a.OldManId from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where 
b.CallNo is null and 
a.OldManName not like 'δ֪%' ) m,
(select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets)n
where m.OldManName=n.oldmanname and m.IDNo=n.idno)

-----------step 1 ��callservice ���У��� δ֪���˵�oldmanid,��Ϊ �¼Ӻ�������˵�oldmanid.
select k.OldManId sourcevalue,k.CallNo,p.OldManId targetvalue,k.CallServiceId
from (
       select b.CallNo,a.OldManId,a.OldManName,a.IDNo ,c.CallServiceId
       from dbo.Oca_OldManBaseInfo a , Oca_OldManConfigInfo b ,oca_callservice c 
       where a.OldManName like 'δ֪%' and a.OldManId=b.OldManId and a.oldmanid=c.oldmanid
    ) k,
   (
     select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid
     from (
           select b.CallNo,a.IDNo,a.OldManName,a.OldManId from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
           on a.OldManId=b.OldManId where 
          b.CallNo is null and 
          a.OldManName not like 'δ֪%' 
         ) m,
         (select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets
         )n
     where m.OldManName=n.oldmanname and m.IDNo=n.idno
   ) p
where k.CallNo=cast(cast(p.tel as bigint) as  varchar(11))

------------------------------------
select COUNT(*) from Oca_CallService;
---------------------------------
update Oca_CallService 
set OldManId=o.targetvalue
from Oca_CallService a,(
  select k.OldManId sourcevalue,k.CallNo,p.OldManId targetvalue,k.CallServiceId
  from (
       select b.CallNo,a.OldManId,a.OldManName,a.IDNo ,c.CallServiceId
       from dbo.Oca_OldManBaseInfo a , Oca_OldManConfigInfo b ,oca_callservice c 
       where a.OldManName like 'δ֪%' and a.OldManId=b.OldManId and a.oldmanid=c.oldmanid
    ) k,
   (
     select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid
     from (
           select b.CallNo,a.IDNo,a.OldManName,a.OldManId from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
           on a.OldManId=b.OldManId where 
          b.CallNo is null and 
          a.OldManName not like 'δ֪%' 
         ) m,
         (select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets
         )n
     where m.OldManName=n.oldmanname and m.IDNo=n.idno
   ) p
  where k.CallNo=cast(cast(p.tel as bigint) as  varchar(11))
)  o
where a.CallServiceId=o.CallServiceId and a.CallServiceId in 
(
   select k.CallServiceId
   from (
       select b.CallNo,a.OldManId,a.OldManName,a.IDNo ,c.CallServiceId
       from dbo.Oca_OldManBaseInfo a , Oca_OldManConfigInfo b ,oca_callservice c 
       where a.OldManName like 'δ֪%' and a.OldManId=b.OldManId and a.oldmanid=c.oldmanid
    ) k,
   (
     select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid
     from (
           select b.CallNo,a.IDNo,a.OldManName,a.OldManId from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
           on a.OldManId=b.OldManId where 
          b.CallNo is null and 
          a.OldManName not like 'δ֪%' 
         ) m,
         (select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets
         )n
     where m.OldManName=n.oldmanname and m.IDNo=n.idno
   ) p
  where k.CallNo=cast(cast(p.tel as bigint) as  varchar(11))
 
)
------------------------------step 1 ��callservice ���У��� δ֪���˵�oldmanid,��Ϊ �¼Ӻ�������˵�oldmanid.
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
---------------
select a.oldmanid,b.CallServiceId from temp_callrecord a,Oca_CallService b  where a.TYPE='2' and a.oldmanid=b.OldManId;
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


-----------------------=================��Ҫ��ӵ绰�ŵ��������ü�¼  8170


insert into Temp_CallRecord (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select m.idno,m.OldManName,m.oldmanid ,n.tel,n.idno IdNoNew,n.oldmanname OldManNameNew,null OldManIdNew,'add' type 
from (
select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where 
b.CallNo is null and 
a.OldManName not like 'δ֪%' ) m,
(select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets)n
where m.OldManName=n.oldmanname and m.IDNo=n.idno

----------------------------------------==========���� 2786
insert into Temp_CallRecord  (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select m.idno,m.OldManName,m.oldmanid,n.tel,n.idno IdNoNew,n.oldmanname OldManNameNew,null OldManIdNew,'0' TYPE
from (
select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where 
b.CallNo is not null and 
a.OldManName not like 'δ֪%' ) m,
(select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets)n
where m.OldManName=n.oldmanname and m.IDNo=n.idno and m.CallNo=n.tel

-------------------------------------------------------- 8401
select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid,n.oldmanname,n.idno
from (
select b.CallNo,a.IDNo,a.OldManName,a.OldManId 
from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where 
b.CallNo is not null and 
a.OldManName  like 'δ֪%' ) m,
(select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets)n
where   m.CallNo=n.tel

------------------------------------------------------------------------
insert into Temp_CallRecord  (idno,OldManName,oldmanid ,tel,IdNoNew,OldManNameNew,OldManIdNew,type )
select k.idno,k.oldmanname ,k.OldManId,k.CallNo,p.IDNo IdNoNew,p.OldManName OldManNameNew,p.OldManId OldManIdNew,'2' type
from (
select b.CallNo,a.OldManId,a.OldManName,a.IDNo 
from dbo.Oca_OldManBaseInfo a inner join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where a.OldManName like 'δ֪%'
) k,(
select m.idno,m.OldManName,m.CallNo,n.tel,m.oldmanid
from (
select b.CallNo,a.IDNo,a.OldManName,a.OldManId from dbo.Oca_OldManBaseInfo a left join Oca_OldManConfigInfo b
on a.OldManId=b.OldManId where 
b.CallNo is null and 
a.OldManName not like 'δ֪%' ) m,
(select  oldmanname,idno,callno tel,areaid2 from dbo.temp_mutisheets)n
where m.OldManName=n.oldmanname and m.IDNo=n.idno
) p
where k.CallNo=p.tel;


select * from Temp_CallRecord where type<>'0';
select * from Temp_MutiSheets;



select * 
from Temp_MutiSheets a
where a.IdNo not in (
                         select IdNo
                         from Oca_OldManBaseInfo
                        
                     )
     -----------------------------------У�����֤�������ĳ������� ��ѯ������������֤��������                
         select a.IdNo,a.OldManName name_inexcel,c.IDNo,c.OldManName name_indb
         from  (            
                    select idno,oldmanname,areaid2
                    from Temp_MutiSheets 
                )a,    
             --   Pub_Area b,
                (    
                    select idno,oldmanname,areaid2 
                    from oca_oldmanbaseinfo
               --     where AreaId2 is null
                 ) c   
         where a.IdNo=c.IDNo  and replace(a.OldManName,' ','')<>replace(c.OldManName,' ','') 
         
         ----------------------------------------���֤��λ������ȷ��
         select 
         newid() oldmanid,
           f1
          ,len(f4) length_num
           ,f4
            from  dbo.sheetSource where LEN(f4)<>18 and LEN(f4)<>15  
       ----------------------------------  
         
         select LEN(replace('��  ��',' ','')),replace('��  ��',' ','')  
         
       
          select * from Temp_MutiSheets where IdNo='330104192803183012'
          select top 30 * from dbo.Sheet12$
          
          and replace(a.OldManName,' ','')=replace(c.OldManName,' ','')
          select * from Pub_Area where AreaName like '%��';
         
         select * from Oca_OldManBaseInfo;
         
         select * from Sys_DictionaryItem where DictionaryId='00012'
         
         --------------------------------============================================================
         update Pub_Area set AreaName=REPLACE(areaname,'��','�ֵ�') where AreaName like '%��';
         
         update Oca_OldManBaseInfo set AreaId2=n.AreaId
         from Oca_OldManBaseInfo m, (
           select a.IdNo,a.OldManName name_inexcel,c.OldManName name_indb,b.AreaId,c.AreaId2
         from  (            
                    select idno,oldmanname,areaid2
                    from Temp_MutiSheets 
                )a,    
              Pub_Area b,
                (    
                    select idno,oldmanname,areaid2 
                    from oca_oldmanbaseinfo
                    where AreaId2 is null
                 ) c   
         where a.IdNo=c.IDNo 
          and replace(a.AreaId2,' ','')=replace(b.AreaName,' ','')
          ) n
          where m.IDNo=n.IdNo and m.AreaId2 is null
          
          ----------------------------------
                 update Oca_OldManBaseInfo set AreaId3=n.AreaId
         from Oca_OldManBaseInfo m, (
           select a.IdNo,a.OldManName name_inexcel,c.OldManName name_indb,--b.AreaId,
                  c.AreaId3
         from  (            
                    select idno,oldmanname,areaid3
                    from Temp_MutiSheets --where areaid3 in (select distinct areaname from pub_area)
                )a,    
             -- Pub_Area b,
                (    
                    select idno,oldmanname,areaid3 
                    from oca_oldmanbaseinfo
                    where AreaId3 is null
                 ) c   
         where a.IdNo=c.IDNo and a.areaid3=b.AreaName
          and replace(a.AreaId3,' ','')=replace(b.AreaName,' ','')
          ) n
          where m.IDNo=n.IdNo and m.AreaId2 is null
          
   ----------------------------------------====================================================       
          alter table temp_mutisheets add areaid3 nvarchar(255) null;
          
          select * from Temp_MutiSheets where areaid3 is  null;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet10$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet11$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet12$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet13$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet14$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet15$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet16$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet17$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet18$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet19$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          -------------------------------------------------
           update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet20$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet21$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet22$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet23$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet24$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet25$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet26$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet27$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet28$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet29$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          -------------------------------------
           update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet30$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet31$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet32$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet33$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet34$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet35$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet36$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet37$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet38$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet9$ b
          where a.areaid3 is null and  a.IdNo=b.F4;

          update temp_mutisheets set areaid3=b.f17
          from Temp_MutiSheets a,dbo.Sheet8$ b
          where a.areaid3 is null and  a.IdNo=b.F4;
          
          
          select * into remote_dbo.[smartlife-120303].Temp_MutiSheets from Temp_MutiSheets
          
            insert into remote_dbo.[SmartLife-120303].Temp_MutiSheets 
            select * from Temp_MutiSheets
          