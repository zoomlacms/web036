/*
 *Author:Coffee
 *功  能:后台Addcontent.aspx和EditContent.aspx
 */
//----Tools
function checkImgContent() {
    var content = $(document.getElementById('ueditor_0').contentWindow.document.body).html();
    if (content.indexOf("<img") > -1) {
        document.getElementById("selectpic").options[0].text = "点击下拉选择附图片";
    } else {
        document.getElementById("selectpic").options[0].text = "编辑器内无上传图片";
    }
}
function editnode(NodeID) {
    var answer = confirm("该栏目未绑定模板，是否立即绑定");
    if (answer == false) {
        return false;
    }
    else {
        open_page(NodeID, "EditNode.aspx?NodeID=");
    }
}
function GetPicurl(imgurl) {
    var optlen = document.getElementById("selectpic").options.length;
    var isin = 0;
    for (var i = 0; i < optlen; i++) {
        var doctxt = document.getElementById("selectpic").options.item(i);
        if (doctxt.value.toLowerCase() == imgurl.toLowerCase() || imgurl.toLowerCase().indexOf("http://") > -1) {
            isin = 1;
        }
    }
    if (isin == 0) {
        var option = document.createElement("option");
        option.text = imgurl;
        option.value = imgurl;
        document.getElementById("selectpic").add(option);
    }
}
function SelectKey(id) {
    window.open('/Common/KeyList.aspx?OpenerText=' + id, '', 'width=600,height=450,resizable=0,scrollbars=yes');
}
function SetContent() {
    setTimeout(function () { UE.getEditor("txt_content").setContent($(parent.document).find("#Content_Div").html()); }, 2000);
}
function ShowPic(content) {
    if (content != "") {
        document.getElementById("picview").innerHTML = "<img width=100px height=100px src=" + content + " />";
    } else {
        document.getElementById("picview").innerHTML = "";
    }
}
function LoadImg(id) {
    var contenttxt = $("#" + id).val().toLowerCase();
    if (contenttxt.indexOf("<img") < 0) {
        document.getElementById("selectpic").options.length = 1;
        document.getElementById("selectpic").options[0].text = "编辑器内无上传图片";
    }
    else {
        var myregexp = /src=\"(.*?).(gif|jpg|png)/img;
        var match = myregexp.exec(contenttxt);
        if (match == null) {
            document.getElementById("selectpic").options.length = 1;
            document.getElementById("selectpic").options[0].text = "编辑器内无上传图片";
        }
        else {
            document.getElementById("selectpic").options[0].text = "点击下拉选择附图片";
            while (match != null) {
                var picurl = match[0];
                if (picurl.indexOf("http://") == -1) {
                    picurl = picurl.replace("src=\"", "")
                    GetPicurl(picurl);
                }
                else {
                    picurl = picurl.replace("src=\"", "")
                    GetPicurl(picurl);
                }
                match = myregexp.exec(contenttxt);
            }//while end;
        }
    }//else end;
}
function LoadImgEdit(content) {
    //document.getElementById("selectpic").focus();
    //eval("var oEditor = CKEDITOR.instances." + content);
    //var contenttxt = $("#" + content).val().toLowerCase();

    //var myregexp = /src=\"(.*?).(gif|jpg|png)/img;
    //var match = myregexp.exec(contenttxt);
    //if (match == null)
    //    document.getElementById("selectpic").options.length = 1;
    //while (match != null) {
    //    var picurl = match[0];

    //    if (picurl.indexOf("http://") == -1) {
    //        picurl = picurl.replace("src=\"", "")
    //        GetPicurl(picurl);
    //    }
    //    else {
    //        picurl = picurl.replace("src=\"", "")
    //        GetPicurl(picurl);
    //    }
    //    match = myregexp.exec(contenttxt);
    //}
}
function pageScroll() {
    window.scrollBy(0, -30);
    scrolldelay = setTimeout('pageScroll()', 5);
    if (document.documentElement.scrollTop == 0) clearTimeout(scrolldelay);
}
function DealImgUrl(url) {//处理图片路径
    url = url.toLocaleLowerCase();
    if (url.indexOf("http:") > -1 || url.indexOf("https:") > -1 || url.indexOf(updir) > -1) {

    }
    else {
        url = updir + url;
    }
    return url;
}
//----Dialog
var diag = new ZL_Dialog(), viewDiag = new ZL_Dialog();
function ShowTitle() {
	ShowDiag("/Common/SelectStyle.htm", "设置标题字体");
}
function ShowSpDiag() {
	ShowDiag("SpecialList.aspx","选择专题 [<a href='javascript:;' onclick='SelSpec()'>选好点此确认</a>]");
}
function UpFileDiag(json) {
    var url = arguments[1] == null ? "/Plugins/WebUploader/WebUp.aspx" : arguments[1];
    url = url + "?json={\"ashx\":\"action=ModelFile%26value=" + json.nodeid + "\",\"pval\":" + JSON.stringify(json) + "}";
    ShowDiag(url, "上传图片");
}
function ShowCutImg(param) {
    ShowDiag("/Plugins/PicEdit/CutPic.aspx?"+param,"图片编辑");
}
function SelectUppic(pval) {
    ShowDiag("/common/SelFiles.aspx?pval=" + JSON.stringify(pval), "选择在线图片");
}
function open_page(NodeID, strURL) {
    var diag = new Dialog();
    diag.Width = 1000;
    diag.Height = 750;
    diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
    diag.URL = strURL + NodeID;
    diag.show();
}
function ShowDiag(url, title) {
    diag.title = title;
    diag.maxbtn = false;
    diag.url = url;
    diag.backdrop = true;
    diag.ShowModal();
}
function PreViewImg(url)//预览图片,适用于单图预览
{
    if (url == "") { alert("请先上传图片,才可预览"); return; }
    url = DealImgUrl(url); console.log(url);
    if (!$("#view_div")[0]) {
        $("body").append($("<div id='view_div' style='display:none;'><img style='width:100%' id='view_img' /></div>"));
    }
    $("#view_img").attr("src", url);
    viewDiag.title = "预览图片";
    viewDiag.content = "view_div";
    viewDiag.ShowModal();
}
function CloseDiag() {
    diag.CloseModal();
    viewDiag.CloseModal();
}
//----获取图片链接,用于图片编辑
function GetCutpic(name, d) {
    var srcurl = document.getElementById("txt_" + name).value;
    if (srcurl != null && srcurl != "" && srcurl != "/Images/nopic.gif") {
        ShowCutImg("ipath=" + srcurl);
    }
    else {
        alert("请先上传图片或选择已上传图片");
    }
}
function PopImage(divID, path, width, heigh) {
    //if (document.getElementById(path).value == "") {
    //    alert("请先上传图片， 才可预览");
    //    return;
    //}
    //if (!$("#view_div")[0]) {
    //    $("body").append($("<div id='view_div' style='display:none;'><img style='width:100%' id='view_img' /></div>"));
    //}
    PreViewImg(document.getElementById(path).value);
}
//----专题
function AddToSpecial() {
    var urlstr = "SpecialList.aspx";
    var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
    var arr = null;
    if (isMSIE) {
        arr = window.showModalDialog(urlstr, "self,width=200,height=150,resizable=yes,scrollbars=yes");
        if (arr != null) {
            UpdateSpecial(arr);
        }
    }
    else {
        window.open(urlstr, 'newWin', 'modal=yes,width=200,height=150,resizable=yes,scrollbars=yes');
    }
}
function DelSpecial(specialId) {
    var li = document.getElementById("SpecialSpanId" + specialId);
    if (li != null) {
        li.parentNode.removeChild(li);
    }
    var hdnSpecial = document.getElementById("HdnSpec");
    var SelectedSpecial = hdnSpecial.value.split(",");
    var newselected = '';
    for (i = 0; i < SelectedSpecial.length; i++) {
        if (SelectedSpecial[i] != specialId) { if (newselected != '') { newselected = newselected + ','; } newselected = newselected + SelectedSpecial[i]; }
    }
    hdnSpecial.value = newselected;
}
function DealResult(json) {
    $(".specDiv").html(''); $("#Spec_Hid").val("");
    if (!json || json == "") return;
    var nodeArr = JSON.parse(json);
    var ids = "";
    for (var i = 0; i < nodeArr.length; i++) {
        var model = nodeArr[i];
        $(".specDiv").append("<div class='spec'><div class='specname'>" + model.name + "</div> <a href='javascript:;' onclick='removeSpe(this," + model.id + ")'><span class='glyphicon glyphicon-remove'></span></a></div>");
        ids += model.id + ",";
    }
    $("#Spec_Hid").val(',' + ids);
    CloseDiag();
}
function removeSpe(obj, id) {
	$("#Spec_Hid").val($("#Spec_Hid").val().replace("," + id + ",", ","));
	$(obj).parent().remove();
}
function SelSpec() {
    DealResult($("#" + spdiag.id).find("iframe")[0].contentWindow.GetResult());
}
function UpdateSpecial(arr) {
    var arrNodes = arr.split(',');
    var HdnSpecial = document.getElementById("HdnSpec");
    var SelectedSpecial = HdnSpecial.value.split(",");
    var isExist = false;
    for (i = 0; i < SelectedSpecial.length; i++) {
        if (SelectedSpecial[i] == arrNodes[0])
        { isExist = true; }
    }

    if (!isExist) {
        if (HdnSpecial.value != '')
        { HdnSpecial.value = HdnSpecial.value + ','; }

        HdnSpecial.value = HdnSpecial.value + arrNodes[0];

        var newli = document.createElement("SPAN");
        newli.setAttribute("id", "SpecialSpanId" + arrNodes[0]);
        newli.innerHTML = arrNodes[1] + " ";
        var newlink = document.createElement("INPUT");
        newlink.onclick = function () { DelSpecial(arrNodes[0]); };
        newlink.setAttribute("type", "button");
        newlink.setAttribute("class", "btn btn-primary");
        newlink.setAttribute("value", "从此专题中移除");
        newli.appendChild(newlink);
        var newbr = document.createElement("BR");
        newli.appendChild(newbr);
        var links = document.getElementById("lblSpec");
        links.appendChild(newli);
        DelSpecial('0');
    }
}
function UpdateSpe(name, id) {
    $("#SpeName").text($("#SpeName").text() + "," + name);
    $("#Spec_Hid").val($("#Spec_Hid").val() + "," + id + ",");
    CloseDiag();
}
//----组图
function AddAttach(file, ret, pval) {
    var tlp = "<li><img src='@src' class='preview_img'/><div class='file-panel' style='height: 0px;'><span class='editpic' title='编辑'></span><span class='cancel' title='删除'></span></div></li>";
    if (ret._raw == "") return;
    var $text = $("#txt_" + pval.inputid), imgarr = ret._raw.split('|');
    $imgul = $("#ul_" + pval.inputid);
    for (var i = 0; i < imgarr.length; i++) {
        if (imgarr[i] == "") continue;
        if ($imgul.length > 0) {
            $imgul.append(tlp.replace("@src", imgarr[i]));
        }
        imgarr[i] = imgarr[i].replace(pval.uploaddir, "");
        $text.val($text.val() + imgarr[i] + "|\r\n");
    }
    BindAttachEvent();
    CloseDiag();
}
function BindAttachEvent() {
    $(".preview_img_ul li").mouseenter(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 30 });
    }).mouseleave(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 0 });
    });
    $(".preview_img_ul li .cancel").click(function () {
        var $li = $(this).closest("li");
        var $text = $("#" + $li.closest("ul").data("id"));
        var name = $li.find("img").attr("src");
        $li.remove();
        $text.val(RemoveAttach(name, $text.val()));
    });
    $(".preview_img_ul li .editpic").click(function () {
        $li = $(this).closest("li");
        var url = $li.find("img").attr("src");
        ShowCutImg("ipath=" + url);
    });
    $(".preview_img").click(function () {//允许点击预览大图
        PreViewImg(this.src);
    });
}
function RemoveAttach(name, text) {//需要移除的图片名,全图片字符串
    name = GetFname(name, 0);//获取文件名称
    var imgarr = text.split('|');
    var result = "";
    for (var i = 0; i < imgarr.length; i++) {
        var imgname = GetFname(imgarr[i], 0);
        if (imgname != name) {
            result += imgarr[i] + "|";
        }
    }
    result = result.replace("||", "|").trim("|");
    return result;
}
//----页面回调,图片库等后执行
function PageCallBack(action, vals, pval) {//中转Hub
    switch (action) {
        case "selfiles"://图片库
            if (pval.field == "images") {
                AddAttach(null, { _raw: vals }, pval);
            }
            else { ReturnFile(vals, pval); }
            break;
        case "cutpic"://图片编辑
            var vals = vals.toLowerCase();
            $("img[src]").each(function () {
                this.src.toLowerCase() == vals;
                this.src = this.src += "?" + Math.random();
            });
            break;
        case "SelContent":
            $("#JoinGID_Hid").val(vals);
            break;
    }
    CloseDiag();
}
//----回调实际处理方法
//单图片,只处理第一张图
function ReturnFile(imgs, pval) {
    var name = pval.name;
    var url = imgs.split('|')[0];
    for (var i = 0; i < length; i++) {
        $("#txt_" + name).val(url);
        $("#Img_" + name).attr('src', url);
    }
    CloseDiag();
}
//----
$(function () {
    $("#OAkeyword").tabControl({ maxTabCount: 5, tabW: 80 }, $("#Keywords").val());//关键词
    BindAttachEvent();//绑定组图事件
    //setInterval(checkImgContent, 1000);//缩略图检测
    if ($("#specbtn_span").html().trim() == "") {$("#spec_tr").hide();}//专题,如不存在,Hide
    $(".nav").find("li ul li a").each(function () {
        var href = $(this).attr("href");
        if (href.toLowerCase() == '/manage/') {
            $(this).parent().addClass("active");
        }
    });
    $(".for").click(function () {
        var id = $(this).data("for");
        $("#" + id).val($(this).text());
    });
    setInterval(function () { LoadImg("txt_content"); }, 500);//缩略图检测
    //-----图片预览
});
function ShowContentList() {
    var url = $("#JoinGID_Hid").val() != "" ? "?ids=" + $("#JoinGID_Hid").val() : "";
    ShowDiag("SelContentTitle.aspx" + url, "选择关联内容");
}