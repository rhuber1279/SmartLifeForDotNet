
------------------��麯���Ķ�����ı�����
select e.name,e.lengths,f.lengths
from (
select a.name,LEN(b.definition) lengths
 from sys.all_objects a,sys.all_sql_modules b 
where a.type in ('AF','TF','FN') and a.object_id>0 and a.object_id=b.object_id) e,
 (
select a.name,LEN(b.definition) lengths
 from [remote1].[Smartlife-120399].sys.all_objects a,[remote1].[Smartlife-120399].sys.all_sql_modules b 
where a.type in ('AF','TF','FN') and a.object_id>0 and a.object_id=b.object_id) f
where  e.name=f.name and e.lengths<>f.lengths
;

---------------------------------------------------
Exec sp_droplinkedsrvlogin 'remote1','sa'       --ɾ��ӳ�䣨¼�����ӷ�������Զ�̵�¼֮���ӳ�䣩
Exec sp_dropserver 'remote1'                         --ɾ��Զ�̷���������

exec sp_addlinkedserver  @server='remote1' ,@srvproduct='',
 @provider='SQLOLEDB',
      @datasrc="115.236.175.110,10017"   --Ҫ���ʵķ�����


exec sp_addlinkedsrvlogin @rmtsrvname='remote1'
,@useself=false
,@locallogin='sa'
,@rmtuser='sa'
,@rmtpassword='888'

select top 10 * from [remote1].[Smartlife-120399].dbo.oca_oldmanbaseinfo order by ID desc;
