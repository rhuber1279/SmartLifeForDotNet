select count(*)  ,CONVERT(varchar(7),checkintime,120)
  from dbo.IPCC_CallRecord
group by CONVERT(varchar(7),checkintime,120);
-------------=======================================

declare @tablename varchar(100) , @Statement nvarchar(4000)
select  @tablename='IPCC_CallRecord_'+convert(varchar(6),dateadd(MONTH,-1,getdate()),112)
print @tablename
set @Statement=' select * into '+@tablename+' from dbo.IPCC_CallRecord 
where convert(varchar(6),checkintime,112)=convert(varchar(6),dateadd(MONTH,-1,getdate()),112)';
select @Statement
exec sp_executesql  @Statement   , @tablename


--------------------===================================
select convert(varchar(6),dateadd(MONTH,-1,getdate()),112),convert(varchar(7),dateadd(MONTH,-1,getdate()),120)

insert into IPCC_CallRecord_201402 select * from dbo.IPCC_CallRecord   where convert(varchar(6),checkintime,112)=convert(varchar(6),dateadd(MONTH,-1,getdate()),112)

select * into IPCC_CallRecord_201402 from dbo.IPCC_CallRecord   where convert(varchar(6),checkintime,112)=convert(varchar(6),dateadd(MONTH,-1,getdate()),112)