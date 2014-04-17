using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;
using System.Data;
using System.IO;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class ClerkMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int authorityid = Convert.ToInt32((Session["authorityid"]));

#if DEBUG
            if (Session["UserId"] == null)
            {

                Session["UserId"] = 1;
            }
#endif

            if (Session["UserId"] == null)
            {
                Response.Redirect("~\\Default.aspx");
            }
            else
            {

                if (authorityid == 1)
                {
              
                    HyperLink1.NavigateUrl = "../Serviceman/ClerkMain.aspx";

                }
                else if (authorityid == 2)
                { HyperLink1.NavigateUrl = "../Supervisor/supervisorHomePage.aspx"; }
                //更新用户信
                ///*
                int userid = Convert.ToInt32(Session["UserId"]);

                tb_clerkTableAdapter clerkTableAdapter = new tb_clerkTableAdapter();
                DataRowCollection clerkRows = clerkTableAdapter.GetDataByid(userid).Rows;


                if (clerkRows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow clerkRow = (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerkRows[0];

                    LabelUserName.Text = clerkRow.realname;

                    if (clerkRow.headpic != null && File.Exists(Server.MapPath("~\\img\\" + clerkRow.headpic)))
                    {
                        ImageUser.ImageUrl = Server.MapPath("~\\img\\" + clerkRow.headpic);
                    }
                    else
                    {
                        ImageUser.ImageUrl = "~\\img\\noavatar_small.gif";
                    }
                }
                //*/

                ////from cooks
                //LabelUserName.Text = Request.Cookies["UserName"].ToString();
                //ImageUser.ImageUrl =


            }
        }
    }
}
