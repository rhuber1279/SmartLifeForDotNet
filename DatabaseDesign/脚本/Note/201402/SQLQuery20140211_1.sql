select 2014-substring(idno,7,4),birthday from dbo.Oca_OldManBaseInfo;
select '0571-'+right(longitudes,8) from dbo.Oca_OldManBaseInfo where id<18 Address is null;
select * from dbo.Oca_OldManLocateInfo;
select * from dbo.Oca_CallService;

select  * from dbo.vSystem_Info_Columns where table_name='oca_callservice';
update dbo.Oca_OldManBaseInfo set Birthday=substring(idno,7,8) where Birthday is null;
update dbo.Oca_OldManBaseInfo set Mobile='15'+right(latitudes,9) where Mobile is null and ID<18;
update dbo.Oca_OldManBaseInfo set Tel='0571-'+right(longitudes,8) where Tel is null and ID<18;

update dbo.oca_oldmanbaseinfo set Address='������԰��԰20��301',LongitudeS='120.1950352771',LatitudeS='30.2382705789' where id%16=1;
update dbo.oca_oldmanbaseinfo set Address='������3��1102',LongitudeS='120.1974939487',LatitudeS='30.2337696514' where id%16=2;
update dbo.oca_oldmanbaseinfo set Address='�ַ绨԰A��6��503',LongitudeS='120.1965222771',LatitudeS='30.2334315789' where id%16=3;
update dbo.oca_oldmanbaseinfo set Address='��¡����15��102',LongitudeS='120.1941794083',LatitudeS='30.2462822276' where id%16=4;
update dbo.oca_oldmanbaseinfo set Address='��¡����13��301',LongitudeS='120.1941794083',LatitudeS='30.2462822276' where id%16=5;
update dbo.oca_oldmanbaseinfo set Address='ϼ�ͱ���12��505',LongitudeS='120.1895683511',LatitudeS='30.2436933494' where id%16=6;
update dbo.oca_oldmanbaseinfo set Address='ϼ�ͱ���3��502',LongitudeS='120.1890319093',LatitudeS='30.2434894295' where id%16=7;
update dbo.oca_oldmanbaseinfo set Address='ϼ���ϴ�9��301',LongitudeS='120.1879590257',LatitudeS='30.2422102859' where id%16=8;
update dbo.oca_oldmanbaseinfo set Address='������԰��԰37��1502',LongitudeS='120.1975392771',LatitudeS='30.2375945789' where id%16=9;
update dbo.oca_oldmanbaseinfo set Address='�����´�7��401',LongitudeS='120.184523331',LatitudeS='30.2389835195' where id%16=10;
update dbo.oca_oldmanbaseinfo set Address='�Ľ�·2Ū4��Ԫ102',LongitudeS='120.2031495347',LatitudeS='30.2378401763' where id%16=11;
update dbo.oca_oldmanbaseinfo set Address='��¡����5��201',LongitudeS='120.1953294083',LatitudeS='30.2452932276' where id%16=12;
update dbo.oca_oldmanbaseinfo set Address='��¡·1Ū5��302',LongitudeS='120.1957840083',LatitudeS='30.2448586276' where id%16=13;
update dbo.oca_oldmanbaseinfo set Address='ʼ���Ż�԰7��403',LongitudeS='120.1883238061',LatitudeS='30.2447870944' where id%16=14;
update dbo.oca_oldmanbaseinfo set Address='½�Һ�ͷС��7��301',LongitudeS='120.1840984758',LatitudeS='30.2422901642' where id%16=15;
update dbo.oca_oldmanbaseinfo set Address='½�Һ�ͷС��7��301',LongitudeS='120.1840984758',LatitudeS='30.2422901642' where id%16=0;

