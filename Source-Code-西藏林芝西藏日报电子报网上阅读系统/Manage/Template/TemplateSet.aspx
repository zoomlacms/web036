<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_TemplateSet, App_Web_a4yhi3lz" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>方案设置</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">  
<ol class="breadcrumb navbar-fixed-top" id="breadcrumb">
<li><a href="<%=CustomerPageAction.customPath2 %>>/Main.aspx">工作台</a></li>
<li><a href="/Config/SiteOption.aspx">系统设置</a></li>
<li class="active">本地方案列表<a href="TemplateSetOfficial.aspx"> [从云端免费获取全站方案] </a></li>
</ol>
<div class="template">
<ul class="list-unstyled">
<ZL:ExRepeater runat="server" ID="RPT" PageSize="14" PagePre="<li class='text-center'>" PageEnd="</li>" OnItemCommand="RPT_ItemCommand">
<ItemTemplate>
<li class="padding5">
<div class="Template_box">
<img onmouseover="this.style.border='1px solid #9ac7f0';" onmouseout="this.style.border='1px solid #eeeeee';" alt="点击大图预览" onerror="this.onerror=null;this.src='/Images/nopic.gif'" style="width: 100%;" src="/Template/<%#Eval("name") %>/view.jpg">          
<span><%#IsDefaultTlp() %><%# GetTlpName("Project")%></span>
<ul class="list-unstyled text-center"> 
<li><a href="TemplateManage.aspx?setTemplate=<%#Eval("name") %>" class="btn btn-primary">模板管理</a></li>
<li>作者名：<%# GetTlpName("Author")%></li>
<li><a href='/Template/<%#Eval("name") %>/Bview.jpg' class="lightbox">[<i class="fa fa-search-plus"></i>大图预览]</a></li>              
<li> 
<asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="set">设为默认</asp:LinkButton>
<asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="del2" OnClientClick="return confirm('你确定删除吗');">删除</asp:LinkButton>
</li>
</ul>     
</div>        
</li>
</ItemTemplate>    
<FooterTemplate><div class="clearfix"></div></FooterTemplate> 
</ZL:ExRepeater>
</ul>
</div>  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script> 
<script type="text/javascript">
	$(document).ready(function () {
		base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
		$(".lightbox").lightbox({
			fitToScreen: true,
			imageClickClose: false
		});
	});
	$(".Template_box").mouseenter(function (e) {
		$(".Template_box").find("ul").fadeOut();
		$(this).find("ul").fadeIn();
	});
	$(".template").mouseleave(function (e) {
		$(".Template_box").find("ul").hide();
	});         
</script>
</asp:Content>