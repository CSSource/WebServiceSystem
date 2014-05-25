using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsRepairStateTableAdapters;
using AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class SheetDetail : System.Web.UI.Page
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

            


        }

        private int sheetid = 0;


        protected void FormViewSheetInfo_DataBound(object sender, EventArgs e)
        {
            int sheetid = 0;

            if (Session["UserId"] == null)
                return;
            else
                sheetid = Convert.ToInt32(Session["UserId"]);

            tb_repairsheetTableAdapter repairsheetTableAdapter = new tb_repairsheetTableAdapter();

            AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow repairsheetRow =
                  (AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow)repairsheetTableAdapter.GetDataByid(sheetid).Rows[0];
            int stateid = repairsheetRow.repairstateid;

            Label lbrepairstateid = (Label)this.Master.FindControl("ContentPlaceHolderContent").FindControl("FormViewSheetInfo").FindControl("repairstateidLabel");
            if (lbrepairstateid != null)
            {
                tb_repairstateTableAdapter repairstateTableAdapter = new tb_repairstateTableAdapter();
                if (repairstateTableAdapter.GetDatabyid(stateid).Rows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsRepairState.tb_repairstateRow repairstateRow =
                        (AfterSaleServiceSystem.DAL.dsRepairState.tb_repairstateRow)
                        repairstateTableAdapter.GetDatabyid(stateid).Rows[0];

                    lbrepairstateid.Text = repairstateRow.description;
                }


            }

        }


        protected void ListViewLogs_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["logtime"] = DateTime.Now.ToString();
            e.Values["clerkid"] = Convert.ToInt32(Session["UserId"]);
            e.Values["repairsheetid"] = Convert.ToInt32(Request["id"]);
        }

        protected void ListViewLogs_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.NewValues["logtime"] = DateTime.Now.ToString();
            e.NewValues["clerkid"] = Convert.ToInt32(Session["UserId"]);
            e.NewValues["repairsheetid"] = Convert.ToInt32(Request["id"]);
        }

        protected void FormViewSheetInfo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int state = Convert.ToInt32(e.NewValues["repairstateid"]);

            if (state >= 2 && state <= 4)
            { }
            else
            {
                Response.Write("<script language='javascript'>alert('没有权限修改此项内容！')</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "JS", "请阅读并勾选条款！");
                e.Cancel = true;
            }
        }
    }
}
