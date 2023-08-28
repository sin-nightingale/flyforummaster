

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 添加用户</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">


</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">

<c:choose>
    <c:when test="${msg=='注册成功'}"><div class="alert alert-success alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        ${msg}
    </div></c:when>

    <c:when test="${msg=='注册失败'}"><div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            ${msg}
    </div></c:when>

</c:choose>

            <h5>添加新用户</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">

                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>

        <form class="form-horizontal" role="form" action="/admin?method=adminregister" method="post">
        <div class="ibox-content">
            <form class="form-horizontal m-t" id="signupForm">
                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名：</label>
                    <div class="col-sm-8">
                        <input id="firstname" name="username" class="form-control" type="text" required="">
                        <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 填写用户名</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">手机号：</label>
                    <div class="col-sm-8">
                        <input id="username" name="phone" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">密码：</label>
                    <div class="col-sm-8">
                        <input id="password" name="pwd" class="form-control" type="password" required="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">性别：</label>
                    <div class="col-sm-8">
                    <div class="radio">
                        <div class="col-sm-2">
                        <label><input type="radio" checked="" value="1"  name="sex">男</label>
                        </div>
                        <div class="col-sm-2">
                        <label><input type="radio" value="2"  name="sex">女</label>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">权限：</label>
                    <div class="col-sm-8">
                    <div class="radio">
                        <div class="col-sm-2">
                        <label>
                            <input type="radio" checked="" value="1"  name="role">普通用户</label></div>
                        <div class="col-sm-2">
                            <label><input type="radio"  value="2"  name="role">管理员</label></div>
                    </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <button class="btn btn-primary" type="submit">提交</button>
                    </div>
                </div>
            </form>
        </div>
        </form>
    </div>

</div>
</div>

</div>


<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>

<!-- jQuery Validation plugin javascript-->
<script src="/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/js/plugins/validate/messages_zh.min.js"></script>

<script src="/js/demo/form-validate-demo.js"></script>

</body>

</html>
