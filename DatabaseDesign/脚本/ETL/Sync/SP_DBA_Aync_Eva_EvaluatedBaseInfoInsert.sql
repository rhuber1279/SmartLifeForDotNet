	/****************************************************************************/
		/*SP_DBA_Aync_Eva_EvaluatedBaseInfoInsert                                   */
		/* function: ������������                                                   */
		/* @RefreshTime �������ϴ�ˢ��ʱ�� �ȴ�ʱ�� ������µļ�¼�ű��ӵ����ݿ�    */
		/****************************************************************************/			
					create procedure SP_DBA_Aync_Eva_EvaluatedBaseInfoInsert
					@RefreshTime datetime
					as 
					begin
					
						insert into [Smartlife-120300].dbo.Eva_EvaluatedBaseInfo(ResidentId,CheckInTime,Status,OperatedBy,OperatedOn,
		DataSource,ResidentName,ResidentStatus,ResidentBizId,IDNo,Gender,NativePlace,HouseholdRegister,
		EducationLevel,Marriage,LivingStatus,HousingStatus,IncomeStatus,AreaId,AreaId2,AreaId3,
		ResidentialAddress,PlaceOfHouseholdRegister,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2,
		ResidentialOfHometown,Nation,AccountType)
		
		select ResidentId,GETDATE() CheckInTime,Status,OperatedBy,OperatedOn,'00003' DataSource,
		ResidentName,ResidentStatus,ResidentBizId,IDNo,Gender,NativePlace,HouseholdRegister,
		EducationLevel,Marriage,LivingStatus,HousingStatus,IncomeStatus,AreaId,AreaId2,AreaId3,
		ResidentialAddress,PlaceOfHouseholdRegister,PostCode,Tel,Mobile,Remark,InputCode1,InputCode2,
		ResidentialOfHometown,Nation,AccountType
		from [Smartlife-1203].dbo.Bas_ResidentBaseInfo
		 where IDNo not in(select IDNo from [Smartlife-120300].dbo.Eva_EvaluatedBaseInfo)
		          and AreaId='99999' and Status=1 and (OperatedOn >@refreshtime or CheckInTime >@refreshtime);
					
					end