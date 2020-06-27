<%@ page language="C#" autoeventwireup="true" inherits="Common_Ppc, App_Web_fqccbaaa" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>多级选择</title>
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://code.zoomla.cn/Area.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div>

	<select id="Select1"></select>
	<select id="Select2"></select>
	<select ID="Select3"></select>
	<input id="address" runat="server" type="hidden" />
</div>
</form>
</body>
</html>
<script type="text/javascript">
    $().ready(function () {
        var pcc = new ZL_PCC("Select1", "Select2", "Select3");
        if ($("#address").val()!="") {
            pcc.SetDef();
        }
        pcc.ProvinceInit();
    });
</script>