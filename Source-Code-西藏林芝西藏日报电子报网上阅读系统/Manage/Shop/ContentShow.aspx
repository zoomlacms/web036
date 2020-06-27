﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Content_ContentShow, App_Web_sunz0hm4" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>显示商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle"><asp:Label ID="Label7" runat="server" Text="修改商品成功"></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">所属栏目：</td>
            <td><asp:Label ID="NodeName" runat="server" ></asp:Label> &nbsp;</td>
        </tr>
           <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">商品ID：</td>
            <td><asp:Label runat="server" ID="ProID_L"></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">商品名：</td>
            <td><asp:Label ID="title_T" runat="server" ></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">市场参考价：</td>
            <td><asp:Label ID="ckPrice" runat="server" ></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">当前零售价：</td>
            <td><asp:Label ID="nowPrice" runat="server" ></asp:Label></td>
        </tr>
            <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">积分价格：</td>
            <td><asp:Label ID="lblpoint" runat="server" ></asp:Label></td>
        </tr>
            <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">点击数：</td>
            <td><asp:Label ID="lblCountHits" runat="server" ></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">销售状态：</td>
            <td><asp:Label ID="shopState" runat="server" ></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" class="tdbgleft" align="right" style="width: 24%">属性设置：</td>
            <td><asp:Label ID="codes" runat="server" ></asp:Label></td>
        </tr>
        <tr class="tdbg">
            <td height="22" align="center" colspan="2" style="line-height: 25px;">
                <a class="btn btn-primary" href="<%:"AddProduct.aspx?menu=edit&ModelID=" + pinfo.ModelID + "&NodeID=" + pinfo.Nodeid + "&id=" + pinfo.ID %>"">重新修改</a>
                <a class="btn btn-primary" href="<%:"AddProduct.aspx?ModelID=" + pinfo.ModelID + "&NodeID=" + pinfo.Nodeid %>">继续添加</a>
                <a class="btn btn-primary" href="<%:"ProductManage.aspx?NodeID=" + pinfo.Nodeid %>">管理商品</a>
                <a class="btn btn-primary" href="<%:"ShowProduct.aspx?menu=edit&ModelID=" + pinfo.ModelID + "&NodeID=" + pinfo.Nodeid + "&id=" + pinfo.ID %>">查看内容</a>
                <a class="btn btn-primary" href="<%:"/Shop.aspx?ID=" + pinfo.ID %>" target="_blank">前台预览</a>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script src="/JS/calendar.js" type="text/javascript"></script>
</asp:Content>