﻿using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;

namespace QLDSV_HTC.Reports
{
    public partial class InDSSVReport : DevExpress.XtraReports.UI.XtraReport
    {
        public InDSSVReport(string nienkhoa, int hocky, string mamh, int nhom)
        {
            InitializeComponent();
            this.label1.Text = "DASHD";
            this.sqlDataSource1.Connection.ConnectionString = Program.ConnStr;
            this.sqlDataSource1.Queries[0].Parameters[0].Value = nienkhoa;
            this.sqlDataSource1.Queries[0].Parameters[1].Value = hocky;
            this.sqlDataSource1.Queries[0].Parameters[2].Value = mamh;
            this.sqlDataSource1.Queries[0].Parameters[3].Value = nhom;
            this.sqlDataSource1.Fill();

        }

    }
}
