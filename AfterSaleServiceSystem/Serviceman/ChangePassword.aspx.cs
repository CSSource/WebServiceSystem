using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;
using System.Data;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            tb_clerkTableAdapter clerkTableAdapter = new tb_clerkTableAdapter();
            DataRowCollection rows = clerkTableAdapter.GetDataByid(Convert.ToInt32(Session["UserId"])).Rows;

            if (rows.Count > 0)
            {
                AfterSaleServiceSystem.DAL.dsClerk.tb_clerkDataTable dt = clerkTableAdapter.GetDataByid(Convert.ToInt32(Session["UserId"]));
                AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow row = (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow )dt.Rows[0];
               
                // row .password 
                TextBox tbOld = (TextBox)this.Master.FindControl("ContentPlaceHolderContent").FindControl("TextBoxOldVal");
                TextBox tbNew = (TextBox)this.Master.FindControl("ContentPlaceHolderContent").FindControl("TextBoxNewVal");
                TextBox tbConfirm = (TextBox)this.Master.FindControl("ContentPlaceHolderContent").FindControl("TextBoxConfirm");

                string sOld = tbOld.Text;
                string sNew = tbNew.Text;
                string sConfirm = tbConfirm.Text;
                if (row.password.Trim() == sOld)//原密码验证成功
                { 
                    row.password = sNew;
                    clerkTableAdapter.Update(dt);
                }
                else
                {
                    RequiredFieldValidatorOldVal.Text = "原始密码错误";
                }





            }


        }
    }
}
