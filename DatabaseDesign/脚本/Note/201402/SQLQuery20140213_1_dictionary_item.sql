select * from  Sys_DictionaryItem  where dictionaryId=11013 and itemid like '01%'

insert into Sys_DictionaryItem (dictionaryid,itemid,id,itemcode,itemname,parentid,orderno,levels,endflag,systemflag,description) 
values(11013,'01003',(select MAX(ID)+1 from  Sys_DictionaryItem),'01003','ҽ�Ʊ�������',null,3,1,1,1,'');

update  Sys_DictionaryItem set ItemName='�������'  where DictionaryId=11013 and ItemId='01001';
update  Sys_DictionaryItem set ItemName='ˮ��ҵ�ά��'  where DictionaryId=11013 and ItemId='01002';

select MAX(ID)+1 from  Sys_DictionaryItem

select * from  Sys_DictionaryItem
 where DictionaryId=11013 and ItemId='01001'
 update Sys_DictionaryItem set ItemId='01003' ,ItemCode='01003' where ID=3650 
 -----==================================================
update  Sys_DictionaryItem set ItemName='ͳ������'  where DictionaryId=11013 and ItemId='01001';
update  Sys_DictionaryItem set ItemName='�������'  where DictionaryId=11013 and ItemId='01002';
delete from  Sys_DictionaryItem  where dictionaryId=11013 and itemid='01003';

select name databasename from sys.databases where name like 'smart%' or name like 'IPCC%';