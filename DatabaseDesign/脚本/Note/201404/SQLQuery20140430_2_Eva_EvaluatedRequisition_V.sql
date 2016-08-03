EXEC dbo.sp_update_job
    @job_name = N'refresh_oldman_locate_10min',
    @new_name = N'refresh_oldman_locate_5min',
     @owner_login_name = 'job'
     
     exec sp_help_job
     
     select * from sys.all_sql_modules;
     
select * from sys.dm_db_script_level; 
select * from sys.dm_db_index_usage_stats order by user_scans desc

/***********************************************************************/
/* Eva_EvaluatedRequisition_V                                          */
/*  ��������ͼ                                                       */
/*  Ϊ����� ��� ����Դ��ѧ������ס������ֶε� ������Ϣ�ֶ�          */
/***********************************************************************/
create view Eva_EvaluatedRequisition_V
as 
select  RequisitionId,Id,CheckInTime,Status,OperatedBy,OperatedOn,DataSource,ResidentId,
		ResidentName,ResidentStatus,ResidentBizId,IDNo,Gender,Nation,NativePlace,
		HouseholdRegister,Familys,EducationLevel,EducationLevelNodes,Marriage,LivingStatus,
		HousingStatus,HousingStatusNodes,IncomeStatus,IncomeStatusNodes,AreaId,AreaId2,
		AreaId3,ResidentialAddress,PlaceOfHouseholdRegister,PostCode,Tel,Mobile,ServeItemType,
		ProxyName,ProxyAddress,ProxyPostCode,ProxyTel,ProxyMobile,RelationshipOfResident ,
		case gender when 'M' then '��'  when 'F' then 'Ů'  else 'Ů' end GenderName,
		case status when 0 then 'ɾ��' when 1 then '����' else 'δ֪' end StatusName,
		case ResidentStatus when 1 then '����' when 3 then 'Ǩ��' else 'δ֪' end ResidentStatusName,
		dbo.FUNC_Tol_GetDictionaryItemName('00012',DataSource) DataSourceName,
		dbo.FUNC_Tol_GetDictionaryItemName('00017',EducationLevel) EducationLevelName,
		dbo.FUNC_Tol_GetDictionaryItemName('00005',NativePlace) NativePlaceName,
		dbo.FUNC_Tol_GetDictionaryItemName('00016',HouseholdRegister) HouseholdRegisterName,
		dbo.FUNC_Tol_GetDictionaryItemName('00018',Marriage) MarriageName,
		dbo.FUNC_Tol_GetDictionaryItemName('00019',LivingStatus) LivingStatusName,
		dbo.FUNC_Tol_GetDictionaryItemName('00020',HousingStatus) HousingStatusName,
		dbo.FUNC_Tol_GetDictionaryItemName('00021',IncomeStatus) IncomeStatusName,
		dbo.FUNC_Tol_GetDictionaryItemName('01005',ResidentbizId) ResidentbizIdName,
		dbo.FUNC_Tol_GetDictionaryItemName('12002',ServeItemType) ServeItemTypeName,
		dbo.FUNC_Tol_GetDictionaryItemName('00005',AreaId) AreaIdName,
		(select top 1 areaname from Pub_Area where areaid2=a.areaid2) AreaId2Name,
		(select top 1 areaname from Pub_Area where areaid3=a.areaid3) AreaId3Name
from Eva_EvaluatedRequisition a
;

select   dbo.joinStr(name)
from    sys.all_columns 
where  object_id   in 
            (   select  object_id 
                from    sys.tables 
               where  name='Eva_EvaluatedRequisition'
             )
