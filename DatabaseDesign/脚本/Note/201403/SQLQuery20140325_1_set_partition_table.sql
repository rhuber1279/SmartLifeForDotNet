------------��ѯĿ¼��ͼ���˽�ϵͳ�����е��ļ��飬�ļ������ݿռ䡣
select *
from sys.filegroups 
select *
from sys.database_files;
select * 
from sys.data_spaces;

--------���ļ���
alter database smartlife add filegroup test1fg;

declare @i int,@str nvarchar(4000)
set @i=0
set @str=''
while (select @i)<20
begin
set @i=@i+1
print @i
set @str='alter database smartlife add filegroup test'+cast(@i as nvarchar(10))+'fg;'
exec sp_executesql @str
end

-----------------Ϊ�ļ�������ļ�
ALTER DATABASE smartlife 
ADD FILE 
(
    NAME = Test1dat2,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\100\t1dat2.mdf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
) TO FILEGROUP test1fg
;

declare @i int,@str nvarchar(4000)
set @i=0
set @str=''
while (select @i)<20
begin
set @i=@i+1
print @i
set @str='ALTER DATABASE smartlife 
ADD FILE 
(
    NAME = Test1dat2,
    FILENAME =''C:\Program Files\Microsoft SQL Server\100\t'+cast(@i as nvarchar(10))+'dat2.mdf'',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
) TO FILEGROUP test'+cast(@i as nvarchar(10))+'fg
;'
exec sp_executesql @str
end

/*------------
�����ѷ�����
����ʾ������һ�����������������������Ϊ�ĸ�������Ȼ�󣬴�ʾ����������ָ�������ĸ�����
���ļ���ķ����ܹ�����󣬴�ʾ������ʹ�ô˷����ܹ��ı���ʾ���ٶ����ݿ����Ѿ������ļ��顣

 ���ƴ��� */
CREATE PARTITION FUNCTION myRangePF1 (int)
    AS RANGE LEFT FOR VALUES (1, 100, 1000) ;
GO

CREATE PARTITION SCHEME myRangePS1
    AS PARTITION myRangePF1
    TO (test1fg, test2fg, test3fg, test4fg) ;
GO

CREATE TABLE PartitionTable (col1 int, col2 char(10))
    ON myRangePS1 (col1) ;


CREATE TABLE [dbo].[zping.com](
 
    [id] [varchar](32) NOT NULL,
 
    [sid] int,
 
    [hashid] AS (checksum([id])) PERSISTED
 
)
 
ON [zping.com.Ps] ([hashid])



��Ϣ 1908������ 16��״̬ 1���� 3 ��
�� 'Id' ������ 'PK_Oca_OldManBaseInfoPartition' �ķ��������С�Ψһ�����ķ��������б��������������Ӽ���
��Ϣ 1750������ 16��״̬ 0���� 3 ��
�޷�����Լ���������ǰ��Ĵ�����Ϣ��


��Ϣ 7726������ 16��״̬ 1���� 1 ��
���������� 'OldManId' ���������� uniqueidentifier ��������� 'myRangePF1' �Ĳ����������� int ��ͬ��
��Ϣ 1750������ 16��״̬ 0���� 1 ��
�޷�����Լ���������ǰ��Ĵ�����Ϣ��

Ϊ�ۼ����� 'PK_Oca_OldManBaseInfoPartition' ָ���� �ļ���'PRIMARY' ���ڱ� 'dbo.Oca_OldManBaseInfoPartition'��
��ȻΪ��ָ���� �������� 'myRangePS1'��

-------------------------------------------------------------------------------------------------------------------------

�������ִ�еĲ�ѯ�漰���������ѷ�����֮���ͬ�����ӣ�����Щ��ѯ�ķ���������Ӧ�������ӱ������ڵ�����ͬ��
���⣬Ӧ������������Щ������ǵ�����������ζ������Ҫôʹ��ͬһ��������������Ҫôʹ�������·��������ͬ�Ĳ�ͬ������
?
������ͬ���������ڽ��з����Ĳ�������Ӧ�Ĳ���������ͬ���������͡�

?
��������ͬ�����ķ�����

?
��������ͬ�ķ����߽�ֵ��


����һ����SQL Server ��ѯ�Ż����Ϳ��Ը���ش������ӣ���Ϊ���������������ӡ������ѯ���ӵ��������ֶ�δ����
��δ������������������ĳ���ʵ���ϻή�Ͷ�������߲�ѯ�����ٶȡ�


�����������ֻ����������ͣ���ʹ���ַ������͵��У�Ҳ���԰�����ĸ˳����з��������������͵��в������ڷ�����
text��ntext��image��xml��timestamp��varchar(max)��nvarchar(max)��varbinary(max)��������hierarchyid��
�ռ������� CLR �û�������������͡����⣬���ʹ�ü�������Ϊ�����У�����뽫������Ϊ�־û��У�Persisit����

���б��·����ṩ������ѡ�
1.���䵽���÷����� 
��Ҫ����ͬһ���ݿ�������һ���ѷֺ����ı�ͬʱ�ñ�ķ����к͵�ǰѡ�е��е�������ȫһ�¡� 
�����ĺô��ǵ����ű��ڲ�ѯ���й���ʱ������������о��Ƿ�����ʱ��ʹ��ͬ���ķ������Ի����Ч�ʡ� 
2.����Ψһ������Ψһ�����Ĵ洢�ռ����Ϊ������������һ�£� 
�����Ὣ���е���������Ҳһͬ������ʵ�֡����롱������һ����Ҫ���鷳��ѡ��������������MSDN���ѷ�������������ָ��ԭ�򣩡� 
�����ĺô��Ǳ�������ķ���һ�£�һ�����ѯʱ����������Ϊ��Ч�������������ᵽ�������Ƴ�����Ҳ���Ϊ��Ч�� 

ע�⣺���ｨ��ʹ�þۼ���������Ϊ�����С�һ���������ṹ�����Ӧ���ѯ��أ���ô������������һ�»ᱣ֤��ѯ�����Ч�ʣ�
��һ���棬��֤������������Ǿۼ����������Ǳ�֤�����������Ƴ�����˳����ǰ�ᣬ������ܻ�����޷������Ƴ����������
�����������Ƴ����ǹ�������ݵ���Ҫ���ԡ����������ڣ�SlideWindow�����ԵĻ������������⣬���Ҫ�����������룬��Ҫ
���������ͱ��ѹ��ģʽһ�¡�


ͨ����ֻ�ϲ��߽�ֵ���ķ���������ͨ��ִ�� ALTER PARTITION FUNCTION�����Խ�ʹ�÷����������κα��������ĳ���������Ϊ����������Ҳ���Խ����������ϲ�Ϊһ��������

ע�⣺ 
��������������ʹ��ͬһ����������ALTER PARTITION FUNCTION �ڵ���������Ӱ��������Щ��������� 

ALTER PARTITION FUNCTION �ڵ���ԭ�Ӳ����ж�ʹ�øú������κα�������������·��������ò������ѻ�״̬�½��У����Ҹ������·����ķ�Χ�����ܻ����Ĵ�����Դ��

ALTER PARTITION FUNCTION ֻ�����ڽ�һ���������Ϊ���������������������ϲ�Ϊһ����������Ҫ������������¶Ա���з������������磬�� 10 �������ϲ�Ϊ 5 �������������Գ���ʹ�������κ�ѡ�����ϵͳ���ã���Щѡ���������Դ���ķ���������ͬ��

ʹ������ķ�����������һ���µ��ѷ�����Ȼ��ʹ�� INSERT INTO...SELECT FROM ��佫�ɱ��е����ݲ����±�


Ϊ�Ѵ��������ۼ�������

ע�⣺ 
ɾ���ѷ����ľۼ����������������ѡ�
 


ͨ���� Transact-SQL CREATE INDEX ����� DROP EXISTING = ON �Ӿ�һ��ʹ����ɾ���������������е��ѷ���������


ִ��һϵ�� ALTER PARTITION FUNCTION ��䡣


ALTER PARITITION FUNCTION ��Ӱ���ȫ���ļ��鶼���봦������״̬��

���ʹ�÷����������κα��д����ѽ��õľۼ�������ALTER PARTITION FUNCTION ����ʧ�ܡ�

SQL Server 2008 �����޸ķ��������ṩ����֧�֡������ڶ������ݿ����ֶ�Ӧ�öԷ������ݿ��еķ��������ĸ��ġ�


select *
from sys.filegroups 
select *,
reverse(substring(reverse(physical_name),charindex('\',reverse(physical_name),0),LEN(physical_name)))
from sys.database_files where data_space_id=1;
select * 
from sys.data_spaces ;

select 
D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\

select @filePath=
reverse(substring(reverse(physical_name),charindex('\',reverse(physical_name),0),LEN(physical_name)))
from sys.database_files where data_space_id=1;

select * 
from sys.partitions
where object_id in(select object_id from sys.tables where name='Bas_ResidentBaseInfo')

select * 
from  sys.partition_range_values

ALTER PARTITION FUNCTION OldManBaseInfoPF1 ()
SPLIT RANGE ('01201');
ALTER PARTITION FUNCTION OldManBaseInfoPF1 ()
MERGE RANGE ('01200');

ALTER PARTITION FUNCTION OldManFamilyInfoPF1 ()
SPLIT RANGE (30);

ALTER PARTITION SCHEME OldManFamilyInfoPS1
NEXT USED test31fg;