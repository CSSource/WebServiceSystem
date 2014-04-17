using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AfterSaleServiceSystem.DAL.dsClerkTableAdapters;
using System.Data;
using System.Web.SessionState;

namespace AfterSaleServiceSystem
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class LogIn : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string str_ispostBack = context.Request["btn"];

            if (string.IsNullOrEmpty(str_ispostBack))//请求展示
            {
                string result = CommonHelper.RenderHtml("LogIn.htm", new { tips = "" });
                context.Response.Write(result);
            }
            else//提交请求
            {

                string username = context.Request["txtName"];
                string passwd = context.Request["txtPwd"];

                using (tb_clerkTableAdapter clerkTableAdapter = new tb_clerkTableAdapter())
                {
                    if (clerkTableAdapter.GetDataByUsernameAndPassword(username, passwd).Rows.Count > 0)//存在用户
                    {
                        AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow row = (AfterSaleServiceSystem.DAL.dsClerk.tb_clerkRow)clerkTableAdapter.GetDataByUsernameAndPassword(username, passwd).Rows[0];
                        context.Session["UserId"] = (int)row.id;
                        context.Session["authorityid"] = row.authorityid;
                        if (row.authorityid == 2)//管理员登陆
                        {
                         
                            context.Response.Redirect("/Supervisor/supervisorHomePage.aspx");
                            //进入管理员页面
                            //todo

                        }
                        else if (row.authorityid == 1)//维修人员登陆
                        {

                            //进入维修人员页面
                            context.Response.Redirect("/Serviceman/ClerkMain.aspx");
                        }


                    }
                    else //用户名或密码错误
                    {
                        string result = CommonHelper.RenderHtml("LogIn.htm", new { tips = "用户名或密码错误" });
                        context.Response.Write(result);
                    }
                }
            }


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
