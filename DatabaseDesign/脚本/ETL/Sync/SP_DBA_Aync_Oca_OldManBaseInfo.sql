/*******************************************************************************************/
/* SP_DBA_Aync_Oca_OldManBaseInfo                                                          */
/* ��1203��ľ�����Ϣ ͬ����ҵ�������˻�����Ϣ���������                                 */
/* @Phase   1 ������ǰ�� 2��������*/
/*******************************************************************************************/
create procedure [dbo].[SP_DBA_Aync_Oca_OldManBaseInfo]
@Phase int
as
begin

	if (@Phase=1)
	   begin
		exec  SP_DBA_Aync_Oca_OldManBaseInfo_Phase1
	   end 
	   
     if (@Phase=2)
	   begin
	   
		exec   SP_DBA_Aync_Oca_OldManBaseInfo_Phase2
	   end   
        
end
