using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class UserDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormViewUser_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            DropDownList ddl = (DropDownList)FormViewUser.FindControl("DropDownListSex");
            if (ddl != null)
                e.NewValues["sex"] = ddl.SelectedValue;
        }

        protected void FormViewUser_ItemCreated(object sender, EventArgs e)
        {
            if (FormViewUser.CurrentMode == FormViewMode.Edit)
            {
                DropDownList ddl = (DropDownList)FormViewUser.FindControl("DropDownListSex");
                if (ddl != null && FormViewUser.DataItem != null)
                {
                    DataRowView view = (DataRowView)FormViewUser.DataItem;
                    AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkRow = (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)view.Row;

                    ddl.SelectedValue = clerkRow.sex;
                }
            }
        }
    }
}
