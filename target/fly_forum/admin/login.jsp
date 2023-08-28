<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>管理员登陆</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/admin/css/bootstrap1.min.css">

    <link rel="stylesheet" href="/admin/css/Login.css">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <script src="/admin/js/jquery.min.js"></script>


    <style>


        #admin{
            width: 52px;
            height: 52px;
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
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">管理员登录</h4>
                                        <form class="form-horizontal" role="form" action="/admin?method=login" method="post">
                                            <div class="form-group">
                                                <input type="text" name="phone" class="form-style" placeholder="请输入手机号" required="" autocomplete="off">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" name="pwd" class="form-style" placeholder="请输入密码" required="" autocomplete="off">
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <input type="submit" name="" value="登录" class="btn mt-4">
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
<a id="admin" href="/user/login.jsp" alt="3Cluntan"><img style="width: 52px;height: 52px" src="../images/user.png" title="用户入口" alt="用户入口"></a>
</body>
</html>