<%@ page language="C#" autoeventwireup="true" inherits="test_Default, App_Web_fqccbaaa" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <title>内容采集</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered">
        <tr><td class="td_m">所属节点：</td><td><asp:DropDownList runat="server" ID="NodeList_DP" DataValueField="NodeID" DataTextField="NodeName" CssClass="form-control"></asp:DropDownList></td></tr>
        <tr><td>标题：</td><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control" /></td></tr>
        <tr><td>来源：</td><td><asp:TextBox runat="server" ID="SourceUrl_T" CssClass="form-control" /></td></tr>
        <tr><td>作者：</td><td><asp:TextBox runat="server" ID="Author_T" CssClass="form-control" /></td></tr>
        <tr><td>简述：</td><td><asp:TextBox runat="server" ID="Synopsis_T" CssClass="form-control" /></td></tr>
        <tr><td>内容：</td><td><asp:TextBox runat="server" ID="Content_T" TextMode="MultiLine" style="height:300px;width:900px;"></asp:TextBox></td></tr>
    </table>
    <div style="position:fixed;border:1px solid #ddd;width:100%;bottom:0px;z-index:1000;padding:5px;background-color:rgba(114, 111, 111, 0.5)" class="text-center">
        <asp:Button runat="server" ID="Add_Btn" Text="添加" CssClass="btn btn-primary" OnClick="Add_Btn_Click" OnClientClick="return CheckData();" />
    </div>
    <%=Call.GetUEditor("Content_T",3) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function CheckData() {
            if ($("#NodeList_DP").val() < 0)
            {
                alert("请选择节点"); return false;
            }
        }
    </script>
</asp:Content>