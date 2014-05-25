using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsReportsTableAdapters;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class SheetDetail2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
#if DEBUG
            if (Request["id"] == null)
                sheetid = 1;
#endif

            try
            {
                sheetid = Convert.ToInt32(Request["id"]);

            }
            catch (Exception)
            {
                //
                throw;
            }

            Label_No.Text = sheetid.ToString();

            tb_reportsTableAdapter reports = new tb_reportsTableAdapter();

            if (reports.GetDataBysheetid(sheetid).Rows.Count > 0)
                FormView_report.DefaultMode = FormViewMode.Edit;
            else
                FormView_report.DefaultMode = FormViewMode.Insert;
        }

        private int sheetid = 0;

        protected void FormView_report_ItemCreated(object sender, EventArgs e)
        {
            if (FormView_report.CurrentMode == FormViewMode.Edit)
            {
                TextBox TextBoxStartTime = (TextBox)FormView_report.FindControl("TextBoxStartTime");
                Literal LiteralstartTime = (Literal)FormView_report.FindControl("LiteralstartTime");

                TextBox TextBoxEndTime = (TextBox)FormView_report.FindControl("TextBoxEndTime");
                Literal LiteralEndTime = (Literal)FormView_report.FindControl("LiteralEndTime");

                TextBox TextBoxEdtTime = (TextBox)FormView_report.FindControl("TextBoxEdtTime");
                Literal LiteralEdtTime = (Literal)FormView_report.FindControl("LiteralEdtTime");

                Label labelclerk = (Label)FormView_report.FindControl("labelclerk");



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



    }
}
