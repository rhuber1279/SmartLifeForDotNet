﻿
#region 模型代码文件说明
/*****************************************************************************
 * $Author: $
 * $Revision: $
 * $Date: 2013-07-17 $
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

namespace SmartLife.Share.Models.Oca
{
    /// <summary>
    /// ServiceFamilyResponse模型
    /// </summary>
    public class ServiceFamilyResponse : BaseModel
    {
        #region 属性
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 记录时间
        /// </summary>
        public DateTime? CheckInTime { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public byte? Status { get; set; }
        /// <summary>
        /// 响应亲属
        /// </summary>
        public Guid? FamilyMemberId { get; set; }
        /// <summary>
        /// 呼叫服务Id
        /// </summary>
        public Guid? CallServiceId { get; set; }
        #endregion

        #region 重写方法
        /// <summary>
        /// 获取模型名称
        /// </summary>
        public override string GetMappingModelName()
        {
            return "ServiceFamilyResponse";
        }
        /// <summary>
        /// 获取表名称
        /// </summary>
        public override string GetMappingTableName()
        {
            return "Oca_ServiceFamilyResponse";
        }
        #endregion
    }

    /// <summary>
    /// ServiceFamilyResponse主键
    /// </summary>
    public class ServiceFamilyResponsePK : IPrimaryKeys
    {
        #region 属性
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        #endregion
    }
}