

go
/***********************************************************************/
/*  SP_Cfg_GetJobMain  */
/*  ȡ����ҵ����Ϣ�������ݿ� ��ڳ��� */
/*  ��������,@source_dbNameԴ���ݿ����ڵĻ���,    
    @dest_dbName Ŀ�����ݿ����ڵĻ���  ������������Ĭ��ֵ��
    @source_dbName Ĭ��ʱΪ�洢�������ڵı���
    @dest_dbNameĬ��ʱΪ ���Ƚ�Ŀ�����ݿ�*/
/***********************************************************************/
alter procedure SP_Cfg_GetJobMain
@source_dbName nvarchar(100)='',
@dest_dbName nvarchar(100)='' 
as
begin

    ----------�����ҵ����Ϣ
	exec SP_Cfg_GetJob @source_dbName=@source_dbName,@dest_dbName=@dest_dbName

    ----------�����ҵ�������Ϣ
	exec SP_Cfg_GetJobSteps @source_dbName=@source_dbName,@dest_dbName=@dest_dbName

    ----------�����ҵ�ƻ�����Ϣ
	exec SP_Cfg_GetJobSchedule @source_dbName=@source_dbName,@dest_dbName=@dest_dbName

    ----------�����ҵ���ڵķ���������Ϣ
	exec SP_Cfg_GetJobServer @source_dbName=@source_dbName,@dest_dbName=@dest_dbName
end


                                           
 