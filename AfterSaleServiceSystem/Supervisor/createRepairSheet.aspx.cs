using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters;
using AfterSaleServiceSystem.DAL;
using System.Data;
namespace AfterSaleServiceSystem.Supervisor
{
    public partial class createRepairSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)//表单提交
            {
                string guidRequest = Context.Request["GUID"];
                string productType = Context.Request["productType"];
                string productCode = Context.Request["productCode"];

                tb_repairsheetTableAdapter repairsheetTableAdapter = new tb_repairsheetTableAdapter();
                if (repairsheetTableAdapter.GetDataByGuid(guidRequest).Rows.Count > 0)//已经存在该条形码
                {
                    Label1.Text = "该维修单已经被录入";
                }
                else
                {
                    dsRepairSheet.tb_repairsheetDataTable ds = new dsRepairSheet.tb_repairsheetDataTable();
                    repairsheetTableAdapter.Fill(ds);
                    //repairsheetTableAdapter.Fill(dataset, "acUser");//用表User填充dataset对象
                    repairsheetTableAdapter.InsertQuery(guidRequest, productType, productCode, 1, 0, DropDownList1.SelectedIndex+1, 0);
                    repairsheetTableAdapter.Update(ds);
                    isInsertSucced.Text = "录入成功";
                }

            }
        }
    }
}
