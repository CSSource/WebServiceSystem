using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AfterSaleServiceSystem.Supervisor
{
    public partial class repairSheetView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Context.Session["authorityid"]) != 2)//管理员身份
            {
                Context.Response.Redirect("~/LogIn.ashx");
            }
            SqlDataSource1.InsertCommand = "SELECT tb_repairsheet.id, tb_repairsheet.guid, tb_repairsheet.producttype, tb_repairsheet.productnumber, tb_repairsheet.repairstateid, tb_repairsheet.clerkid, tb_repairsheet.customid, tb_repairsheet.process, tb_clerk.username, tb_repairstate.description, tb_custom.company FROM tb_repairsheet LEFT JOIN tb_custom ON tb_repairsheet.id = tb_custom.id LEFT JOIN tb_repairstate ON tb_repairsheet.id = tb_repairstate.id LEFT JOIN tb_clerk ON tb_repairsheet.clerkid = tb_clerk.id";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter s = new AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter();
            ListView1.DataSource = s.GetDataBy1(Convert.ToInt32(DropDownList1.SelectedValue));
            ListView1.DataSourceID = null;
            ListView1.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter s = new AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter();

            ListView1.DataSource = s.GetDataBycustomid(Convert.ToInt32(DropDownList2.SelectedValue));
            ListView1.DataSourceID = null;
            ListView1.DataBind();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter s = new AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter();

            ListView1.DataSource = s.GetDataByrepairstateid(Convert.ToInt32(DropDownList3.SelectedValue));
            ListView1.DataSourceID = null;
            ListView1.DataBind();
        }





 
    }
}
