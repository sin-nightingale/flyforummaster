
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content=" 3c论坛">
    <meta name="description" content="3c论坛">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">

    <style type="text/css">
        #style{
            height: auto;
        }
        #style li{
            margin: 2px;
        }
        #paixu{
            top: 20px;
        }
        .fly-header img{
            width: 40px;
        }
        .fly-header span{
            color: #5FB878;
            font-size: 20px;
        }
    </style>


</head>
<body style="margin-top: 65px;">

<div class="fly-header layui-bg-black">
    <div class="layui-container">


        <a class="fly-logo" href="home.jsp">
            <img src="../images/logo.jpg" alt="layui">
            <span style="font-family: '青青子衿体';" id="">
      <b>3C论坛</b>

      </span>
        </a>


        <ul class="layui-nav fly-nav-user">
            <!-- 登入后的状态 -->

            <li class="layui-nav-item">
                <a class="fly-nav-avatar" href="javascript:;" style="margin: 0 140px 0 0">
                    <img src="${loginUser.img}">
                    <cite class="layui-hide-xs" style="margin: 0 0 0 12px;color:#f4f6fa ">${loginUser.username}</cite>
                </a>
            </li>
            <li style="position: absolute;right: 30px;top:20px ">
                <a style="text-align: center;color: #f4f6fa"  href="../home.jsp">返回主页</a>
            </li>
            <li style="position: absolute;right: -35px;top:20px ">

                <a href="${pageContext.request.contextPath}/user?method=logout" style="text-align: center;color: #f4f6fa">退出</a>
            </li>
        </ul>
    </div>
</div>

<div class="layui-container fly-marginTop fly-user-main">
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
        <li class="layui-nav-item ">
            <a href="${pageContext.request.contextPath}/user/userhome.jsp">
                <i class="layui-icon"><img style="height: 20px;width: 20px"  src="../images/logo1.png" ></i>
                个人中心
            </a>
        </li>
        <li class="layui-nav-item ">
            <a href="${pageContext.request.contextPath}/user?method=usertitle&id=${loginUser.id}">
                <i class="layui-icon"><img style="height: 20px;width: 20px" src="../images/title.png" ></i>
                历史记录
            </a>
        </li>
        <li class="layui-nav-item layui-this">
            <a href="${pageContext.request.contextPath}/user/useset.jsp">
                <i class="layui-icon"><img style="height: 20px;width: 20px" src="../images/set.png" ></i>
                基本设置
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/user/userpsw.jsp">
                <i class="layui-icon"><img style="height: 20px;width: 20px" src="../images/psw.png" ></i>
                修改密码
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/user?method=getRelation&loginuser=${loginUser.id}">
                <i class="layui-icon"><img style="height: 20px;width: 20px" src="../img/fans.png" ></i>
                我的粉丝与关注
            </a>
        </li>
    </ul>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info">我的资料</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">
                    <form  action="/user?method=updateUserPhoneAndUsername&id=${loginUser.id}"  method="post">                        <%--??????????没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写没写--%>
                        <div class="layui-form-item">
                            <label for="L_email" class="layui-form-label">手机号</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_email" name="phone" required lay-verify="email" autocomplete="off" value="${loginUser.phone}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_username" name="username" required lay-verify="required" autocomplete="off" value="${loginUser.username}" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>



<div class="fly-footer">
    <p><a href="http://www.3class.cc/" target="_blank">3C论坛</a> 2021 &copy; <a href="http://www.3class.cc/" target="_blank">3class.cc 出品</a></p>

</div>


</body>
</html>
