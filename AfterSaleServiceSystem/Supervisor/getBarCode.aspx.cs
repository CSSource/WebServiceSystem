using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AfterSaleServiceSystem.Supervisor
{
    public partial class getBarCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Context.Session["authorityid"]) != 2)//管理员身份
            {
                Context.Response.Redirect("~/LogIn.ashx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string guid = Context.Request["barCode"];
            Context.Response.Redirect("createRepairSheet.aspx?GUID="+guid);
        }
    }
}
