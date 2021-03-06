﻿
#region 模型代码文件说明
/*****************************************************************************
 * $Author: $
 * $Revision: $
 * $Date: 2016-01-26 $
 * 
 * iBATIS.NET For DotNet4.0 Models
 * Copyright (C) 2009 - CreateCode v0.5
 * 
 * $Remark: $
 * 
 * 
 * 
 ********************************************************************************/
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e0571.web.core.Model;

namespace SmartLife.Share.Models.Eva
{
    /// <summary>
    /// EvaluatedRequisition_V模型
    /// </summary>
    public class EvaluatedRequisition_V : BaseModel
    {
        #region 属性
        /// <summary>
        /// null
        /// </summary>
        public Guid? RequisitionId { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public DateTime? CheckInTime { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public byte? Status { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public Guid? OperatedBy { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public DateTime? OperatedOn { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string DataSource { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public Guid? ResidentId { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public byte? ResidentStatus { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentBizId { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string IDNo { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string Gender { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string Nation { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string NativePlace { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string HouseholdRegister { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public int? Familys { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string EducationLevel { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string EducationLevelNodes { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string Marriage { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string LivingStatus { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string HousingStatus { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string HousingStatusNodes { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string IncomeStatus { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public decimal? IncomeStatusNodes { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AssessmentResult { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public decimal? AssessmentResultNodes { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaId { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaId2 { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaId3 { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentialAddress { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string PlaceOfHouseholdRegister { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string PostCode { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string Tel { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string Mobile { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ServeItemType { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AccountType { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ProxyName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ProxyAddress { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ProxyPostCode { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ProxyTel { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ProxyMobile { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string RelationshipOfResident { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentialOfHometown { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string StationId { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string GenderName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string StatusName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentStatusName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string EducationLevelName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string NationName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AccountTypeName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string NativePlaceName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string HouseholdRegisterName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentialOfHometownName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string MarriageName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string LivingStatusName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string HousingStatusName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string IncomeStatusName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ResidentbizIdName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string ServeItemTypeName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaIdName { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaId2Name { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string AreaId3Name { get; set; }
        /// <summary>
        /// null
        /// </summary>
        public string StationName { get; set; }
        #endregion

        #region 重写方法
        /// <summary>
        /// 获取模型名称
        /// </summary>
        public override string GetMappingModelName()
        {
            return "EvaluatedRequisition_V";
        }
        /// <summary>
        /// 获取表名称
        /// </summary>
        public override string GetMappingTableName()
        {
            return "Eva_EvaluatedRequisition_V";
        }
        #endregion
    }

    /// <summary>
    /// EvaluatedRequisition_V主键
    /// </summary>
    public class EvaluatedRequisition_VPK : IPrimaryKeys
    {
        #region 属性
        #endregion
    }
}
