using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AfterSaleServiceSystem.DAL.dsCustomerTableAdapters;
using AfterSaleServiceSystem.DAL.dsRepairStateTableAdapters;
using AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters;

namespace AfterSaleServiceSystem.Serviceman
{
    public partial class ClerkMain : System.Web.UI.Page
    {
        protected override void OnLoadComplete(EventArgs e)
        {
            if (Context.Session["UserId"] == null || Context.Session["UserId"] == string.Empty || Convert.ToInt32(Context.Session["authorityid"]) != 1)
            {
                //用户未登录，重定向到登录页面
                this.Response.Redirect(MapPath("~/LogIn.ashx"));
                
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListViewRepairSheet_ItemCreated(object sender, ListViewItemEventArgs e)
        {
        }

        protected void ListViewRepairSheet_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem DataItem = (ListViewDataItem)e.Item;
                DataRowView dv = (DataRowView)DataItem.DataItem;
                AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow repairsheetRow = (AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow)dv.Row;

                tb_repairstateTableAdapter repairstateTableAdapter = new tb_repairstateTableAdapter();
                if (repairstateTableAdapter.GetDatabyid(repairsheetRow.repairstateid).Rows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsRepairState.tb_repairstateRow repairstateRow =
                        (AfterSaleServiceSystem.DAL.dsRepairState.tb_repairstateRow)
                        repairstateTableAdapter.GetDatabyid(repairsheetRow.repairstateid).Rows[0];
                    Label lb = (Label)e.Item.FindControl("repairstateidLabel");
                    if (lb != null)
                        lb.Text = repairstateRow.description;
                }

                tb_customTableAdapter customTableAdapter = new tb_customTableAdapter();
                if (customTableAdapter.GetDataByid(repairsheetRow.customid).Rows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow customRow =
                        (AfterSaleServiceSystem.DAL.dsCustomer.tb_customRow)
                        customTableAdapter.GetDataByid(repairsheetRow.customid).Rows[0];
                    Label lb = (Label)e.Item.FindControl("customidLabel");
                    if (lb != null)
                        lb.Text = customRow.company;
                }
            }

        }

        protected void ObjectDataSourceRepairSheet_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //TextBox tbGUID = (TextBox)this.FindControl("TextBoxGUID");
            TextBox tbGUID = (TextBox)this.Master.FindControl("ContentPlaceHolderContent").FindControl("TextBoxGUID");
            Label err_Checked = (Label)this.Master.FindControl("ContentPlaceHolderContent").FindControl("LabelErr_Checked");
            err_Checked.Visible = false;

            Label err_NoExist = (Label)this.Master.FindControl("ContentPlaceHolderContent").FindControl("LabelErr_NoExist");
            err_NoExist.Visible = false;

            if (tbGUID != null)
            {
                string sguid = tbGUID.Text;

                tb_repairsheetTableAdapter repairsheetTableAdapter = new tb_repairsheetTableAdapter();

                DataRowCollection Rows = repairsheetTableAdapter.GetDataByGUID(sguid).Rows;

                if (Rows.Count > 0)
                {
                    AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow repairsheetRow =
                              (AfterSaleServiceSystem.DAL.dsRepairSheet.tb_repairsheetRow)Rows[0];

                    if (repairsheetRow.clerkid != 0)
                    {
                        //err:维修单已经申领

                        err_Checked.Visible = true;

                    }
                    else if (Session["UserId"] == null || Session["UserId"] == string.Empty)
                    {
                        //用户未登录，重定向到登录页面
                        this.Response.Redirect(MapPath("~\\Default.aspx"));
                    }
                    else
                    {
                        repairsheetRow.clerkid = Convert.ToInt32(Session["UserId"]);

                        repairsheetTableAdapter.Update(repairsheetRow);
                        Response.Redirect(MapPath("~\\Serviceman\\ClerkMain.aspx"));
                        //申领成功
                    }
                }
                else
                {
                    //维修单不存在
                    err_NoExist.Visible = true;
                }
            }
        }

    }
}
