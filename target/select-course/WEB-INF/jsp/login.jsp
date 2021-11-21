<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生选课系统-登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
`    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>`
    <![endif]-->
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {background: #1E9FFF;}
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:420px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha {width:60%;display:inline-block;}
        .captcha-img {display:inline-block;width:34%;float:right;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="">
                <div class="layui-form-item logo-title">
                    <h1>学生选课系统</h1>
                </div>
                <div class="layui-form-item">
                    <%--@declare id="username"--%><label class="layui-icon layui-icon-username" for="username"></label>
                    <input type="text" id="username" name="username" lay-verify="required|account" placeholder="用户名或者邮箱" autocomplete="off" class="layui-input" value="admin">
                </div>
                <div class="layui-form-item">
                    <%--@declare id="password"--%><label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" id="password" name="password" lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input" value="123456">
                </div>
                <div class="layui-form-item">
                    <%--@declare id="captcha"--%><label class="layui-icon layui-icon-vercode" for="captcha"></label>
                    <input type="text" name="captcha" id="captcha" lay-verify="required|captcha" placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" value="xszg">
                    <div class="captcha-img">
                        <img id="captchaPic" src="../images/captcha.jpg">
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: center">
                    <input type="radio" name="userType" value="1" lay-skin="primary" title="学生">
                    <input type="radio" name="userType" value="2" lay-skin="primary" title="教师">
                    <input type="radio" name="userType" value="3" lay-skin="primary" title="管理员">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" id="loginBtn" type="button">登 入</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/http.js" charset="utf-8"></script>

<script>
    //layui是多模块的 layui.use表示加载我们需要的模块
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#7ec7fd',
                lineColor:'#7ec7fd'
            });
        });
            //登录点击事件
        $("#loginBtn").click(function () {
            //获取输入框的值 需要给输入框添加id 根据id获取输入框的值
            //获取登录名 密码 验证码
            var username=$("#username").val();
            if (!username){
                layer.msg("请填写用户名");
                return;
            }
            var password=$("#password").val();
            if (!password){
                layer.msg("请填写密码");
                return;
            }
            var captcha=$("#captcha").val();
            if (!captcha){
                layer.msg("请填写验证码");
                return;
            }
            //获取用户类型
            var userType=$("input[name='userType']:checked").val();
            if (!userType){
                layer.msg("请选择用户类型");
                return;
            }
            //提交后端的数据
            var parm={
                "username":username,
                "password":password,
                "captcha":captcha,
                "userType":userType,
                "method":"login"
            }
            console.log(parm);
            //发送请求到后端
            //url: 是请求的servlet
            http.post("/login.do?method=login",parm,function (data) {
                console.log(data);
                if(data && data.code==200){
                    window.location="/login.do?method=adminHomeUI"
                }
            });
        });
        // // 进行登录操作
        // form.on('submit(login)', function (data) {
        //     data = data.field;h
        //     if (data.username == '') {
        //         layer.msg('用户名不能为空');
        //         return false;
        //     }
        //     if (data.password == '') {
        //         layer.msg('密码不能为空');
        //         return false;
        //     }
        //     if (data.captcha == '') {
        //         layer.msg('验证码不能为空');
        //         return false;
        //     }
        //     layer.msg('登录成功', function () {
        //         window.location = '../index.html';
        //     });
        //     return false;
        // });
    });
</script>
</body>
</html>
