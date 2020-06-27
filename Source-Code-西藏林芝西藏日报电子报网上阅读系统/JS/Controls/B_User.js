/*用于用户校验,面向对象*/
var B_User = function () {
    var opts = {};
    if (arguments.length > 1) {
        opts = JSON.parse(arguments[0]);
    }
    this.loggedurl = opts.url ? opts.url : "/User/";//登录后的链接
};
B_User.prototype = {
    Logout: function (callback) {
        var url = "/User/Logout.aspx?" + Math.random() + "";
        $.post(url, {},
        function (data) {
            callback(data);
        })
    },
    Login: function (model,callback) {
        if (model.name == "" || model.pwd == "") {
            alert("用户名与密码不能为空");
            return false
        }
        $.ajax({
            type: "Post",
            url: "/Api/UserCheck.ashx",
            data: {
                value: model.name + ":" + model.pwd + ":" + model.key + ":" + model.code
            },
            success: function (data) {//返回模型JSON
                callback(data);
            },
            error: function (data) { }
        })

    },
    IsLogged: function (callback) {//登录成功和失败的回调
        $.ajax({
            type: "Post",
            url: "/Api/UserCheck.ashx",
            data: { action: "HasLogged" },
            success: function (data) {
                if (!callback) return;
                if (data != -1 && data != "") {
                    callback(data, true);
                }
                else//未登录
                    callback(data, false);
            }
        });//IsLogged end;
    },
    UserInfo: function (callback) { }
}