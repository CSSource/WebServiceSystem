using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services ;
using System.Web.SessionState;

namespace AfterSaleServiceSystem
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class Logout : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            //这样你就可以如下 操作了

            if (context.Session["UserID"] != null)
            {
                context.Session["UserID"] = null;
            }

            //...继续
            context.Response.Redirect("~\\Default.aspx");

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
