select * from dbo.Cfg_ETL_ConnectManager_V

insert into Cfg_ETL_ConnectManager (Name,Description,ConnectString,Abbr)values('impdest','����Ŀ���������','-U sa -P 1,leblue@2013 -S 115.236.175.109,10016','BCP');

update Cfg_ETL_ConnectManager set ConnectString='-U sa -P 1,leblue@2013 -S 115.236.175.109,10016 -d WeiXin-12 ' where ID=3

select @@DATEFIRST 
select @@DBTS;
select @@SPID;

create table Cfg_ETL_Variable
(
EvaluateAsExpression bit default(1) not null,----1 ΪTRUE��ֵ�ɱ��ʽȷ�����ֹ���ֵ��Ч��
Description         varchar(max) null,
Expression          varchar(100) null,
Name               nvarchar(100) null,
Namespace           varchar(50) null,
RaiseChangedEvent  bit default(1) not null,---1 ΪTRUE ��ÿ�α������£����ᴥ���¼���
Scope               varchar(100),
Value              varchar(100),
ValueType           varchar(10)
)


create table Cfg_ETL_ColumnNullRatio
(
TableName   varchar(100) not null,
ColumnName  varchar(100) not null,
Value      float not null
);

create table Cfg_ETL_ColumnStatistics
(

)

create table Cfg_ETL_ColumnValueDistribution
(

)

create table Cfg_ETL_ColumnLengthDistribution
(

)

create table Cfg_ETL_ColumnMode
(

)

create table Cfg_ETL_SelectingKey
(

)

create table Cfg_ETL_FunctionDepenceRation
(

)


insert into Cfg_ETL_Variable (Description,Expression,Name,Namespace,Scope,Value,ValueType)values('ȡ������������ݣ�����','1','DiffDaysToToday','user','package','16','int');

insert into Cfg_ETL_Variable (Description,Expression,Name,Namespace,Scope,Value,ValueType)values('��ֵ��ʾÿ�ܵĵ�һ��','1','DATEFIRST','system','package','7','int');

insert into Cfg_ETL_Variable (Description,Expression,Name,Namespace,Scope,Value,ValueType)values('���ص�ǰ���ݿ⣬��ǰtimestamp������ֵ','1','DBTS','system','package','2000','int');

insert into Cfg_ETL_Variable (Description,Expression,Name,Namespace,Scope,Value,ValueType)values('ȡ������������ݣ�����','1','SPID','user','package','16','int');

insert into Cfg_ETL_Variable (Description,Expression,Name,Namespace,Scope,Value,ValueType)values('ȡ������������ݣ�����','1','DiffDaysToToday','user','package','16','int');
select value,* from Cfg_ETL_Variable where Name='DiffDaysToToday';

select * from remote_dbo.[smartlife-120301].dbo.oca_oldmanbaseinfo
where DATEDIFF(day,checkintime,getdate())='6';

update Cfg_ETL_Variable set Value=10 where Name='DiffDaysToToday';

exec SP_ETL_ExpData @tablename='[Smartlife-1203].dbo.Bas_ResidentBaseInfo'
exec SP_ETL_ExpData @tablename='[smartlife-120301].dbo.oca_oldmanbaseinfo'
select top 10 * from remote_dbo.[smartlife-1203].dbo.Bas_ResidentBaseInfo order by CheckInTime desc

drop table oca_oldmanbaseinfostep1 ;
select * into oca_oldmanbaseinfostep1 
		from remote_dbo.[smartlife-120301].dbo.oca_oldmanbaseinfo
		where 1=0


��Ϣ 117������ 15��״̬ 1���� 3 ��
���� ���� 'remote_dbo.smartlife-120301.dbo.dbo.oca_oldmanbaseinfo' ������ǰ׺�����������ֵ�����ֻ���� 3 ����

select * from oca_oldmanbaseinfostep1


select COUNT(idno),SUBSTRING(name,1,1) from Oca_OldMan
group by SUBSTRING(name,1,1)
having COUNT(idno)>1
order by COUNT(idno) desc


select @@options
select @@FETCH_STATUS;
select @@CURSOR_ROWS;
select @@PROCID;
select @@ERROR;
select @@IDENTITY;
select @@ROWCOUNT;
select @@TRANCOUNT;
select @@NESTLEVEL;