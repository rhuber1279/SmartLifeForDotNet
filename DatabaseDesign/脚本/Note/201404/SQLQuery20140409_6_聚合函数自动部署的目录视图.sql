select * from sys.all_sql_modules;

select * from sys.all_parameters
where object_id in (select object_id from sys.all_objects where name='sp_etl_column');


select * from sys.all_parameters
where object_id in (select object_id from sys.assembly_modules where assembly_class='JoinStrEx');------����

select * from sys.assemblies;----------����
select *,LEN(content) from sys.assembly_files;  -----���ɽű��Ĳ�ѯ��ͼ
select * from sys.assembly_modules;  ---�ۺϺ�������
select * from sys.assembly_references;  
select * from sys.assembly_types;


