﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsReportsTableAdapters;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;
using AfterSaleServiceSystem.DAL.dsCustomerTableAdapters;
using AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters;
using AfterSaleServiceSystem.DAL;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class SheetDetail2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("/LogIn.ashx");
                return;
            }
            try
            {
                sheetid = Convert.ToInt32(Request["id"]);

                
                #region 绑定客户数据
                tb_repairsheetTableAdapter sheet = new tb_repairsheetTableAdapter();
                dsRepairSheet.tb_repairsheetDataTable sheetDt = sheet.GetDataByid(sheetid);
                if (sheetDt != null && sheetDt.Rows.Count > 0)
                {
                    dsRepairSheet.tb_repairsheetRow row = (dsRepairSheet.tb_repairsheetRow)sheetDt.Rows[0];
                    tb_customTableAdapter custom = new tb_customTableAdapter();
                    AfterSaleServiceSystem.DAL.dsCustomer.tb_customDataTable customDt = custom.GetDataByid(Convert.ToInt32(row.customid));
                    FormView_custom.DataSource = customDt;
                    FormView_custom.DataBind();
                }
                #endregion

            }
            catch (Exception)
            {
                //
                throw;
            }

            Label_No.Text = sheetid.ToString();


            tb_reportsTableAdapter reports = new tb_reportsTableAdapter();

            if (reports.GetDataBysheetid(sheetid).Rows.Count > 0)
            {
                FormView_report.DefaultMode = FormViewMode.Edit;
            }
            else
                FormView_report.DefaultMode = FormViewMode.Insert;
        }

        private int sheetid = 0;

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

            Label labelclerk;





            if (FormView_report.CurrentMode == FormViewMode.Edit)
            {
                TextBoxStartTime = (TextBox)FormView_report.FindControl("TextBoxStartTime");
                LiteralstartTime = (Literal)FormView_report.FindControl("LiteralstartTime");

                TextBoxEndTime = (TextBox)FormView_report.FindControl("TextBoxEndTime");
                LiteralEndTime = (Literal)FormView_report.FindControl("LiteralEndTime");

                TextBoxEdtTime = (TextBox)FormView_report.FindControl("TextBoxEdtTime");
                LiteralEdtTime = (Literal)FormView_report.FindControl("LiteralEdtTime");

                TextBoxSendTime = (TextBox)FormView_report.FindControl("TextBoxSendTime");
                LiteralSendTime = (Literal)FormView_report.FindControl("LiteralSendTime");


                labelclerk = (Label)FormView_report.FindControl("labelclerk");



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

                if (labelclerk != null)
                {
                    labelclerk.Text = "测试员";

                    tb_clerkTableAdapter clerks = new tb_clerkTableAdapter();
                    AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable clerktb =
                        (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable)clerks.GetDataByid(Convert.ToInt32(Session["UserId"]));

                    if (clerktb.Rows.Count > 0)
                    {
                        AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkrow =
                            (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerktb.Rows[0];

                        labelclerk.Text = clerkrow.realname;
                    }
                }

            }
            else if (FormView_report.CurrentMode == FormViewMode.Insert)
            {
                TextBoxStartTime = (TextBox)FormView_report.FindControl("TextBoxStartTimeIns");
                LiteralstartTime = (Literal)FormView_report.FindControl("LiteralstartTimeIns");

                TextBoxEndTime = (TextBox)FormView_report.FindControl("TextBoxEndTimeIns");
                LiteralEndTime = (Literal)FormView_report.FindControl("LiteralEndTimeIns");

                TextBoxEdtTime = (TextBox)FormView_report.FindControl("TextBoxEdtTimeIns");
                LiteralEdtTime = (Literal)FormView_report.FindControl("LiteralEdtTimeIns");

                TextBoxSendTime = (TextBox)FormView_report.FindControl("TextBoxSendTimeIns");
                LiteralSendTime = (Literal)FormView_report.FindControl("LiteralSendTimeIns");

                labelclerk = (Label)FormView_report.FindControl("labelclerkIns");


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

                if (labelclerk != null)
                {
                    labelclerk.Text = "测试员";

                    tb_clerkTableAdapter clerks = new tb_clerkTableAdapter();
                    AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable clerktb =
                        (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable)clerks.GetDataByid(Convert.ToInt32(Session["UserId"]));

                    if (clerktb.Rows.Count > 0)
                    {
                        AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkrow =
                            (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerktb.Rows[0];

                        labelclerk.Text = clerkrow.realname;
                    }
                }

            }
        }

        protected void FormView_report_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            e.NewValues["modifytime"] = DateTime.Now.ToString();
            e.NewValues["clerkid"] = Convert.ToInt32(Session["UserId"]);
            e.NewValues["repairsheetid"] = Convert.ToInt32(Request["id"]);
            e.NewValues["productname"] = "";
            e.NewValues["productnumber"] = "";

        }

        protected void FormView_report_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["modifytime"] = DateTime.Now.ToString();
            e.Values["clerkid"] = Convert.ToInt32(Session["UserId"]);
            e.Values["repairsheetid"] = Convert.ToInt32(Request["id"]);
            e.Values["productname"] = "";
            e.Values["productnumber"] = "";
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.NewValues["sheetid"] = sheetid.ToString();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["sheetid"] = sheetid.ToString();

        }



    }
}
