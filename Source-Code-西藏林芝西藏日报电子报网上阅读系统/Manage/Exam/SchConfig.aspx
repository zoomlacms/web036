﻿<%@ page language="C#" autoeventwireup="true" inherits="test_test, App_Web_farmqmyf" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <title>基本设置</title>
    <style type="text/css">
      .table>tbody>tr>td{padding:0px;}
      .item{cursor:pointer;height:120px;}
      .hid{display:none;}
      .content{height:85px; width: 100%;resize:none;text-align:center;border:none;}
      .itemhead{height: 30px;line-height: 30px; width: 100%; background-color: rgba(0, 0, 0, 0.50); text-align: right; padding-right: 5px; color:white;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr><td class="td_m">学校名称:</td><td><asp:TextBox runat="server" ID="SchoolName_T" CssClass="form-control"/></td></tr>
        <tr><td>学期名称:</td><td><asp:TextBox runat="server" ID="TermName_T" CssClass="form-control" /></td></tr>
        <tr><td>课数配置:</td><td>
            <span>每周天数:</span>
            <asp:DropDownList runat="server" ID="WeekDay_DP" onchange="Render();">
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
                <asp:ListItem Text="5" Selected="True">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <span>上午节数:</span>
            <asp:DropDownList runat="server" ID="Moring_DP" onchange="Render();">
                <asp:ListItem Text="0">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4" Selected="True">4</asp:ListItem>
                <asp:ListItem Text="5">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <span>下午节数:</span>
            <asp:DropDownList runat="server" ID="Afternoon_DP" onchange="Render();">
                <asp:ListItem Text="0">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3" Selected="True">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
                <asp:ListItem Text="5">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <span>晚上节数:</span>
            <asp:DropDownList runat="server" ID="Evening_DP" onchange="Render();">
                <asp:ListItem Text="0" Selected="True">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
                <asp:ListItem Text="5">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <input type="button" value="节次时间" class="btn btn-xs btn-primary" onclick="ShowSetTime();" />
            </td></tr>
        <tr><td>学校类型:</td><td>
            <label><input type="radio" name="schoolType_rad" value="小学" />小学</label>
            <label><input type="radio" name="schoolType_rad" value="中学" checked="checked" />中学</label>
            <label><input type="radio" name="schoolType_rad" value="院校" />院校</label>
            <label>安排早晚自学:<asp:CheckBox runat="server" ID="StudySelf_Chk" /></label>
            <label>有自主选修课程:<asp:CheckBox runat="server" ID="SelectCourse_Chk" /></label>
            <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-xs btn-primary" OnClientClick="return SaveConfig();" OnClick="Save_Btn_Click" />
        </td></tr>
    </table>
    <table id="maintable" class="table table-bordered">
        <thead style="text-align:center;"><tr><td class="td_s"></td><td>星期一</td><td>星期二</td><td>星期三</td><td>星期四</td><td>星期五</td><td>星期六</td><td>星期日</td></tr></thead>
        <tbody id="courseTable"></tbody>
    </table>
   <asp:HiddenField runat="server" ID="Json_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ICMS/ZL_EDU.js"></script>
    <script>
        var table = $("#courseTable");
        var config = JSON.parse($("#Json_Hid").val());
        var items = JSON.parse(config.items);//单元格Json
        $(function () {
            InitTable();
        })
    </script>
</asp:Content>