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
            if (Convert.ToInt32(Context.Session["UserID"]) != 2)//管理员身份
            {
                Context.Response.Redirect("~/LogIn.ashx");
            }
        }
    }
}
