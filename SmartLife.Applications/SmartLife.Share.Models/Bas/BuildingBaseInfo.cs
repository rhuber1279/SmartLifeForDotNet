﻿
#region 模型代码文件说明
/*****************************************************************************
 * $Author: $
 * $Revision: $
 * $Date: 2014-06-20 $
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

namespace SmartLife.Share.Models.Bas
{
    /// <summary>
    /// BuildingBaseInfo模型
    /// </summary>
    public class BuildingBaseInfo : BaseModel
    {
        #region 属性
        /// <summary>
        /// 楼宇Id
        /// </summary>
        public Guid? BuildingId { get; set; }
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 记录时间
        /// </summary>
        public DateTime? CheckInTime { get; set; }
        /// <summary>
        /// 记录状态
        /// </summary>
        public byte? Status { get; set; }
        /// <summary>
        /// 操作人
        /// </summary>
        public Guid? OperatedBy { get; set; }
        /// <summary>
        /// 操作日期
        /// </summary>
        public DateTime? OperatedOn { get; set; }
        /// <summary>
        /// 数据来源
        /// </summary>
        public string DataSource { get; set; }
        /// <summary>
        /// 楼宇名称
        /// </summary>
        public string BuildingName { get; set; }
        /// <summary>
        /// 路牌号
        /// </summary>
        public string SignNo { get; set; }
        /// <summary>
        /// 单元数量
        /// </summary>
        public int? Units { get; set; }
        /// <summary>
        /// 楼层数量
        /// </summary>
        public int? Floors { get; set; }
        /// <summary>
        /// 道路Id
        /// </summary>
        public Guid? RoadId { get; set; }
        /// <summary>
        /// 所属辖区
        /// </summary>
        public string AreaId { get; set; }
        /// <summary>
        /// 所属街道
        /// </summary>
        public string AreaId2 { get; set; }
        /// <summary>
        /// 所属社区
        /// </summary>
        public string AreaId3 { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 拼音码
        /// </summary>
        public string InputCode1 { get; set; }
        /// <summary>
        /// 五笔码
        /// </summary>
        public string InputCode2 { get; set; }
        #endregion

        #region 重写方法
        /// <summary>
        /// 获取模型名称
        /// </summary>
        public override string GetMappingModelName()
        {
            return "BuildingBaseInfo";
        }
        /// <summary>
        /// 获取表名称
        /// </summary>
        public override string GetMappingTableName()
        {
            return "Bas_BuildingBaseInfo";
        }
        #endregion
    }

    /// <summary>
    /// BuildingBaseInfo主键
    /// </summary>
    public class BuildingBaseInfoPK : IPrimaryKeys
    {
        #region 属性
        /// <summary>
        /// 楼宇Id
        /// </summary>
        public Guid? BuildingId { get; set; }
        #endregion
    }
}