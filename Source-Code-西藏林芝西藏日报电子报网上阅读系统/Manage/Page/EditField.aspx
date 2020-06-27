﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Page.UpdateModelField, App_Web_svnn24km" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改字段</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr>
        <td class="tdbgleft">
            字段别名：
        </td>
        <td>
            <asp:TextBox ID="Alias" runat="server" class="l_input" MaxLength="20"></asp:TextBox><font color="#ff0066">*</font><span
                class="tips"> 如：文章标题</span>
        </td>
    </tr>
    <tr>
        <td class="tdbgleft">
            字段名称：
        </td>
        <td>
            <asp:TextBox ID="Name" MaxLength="50"  class="l_input"  runat="server"></asp:TextBox><font color="#ff0066">*</font><span
                class="tips">字段名由字母、数字、下划线组成，不接受空格</span>
        </td>
    </tr>
    <tr>
        <td class="tdbgleft">
            字段提示：
        </td>
        <td>
            <asp:TextBox ID="Tips" MaxLength="50"  class="l_input"  runat="server"></asp:TextBox><span class="tips">显示在字段别名下方作为重要提示的文字</span>
        </td>
    </tr>
    <tr>
        <td class="tdbgleft">
            字段描述：
        </td>
        <td>
            <asp:TextBox ID="Description"  class="l_input"  runat="server" Columns="40" 
                Rows="6" TextMode="MultiLine" Height="60px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="tdbgleft">
            是否必填：
        </td>
        <td>
            <asp:RadioButtonList ID="IsNotNull" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="True">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="False">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="tdbgleft">
            是否在页面显示：
        </td>
        <td>
            <asp:RadioButtonList ID="IsShow" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="true" Value="True">是</asp:ListItem>
                <asp:ListItem Value="False">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tbody id="tbSearch" runat="server" style="">
        <tr>
            <td class="tdbgleft">
                是否在搜索表单显示：
            </td>
            <td>
                <asp:RadioButtonList ID="IsSearchForm" runat="server" RepeatDirection="Horizontal"
                    CssClass="input1">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </tbody>
    <tr>
        <td class="tdbgleft">
            字段类型：
        </td>
        <td>
            <asp:RadioButtonList ID="Type" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                onclick="SelectModelType()">
                <asp:ListItem Value="TextType" Selected="True">单行文本</asp:ListItem>
                <asp:ListItem Value="MultipleTextType">多行文本(不支持Html)</asp:ListItem>
                <asp:ListItem Value="MultipleHtmlType">多行文本(支持Html)</asp:ListItem>
                <asp:ListItem Value="OptionType">单选项</asp:ListItem>
                <asp:ListItem Value="ListBoxType">多选项</asp:ListItem>
                <asp:ListItem Value="DateType">日期时间</asp:ListItem>
                <asp:ListItem Value="PicType">图片</asp:ListItem>
                <asp:ListItem Value="MultiPicType">多图片</asp:ListItem>
                <asp:ListItem Value="SmallFileType">文件</asp:ListItem>
                <asp:ListItem Value="FileType">多文件</asp:ListItem>
                <asp:ListItem Value="NumType">数字</asp:ListItem>
                <asp:ListItem Value="OperatingType">运行平台</asp:ListItem>
                <asp:ListItem Value="SuperLinkType">超链接</asp:ListItem>
                <asp:ListItem Value="GradeOptionType">多级选项</asp:ListItem>
                <asp:ListItem Value="ColorType">颜色代码</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <!--  单行文本   -->
    <tbody id="DivTextType" runat="server">
        <tr>
            <td class="tdbgleft">
                文本框长度：
            </td>
            <td>
                <asp:TextBox ID="TitleSize"  class="l_input"  runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                是否为密码：
            </td>
            <td>
                <asp:RadioButtonList ID="IsPassword" runat="server" RepeatDirection="Horizontal"
                    CssClass="input1">
                    <asp:ListItem Value="password">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="text">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                默认值：
            </td>
            <td>
                <asp:TextBox ID="TextType_DefaultValue"  class="l_input"  runat="server" Columns="10"></asp:TextBox>
            </td>
        </tr>
    </tbody>
    <!--  多行文本(不支持Html)    -->
    <tbody id="DivMultipleTextType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                显示的宽度：
            </td>
            <td>
                <asp:TextBox ID="MultipleTextType_Width"  class="l_input"  runat="server" Columns="10" MaxLength="4">500</asp:TextBox>px
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                显示的高度：
            </td>
            <td>
                <asp:TextBox ID="MultipleTextType_Height"  class="l_input"  runat="server" Columns="10" MaxLength="4">200</asp:TextBox>px
            </td>
        </tr>
    </tbody>
    <!--  多行文本(支持Html)    -->
    <tbody id="DivMultipleHtmlType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                编辑器类型：
            </td>
            <td>
                <asp:DropDownList ID="IsEditor" runat="server">
                    <asp:ListItem Value="1">简洁型编辑器</asp:ListItem>
                    <asp:ListItem Value="2">标准型编辑器</asp:ListItem>
                    <asp:ListItem Value="3">增强型编辑器</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                显示的宽度：
            </td>
            <td>
                <asp:TextBox ID="MultipleHtmlType_Width" runat="server" Columns="10" MaxLength="4">715</asp:TextBox>px
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                显示的高度：
            </td>
            <td>
                <asp:TextBox ID="MultipleHtmlType_Height"  class="l_input"  runat="server" Columns="10" MaxLength="4">400</asp:TextBox>px
            </td>
        </tr>
    </tbody>
    <!--  单选项    -->
    <tbody id="DivOptionType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                分行键入每个选项：
            </td>
            <td>
                <input id="Button3" type="button" value="从数据字典中选择选项" class="C_input" onclick="SelectDictionary('RadioType_Content')" /><input
                    id="Button5" class="C_input" type="button" value="添加数据字段" onclick='SubPage("RadioType_Content")' /><br />
                <asp:TextBox ID="RadioType_Content" class="l_input" runat="server" 
                    TextMode="MultiLine" Columns="40"
                    Rows="6" Height="60px"></asp:TextBox>
                <span style="color: red">*</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                默认值：
            </td>
            <td>
                <asp:TextBox ID="RadioType_Default" class="l_input" runat="server"></asp:TextBox>
                注：没有数据录入的默认值，与前台显示无关.
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                显示选项：
            </td>
            <td>
                <asp:RadioButtonList ID="RadioType_Type" runat="server">
                    <asp:ListItem Selected="True" Value="1">单选下拉列表框</asp:ListItem>
                    <asp:ListItem Value="2">单选按钮</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                是否设置属性值：
            </td>
            <td>
                <asp:RadioButtonList ID="RadioType_Property" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </tbody>
    <!--  多选项    -->
    <tbody id="DivListBoxType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                分行键入每个选项：
            </td>
            <td>
                <input id="Button4" type="button" value="从数据字典中选择选项" class="C_input" onclick="SelectDictionary('ListBoxType_Content')" /><input
                    id="Button2" type="button" class="C_input" value="添加数据字段" onclick='SubPage("ListBoxType_Content")' /><br />
                <asp:TextBox ID="ListBoxType_Content" class="l_input"  runat="server" 
                    TextMode="MultiLine" Columns="40"
                    Rows="6" Height="59px"></asp:TextBox>
                <span style="color: red">*</span>
            </td>
        </tr>
        <tr> 
            <td class="tdbgleft">
                显示选项：
            </td>
            <td>
                <asp:RadioButtonList ID="ListBoxType_Type" runat="server">
                    <asp:ListItem Selected="True" Value="1">复选框</asp:ListItem>
                    <asp:ListItem Value="2">多选列表框</asp:ListItem>
                    <asp:ListItem Value="3">多填选项框</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </tbody>
    <!--  日期型    -->
    <tbody id="DivDateType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                搜索范围：
            </td>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                    <tr class="tdbg">
                        <td>
                            <asp:RadioButtonList ID="DateSearchType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">开始-结束日期</asp:ListItem>
                                <asp:ListItem Value="0">自定范围</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="DateSearchRang" class="l_input"  runat="server" 
                                TextMode="MultiLine" Columns="40"
                                Rows="6" Height="60px"></asp:TextBox><br />
                            <asp:RadioButtonList ID="DateSearchUnit" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">小时</asp:ListItem>
                                <asp:ListItem Value="1">天</asp:ListItem>
                                <asp:ListItem Value="2">月</asp:ListItem>
                                <asp:ListItem Value="3">年</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <font color="red">选择了自定范围时请输入此项内容,格式：范围名|范围<br />
                                分行输入范围，单位选择 天 如：<br />
                                3天内|0-3<br />
                                7天内|0-7<br />
                                7天-15天|7-15<br />
                                1个月内|0-30</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
    <!--  图片类型    -->
    <tbody id="DivPicType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                图片是否加水印：
            </td>
            <td>
                <asp:RadioButtonList ID="RBLPicWaterMark" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                允许上传的图片大小：
            </td>
            <td>
                <asp:TextBox ID="TxtSPicSize" class="l_input"  runat="server" Columns="5">1024</asp:TextBox>KB <span
                    style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">
                        *</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的图片类型：
            </td>
            <td>
                <asp:TextBox ID="TxtPicExt" class="l_input" runat="server" Columns="30"></asp:TextBox><span style="color: red">*</span>
                <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
    <!--  多图片    -->
    <tbody id="DivMultiPicType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                缩略图选项：
            </td>
            <td>
                <asp:CheckBox ID="ChkThumb" runat="server" Text="是否保存缩略图地址" />&nbsp;&nbsp;保存缩略图地址字段：
                <asp:TextBox ID="TxtThumb" class="l_input" runat="server" Columns="20"></asp:TextBox><span style="color: Red;
                    display: none;">保存缩略图地址字段名不能与主字段名重复！</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                图片是否加水印：
            </td>
            <td>
                <asp:RadioButtonList ID="RBLWaterMark" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的图片大小：
            </td>
            <td>
                <asp:TextBox ID="TxtPicSize" class="l_input" runat="server" Columns="5">1024</asp:TextBox>KB <span
                    style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">
                        *</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的图片类型：
            </td>
            <td>
                <asp:TextBox ID="TextImageType" class="l_input"  runat="server" Columns="30"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
    <!--  文件类型    -->
    <tbody id="DivSmallFileType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                允许上传的文件大小：
            </td>
            <td>
                <asp:TextBox ID="TxtMaxFileSizes" class="l_input" runat="server" Columns="5">1024</asp:TextBox>KB
                <span style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">
                    *</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的文件类型：
            </td>
            <td>
                <asp:TextBox ID="TxtUploadFileTypes"  class="l_input" runat="server" Columns="30"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
    <!--  多文件类型    -->
    <tbody id="DivFileType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                保存文件大小设置：
            </td>
            <td>
                <asp:CheckBox ID="ChkFileSize" runat="server" Text="是否保存文件大小" Checked="True" /><br />
                保存文件大小字段名：
                <asp:TextBox ID="TxtFileSizeField" class="l_input"  runat="server" Columns="20"></asp:TextBox><br />
                <span style="color: Red; display: none;">注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾。不能与已有字段名重复</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的文件大小：
            </td>
            <td>
                <asp:TextBox ID="TxtMaxFileSize" class="l_input"  runat="server" Columns="5">1024</asp:TextBox>KB
                <span style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">
                    *</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                允许上传的文件类型：
            </td>
            <td>
                <asp:TextBox ID="TxtUploadFileType" class="l_input" runat="server" Columns="30"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
    <!--  运行平台    -->
    <tbody id="DivOperatingType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                分行键入&nbsp;&nbsp;<br />
                每个平台选项：
            </td>
            <td>
                <asp:TextBox ID="TxtOperatingOption" class="l_input" runat="server" 
                    TextMode="MultiLine" Columns="40"
                    Rows="6" Height="60px"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: blue">注：一行一个默认项</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                文本框长度：
            </td>
            <td>
                <asp:TextBox ID="OperatingType_TitleSize" class="l_input" runat="server" Columns="10" MaxLength="4">35</asp:TextBox><span
                    style="color: red">*</span>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                默认值：
            </td>
            <td>
                <asp:TextBox ID="OperatingType_DefaultValue" class="l_input" runat="server" Columns="30"></asp:TextBox><span
                    style="color: green">例：Win2000/XP/Win2003</span>
            </td>
        </tr>
    </tbody>
    <!--  超链接    -->
    <tbody id="DivSuperLinkType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                文本框长度：
            </td>
            <td>
                <asp:TextBox ID="SuperLinkType_TitleSize" class="l_input" runat="server" Columns="10" MaxLength="4">50</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                默认值：
            </td>
            <td>
                <asp:TextBox ID="SuperLinkType_DefaultValue" class="l_input" runat="server" Columns="30"></asp:TextBox><span
                    style="color: green">例：http://127.0.0.1/</span>
            </td>
        </tr>
    </tbody>
    <!--  数字类型    -->
    <tbody id="DivNumType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                文本框长度：
            </td>
            <td>
                <asp:TextBox ID="NumberType_TitleSize" class="l_input" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                数字类型：
            </td>
            <td>
                <asp:RadioButtonList ID="NumberType_Style" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">整数</asp:ListItem>
                    <asp:ListItem Value="2">小数</asp:ListItem>
                    <asp:ListItem Value="3">货币</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                默认值：
            </td>
            <td>
                <asp:TextBox ID="NumberType_DefaultValue" class="l_input" runat="server" Columns="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                搜索设置：
            </td>
            <td>
                <asp:RadioButtonList ID="NumSearchType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">精确搜索</asp:ListItem>
                    <asp:ListItem Value="0">范围搜索</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                搜索范围：
            </td>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                    <tr class="tdbg">
                        <td>
                            <asp:RadioButtonList ID="NumRangType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">下限-上限</asp:ListItem>
                                <asp:ListItem Value="0">自定范围</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <font color="red">选择了范围搜索时，此设置才有效</font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="NumSearchRange" class="l_input" runat="server" 
                                TextMode="MultiLine" Columns="40"
                                Rows="6" Height="60px"></asp:TextBox><br />
                        </td>
                        <td>
                            <font color="red">选择了自定范围时请输入此项内容,格式：范围名|范围<br />
                                分行输入范围如：<br />
                                500元以下|0-500<br />
                                500元-1000元|500-1000<br />
                                1000元以上|1000</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
    <!--  多级选项    -->
    <tbody id="DivGradeOptionType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                选择分级数据分类：
            </td>
            <td>
                <asp:DropDownList ID="GradeOptionType_Cate" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft">
                选项下拉框排列格式化：
            </td>
            <td>
                <asp:RadioButtonList ID="GradeOptionType_Direction" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">一行横排</asp:ListItem>
                    <asp:ListItem Value="1">多行竖排</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </tbody>
    <!----颜色代码---->
    <tbody id="DivColorType" style="display: none" runat="server">
        <tr>
            <td class="tdbgleft">
                默认颜色值：
            </td>
            <td>
                <asp:TextBox ID="ColorDefault" class="l_input" runat="server" MaxLength="7" Columns="7" Style="font-size: 9pt;
                    height: 15px;"></asp:TextBox>
                <img onclick="SelectColor(this,'ColorDefault');" src="/App_Themes/AdminDefaultTheme/Images/selectclolor.gif"
                    align="absmiddle" style="border-width: 0px; cursor: pointer" />
            </td>
        </tr>
    </tbody>
    <tr class="tdbg">
        <td class="tdbgleft">
        </td>
        <td height="50">
            <asp:Button ID="Button1" runat="server" Text=" 修改字段 " class="C_input" OnClientClick="return isok()"
                OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="BtnBack" runat="server" Text="返回字段列表" class="C_input" OnClick="BtnBack_Click" UseSubmitBehavior="False"
                CausesValidation="False" />
            <asp:HiddenField ID="HdfModelID" runat="server" />
            <asp:HiddenField ID="HdfFieldID" runat="server" />
            <asp:HiddenField ID="hdfOrder" runat="server" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/ModelField.js"></script>
</asp:Content>