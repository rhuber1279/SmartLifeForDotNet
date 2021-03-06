﻿
#region 模型代码文件说明
/*****************************************************************************
 * $Author: $
 * $Revision: $
 * $Date: 2015-08-04 $
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

namespace SmartLife.Share.Models.Pam
{
    /// <summary>
    /// AssessmentResult模型
    /// </summary>
    public class AssessmentResult : BaseModel
    {
        #region 属性
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 录入时间
        /// </summary>
        public DateTime? CheckInTime { get; set; }
        /// <summary>
        /// 状态
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
        /// 老人Id
        /// </summary>
        public Guid? OldManId { get; set; }
        /// <summary>
        /// 工作项
        /// </summary>
        public string WorkItem { get; set; }
        /// <summary>
        /// 工作计划
        /// </summary>
        public string WorkSchedule { get; set; }
        /// <summary>
        /// 工作量
        /// </summary>
        public int? Workload { get; set; }
        /// <summary>
        /// 提醒标识
        /// </summary>
        public byte? RemindFlag { get; set; }
        /// <summary>
        /// 提醒重复次数
        /// </summary>
        public int? RemindRepeats { get; set; }
        /// <summary>
        /// 播放重复次数
        /// </summary>
        public int? PlayRepeats { get; set; }
        /// <summary>
        /// 勾选标识
        /// </summary>
        public byte? CheckFlag { get; set; }
        /// <summary>
        /// 勾选说明
        /// </summary>
        public string CheckDescription { get; set; }
        /// <summary>
        /// 来源表
        /// </summary>
        public string SourceTable { get; set; }
        /// <summary>
        /// 来源编号
        /// </summary>
        public string SourceId { get; set; }
        #endregion

        #region 重写方法
        /// <summary>
        /// 获取模型名称
        /// </summary>
        public override string GetMappingModelName()
        {
            return "AssessmentResult";
        }
        /// <summary>
        /// 获取表名称
        /// </summary>
        public override string GetMappingTableName()
        {
            return "Pam_AssessmentResult";
        }
        #endregion
    }

    /// <summary>
    /// AssessmentResult主键
    /// </summary>
    public class AssessmentResultPK : IPrimaryKeys
    {
        #region 属性
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        #endregion
    }
}
