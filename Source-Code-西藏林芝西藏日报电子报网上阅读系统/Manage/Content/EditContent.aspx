<%@ page language="C#" autoeventwireup="true" inherits="V_Content_EditContent, App_Web_sxzm1jra" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>修改内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
<style>
.speDiag{width:500px;}
.specDiv{width:110px;padding-left:5px;}
.specDiv .spec{border:solid 1px #ccc;margin:5px;}
.specDiv .specname{text-align:left;padding-left:5px;display:inline-block}
.specDiv span{display:inline-block;float:right;line-height:20px;}  
.Conent_fix #toTop { position:fixed; margin-left:10px; bottom:5px; font-size:12px;}
.Conent_fix #toTop i { font-size:16px; }
#OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; border-radius:4px;}
.tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
#Keywords{ display:none;} 
.radius{  margin-left:2px; margin-right:2px; height:24px; line-height:24px; background:#eee; border:1px solid #ddd;}
</style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
  <asp:HiddenField ID="nodename" runat="server" />
  <div class="tabbable">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#ConInfo" data-toggle="tab">内容信息</a></li>
      <li><a href="#InfoAttr" data-toggle="tab">信息属性</a></li>
      <li><a href="#Process " data-toggle="tab">流程控制</a></li>
      <li><a href="#Reward " data-toggle="tab">悬赏定义</a></li>
      <li class="content_tem_li" runat="server" id="Remind_Li" visible="false"> <a href="#InfoAttr" data-toggle="tab" title="提示：该内容启用了个性模板"></a> </li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="ConInfo" >
        <table class="table table-bordered table_padding0">
          <tr>
            <td style="overflow-x:hidden;" class="col-sm-2 col-xs-2 text-right"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label></td>
            <td class="col-sm-10 col-xs-10"><asp:TextBox ID="txtTitle" style="max-width:715px;background:url(/Images/bg1.gif) repeat-x;width:50%;" CssClass="form-control" onblur="getstrKeys()" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')" runat="server" Text=''></asp:TextBox>
              <span id="span_txtTitle" name="span_txtTitle"></span><span><span class="vaild_tip">*</span></span>
              <input id="Button3" type="button" value="标题属性" onclick="ShowTitle()" class="btn btn-primary btn-sm" />
              <button type="button" class="btn btn-primary btn-sm" onclick="ShowContentList()">关联内容</button>
              <asp:HiddenField ID="ThreadStyle" runat="server" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator></td>
          </tr>
          <tbody id="Sys_Fied" runat="server">
            <tr>
              <td  class="text-right"><asp:Label ID="Label7" runat="server" Text="拼音"></asp:Label></td>
              <td><asp:TextBox ID="PYtitle" runat="server" Text='' Width="20%" CssClass="form-control"></asp:TextBox></td>
            </tr>
              <tr id="spec_tr">
                  <td class="text-right">所属专题&nbsp;&nbsp;</td>
                        <td>
                            <div class="specDiv"></div>
                            <span id="specbtn_span"><asp:Literal ID="SpecInfo_Li" runat="server"></asp:Literal></span>
                            <asp:HiddenField ID="Spec_Hid" runat="server" />
                        </td>
                    </tr>
            <tr>
              <td class="tdbgleft text-right"><asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
                </td>
              <td class="bqright">              
                 <div id="OAkeyword"></div>
                        <div class="clearfix"></div>
                        <asp:TextBox ID="Keywords" runat="server" CssClass="form-control" ></asp:TextBox>
                   
                        		<input id="Button7" type="button" value="提取关键字" class="btn btn-sm btn-primary" onclick="getstrKeys()" class="btn btn-primary" />
                        [</span><a href="javascript:;" onclick="SelectKey('tabinput');"> <span class="remind_g_x">选择关键字</span></a><span class="content_k_lr">]</span> (提示：使用空格键或回车键分隔每个关键字，每个关键字长度不超过5个)</span> 
              </td>
            </tr>
            <tr>
              <td class="text-right"><asp:Label ID="Label21" runat="server" Text="副标题"></asp:Label></td>
              <td><asp:TextBox ID="Subtitle" runat="server" Text='' Width="41%" CssClass="form-control pill-left" TextMode="SingleLine"></asp:TextBox></td>
            </tr>
          </tbody>
          <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
          <tr>
            <td class="text-right">
              <asp:Label ID="Label6" runat="server" Text="主编辑器扩展图"></asp:Label></td>
            <td class="bqright" style="height:80px;"><select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" onblur="reSelect()" onmousemove="LoadImgEdit('txt_content')" class="form-control">
                <option value="" selected="selected">不指定编辑器扩展图</option></select></td>
          </tr>
          <tr id="CreateHTML" runat="server">
            <td  align="right"><asp:Label ID="Label4" runat="server" Text="生成"></asp:Label></td>
            <td><asp:CheckBox ID="quickmake" runat="server" Checked="true" Text="是否立即生成" /></td>
          </tr>
        </table>
      </div>
      <div class="tab-pane fade" id="InfoAttr">
        <table class="table table-bordered table_padding0">
          <tr>
            <td align="right"><span>录入者</span></td>
            <td><asp:TextBox ID="txtInputer" CssClass="form-control" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="right"><span>添加时间</span></td>
            <td><asp:TextBox ID="txtAddTime" CssClass="form-control" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="right"><span>更新时间</span></td>
            <td><asp:TextBox ID="txtdate" CssClass="form-control" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="right"><asp:Label ID="hits_txt" runat="server" Text="点击数"></asp:Label></td>
            <td><asp:TextBox ID="txtNum" CssClass="form-control" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="right"><span>指定个性模板</span></td>
            <td><asp:TextBox ID="TxtTemplate" CssClass="form-control" runat="server" Columns="50"></asp:TextBox>
              <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TxtTemplate')+'&FilesDir=',650,480)" class="btn btn-primary btn-xs" /></td>
          </tr>
          <tr id="outpdf">
            <td align="right"><asp:Button runat="server" ID="makePDFBtn" Text="生成PDF" CssClass="btn btn-primary btn-xs" OnClick="makePDFBtn_Click" /></td>
            <td><asp:LinkButton runat="server" ID="downPdfHref" ToolTip="点击下载" OnClick="downPdfBtn_Click" Visible="false"> <img src="/Plugins/ckfinder/skins/kama/images/icons/16/pdf.gif" class="content_d_img"/> </asp:LinkButton>
              <asp:LinkButton runat="server" ID="delPdfHref" ToolTip="删除" OnClick="delPdfBtn_Click" OnClientClick="return confirm('确定要删除吗!')" Visible="false"> <img src="/App_Themes/AdminDefaultTheme/images/del.png" class="content_d_img"/> </asp:LinkButton></td>
          </tr>
          <tr id="outword">
            <td align="right"><asp:Button runat="server" ID="makeWordBtn" Text="生成Word" CssClass="btn btn-primary btn-primary btn-xs" OnClick="makeWordBtn_Click" /></td>
            <td><asp:LinkButton runat="server" ID="downWordHref" ToolTip="点击下载" OnClick="downWordBtn_Click" Visible="false"> <img src="/Plugins/Ueditor/themes/default/images/word.gif" class="content_d_img"/></asp:LinkButton>
              <asp:LinkButton runat="server" ID="delWordHref" ToolTip="删除" OnClick="delWordBtn_Click" OnClientClick="return confirm('确定要删除吗!')" Visible="false"> <img src="/App_Themes/AdminDefaultTheme/images/del.png" class="content_d_img"/></asp:LinkButton></td>
          </tr>
        </table>
      </div>
      <div class="tab-pane fade" id="Process">
        <table class="table table-bordered">
          <tr>
            <td align="right"><asp:Label ID="tj_txt" runat="server" Text="推荐级别"></asp:Label></td>
            <td><asp:CheckBox ID="ChkAudit" Text="推荐" runat="server" /></td>
          </tr>
          <tr>
            <td align="right"><asp:Label ID="zht_txt" runat="server" Text="状态"></asp:Label></td>
            <td><asp:RadioButtonList ID="ddlFlow" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
              </asp:RadioButtonList></td>
          </tr>
        </table>
      </div>
      <div class="tab-pane fade" id="Reward">
        <table class="table table-bordered table_padding0">
          <tr>
            <td align="right"><asp:Label ID="Label3" runat="server" Text="发布悬赏"></asp:Label></td>
            <td><asp:DropDownList ID="BidType" CssClass="form-control" runat="server" onchange="changevalue(this.value);">
                <asp:ListItem Value="0">选择方式</asp:ListItem>
                <asp:ListItem Value="1">单人中标</asp:ListItem>
                <asp:ListItem Value="2">记件工资</asp:ListItem>
              </asp:DropDownList>
              <div id="changeins" style="display: none"> 我想要
                <asp:TextBox ID="pronum" Width="30px" runat="server" CssClass="form-control">0</asp:TextBox>
                个方案，每个
                <asp:TextBox ID="bidmoney" Width="30px" runat="server" CssClass="form-control">0</asp:TextBox>
                元 </div></td>
          </tr>
          <tr id="bidmoneytable">
            <td align="right"><asp:Label ID="Label5" runat="server" Text="项目完成周期"></asp:Label></td>
            <td><asp:TextBox ID="proweek" runat="server" Width="60" CssClass="form-control">0</asp:TextBox>
              天 </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <div class="Conent_fix">
       <asp:HiddenField ID="JoinGID_Hid" runat="server" Value="" />
      <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="保存项目" runat="server" OnClick="EBtnSubmit_Click" />
      <asp:Button ID="Button1" CssClass="btn btn-primary" Text="添加为新项目" runat="server" OnClick="Button1_Click" />
      <a href="<%="ContentManage.aspx?NodeID=" + NodeID %>" class="btn btn-primary">返回列表</a>
      <a href="javascript:;" id="toTop" onclick="pageScroll();"><i class="fa fa-angle-up"></i>top</a>
      <asp:Button ID="BtnDoc" CssClass="btn btn-primary" runat="server" OnClientClick="return generate('docTitle','docParamValue');" Text="重新生成文档" Visible="false" />
  </div>    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    var updir = "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>";
</script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
</asp:Content>