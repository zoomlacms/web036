﻿<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_KeyWordManage, App_Web_ydw421gi" clientidmode="Static" validaterequest="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>来源管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
<div class="btn-group marginbot10">
<a href="AddSource.aspx" class="btn btn-primary" >添加来源</a>
<a href="Author.aspx"  class="btn btn-primary" >添加作者</a>
<a href="AddKeyWord.aspx"  class="btn btn-primary" >添加关键字</a>
</div><!--end navigation-->
    <div class="clearfix"></div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="KeywordID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField>                            
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("KeywordID") %>' />
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="KeywordID" HeaderText="序号">
                <ItemStyle  CssClass="keyid" HorizontalAlign="Center" />
            </asp:BoundField>                        
            <asp:TemplateField HeaderText="关键字名称">
                <ItemTemplate>
                    <a href="AddKeyWord.aspx?Action=Modify&KWId=<%#Eval("KeywordID")%>">
                        <%# DataBinder.Eval(Container.DataItem, "KeywordText")%>
                    </a>
                </ItemTemplate>
                    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="关键字类别">
                <HeaderStyle/>
                <ItemTemplate>
                    <%#Convert.ToInt32(Eval("KeywordType"))==0?"常规关键字":"搜索关键字"%>
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="优先级">
                <ItemTemplate>
                    <%#Eval("Priority")%>
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="查询次数">
                <ItemTemplate>
                    <%#Eval("Hits")%>
                </ItemTemplate>   
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />                     
            </asp:TemplateField>
                <asp:TemplateField HeaderText="引用次数">
                <ItemTemplate>
                    <%#Eval("QuoteTimes")%>
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />                        
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="19%" />
                <ItemTemplate>
                    <a href='AddKeyWord.aspx?Action=Modify&KWId=<%# Eval("KeywordID")%>' >修改</a>
                    <a  href="javascript:if(confirm('你确定要删除吗?')) window.location.href='KeyWordManage.aspx?KWId=<%# Eval("KeywordID")%>';">删除</a>
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
    <div class="clearfix"></div>
    <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
        <tr>
            <td>
                <asp:Button class="btn btn-primary" ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="删除选定关键字" OnClick="btndelete_Click" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr").dblclick(function () {
                var id = $(this).find(".keyid").text();
                if (id) {
                    location = "AddKeyWord.aspx?Action=Modify&KWId=" + id;
                }
            });
        });
    </script>
</asp:Content>