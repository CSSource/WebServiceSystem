using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsReportsTableAdapters;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;
using AfterSaleServiceSystem.DAL.dsCustomerTableAdapters;

namespace AfterSaleServiceSystem.Supervisor
{
    public partial class createRepairSheet2 : System.Web.UI.Page
    {
#if DEBUG1
        private string _ReqGUID = "12121";//string.Empty;
#else
        private string _ReqGUID = string.Empty;
#endif

        public string ReqGUID
        {
            get { return _ReqGUID; }
            set
            {
                _ReqGUID = value;
            }
        }

        private long SheetId = 0;
        private long ReportId = 0;

        //提交之后回主页面

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("/LogIn.ashx");
                return;
            }

            ReqGUID = Request["GUID"];
            Label_GUID.Text = ReqGUID;
            AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter sheetadp =
                new AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter();
            System.Data.DataRowCollection RsRows = sheetadp.GetDataByGUID(ReqGUID).Rows;
            if (RsRows.Count > 0)
            {
                FormView_Report.ChangeMode(FormViewMode.Edit);
                FormView_Report.DefaultMode = FormViewMode.Edit;

                AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow RsRow =
                  (AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow)RsRows[0];
                SheetId = RsRow.id;

                tb_reportsTableAdapter reportAdp = new tb_reportsTableAdapter();
                AfterSaleServiceSystem.DAL.dsReports.tb_reportsDataTable dtReports = reportAdp.GetDataBysheetid(SheetId);
                if (dtReports.Rows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsReports.tb_reportsRow rRow =
                  (AfterSaleServiceSystem.DAL.dsReports.tb_reportsRow)dtReports[0];
                    ReportId = rRow.id;
                }
            }

            if (!IsPostBack)
            {
                if (RsRows.Count == 0)
                {
                    FormView_Report.ChangeMode(FormViewMode.Edit);

                    //新建一条记录
                    sheetadp.InsertNewSheet(ReqGUID, string.Empty, string.Empty, 0, 0, 0, 0);

                    RsRows = sheetadp.GetDataByGUID(ReqGUID).Rows;
                    if (RsRows.Count > 0)
                    {
                        AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow RsRow =
                          (AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow)RsRows[0];
                        SheetId = RsRow.id;

                        tb_reportsTableAdapter reportAdp = new tb_reportsTableAdapter();

                        int userID = 0;
                        if (Session["authorityid"].ToString() == "1")
                        {
                            userID = Convert.ToInt32(Session["UserId"]);
                        }

                        reportAdp.Insert(userID, SheetId, false, DateTime.Today,
                            string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
                            string.Empty, 0, 0, 0, 0, null, null, string.Empty, string.Empty, null);

                        AfterSaleServiceSystem.DAL.dsReports.tb_reportsDataTable dtReports = reportAdp.GetDataBysheetid(SheetId);
                        if (dtReports.Rows.Count > 0)
                        {
                            AfterSaleServiceSystem.DAL.dsReports.tb_reportsRow rRow =
                          (AfterSaleServiceSystem.DAL.dsReports.tb_reportsRow)dtReports[0];
                            ReportId = rRow.id;
                        }
                    }
                }

                #region 绑定代理商
                tb_customTableAdapter custom = new tb_customTableAdapter();
                AfterSaleServiceSystem.DAL.dsCustomer.tb_customDataTable customDt = custom.GetData();
                ddlCustom.DataTextField = "agent";
                ddlCustom.DataValueField = "id";
                ddlCustom.DataSource = customDt;
                ddlCustom.DataBind();
                BindCustom();
                #endregion
            }
        }

        protected void ddlCustom_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCustom();
        }
        private void BindCustom()
        {
            int customid = Convert.ToInt32(ddlCustom.SelectedValue);
            tb_customTableAdapter custom = new tb_customTableAdapter();
            AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow row = (AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow)custom.GetDataByid(customid).Rows[0];
            companyLabel.Text = row.company;
            addressLabel.Text = row.address;
            nameLabel.Text = row.name;
            telephoneLabel.Text = row.telephone;
            faxLabel.Text = row.fax;
        }


        protected void FormView_report_ItemCreated(object sender, EventArgs e)
        {
            TextBox TextBoxStartTime;
            Literal LiteralstartTime;

            TextBox TextBoxEndTime;
            Literal LiteralEndTime;

            TextBox TextBoxEdtTime;
            Literal LiteralEdtTime;

            TextBox TextBoxSendTime;
            Literal LiteralSendTime;

            //Label labelclerk;
            TextBox Textboxclerk;

            if (FormView_Report.CurrentMode == FormViewMode.Edit)
            {
                TextBoxStartTime = (TextBox)FormView_Report.FindControl("TextBoxStartTime");
                LiteralstartTime = (Literal)FormView_Report.FindControl("LiteralstartTime");

                TextBoxEndTime = (TextBox)FormView_Report.FindControl("TextBoxEndTime");
                LiteralEndTime = (Literal)FormView_Report.FindControl("LiteralEndTime");

                TextBoxEdtTime = (TextBox)FormView_Report.FindControl("TextBoxEdtTime");
                LiteralEdtTime = (Literal)FormView_Report.FindControl("LiteralEdtTime");

                TextBoxSendTime = (TextBox)FormView_Report.FindControl("TextBoxSendTime");
                LiteralSendTime = (Literal)FormView_Report.FindControl("LiteralSendTime");


                Textboxclerk = (TextBox)FormView_Report.FindControl("Textboxclerk");



                if (TextBoxStartTime != null && LiteralstartTime != null)
                {
                    LiteralstartTime.Text = TextBoxStartTime.ClientID;
                }

                if (TextBoxEndTime != null && LiteralEndTime != null)
                {
                    LiteralEndTime.Text = TextBoxEndTime.ClientID;
                }

                if (TextBoxEdtTime != null && LiteralEdtTime != null)
                {
                    LiteralEdtTime.Text = TextBoxEdtTime.ClientID;
                }

                if (TextBoxSendTime != null && LiteralSendTime != null)
                {
                    LiteralSendTime.Text = TextBoxSendTime.ClientID;
                }

                if (Textboxclerk != null)
                {
                    Textboxclerk.Text = "";

                    if (Convert.ToInt32(Session["authorityid"]) == 1)
                    {
                        tb_clerkTableAdapter clerks = new tb_clerkTableAdapter();
                        AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable clerktb =
                            (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable)clerks.GetDataByid(Convert.ToInt32(Session["UserId"]));

                        if (clerktb.Rows.Count > 0)
                        {
                            AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkrow =
                                (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerktb.Rows[0];

                            Textboxclerk.Text = clerkrow.realname;
                        }
                    }
                }

            }
            else if (FormView_Report.CurrentMode == FormViewMode.Insert)
            {
                TextBoxStartTime = (TextBox)FormView_Report.FindControl("TextBoxStartTimeIns");
                LiteralstartTime = (Literal)FormView_Report.FindControl("LiteralstartTimeIns");

                TextBoxEndTime = (TextBox)FormView_Report.FindControl("TextBoxEndTimeIns");
                LiteralEndTime = (Literal)FormView_Report.FindControl("LiteralEndTimeIns");

                TextBoxEdtTime = (TextBox)FormView_Report.FindControl("TextBoxEdtTimeIns");
                LiteralEdtTime = (Literal)FormView_Report.FindControl("LiteralEdtTimeIns");

                TextBoxSendTime = (TextBox)FormView_Report.FindControl("TextBoxSendTimeIns");
                LiteralSendTime = (Literal)FormView_Report.FindControl("LiteralSendTimeIns");

                //labelclerk = (Label)FormView_Report.FindControl("labelclerkIns");


                if (TextBoxStartTime != null && LiteralstartTime != null)
                {
                    LiteralstartTime.Text = TextBoxStartTime.ClientID;
                }

                if (TextBoxEndTime != null && LiteralEndTime != null)
                {
                    LiteralEndTime.Text = TextBoxEndTime.ClientID;
                }

                if (TextBoxEdtTime != null && LiteralEdtTime != null)
                {
                    LiteralEdtTime.Text = TextBoxEdtTime.ClientID;
                }

                if (TextBoxSendTime != null && LiteralSendTime != null)
                {
                    LiteralSendTime.Text = TextBoxSendTime.ClientID;
                }

                //if (labelclerk != null)
                //{
                //    labelclerk.Text = "测试员";

                //    tb_clerkTableAdapter clerks = new tb_clerkTableAdapter();
                //    AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable clerktb =
                //        (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable)clerks.GetDataByid(Convert.ToInt32(Session["UserId"]));

                //    if (clerktb.Rows.Count > 0)
                //    {
                //        AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkrow =
                //            (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerktb.Rows[0];

                //        labelclerk.Text = clerkrow.realname;
                //    }
                //}

            }
        }

        protected void FormView_report_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            e.NewValues["modifytime"] = DateTime.Now.ToString();
            e.NewValues["clerkid"] = Convert.ToInt32(Session["UserId"]);
            //e.NewValues["repairsheetid"] = SheetId;// Convert.ToInt32(Request["id"]);
            e.NewValues["productname"] = "";
            e.NewValues["productnumber"] = "";

        }

        protected void FormView_report_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["modifytime"] = DateTime.Now.ToString();
            e.Values["clerkid"] = Convert.ToInt32(Session["UserId"]);
            //e.Values["repairsheetid"] = SheetId;//Convert.ToInt32(Request["id"]);
            e.Values["productname"] = "";
            e.Values["productnumber"] = "";
        }

        /// <summary>
        /// 点击FormView里面的按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <remarks>修改------------------------------------------</remarks>
        protected void FormView_Report_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            string eName = e.CommandName.ToString();
            try
            {
                if (eName == "Set")
                {
                    //更新tb_custom表
                    string company = companyLabel.Text.Trim();
                    string address = addressLabel.Text.Trim();
                    string name = nameLabel.Text.Trim();
                    string tel = telephoneLabel.Text.Trim();
                    string fax = faxLabel.Text.Trim();
                    int customid = Convert.ToInt32(ddlCustom.SelectedValue);
                    tb_customTableAdapter custom = new tb_customTableAdapter();
                    AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow row = (AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow)custom.GetDataByid(customid).Rows[0];
                    row.company = company;
                    row.address = address;
                    row.name = name;
                    row.telephone = tel;
                    row.fax = fax;
                    custom.Update(row);



                    //更新tb_repairsheet表
                    string producttype = ((TextBox)FormView_Report.FindControl("TextBoxproducttype")).Text;
                    string productnumber = ((TextBox)FormView_Report.FindControl("TextBoxproductnumber")).Text;
                    int userID = 0;
                    if (Session["authorityid"] != null && Session["authorityid"].ToString() == "1")
                    {
                        userID = Convert.ToInt32(Session["UserId"]);
                    }

                    AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter sheetadp =
                           new AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter();
                    sheetadp.UpdateQueryForRepairSheet(ReqGUID, producttype, productnumber, 0, userID, Convert.ToInt32(ddlCustom.SelectedValue), 0, SheetId);

                    bool warrantyperiod = ((CheckBox)FormView_Report.FindControl("cbwarrantyperiod")).Checked;
                    DateTime modifytime = DateTime.Now;
                    DateTime.TryParse(((TextBox)FormView_Report.FindControl("TextBoxEdtTime")).Text, out modifytime);
                    if (modifytime == DateTime.MinValue)
                    {
                        modifytime = DateTime.Now;
                    }

                    string productname = ((TextBox)FormView_Report.FindControl("TextBoxproducttype")).Text;
                    string softwareVersion = ((TextBox)FormView_Report.FindControl("TextBoxsoftwareVersion")).Text;
                    string errorcode = ((TextBox)FormView_Report.FindControl("TextBoxerrorcode")).Text;
                    string breakdowndescription = ((TextBox)FormView_Report.FindControl("TextBoxbreakdowndescription")).Text;
                    string breakdownreason = ((TextBox)FormView_Report.FindControl("TextBoxbreakdownreason")).Text;
                    string resulttofrepair = ((TextBox)FormView_Report.FindControl("TextBoxresultofrepair")).Text;

                    decimal laborcost = 0;
                    decimal.TryParse(((TextBox)FormView_Report.FindControl("TextBoxlaborcost")).Text, out laborcost);

                    decimal partcost = 0;
                    decimal.TryParse(((TextBox)FormView_Report.FindControl("TextBoxpartcost")).Text, out partcost);

                    decimal testcost = 0;
                    decimal.TryParse(((TextBox)FormView_Report.FindControl("TextBoxtestcost")).Text, out testcost);

                    decimal tranitcost = 0;
                    decimal.TryParse(((TextBox)FormView_Report.FindControl("TextBoxtransitcost")).Text, out tranitcost);

                    DateTime starttime = DateTime.Now;
                    DateTime.TryParse(((TextBox)FormView_Report.FindControl("TextBoxStartTime")).Text, out starttime);
                    if (starttime == DateTime.MinValue)
                    {
                        starttime = DateTime.Now;
                    }

                    DateTime endtime = DateTime.Now;
                    DateTime.TryParse(((TextBox)FormView_Report.FindControl("TextBoxEndTime")).Text, out endtime);
                    if (endtime == DateTime.MinValue)
                    {
                        endtime = DateTime.Now;
                    }

                    string type_delivery = ((TextBox)FormView_Report.FindControl("TextBoxtype_delivery")).Text;
                    string awbnumber_delivery = ((TextBox)FormView_Report.FindControl("TextBoxawbnumber_delivery")).Text;
                    DateTime time_delivery = DateTime.Now;
                    DateTime.TryParse(((TextBox)FormView_Report.FindControl("TextBoxSendTime")).Text, out time_delivery);
                    if (time_delivery == DateTime.MinValue)
                    {
                        time_delivery = DateTime.Now;
                    }

                    AfterSaleServiceSystem.DAL.dsReportsTableAdapters.tb_reportsTableAdapter reportAdp =
                           new AfterSaleServiceSystem.DAL.dsReportsTableAdapters.tb_reportsTableAdapter();

                    reportAdp.UpdateQueryForReports(userID, SheetId, warrantyperiod, modifytime, productname, productnumber,
                        softwareVersion, errorcode, breakdowndescription, breakdownreason, resulttofrepair, laborcost, partcost, testcost,
                        tranitcost, starttime, endtime, type_delivery, awbnumber_delivery, time_delivery, ReportId);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script type='text/javascript'>创建成功</script>", true);
                }
                else if (eName == "Return")
                {
                    Response.Redirect("/Supervisor/getBarCode.aspx");
                }
            }
            catch (Exception ex) { ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script type='text/javascript'>创建失败</script>", true); }

        }




    }
}
