﻿<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="FreeHome.Home.MyHome, App_Web_5r1psnap" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的小屋</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/Userzone/Default.aspx">我的空间</a></li>
        <li class="active">我的小屋</li>
    </ol>
    <div style="margin-bottom:10px;">
        <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    </div>
    <table class="table table-bordered">
        <tr>
            <td>
                <div class="btn-group">
                    <a href="homeset.aspx" class="btn btn-primary" target="_blank">布置我的小屋</a>
                    <a href="ProductCenter.aspx" class="btn btn-primary" >商品中心</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <iframe scrolling="no" frameborder="0" src="Homeshow.aspx?shid=<%=uid %>" width="100%" height="600"></iframe>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" language="javascript" src="../command/common.js"></script>
    <script type="text/javascript" language="javascript" src="../command/subModal.js"></script>
    <script>
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
