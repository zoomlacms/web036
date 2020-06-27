<%@ page language="C#" autoeventwireup="true" inherits="test_user_news, App_Web_ncd3br22" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%Call.Label("{ZL:Boot()/}"); %> 
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
h1{ font-size:28px; color:#000; text-align:center;}
#CDate_L{ color:#999;}
#content_div{ padding-top:10px; min-height:300px; line-height:26px; border-top:1px solid #ccc; text-align:justify; text-justify:inter-ideograph; overflow:hidden;}
.news_item{ clear:both;}
.news_func{ height:30px; line-height:30px; background:#D0EAF9;}
.news_func a{ float:left; display:block; width:25%; color:#999; text-align:center;}
.news_func a i{ margin-right:5px;}
</style>
</head>
<body>
    <form id="form1" runat="server">    
        <div class="news_item" id="news_item">
            <div><h1><asp:Label runat="server" ID="Title_L" /></h1></div>
            <div><asp:Label runat="server" ID="CDate_L" /></div>
            <div runat="server" id="content_div">

            </div> 
            <div class="news_func">
            <a href="javascript:;" onClick="showlist()"><i class="fa fa-list"></i>返回目录</a>
            <a href="javascript:;" onClick="ChangSize(1)"><i class="fa fa-search-plus"></i>放大</a>
            <a href="javascript:;" onClick="ChangSize(2)"><i class="fa fa-search-minus"></i>缩小</a>
            <a href="javascript:;" onClick="CopyAll()"><i class="fa fa-copy"></i>复制全文</a>
            </div>  
            <div style="height:30px;"></div>         
        </div>
        <script>
		function ChangSize(n)
			{				 
				var thisEle = $("#content_div").css("font-size"); 
				var textFontSize = parseFloat(thisEle , 10);
				var unit = thisEle.slice(-2); //获取单位
				if(n == 1)
				{
					textFontSize += 2;
				}
				else if(n == 2)
				{
					textFontSize -= 2;
				}
				$("#content_div").css("font-size",  textFontSize + unit );
			}
			function CopyAll()
			{ 
				 var obj = document.getElementById("news_item");
				 if(obj!=null){
					   var content = obj.innerText;
					   window.clipboardData.setData("Text",content);           
					   alert("复制成功");
				 }                 
			}
			function showlist(){
				parent.showlist();					 
				}
		</script>
    </form>
</body>
</html>
