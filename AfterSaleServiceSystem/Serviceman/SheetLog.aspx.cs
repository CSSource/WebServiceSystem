using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsLogsTableAdapters;
using System.Data;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class SheetLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////判断用户访问权限
            //if (this.Context.Session["UserId"] == null)
            //{
            //    //登陆
            //    Context.Response.Redirect("~\\Default.aspx");
            //}

            //判断该维修单是否属于当前用户的

            if (Request["id"] != null)
            {
                int logid = Convert.ToInt32(Request["id"]);
                tb_logsTableAdapter logsTableAdapter = new tb_logsTableAdapter();
                DataRowCollection DataRows = logsTableAdapter.GetDataByid(logid).Rows;
                if (DataRows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsLogs.tb_logsRow logsRow = (AfterSaleServiceSystem.DAL.dsLogs.tb_logsRow)DataRows[0];
                    if (logsRow.clerkid == Convert.ToInt32(Session["UserId"]))
                    {

                    }
                    else
                    {
                        //不能访问
                        this.Response.Redirect("~\\WebErr.aspx"+ "?msg=对不起，您没有权限访问本页面。");
                    }
                }
            }
        }


        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            e.NewValues["logtime"] = DateTime.Now.ToString();

            e.NewValues["clerkid"] = Convert.ToInt32(Session["UserId"]);
            e.NewValues["repairsheetid"] = Convert.ToInt32(e.OldValues["repairsheetid"]);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            this.Response.Redirect("~\\Serviceman\\SheetDetail.aspx?id=" + e.OldValues["repairsheetid"].ToString());
        }
    }
}
