<%@ page language="C#" autoeventwireup="true" inherits="test_user_demo, App_Web_ncd3br22" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <style type="text/css">
         *{padding:0px;margin:0px;}
         a{font-size:12px;color:#694916;text-decoration:none;cursor:pointer;}
         a:hover{color:orange; } 
         .top_right_div{float: right;} 
         .tipsText{ position:fixed; min-width:300px; min-height:50px; line-height:50px; text-align:center;filter:alpha(opacity:90); display:none; padding: 8px; background: rgba(245,245,245,0.8); box-shadow:0 0 100px 2px rgba(0,0,240,0.8) inset; color: #fff; font-family:'Microsoft YaHei';}
         .items{position:absolute;z-index:1040;text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.00);}
         .items:hover{ background:rgba(0,0,245,0.2);}         
         .news{ margin-top:15px; }
         .newstop{background-color:#f0f0f0;text-align:right;height:30px;line-height:30px;padding-right:30px;}  		  
		  #newimg{ width:400px; height:600px;}
         .aStyle{font-size: 14px; font-weight: bold;}   
		 
		 
		 .publish_nav{ position:relative; margin:auto; margin-bottom:-120px;  width:980px; min-height:150px; background:url(/Template/Tibet/style/images/top.png) center no-repeat; background-size:cover;}
		 .publish_nav #logo{ position:absolute; top:20px; left: 20px;}
		 .publish_nav .firnav{ position:absolute; bottom:0; right:0; margin-bottom:0; padding-left:100px; FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=3,startColorStr=rgba(147,38,255,0),endColorStr=rgba(147,38,255,1)); background: -ms-linear-gradient(left,rgba(147,38,255,0),rgba(147,38,255,1)); background:-webkit-gradient(linear, 0% 0%, 100% 0,from(rgba(147,38,255,0)), to(rgba(147,38,255,1))); }		  
		 .publish_nav li{ float:left; height:30px; line-height:30px; margin-left:10px; margin-right:10px; list-style:none;}
		 .publish_nav li input{ color:#fff;}
		 .publish_nav li a{ color:#fff; font-family:"微软雅黑"; font-size:14px;}
		 .publist_main{ margin:auto; width:980px; position:relative; } 
		 #PrePid_Btn{ background:none; border:none; cursor:pointer;}  
		 #NextPid_Btn{ background:none; border:none; cursor:pointer;}
		 .publish_date{ margin:auto; width:980px; height:30px; line-height:30px; border:1px solid #ddd; background:#ddd;}
		 .publish_today{ float:left; width:700px; text-align:right;}
		 .prev_next{ float:right; width:280px; text-align:right;}
		 .publish_main{ position:relative; margin:auto; width:980px; clear:both;}
		 .publish_main ul{ list-style:none;}
		 .publish_main_l{ float:left; margin-left:8px; width: 415px; height: 600px; z-index:2;}
		 .publish_main_m{ position:relative; float:left; margin-top:130px; width:300px; height:490px; background:rgba(229, 244, 251, 1); box-shadow:0 0 5px 1px #09C;}
		 .publish_main_m ul{ padding-top:10px; overflow:hidden;}
		 .publish_main_m li{ padding:5px; }
		 .publish_main_m li:nth-child(2n+1){ background:#D0EAF9;}
		 .publish_main_r{ position:relative; float:right; margin-top:130px; width:240px; height:490px; background:rgba(229, 244, 251, 1); box-shadow:0 0 5px 1px #09C;}
		 .publish_main_r li{ height:26px; line-height:26px; background:url(/Template/Tibet/style/images/publish_icon.gif) right no-repeat; border-bottom:1px solid #0FF;} 
		 .publish_main_r li a{ font-size:14px;}
		 .publish_main_r ul{ padding:10px; overflow:hidden;}
		 .publist_main_title{ padding-left:10px; height:30px; line-height:30px; color:#fff; background:#09C;}
		 .up_btn{ text-align:center; height:16px; background:#D0EAF9;}
		 .up_btn a{ display:block;}
		 .down_btn{ position:absolute; bottom:0; width:100%; text-align:center; height:16px; background:#D0EAF9;}
		 .down_btn a{ display:block;}
		 .mainDetais{ float:right; display:none; margin-top:120px; width: 556px;}
		 .publish_sort{ float:left; width:340px; height:540px; overflow:scroll;}
		 .publish_download{ float:right; width:200px;}   
		 .back a{ float:right; display:block; margin-top:5px; width:80px; height:26px; line-height:26px; text-align:center; background:#0CF; color:#fff;}
		 .news_comment_body{ margin:auto; padding-top:20px; width:980px; clear:both;}
		 .news_comment{ float:right; width:560px; border:1px solid #D0EAF9;}
		 .comment_title{ padding-left:10px; height:30px; line-height:30px; background:#D0EAF9;}
		 .news_comment li{ margin-top:5px; margin-bottom:5px; min-height:30px; } 
		 .news_comment ul{ padding-left:10px; list-style:none;}
		 #PubTitle{ width:200px; height:24px; line-height:24px; border:1px solid #ccc;}
		 #PubContent{ float:left; width:240px; border:1px solid #ccc;}
		 #button{ margin-left:20px; width:100px; height:30px; line-height:30px; background:#0CF; border:1px solid #09F; color:#fff;}
		 .news_comment p{ padding-left:10px; line-height:24px; color:#666;}
    </style>
    <title><asp:Literal runat="server" ID="Title_T"></asp:Literal></title>
</head>
<body >
<form id="form1" runat="server">   
<div class="publish_nav">  
    <ul class="firnav"> 
    <li><asp:Button runat="server" Text="上一期" OnClick="PrePid_Btn_Click"  ID="PrePid_Btn" /></li>
    <li><asp:Button runat="server" Text="下一期" OnClick="NextPid_Btn_Click" ID="NextPid_Btn" /></li>
    </ul> 
</div>        
<div class="publish_main">    
<div id="maindiv" class="main">
<div class="publish_main_l"> 
<img runat="server" id="newimg" src="/UploadFiles/Admin/Publish/18/A01.jpg"/>
<div style="text-align:right;">
<span style="float:left;" runat="server" id="Title_Span"></span>
<span style="float:right; margin-right:10px;">
<asp:LinkButton runat="server" CssClass="aStyle" ID="lbDown" OnClick="lbDown_Click" Text="附件下载" />
<a href="<%#Eval("ImgPath") %>" style="font-size: 14px; font-weight: bold;">版面预览</a>
<asp:Button runat="server" ID="Button1" Text="上一版" OnClick="Pre_Btn_Click" />
<asp:Button runat="server" ID="Button2" Text="下一版" OnClick="Next_Btn_Click" />
</span>
</div>

 
</div> 
<div class="publish_main_right">  
<div class="publish_main_m">
<div class="publist_main_title"><%Call.Label("{ZL.Label id=\"输出电子报指定版面名称\" ItemID=\"{$GetRequest(ID)$}\" /}"); %></div>
<div class="up_btn"><a href="javascript:;"><img src="/Template/Tibet/style/Images/up_btn.png" class="center-block" alt="向上滚动"></a></div>
<ul> 
<%Call.Label("{ZL.Label id=\"输出电子报指定版面的信息列表\" ItemID=\"{$GetRequest(ID)$}\" /}"); %>
</ul>
<div class="down_btn"><a href="javascript:;"><img src="/Template/Tibet/style/Images/down_btn.png" class="center-block" alt="向下滚动"></a></div>
</div>
<div class="publish_main_r">
<div class="publist_main_title">版面目录</div>
<div class="up_btn"><a href="javascript:;"><img src="/Template/Tibet/style/Images/up_btn.png" class="center-block" alt="向上滚动"></a></div>
<ul>
<%Call.Label("{ZL.Label id=\"输出电子报标题导航\" /}"); %> 
</ul>
<div class="down_btn"><a href="javascript:;"><img src="/Template/Tibet/style/Images/down_btn.png" class="center-block" alt="向下滚动"></a></div>
</div>
</div>
<div class="mainDetais" > 
<div class="back"><a href="javascript:;" onClick="showlist()">返回目录</a></div>               
<div class="loading"></div>
<div class="news">
<iframe id="news_ifr" name="news_ifr" onLoad="iFrameHeight()" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height=100% ></iframe>

</div>
</div>

</div>       
</div>    
<asp:HiddenField runat="server" ID="CurID_Hid" />
        
            <script type="text/javascript">
                var tlp = "<div class='items' style='left: {x}; top: {y}; width: {w}; height: {h};' data-cid='{gid}'>" +
                    "<div class='tipsText'><span class='textBold'>{re}</span></div>" +
                    "</div>";
                //解析Json生成
                function AnalyJson(json) {
                    var jsonArr = JSON.parse(json);
                    for (var i = 0; i < jsonArr.length; i++) {
                        var j = jsonArr[i];
                        j.w = Addpx(j.w, 13);
                        j.h = Addpx(j.h, 20);
                        var divt = tlp.replace("{x}", j.x).replace("{y}", j.y).replace("{re}", j.remind).replace("{w}", j.w).replace("{h}", j.h).replace("{gid}", j.gid);
                        $("#maindiv").append(divt);
						$(".publish_sort ul").append("<li><a href='news.aspx?id='"+j.gid+">"+j.remind+"</a></li>");
                    }
                    $(".items").hover(function (e) {
						var temp=$(this).find(".tipsText")
                        temp.show();
						temp.css({ top:e.clientY, left:e.clientX, })                        
                    }, function () { $(this).find(".tipsText").hide(); }).click(function () {
                        var loadUrl = "news.aspx?id=" + $(this).attr("data-cid");
						$(".publish_main_m").hide();
						$(".publish_main_r").hide();
                        $(".loading").show();
                        $(".news").hide();
						$(".mainDetais").show();
                        $("#news_ifr").attr("src", loadUrl);
                        $(".loading").hide();
                        $(".news").show();
                    });
                }
                function Addpx(v, v2) {
                    return (parseInt(v.replace("px", "")) + v2) + "px";
                }
				function showlist(){
					$(".mainDetais").hide();
					$(".publish_main_m").show();
					$(".publish_main_r").show();
				}
            </script>  
            
            <script>
			function iFrameHeight() {
				var ifm= document.getElementById("news_ifr");	
				var subWeb = document.frames ? document.frames["news_ifr"].document :ifm.contentDocument;	
				if(ifm != null && subWeb != null) {	
					ifm.height = subWeb.body.scrollHeight;	
				}
			}			
			</script>
            
    </form>   
<form name="form7" method="post" action="/PubAction.aspx" />
<div class="news_comment_body">
<div class="news_comment">
<div class="comment_title">我要评论</div>
<input type="hidden" name="PubID" id="PubID" value="7" />
<input type="hidden" name="PubContentid" id="PubContentid" value="{PubContentid/}">
<input type="hidden" name="PubInputer" id="PubInputer" value="{PubInputer/}" />
<ul class="list-unstyled">
<li><span>署名：</span><input name="PubTitle" id="PubTitle" type="text" ></li>
<li><textarea name="PubContent" rows="4" id="PubContent"></textarea></li>
<li><input type="submit" name="button" id="button" value="发表评论"></li>
</ul> 
<p>
1.遵守中华人民共和国有关法律、法规，尊重网上道德，承担一切因您的行为而直接或间接引起的法律责任。<br/> 
2.中国西藏林芝网拥有管理笔名和留言的一切权力。 <br/> 
3.您在中国西藏林芝网留言板发表的言论，人民网有权在网站内转载或引用。<br/>  
</p>
</div> 
</div>   
</form>                
</body>
</html>

