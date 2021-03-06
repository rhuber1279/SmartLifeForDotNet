﻿namespace SmartLife.Client.Seat
{
    partial class frmMainV2X
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMainV2X));
            this.pnlBottom = new System.Windows.Forms.Panel();
            this.pnlCallHoldState = new System.Windows.Forms.Panel();
            this.btnCallHoldState = new System.Windows.Forms.Button();
            this.pnlSeat = new System.Windows.Forms.Panel();
            this.lblUserName = new System.Windows.Forms.Label();
            this.lblUserNameTitle = new System.Windows.Forms.Label();
            this.pnlExt = new System.Windows.Forms.Panel();
            this.lblExtNo = new System.Windows.Forms.Label();
            this.lblExtNoTitle = new System.Windows.Forms.Label();
            this.pnlClock = new System.Windows.Forms.Panel();
            this.xClock4Timer = new win.core.controls.SevenSegmentClock();
            this.xClock = new win.core.controls.SevenSegmentClock();
            this.btnLogout = new System.Windows.Forms.Button();
            this.pnlConfView = new System.Windows.Forms.Panel();
            this.btnViewConf = new System.Windows.Forms.Button();
            this.pnlServiceOnline = new System.Windows.Forms.Panel();
            this.pbWeiXinClientCount = new System.Windows.Forms.PictureBox();
            this.btnServiceOnline = new System.Windows.Forms.Button();
            this.pnlSetBusyFree = new System.Windows.Forms.Panel();
            this.pbHeartbeat = new System.Windows.Forms.PictureBox();
            this.btnSetBusyFree = new System.Windows.Forms.Button();
            this.pnlTransfer = new System.Windows.Forms.Panel();
            this.btnTransfer = new System.Windows.Forms.Button();
            this.pnlSettings = new System.Windows.Forms.Panel();
            this.btnSettings = new System.Windows.Forms.Button();
            this.spLeftRight = new System.Windows.Forms.SplitContainer();
            this.wbWorkArea = new System.Windows.Forms.WebBrowser();
            this.pnlOperateArea = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.cbbServiceList = new System.Windows.Forms.ComboBox();
            this.lblQueueMemberTitle = new System.Windows.Forms.Label();
            this.lblDialBackTitle = new System.Windows.Forms.Label();
            this.wbPhoneList4DialBack = new System.Windows.Forms.WebBrowser();
            this.wbPhoneListQueueMember = new System.Windows.Forms.WebBrowser();
            this.xToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.pnlBottom.SuspendLayout();
            this.pnlCallHoldState.SuspendLayout();
            this.pnlSeat.SuspendLayout();
            this.pnlExt.SuspendLayout();
            this.pnlClock.SuspendLayout();
            this.pnlConfView.SuspendLayout();
            this.pnlServiceOnline.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbWeiXinClientCount)).BeginInit();
            this.pnlSetBusyFree.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbHeartbeat)).BeginInit();
            this.pnlTransfer.SuspendLayout();
            this.pnlSettings.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.spLeftRight)).BeginInit();
            this.spLeftRight.Panel1.SuspendLayout();
            this.spLeftRight.Panel2.SuspendLayout();
            this.spLeftRight.SuspendLayout();
            this.pnlOperateArea.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlBottom
            // 
            this.pnlBottom.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.pnlBottom.Controls.Add(this.pnlCallHoldState);
            this.pnlBottom.Controls.Add(this.pnlSeat);
            this.pnlBottom.Controls.Add(this.pnlExt);
            this.pnlBottom.Controls.Add(this.pnlClock);
            this.pnlBottom.Controls.Add(this.btnLogout);
            this.pnlBottom.Controls.Add(this.pnlConfView);
            this.pnlBottom.Controls.Add(this.pnlServiceOnline);
            this.pnlBottom.Controls.Add(this.pnlSetBusyFree);
            this.pnlBottom.Controls.Add(this.pnlTransfer);
            this.pnlBottom.Controls.Add(this.pnlSettings);
            this.pnlBottom.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnlBottom.Location = new System.Drawing.Point(0, 705);
            this.pnlBottom.Name = "pnlBottom";
            this.pnlBottom.Size = new System.Drawing.Size(1236, 70);
            this.pnlBottom.TabIndex = 0;
            // 
            // pnlCallHoldState
            // 
            this.pnlCallHoldState.BackColor = System.Drawing.Color.White;
            this.pnlCallHoldState.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlCallHoldState.Controls.Add(this.btnCallHoldState);
            this.pnlCallHoldState.Location = new System.Drawing.Point(91, 0);
            this.pnlCallHoldState.Name = "pnlCallHoldState";
            this.pnlCallHoldState.Size = new System.Drawing.Size(93, 70);
            this.pnlCallHoldState.TabIndex = 21;
            // 
            // btnCallHoldState
            // 
            this.btnCallHoldState.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnCallHoldState.Enabled = false;
            this.btnCallHoldState.Location = new System.Drawing.Point(11, 10);
            this.btnCallHoldState.Name = "btnCallHoldState";
            this.btnCallHoldState.Size = new System.Drawing.Size(70, 47);
            this.btnCallHoldState.TabIndex = 3;
            this.btnCallHoldState.Text = "呼叫保持";
            this.btnCallHoldState.UseVisualStyleBackColor = false;
            this.btnCallHoldState.Click += new System.EventHandler(this.btnCallHoldState_Click);
            // 
            // pnlSeat
            // 
            this.pnlSeat.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlSeat.BackColor = System.Drawing.Color.White;
            this.pnlSeat.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlSeat.Controls.Add(this.lblUserName);
            this.pnlSeat.Controls.Add(this.lblUserNameTitle);
            this.pnlSeat.Location = new System.Drawing.Point(1016, 0);
            this.pnlSeat.Name = "pnlSeat";
            this.pnlSeat.Size = new System.Drawing.Size(123, 70);
            this.pnlSeat.TabIndex = 20;
            // 
            // lblUserName
            // 
            this.lblUserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblUserName.Font = new System.Drawing.Font("宋体", 14F);
            this.lblUserName.ForeColor = System.Drawing.Color.Blue;
            this.lblUserName.Location = new System.Drawing.Point(31, 0);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(90, 68);
            this.lblUserName.TabIndex = 7;
            this.lblUserName.Text = "--";
            this.lblUserName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblUserNameTitle
            // 
            this.lblUserNameTitle.Dock = System.Windows.Forms.DockStyle.Left;
            this.lblUserNameTitle.Font = new System.Drawing.Font("宋体", 14F);
            this.lblUserNameTitle.ForeColor = System.Drawing.Color.Black;
            this.lblUserNameTitle.Location = new System.Drawing.Point(0, 0);
            this.lblUserNameTitle.Name = "lblUserNameTitle";
            this.lblUserNameTitle.Size = new System.Drawing.Size(31, 68);
            this.lblUserNameTitle.TabIndex = 8;
            this.lblUserNameTitle.Text = "座席";
            this.lblUserNameTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // pnlExt
            // 
            this.pnlExt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlExt.BackColor = System.Drawing.Color.White;
            this.pnlExt.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlExt.Controls.Add(this.lblExtNo);
            this.pnlExt.Controls.Add(this.lblExtNoTitle);
            this.pnlExt.Location = new System.Drawing.Point(894, 0);
            this.pnlExt.Name = "pnlExt";
            this.pnlExt.Size = new System.Drawing.Size(123, 70);
            this.pnlExt.TabIndex = 19;
            // 
            // lblExtNo
            // 
            this.lblExtNo.Font = new System.Drawing.Font("宋体", 14F);
            this.lblExtNo.ForeColor = System.Drawing.Color.Blue;
            this.lblExtNo.Location = new System.Drawing.Point(30, 0);
            this.lblExtNo.Name = "lblExtNo";
            this.lblExtNo.Size = new System.Drawing.Size(91, 68);
            this.lblExtNo.TabIndex = 8;
            this.lblExtNo.Text = "--";
            this.lblExtNo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblExtNoTitle
            // 
            this.lblExtNoTitle.Dock = System.Windows.Forms.DockStyle.Left;
            this.lblExtNoTitle.Font = new System.Drawing.Font("宋体", 14F);
            this.lblExtNoTitle.ForeColor = System.Drawing.Color.Black;
            this.lblExtNoTitle.Location = new System.Drawing.Point(0, 0);
            this.lblExtNoTitle.Name = "lblExtNoTitle";
            this.lblExtNoTitle.Size = new System.Drawing.Size(30, 68);
            this.lblExtNoTitle.TabIndex = 9;
            this.lblExtNoTitle.Text = "分机";
            this.lblExtNoTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // pnlClock
            // 
            this.pnlClock.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlClock.BackColor = System.Drawing.Color.White;
            this.pnlClock.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlClock.Controls.Add(this.xClock4Timer);
            this.pnlClock.Controls.Add(this.xClock);
            this.pnlClock.Location = new System.Drawing.Point(817, 0);
            this.pnlClock.Name = "pnlClock";
            this.pnlClock.Size = new System.Drawing.Size(78, 70);
            this.pnlClock.TabIndex = 18;
            // 
            // xClock4Timer
            // 
            this.xClock4Timer.ClockColor = System.Drawing.Color.Green;
            this.xClock4Timer.DateTime = new System.DateTime(2014, 5, 9, 17, 27, 3, 0);
            this.xClock4Timer.IsDrawShadow = true;
            this.xClock4Timer.IsTimerEnable = false;
            this.xClock4Timer.Location = new System.Drawing.Point(11, 35);
            this.xClock4Timer.Name = "xClock4Timer";
            this.xClock4Timer.SevenSegmentClockStyle = win.core.controls.SevenSegmentClockStyle.Timer;
            this.xClock4Timer.Size = new System.Drawing.Size(59, 24);
            this.xClock4Timer.TabIndex = 0;
            this.xClock4Timer.Timer = null;
            // 
            // xClock
            // 
            this.xClock.ClockColor = System.Drawing.Color.Green;
            this.xClock.DateTime = new System.DateTime(2015, 10, 22, 15, 3, 25, 0);
            this.xClock.IsDrawShadow = true;
            this.xClock.IsTimerEnable = true;
            this.xClock.Location = new System.Drawing.Point(11, 5);
            this.xClock.Name = "xClock";
            this.xClock.SevenSegmentClockStyle = win.core.controls.SevenSegmentClockStyle.TimeOnly;
            this.xClock.Size = new System.Drawing.Size(59, 24);
            this.xClock.TabIndex = 0;
            this.xClock.Timer = null;
            // 
            // btnLogout
            // 
            this.btnLogout.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnLogout.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnLogout.Enabled = false;
            this.btnLogout.Location = new System.Drawing.Point(1152, 11);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(72, 50);
            this.btnLogout.TabIndex = 17;
            this.btnLogout.Text = "退出登录";
            this.btnLogout.UseVisualStyleBackColor = false;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // pnlConfView
            // 
            this.pnlConfView.BackColor = System.Drawing.Color.White;
            this.pnlConfView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlConfView.Controls.Add(this.btnViewConf);
            this.pnlConfView.Location = new System.Drawing.Point(474, 0);
            this.pnlConfView.Name = "pnlConfView";
            this.pnlConfView.Size = new System.Drawing.Size(99, 70);
            this.pnlConfView.TabIndex = 16;
            // 
            // btnViewConf
            // 
            this.btnViewConf.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnViewConf.Enabled = false;
            this.btnViewConf.Location = new System.Drawing.Point(13, 11);
            this.btnViewConf.Name = "btnViewConf";
            this.btnViewConf.Size = new System.Drawing.Size(70, 47);
            this.btnViewConf.TabIndex = 0;
            this.btnViewConf.Text = "会议室";
            this.btnViewConf.UseVisualStyleBackColor = false;
            this.btnViewConf.Click += new System.EventHandler(this.btnViewConf_Click);
            // 
            // pnlServiceOnline
            // 
            this.pnlServiceOnline.BackColor = System.Drawing.Color.White;
            this.pnlServiceOnline.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlServiceOnline.Controls.Add(this.pbWeiXinClientCount);
            this.pnlServiceOnline.Controls.Add(this.btnServiceOnline);
            this.pnlServiceOnline.Location = new System.Drawing.Point(376, 0);
            this.pnlServiceOnline.Name = "pnlServiceOnline";
            this.pnlServiceOnline.Size = new System.Drawing.Size(99, 70);
            this.pnlServiceOnline.TabIndex = 15;
            // 
            // pbWeiXinClientCount
            // 
            this.pbWeiXinClientCount.BackColor = System.Drawing.Color.Transparent;
            this.pbWeiXinClientCount.Location = new System.Drawing.Point(64, 2);
            this.pbWeiXinClientCount.Name = "pbWeiXinClientCount";
            this.pbWeiXinClientCount.Size = new System.Drawing.Size(32, 32);
            this.pbWeiXinClientCount.TabIndex = 12;
            this.pbWeiXinClientCount.TabStop = false;
            this.pbWeiXinClientCount.Visible = false;
            this.pbWeiXinClientCount.Click += new System.EventHandler(this.pbWeiXinClientCount_Click);
            // 
            // btnServiceOnline
            // 
            this.btnServiceOnline.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnServiceOnline.Location = new System.Drawing.Point(13, 11);
            this.btnServiceOnline.Name = "btnServiceOnline";
            this.btnServiceOnline.Size = new System.Drawing.Size(70, 47);
            this.btnServiceOnline.TabIndex = 11;
            this.btnServiceOnline.Text = "在线客服";
            this.xToolTip.SetToolTip(this.btnServiceOnline, "点击【示忙】从闲到忙，点击示闲从忙到闲");
            this.btnServiceOnline.UseVisualStyleBackColor = false;
            this.btnServiceOnline.Click += new System.EventHandler(this.btnServiceOnline_Click);
            // 
            // pnlSetBusyFree
            // 
            this.pnlSetBusyFree.BackColor = System.Drawing.Color.White;
            this.pnlSetBusyFree.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlSetBusyFree.Controls.Add(this.pbHeartbeat);
            this.pnlSetBusyFree.Controls.Add(this.btnSetBusyFree);
            this.pnlSetBusyFree.Location = new System.Drawing.Point(278, 0);
            this.pnlSetBusyFree.Name = "pnlSetBusyFree";
            this.pnlSetBusyFree.Size = new System.Drawing.Size(99, 70);
            this.pnlSetBusyFree.TabIndex = 14;
            // 
            // pbHeartbeat
            // 
            this.pbHeartbeat.BackColor = System.Drawing.Color.Transparent;
            this.pbHeartbeat.BackgroundImage = global::SmartLife.Client.Seat.Properties.Resources.Red;
            this.pbHeartbeat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pbHeartbeat.Location = new System.Drawing.Point(81, 52);
            this.pbHeartbeat.Name = "pbHeartbeat";
            this.pbHeartbeat.Size = new System.Drawing.Size(16, 16);
            this.pbHeartbeat.TabIndex = 13;
            this.pbHeartbeat.TabStop = false;
            // 
            // btnSetBusyFree
            // 
            this.btnSetBusyFree.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnSetBusyFree.Enabled = false;
            this.btnSetBusyFree.Location = new System.Drawing.Point(11, 11);
            this.btnSetBusyFree.Name = "btnSetBusyFree";
            this.btnSetBusyFree.Size = new System.Drawing.Size(70, 47);
            this.btnSetBusyFree.TabIndex = 10;
            this.btnSetBusyFree.Text = "服务示忙";
            this.xToolTip.SetToolTip(this.btnSetBusyFree, "点击【示忙】从闲到忙，点击示闲从忙到闲");
            this.btnSetBusyFree.UseVisualStyleBackColor = false;
            this.btnSetBusyFree.Click += new System.EventHandler(this.btnSetBusyFree_Click);
            // 
            // pnlTransfer
            // 
            this.pnlTransfer.BackColor = System.Drawing.Color.White;
            this.pnlTransfer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlTransfer.Controls.Add(this.btnTransfer);
            this.pnlTransfer.Location = new System.Drawing.Point(182, 0);
            this.pnlTransfer.Name = "pnlTransfer";
            this.pnlTransfer.Size = new System.Drawing.Size(98, 70);
            this.pnlTransfer.TabIndex = 13;
            // 
            // btnTransfer
            // 
            this.btnTransfer.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnTransfer.Enabled = false;
            this.btnTransfer.Location = new System.Drawing.Point(12, 11);
            this.btnTransfer.Name = "btnTransfer";
            this.btnTransfer.Size = new System.Drawing.Size(70, 47);
            this.btnTransfer.TabIndex = 4;
            this.btnTransfer.Text = "呼叫转移";
            this.btnTransfer.UseVisualStyleBackColor = false;
            this.btnTransfer.Click += new System.EventHandler(this.btnTransfer_Click);
            // 
            // pnlSettings
            // 
            this.pnlSettings.BackColor = System.Drawing.Color.White;
            this.pnlSettings.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlSettings.Controls.Add(this.btnSettings);
            this.pnlSettings.Location = new System.Drawing.Point(0, 0);
            this.pnlSettings.Name = "pnlSettings";
            this.pnlSettings.Size = new System.Drawing.Size(92, 70);
            this.pnlSettings.TabIndex = 11;
            // 
            // btnSettings
            // 
            this.btnSettings.Location = new System.Drawing.Point(11, 10);
            this.btnSettings.Name = "btnSettings";
            this.btnSettings.Size = new System.Drawing.Size(65, 47);
            this.btnSettings.TabIndex = 2;
            this.btnSettings.Text = "系统设置";
            this.btnSettings.UseVisualStyleBackColor = true;
            this.btnSettings.Click += new System.EventHandler(this.btnSettings_Click);
            // 
            // spLeftRight
            // 
            this.spLeftRight.Dock = System.Windows.Forms.DockStyle.Fill;
            this.spLeftRight.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.spLeftRight.IsSplitterFixed = true;
            this.spLeftRight.Location = new System.Drawing.Point(0, 0);
            this.spLeftRight.Name = "spLeftRight";
            // 
            // spLeftRight.Panel1
            // 
            this.spLeftRight.Panel1.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.spLeftRight.Panel1.Controls.Add(this.wbWorkArea);
            // 
            // spLeftRight.Panel2
            // 
            this.spLeftRight.Panel2.Controls.Add(this.pnlOperateArea);
            this.spLeftRight.Size = new System.Drawing.Size(1236, 705);
            this.spLeftRight.SplitterDistance = 1039;
            this.spLeftRight.SplitterWidth = 1;
            this.spLeftRight.TabIndex = 0;
            // 
            // wbWorkArea
            // 
            this.wbWorkArea.Dock = System.Windows.Forms.DockStyle.Left;
            this.wbWorkArea.IsWebBrowserContextMenuEnabled = false;
            this.wbWorkArea.Location = new System.Drawing.Point(0, 0);
            this.wbWorkArea.MinimumSize = new System.Drawing.Size(20, 20);
            this.wbWorkArea.Name = "wbWorkArea";
            this.wbWorkArea.ScrollBarsEnabled = false;
            this.wbWorkArea.Size = new System.Drawing.Size(1024, 705);
            this.wbWorkArea.TabIndex = 4;
            this.wbWorkArea.WebBrowserShortcutsEnabled = false;
            this.wbWorkArea.DocumentCompleted += new System.Windows.Forms.WebBrowserDocumentCompletedEventHandler(this.wbWorkArea_DocumentCompleted);
            // 
            // pnlOperateArea
            // 
            this.pnlOperateArea.BackColor = System.Drawing.Color.Transparent;
            this.pnlOperateArea.Controls.Add(this.tableLayoutPanel1);
            this.pnlOperateArea.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlOperateArea.Location = new System.Drawing.Point(0, 0);
            this.pnlOperateArea.Name = "pnlOperateArea";
            this.pnlOperateArea.Size = new System.Drawing.Size(196, 705);
            this.pnlOperateArea.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.BackColor = System.Drawing.Color.White;
            this.tableLayoutPanel1.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.label1, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblQueueMemberTitle, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblDialBackTitle, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.wbPhoneList4DialBack, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.wbPhoneListQueueMember, 0, 3);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 35F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(196, 705);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label1.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(4, 1);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(188, 30);
            this.label1.TabIndex = 0;
            this.label1.Text = "处理列表";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.cbbServiceList);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(4, 35);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(188, 29);
            this.panel1.TabIndex = 2;
            // 
            // cbbServiceList
            // 
            this.cbbServiceList.FormattingEnabled = true;
            this.cbbServiceList.Location = new System.Drawing.Point(30, 4);
            this.cbbServiceList.Name = "cbbServiceList";
            this.cbbServiceList.Size = new System.Drawing.Size(140, 20);
            this.cbbServiceList.TabIndex = 1;
            this.cbbServiceList.SelectedIndexChanged += new System.EventHandler(this.cbbServiceList_SelectedIndexChanged);
            // 
            // lblQueueMemberTitle
            // 
            this.lblQueueMemberTitle.AutoSize = true;
            this.lblQueueMemberTitle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblQueueMemberTitle.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold);
            this.lblQueueMemberTitle.Location = new System.Drawing.Point(4, 68);
            this.lblQueueMemberTitle.Name = "lblQueueMemberTitle";
            this.lblQueueMemberTitle.Size = new System.Drawing.Size(188, 30);
            this.lblQueueMemberTitle.TabIndex = 3;
            this.lblQueueMemberTitle.Text = "排队列表";
            this.lblQueueMemberTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblDialBackTitle
            // 
            this.lblDialBackTitle.AutoSize = true;
            this.lblDialBackTitle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDialBackTitle.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold);
            this.lblDialBackTitle.Location = new System.Drawing.Point(4, 329);
            this.lblDialBackTitle.Name = "lblDialBackTitle";
            this.lblDialBackTitle.Size = new System.Drawing.Size(188, 30);
            this.lblDialBackTitle.TabIndex = 4;
            this.lblDialBackTitle.Text = "回拨列表";
            this.lblDialBackTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // wbPhoneList4DialBack
            // 
            this.wbPhoneList4DialBack.AllowWebBrowserDrop = false;
            this.wbPhoneList4DialBack.Dock = System.Windows.Forms.DockStyle.Fill;
            this.wbPhoneList4DialBack.Location = new System.Drawing.Point(4, 363);
            this.wbPhoneList4DialBack.MinimumSize = new System.Drawing.Size(20, 20);
            this.wbPhoneList4DialBack.Name = "wbPhoneList4DialBack";
            this.wbPhoneList4DialBack.Size = new System.Drawing.Size(188, 338);
            this.wbPhoneList4DialBack.TabIndex = 5;
            this.wbPhoneList4DialBack.DocumentCompleted += new System.Windows.Forms.WebBrowserDocumentCompletedEventHandler(this.wbPhoneList4DialBack_DocumentCompleted);
            // 
            // wbPhoneListQueueMember
            // 
            this.wbPhoneListQueueMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.wbPhoneListQueueMember.IsWebBrowserContextMenuEnabled = false;
            this.wbPhoneListQueueMember.Location = new System.Drawing.Point(4, 102);
            this.wbPhoneListQueueMember.MinimumSize = new System.Drawing.Size(20, 20);
            this.wbPhoneListQueueMember.Name = "wbPhoneListQueueMember";
            this.wbPhoneListQueueMember.Size = new System.Drawing.Size(188, 223);
            this.wbPhoneListQueueMember.TabIndex = 6;
            this.wbPhoneListQueueMember.DocumentCompleted += new System.Windows.Forms.WebBrowserDocumentCompletedEventHandler(this.wbPhoneListQueueMember_DocumentCompleted);
            // 
            // frmMainV2X
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1236, 775);
            this.Controls.Add(this.spLeftRight);
            this.Controls.Add(this.pnlBottom);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmMainV2X";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "主窗口";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMainV2X_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmMainV2X_FormClosed);
            this.Load += new System.EventHandler(this.frmMainV2X_Load);
            this.Shown += new System.EventHandler(this.frmMainV2X_Shown);
            this.pnlBottom.ResumeLayout(false);
            this.pnlCallHoldState.ResumeLayout(false);
            this.pnlSeat.ResumeLayout(false);
            this.pnlExt.ResumeLayout(false);
            this.pnlClock.ResumeLayout(false);
            this.pnlConfView.ResumeLayout(false);
            this.pnlServiceOnline.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbWeiXinClientCount)).EndInit();
            this.pnlSetBusyFree.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbHeartbeat)).EndInit();
            this.pnlTransfer.ResumeLayout(false);
            this.pnlSettings.ResumeLayout(false);
            this.spLeftRight.Panel1.ResumeLayout(false);
            this.spLeftRight.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.spLeftRight)).EndInit();
            this.spLeftRight.ResumeLayout(false);
            this.pnlOperateArea.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlBottom;
        private System.Windows.Forms.SplitContainer spLeftRight;
        private System.Windows.Forms.Panel pnlOperateArea;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbbServiceList;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblQueueMemberTitle;
        private System.Windows.Forms.Label lblDialBackTitle;
        private System.Windows.Forms.Panel pnlSettings;
        private System.Windows.Forms.Button btnSettings;
        private System.Windows.Forms.Panel pnlTransfer;
        private System.Windows.Forms.Button btnTransfer;
        private System.Windows.Forms.Panel pnlSetBusyFree;
        private System.Windows.Forms.PictureBox pbHeartbeat;
        private System.Windows.Forms.Button btnSetBusyFree;
        private System.Windows.Forms.Panel pnlServiceOnline;
        private System.Windows.Forms.PictureBox pbWeiXinClientCount;
        private System.Windows.Forms.Button btnServiceOnline;
        private System.Windows.Forms.Panel pnlConfView;
        private System.Windows.Forms.Button btnViewConf;
        private System.Windows.Forms.Button btnLogout;
        private System.Windows.Forms.Panel pnlClock;
        private win.core.controls.SevenSegmentClock xClock4Timer;
        private win.core.controls.SevenSegmentClock xClock;
        private System.Windows.Forms.Panel pnlExt;
        private System.Windows.Forms.Label lblExtNo;
        private System.Windows.Forms.Label lblExtNoTitle;
        private System.Windows.Forms.Panel pnlSeat;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.Label lblUserNameTitle;
        private System.Windows.Forms.ToolTip xToolTip;
        private System.Windows.Forms.Panel pnlCallHoldState;
        private System.Windows.Forms.Button btnCallHoldState;
        private System.Windows.Forms.WebBrowser wbWorkArea;
        private System.Windows.Forms.WebBrowser wbPhoneList4DialBack;
        private System.Windows.Forms.WebBrowser wbPhoneListQueueMember;
    }
}