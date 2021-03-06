﻿
#region 模型代码文件说明
/*****************************************************************************
 * $Author: $
 * $Revision: $
 * $Date: 2015-01-19 $
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

namespace SmartLife.Share.Models.Pub
{
    /// <summary>
    /// Flow模型
    /// </summary>
    public class Flow : BaseModel
    {
        #region 属性
        /// <summary>
        /// 流转Id
        /// </summary>
        public Guid? FlowId { get; set; }
        /// <summary>
        /// 序号
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public byte? Status { get; set; }
        /// <summary>
        /// 录入时间
        /// </summary>
        public DateTime? CheckInTime { get; set; }
        /// <summary>
        /// 操作人
        /// </summary>
        public Guid? OperatedBy { get; set; }
        /// <summary>
        /// 操作时间
        /// </summary>
        public DateTime? OperatedOn { get; set; }
        /// <summary>
        /// 业务对象Id
        /// </summary>
        public Guid? BIZ_ID { get; set; }
        /// <summary>
        /// 表名
        /// </summary>
        public string TableName { get; set; }
        /// <summary>
        /// 从
        /// </summary>
        public int? FlowFrom { get; set; }
        /// <summary>
        /// 到
        /// </summary>
        public int? FlowTo { get; set; }
        /// <summary>
        /// 处理结果
        /// </summary>
        public int? ProcessResult { get; set; }
        /// <summary>
        /// 处理意见
        /// </summary>
        public string ProcessComment { get; set; }
        /// <summary>
        /// 处理意见2
        /// </summary>
        public string ProcessComment2 { get; set; }
        /// <summary>
        /// 处理人抬头
        /// </summary>
        public string ProcessTitle { get; set; }
        /// <summary>
        /// 流转定义Id
        /// </summary>
        public Guid? FlowDefineId { get; set; }
        #endregion

        #region 重写方法
        /// <summary>
        /// 获取模型名称
        /// </summary>
        public override string GetMappingModelName()
        {
            return "Flow";
        }
        /// <summary>
        /// 获取表名称
        /// </summary>
        public override string GetMappingTableName()
        {
            return "Pub_Flow";
        }
        #endregion
    }

    /// <summary>
    /// Flow主键
    /// </summary>
    public class FlowPK : IPrimaryKeys
    {
        #region 属性
        /// <summary>
        /// 流转Id
        /// </summary>
        public Guid? FlowId { get; set; }
        #endregion
    }
}
