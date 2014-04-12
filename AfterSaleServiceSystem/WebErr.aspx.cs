using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AfterSaleServiceSystem
{
    public partial class WebErr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["msg"] == null)
            {

                Exception ex = Server.GetLastError(); //获取异常源
                if (ex != null)
                {
                    LabelErrMsg.Text = "错误信息： " + ex.Message;
                    LabelErrSrc.Text = "数据来源：  " + ex.Source;
                    LabelErrStack.Text = "运行堆栈： " + ex.StackTrace;

                }
                //清空前一个异常
                Server.ClearError();
            }
            else
            {
                LabelErrMsg.Text = Request["msg"].ToString();
            }
        }
    }
}
