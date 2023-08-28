<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>3C论坛</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/Login.css">


    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <script src="${pageContext.request.contextPath}/user/js/jquery.min.js"></script>

    <style>
        #admin{
            width: 60px;
            height: 60px;
            line-height: 50px;
            margin-bottom: 1px;
            text-align: center;
            cursor: pointer;
            font-size: 30px;
            color: #fff;
            border-radius: 20px;
            display: inline-block;
        }

    </style>
    <script type="text/javascript">
        var InterValObj; //timer变量，控制时间
        var count = 30; //间隔函数，1秒执行
        var curCount;//当前剩余秒数
        function sendMessage() {
            curCount = count;
            $("#btn").attr("disabled", "true");
            $("#btn").val(curCount + "秒后重发");
            InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
        }
        //timer处理函数
        function SetRemainTime() {
            if (curCount == 0) {
                window.clearInterval(InterValObj);//停止计时器
                $("#btn").removeAttr("disabled");//启用按钮
                $("#btn").val("重新发送");
            } else {
                curCount--;
                $("#btn").val(curCount + "秒后重发");
            }
        }
    </script>
</head>
<body>
<div class="section dwo">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">

                            <div class="card-front"  style="position: relative;text-align: left;">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3" style="position: absolute;top: -40px;left:40%;">忘记密码</h4>
                                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user?method=forgetpass" method="post" style="margin: 10px 0 -30px 0px;">
                                            <div class="form-group mt-2">
                                                <input type="text" required=""id="phone" name="phone" class="form-style" placeholder="请输入绑定手机号" autocomplete="off">
                                                <img src="../img/phone.png" style="width: 25px;height: 25px;position: absolute;top: 11px;left: 15px;">
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" required=""   id="pwd" name="pwd" class="form-style" placeholder="请输入新密码" autocomplete="off">
                                                <img src="../img/psw11.png" style="width: 25px;height: 25px;position: absolute;top: 11px;left: 15px;">
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" id="code" name="code" class="form-style" placeholder="请输入验证码" required="" autocomplete="off" style="width: 56%;float: left;">
                                                <img src="../img/code11.png" style="width: 25px;height: 25px;position: absolute;top: 11px;left: 15px;">
                                                <input type="submit"id="btn" name="btn"  value="发送验证码" class="btn" style="position: relative;width: 95px;padding: 0px 0px;margin: 0" onclick="sendMessage()">
                                            </div>

                                            <a href="${pageContext.request.contextPath}login.jsp" style="color:white;position: absolute;left: 80%;top: 100%;">返回登陆</a>
                                            <input type="submit" name="" style="margin: 30px 0 0 0;position: relative;left: -28%;" value="重置密码" class="userlogin btn" >
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>



<script type="text/javascript">
    var sms = "";
    $("#btn").click(function() {
        var phone = $("#phone").val();
        if (phone != "") {
            $.ajax({
                url : "/user?method=MoblieCode",  //发送请求
                type : "post",
                data : {
                    "phone" : phone
                },
                success : function(result) {
                    sms = result;
                }
            });
        } else {
            alert("请输入手机号");
            return false;
        }
    });
    $("#lo").click(function() {
        var code = $("#code").val();
        if (code == "") {
            alert("请输入验证码");
        } else {
            if (sms == code) {
                window.location.href = "success.jsp";
            } else {
                alert("验证码错误");
            }
            ;
        }
        ;
    });
</script>


<a id="admin" href="${pageContext.request.contextPath}/admin/login.jsp" alt="3Cluntan"><img style="width: 60px;height: 60px" src="../images/admin.png" title="管理员入口" alt="管理员入口"></a>
</body>
</html>
