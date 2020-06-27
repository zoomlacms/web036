<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Comment.CommentFor, App_Web_nsda5fci" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head>
<title>发表评论</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/alt.js"></script>
<link rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="/dist/css/font-awesome.min.css" />
<link rel="stylesheet" href="/App_Themes/ICMS/V3.css" />
<script type="text/javascript" src="/JS/Common.js"></script>
<script src="/JS/ZL_ValidateCode.js"></script>
<script src="/JS/ICMS/MainBlog.js"></script>
<script type="text/javascript">
function DealwithUploadPic(path, id) {
if (document.getElementById(id).value.indexOf("|") > -1) {
var filepath = document.getElementById("txtFiles").value;
var cs = filepath.split('|');
if (path.indexOf('|') > -1) {
var temppath = path.split('|');
document.getElementById("txtFiles").value = cs[0] + "|" + temppath[1];
}
else {
document.getElementById("txtFiles").value = cs[0] + "|" + path;
}
} else {
document.getElementById("txtFiles").value = path;
}
alert(path);
}
</script>
<style>
ul { display: inline-block;margin: 0px;padding: 0px;}
ul li {float: left;margin-left: 10px;}
.replybody { border:1px #ccc solid; padding:5px;background-color:#f5f5f5; margin:5px;}
.replybody h5{ color:#428bca;}
.replybody .comm_btns{ cursor:pointer;}
.comm-date{ display:inline-block; float:right;color:#999;}
.comm_btns{ display:inline-block; margin-right:10px;}
.replycomm{ max-width:100%;}
.ContentRight .form-control{ max-width:100%;}
#toComment{ position:relative; float:right; margin-left:20%; width:80%; border:1px solid #ddd; background:#f5f5f5; border-radius:4px;}
#toComment .form-control{ max-width:100%; border:none; border-bottom:1px solid #ddd; border-radius:0;}
#toComment .fa-smile-o{ margin-left:10px; margin-top:4px; color:#0C3; font-size:1.5em;} 
#toComment .btn{ padding-left:2em; padding-right:2em;}
.comment_func .comm_btns{ cursor:pointer;}
.comment_list{ padding-bottom:120px;}
.reply_vaild{ margin-left:5px;}
.reply_vaild input{border:1px solid #ccc!important;}
#VCode2{ height:30px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="Comment">
                <div id="Comment_List">                    
                    <div id="nocoment" visible="false" runat="server" class="nocontent">信息所属栏目评论功能已关闭</div>
                    <div id="comentyes" visible="false" runat="server">
                        <div class="panel panel-default">
                            <div class="panel-heading">我也来说两句</div>
                            <div class="panel-body">
                                <div class="CommentPK">
                                    <asp:RadioButtonList ID="RBLPK" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Selected="True">我支持</asp:ListItem>
                                        <asp:ListItem Value="0">我反对</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="ListLayout1" style="clear: both;">
                                    <a name="huifu"></a>
                                    <div class="ContentRight">
                                        <asp:TextBox ID="TxtContents" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" Width="100%" Height="120"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="评论内容不能为空" ValidationGroup="SendMsg" ControlToValidate="TxtContents"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="hidden">
                                        <span>评 分：</span><span>
                                            <asp:DropDownList CssClass="form-control" Width="100" ID="DDLScore" runat="server">
                                                <asp:ListItem Value="1">1分</asp:ListItem>
                                                <asp:ListItem Value="2">2分</asp:ListItem>
                                                <asp:ListItem Value="3" Selected="True">3分</asp:ListItem>
                                                <asp:ListItem Value="4">4分</asp:ListItem>
                                                <asp:ListItem Value="5">5分</asp:ListItem>
                                            </asp:DropDownList>
                                        </span>
                                    </div>
                                    
                                    <div class="clear"></div>
                                    <div style="float:left; width:40%;">
                                        <asp:TextBox ID="VCode" placeholder="验证码" MaxLength="6" Width="100" runat="server" class="form-control" />
                                        <img id="VCode_img" runat="server" title="点击刷新验证码" class="code" />
                                        <input type="hidden" id="VCode_hid" name="VCode_hid" />
                                    </div>
                                    <div style="float:right; width:40%; text-align: right;">
                                        <asp:HiddenField ID="HdnTitle" runat="server" />
                                        <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" ShowSummary="false" runat="server" />
                                        <asp:Button ID="Button1" CssClass="btn btn-primary" OnClientClick="return checkLogin()" runat="server" ValidationGroup="SendMsg" Text="发表评论" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divshap" style="<%=getStyle() %>"><strong>已发表评论，系统只允许评论一次，如果你的评论没有显示在列表中，请等待管理员审核。</strong> </div>
                </div>
                <div id="CommentInput" style="margin-bottom: 20px; position: relative;">
                    <div class="alert alert-warning" role="alert">
                        本评论只代表网友个人观点，不代表本站观点。
                    </div>
                    <div class="clear"></div>
                    <div class="panel panel-default comment_list">
                        <div class="panel-heading">
                            <ul>
                                <li>评论总数：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></li>
                                <li>支持：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></li>
                                <li style="text-decoration: line-through;">反对：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></li>
                                <li><a href="#huifu">发表评论</a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <ul class="list-group" style="width:100%; padding:0;">
                                <ZL:ExRepeater ID="RPT" OnItemDataBound="RPT_ItemDataBound" runat="server" PageSize="10" PagePre="<li class='text-center margin_t10'>" PageEnd="</li>">
                                    <ItemTemplate>
                                        <li class="list-group-item" style="width:100%;">
                                            <h5 class="list-group-item-heading"><%#GetHead(Eval("CommentID"))%>评论人：<%# GetUserName(Eval("UserID","{0}")) %> &nbsp;&nbsp;&nbsp;&nbsp;评论意见：<span class="yijian"><%# GetPK(Eval("PK","{0}")) %></span>  <span class="text-right comm-date">发表时间：<%# Eval("CommentTime") %></span></h5>
                                            <p class="list-group-item-text">
                                            <asp:Literal ID="Commment_Lit" runat="server"></asp:Literal>
                                                <%# Eval("Contents")%>
                                            </p>
                                            <div class="text-right comment_func">
                                                <span class="comm_btns">支持(<%#Eval("AgreeCount") %>)</span>
                                                <span class="comm_btns">反对(<%#Eval("DontCount") %>)</span>
                                                <%#GetReport(Eval("ReprotIDS").ToString(),Eval("CommentID").ToString()) %>
                                                <span class="comm_btns" onclick='showHuiFu(this,<%#Eval("commentID") %>)'>回复</span>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate></FooterTemplate>
                                </ZL:ExRepeater>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div id="boxCovers" style="display: none; position: absolute; top: 0px; left: 0px; z-index: 98; background: #b2b2b2;"></div>
            
            <div id="popupLogin" style="width: 300px; height: 200px; background: #fff; position: absolute; top: 250px; left: 350px; z-index: 99; border: #33ccff solid 3px; display: none;">
                <div id="LoginHead" class="ptitle"><span class="pspanl">用户登录</span><span id="lclose" class="pspanr">关闭</span></div>
            </div>
            <div id="toComment_box" class="hidden">
           <div id="toComment">
           <textarea id="popupboxs" name="txtContent" class="form-control" placeholder="请输入评论内容" rows="4"></textarea>
           <span class="pull-left hidden"><i class="fa fa-smile-o" title="插入表情"></i></span>
           <span class="pull-left reply_vaild">验证码: <asp:TextBox ID="VCode2" MaxLength="6" runat="server" class="form-control td_m" />
                                        <img id="VCode2_img" runat="server" title="点击刷新验证码" class="code" />
                                        <input type="hidden" id="VCode2_hid" name="VCode2_hid" /></span>
               <input type="hidden" name="txtpid" id="txtpid" />
           <span class="pull-right"><button class="btn btn-sm btn-default" type="button" id="commentBtn" onClick="commentSubmit()">发布</button></span>
           <div class="clearfix"></div>
           </div>
           </div>    
        <asp:Button ID="Reply_Btn" runat="server" style="display:none;" OnClick="Reply_B_Click" />   
    </form>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        var ismove = false;
        $(function () {
            $("#VCode").ValidateCode();
        })
        function commentSubmit() {
            $("#Reply_Btn").click();
        }
        function Report(obj) {
            $.ajax({
                type: "POST",
                data: { action: 'report', cid: $(obj).data('cid') },
                success: function (data) {
                    if (data == "1") {
                        $(obj).removeAttr('onclick');
                        $(obj).addClass('gray_9');
                        $(obj).text('已举报');
                    }
                }
            });
        }
        var loginDiag = new ZL_Dialog();
        function checkLogin() {
            if (islogin == "1") {
                loginDiag.title = "用户登录";
                loginDiag.url = "/API/login.aspx";
                loginDiag.ShowModal();
                return false;
            }
            return true;
        } 
		function showHuiFu(obj, pid) {
		    $("#VCode2").ValidateCode();
		    $("#txtpid").val(pid);
			    $("#toComment").appendTo($(obj).parent());
			
		}   
        var islogin = "<%=islogin %>";
        var isssfor = "<%=iscfor %>";
        function LoginSuccess() {
            history.go(0);
        }
    </script>
</body>
</html>
