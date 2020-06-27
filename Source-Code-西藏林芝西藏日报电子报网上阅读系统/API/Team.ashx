<%@ WebHandler Language="C#" Class="Team" %>

using System;
using System.Web;
using ZoomLa.SQLDAL;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.Common;
/*
 * 用于Team360,提供手机API
 */ 

public class Team : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest request = context.Request;
        HttpResponse response = context.Response;
        string action = string.IsNullOrEmpty(request["action"]) ? "login" : request["action"];
        string result = "";
        switch (action)
        {
            case "login"://http://Cloud.zoomla.cn/api/team.ashx?N=test&p=test&os=2t&mac=1
                {
                    string uname = request["n"];
                    string passwd = request["p"];//已经MD5后的密码
                    int os = DataConvert.CLng(request["os"]);//设备号
                    string mac = request["mac"];
                    if (string.IsNullOrEmpty(uname) || string.IsNullOrEmpty(passwd))
                    {
                        result = "{\"retstatus\":\"-1\",\"retmsg\":\"登录失败,用户名或密码不能为空\"}";
                    }
                    else
                    {
                        M_UserInfo mu = buser.AuthenticateUser(uname, passwd, true);
                        if (mu.IsNull)
                        {
                            result = "{\"retstatus\":\"-1\",\"retmsg\":\"登录失败,用户名或密码错误\"}";
                        }
                        else
                        {
                            buser.SetLoginState(mu, "Day");
                            M_Uinfo basemod = buser.GetUserBaseByuserid(mu.UserID);
                            string authStamp = EncryptHelper.AESEncrypt(mu.UserName + "|" + mu.UserPwd + "|" + DateTime.Now);
                            result = "{\"retstatus\":\"99\",\"retmsg\":\"\",\"UserID\":\"" + mu.UserID + "\",\"UserName\":\"" + mu.UserName + "\",\"UserFace\":\"" + basemod.UserFace + "\",\"TrueName\":\"" + basemod.TrueName + "\",\"CompName\":\"逐浪软件\",\"Url\":\"http://Cloud.zoomla.cn/\",\"AuthStamp\":\"" + authStamp + "\"}";
                            //\"TUrl\":\"http://Cloud.zoomla.cn/User/Default.aspx\",
                        }
                    }
                }
                break;
        }
        response.Clear(); response.Write(result); response.Flush(); response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}