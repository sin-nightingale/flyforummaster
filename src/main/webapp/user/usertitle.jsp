
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
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
        <li class="layui-nav-item layui-this">
            <a href="${pageContext.request.contextPath}/user?method=usertitle&id=${loginUser.id}">
                <i class="layui-icon"><img style="height: 20px;width: 20px" src="../images/title.png" ></i>
                历史记录
            </a>
        </li>
        <li class="layui-nav-item">
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
                <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <ul class="mine-view jie-row">
                        <c:forEach items="${topicList}" var="topic">
                        <li>
                            <a class="jie-title" href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}" target="_blank">${topic.title}</a>
                            <i>${topic.createTime}</i>
                            <a class="mine-edit" href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">查看</a>
                            <em class="layui-hide-xs">${topic.pv}阅</em>
                        </li>
                        </c:forEach>
                    </ul>
                    <div id="LAY_page"></div>
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
