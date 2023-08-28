<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<html>--%>
<%--<head>--%>
    <%--<title>3c论坛</title>--%>

    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>

    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">--%>

    <%--<script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>--%>

    <%--<script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>--%>

<%--</head>--%>
<%--<body>--%>

<%--<div class="container">--%>


    <%--<ul class="nav nav-tabs">--%>
        <%--<c:forEach items="${categoryList}" var="category">--%>
            <%--<li>--%>
                <%--<a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}"> ${category.name}</a>--%>
            <%--</li>--%>
        <%--</c:forEach>--%>


        <%--<c:choose>--%>
            <%--<c:when test="${empty loginUser}">--%>
                <%--<li style="float: right"> <a href="${pageContext.request.contextPath}/user/register.jsp"> 注册</a> </li>--%>
                <%--<li style="float: right"> <a href="${pageContext.request.contextPath}/user/login.jsp"> 登录</a> </li>--%>
            <%--</c:when>--%>

            <%--<c:otherwise>--%>
                <%--<li style="float: right"> <a href="${pageContext.request.contextPath}/user?method=logout">注销</a> </li>--%>

                <%--<li style="float: right"> <a href="#">${loginUser.username}</a> </li>--%>

                <%--<li style="float: right">--%>
                    <%--<img src="${loginUser.img}" class="img-circle" width="25px" height="25px" style="margin-top: 8.5px">--%>
                <%--</li>--%>

                <%--<li style="float: right"> <a href="${pageContext.request.contextPath}/publish.jsp">发布主题</a> </li>--%>

                <%--<li style="float: right"> <a href="${pageContext.request.contextPath}/reply.jsp?topic_id=${param.topic_id}">盖楼回复</a> </li>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
    <%--</ul>--%>





    <%--<table class="table table-striped">--%>

        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>标题</th>--%>
            <%--<th>内容</th>--%>
            <%--<th>作者</th>--%>
            <%--<th>发布时间</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tr>--%>
            <%--<td>${topic.title}</td>--%>
            <%--<td>${topic.content}</td>--%>
            <%--<td>${topic.username}</td>--%>
            <%--<td>${topic.createTime}</td>--%>
        <%--</tr>--%>

    <%--</table>--%>






    <%--<table class="table table-striped">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>用户</th>--%>
            <%--<th>内容</th>--%>
            <%--<th>回复时间</th>--%>
            <%--<th>楼层</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>

        <%--<tbody>--%>
        <%--<c:forEach items="${replyPage.list}" var="reply">--%>
            <%--<tr>--%>
                <%--<td>${reply.username}</td>--%>
                <%--<td>${reply.content}</td>--%>
                <%--<td>${reply.createTime}</td>--%>
                <%--<td> 第 ${reply.floor} 楼</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
        <%--</tbody>--%>

    <%--</table>--%>









<%--</div>--%>



<%--</body>--%>
<%--</html>--%>










<html>
<head>
    <meta charset="utf-8">
    <title>3c论坛</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="3c论坛">
    <meta name="description" content="3c论坛">
    <link rel="stylesheet" href="css/serch.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">

    <style type="text/css">

        .fly-header img{
            width: 40px;
        }
        .fly-header span{
            color: #5FB878;
            font-size: 20px;
        }
        #uploadbutton{
            display: block;
            position: relative;
            height: 20px;
            line-height: 0px;
            margin-top: 10px;
            padding: 20px 22px 0 22px;
            text-align: center;
            font-size: 16px;
            font-weight: 300;
            background-color: #5FB878;
            color: #fff;
            text-align: center;
            right: 200px;
            border-radius: 30px;
        }


    </style>



</head>
<body>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="home.jsp">
            <img src="images/logo.jpg" alt="3Cluntan">
            <span style="font-family: '青青子衿体';" id="">
      <b>3C论坛</b>

      </span>
        </a>

        <div class="search d7" style="position: relative;left: -32%;top: 8px;">
            <form style="position: relative" action="/fly_forum_master_war/topic?method=searchTopic" method="post">
                <input type="text" name="searchtitle" placeholder="搜索从这里开始...">
                <button href="submit" style="background:none;border: none;position: absolute;left: 82%;top: 15%">
                    <img style="width: 30px;height: 30px" src="img/sou'suo.png">
                </button>
            </form>
        </div>

        <ul class="layui-nav fly-nav-user">
            <c:choose>
                <c:when test="${empty loginUser}">
                    <li class="layui-nav-item">
                        <a class="iconfont icon-touxiang layui-hide-xs" href="${pageContext.request.contextPath}/user/login.jsp"></a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="${pageContext.request.contextPath}/user/login.jsp">登入</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="${pageContext.request.contextPath}/user/register.jsp">注册</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <a class="fly-nav-avatar" href="${pageContext.request.contextPath}/" style="position: relative;top: 14px;left: -120px;">
                        <img src="${loginUser.img}">
                        <cite class="layui-hide-xs" style="margin: 0 0 0 12px;color:#f4f6fa ">${loginUser.username}</cite>
                    </a>
                    </li>
                    <li style="width: 84px;position: absolute;right: 30px;top:20px ">
                        <a style="text-align: center;color: #f4f6fa"  href="${pageContext.request.contextPath}/user?method=userhome&id=${loginUser.id}">我的主页</a>

                    </li>
                    <li style="position: absolute;right: -8px;top:20px ">

                        <a href="${pageContext.request.contextPath}/user?method=logout" style="text-align: center;color: #f4f6fa">退出</a>
                    </li>
                    <%--<li style="float: right">--%>
                    <%--<img src="${loginUser.img}" class="img-circle" width="25px" height="25px" style="margin-top: 8.5px">--%>
                    <%--</li>--%>


                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<c:choose>
    <c:when test="${empty loginUser}">
    </c:when>
    <c:otherwise>
        <div class="fly-panel fly-column">
            <div class="layui-container">
                <ul class="layui-clear">
                    <li class="layui-hide-xs layui-this"><a href="home.jsp">首页</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>


                    <!-- 用户登入后显示 -->
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="${pageContext.request.contextPath}/user?method=usertitle&id=${loginUser.id}">我发表的贴</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="${pageContext.request.contextPath}/user?method=usertitle&id=${loginUser.id}">我收藏的贴</a></li>

                </ul>
                <div class="fly-column-right layui-hide-xs">
                    <a href="publish.jsp" class="layui-btn" style="margin: 6px 0 0 0;">发表主题</a>
                </div>
            </div>
        </div>

    </c:otherwise>
</c:choose>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail" style="width: 100%">
            <div class="fly-panel detail-box">
                <h1>${topic.title}</h1>
                <div class="fly-detail-info">


                    <div class="fly-admin-box" data-id="123">
                        <%--<span class="layui-btn layui-btn-xs jie-admin" type="del">删除</span>--%>

                    </div>
                    <span class="fly-list-nums">
            <%--<a href="#comment">--%>
                <%----%>
                <%--<i class="iconfont" title="回答">&#xe60c;</i> ？？？？？？？？？楼层--%>
            <%----%>
            <%--</a>--%>
            <i class="iconfont" title="人气">&#xe60b;</i> ${topic.pv}
          </span>
                </div>
                <div class="detail-about">

                    <a class="fly-avatar" href="/user?method=youhome&id=${topic.userId}&loginuser=${loginUser.id}">


                        <c:forEach items="${userList}" var="user">
                            <c:choose>
                                <c:when test="${user.id==topic.userId}">
                                    <%--<span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">分类：${category.name}</a></span>--%>
                                    <%--<cite>${user.username}</cite>--%>
                                    <img src="${user.img}" alt="${user.username}">
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </c:forEach>




                    </a>
                    <div class="fly-detail-user">
                        <a href="/user?method=youhome&id=${topic.userId}&loginuser=${loginUser.id}" class="fly-link">


                            <c:forEach items="${userList}" var="user">
                                <c:choose>
                                    <c:when test="${user.id==topic.userId}">
                                        <%--<span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">分类：${category.name}</a></span>--%>
                                        <%--<cite>${user.username}</cite>--%>
                                        <cite>${user.username}</cite>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        </a>
                        <span>${topic.createTime}</span>
                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
                        <c:forEach items="${categoryList}" var="category">
                            <c:choose>
                            <c:when test="${category.id==topic.cId}">
                                <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="">分类：${category.name}</a></span>
                            </c:when>
                                <c:otherwise>

                                </c:otherwise>
                        </c:choose>
                             </c:forEach>
                            </div>
                </div>
                <div class="detail-body photos">
                    ${topic.content}
                </div>
            </div>

            <div class="fly-panel detail-box" id="flyReply">
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>

                <ul class="jieda" id="jieda">
<c:forEach items="${replyPage.list}" var="reply">

                    <li data-id="111">
                        <a name="item-1111111111"></a>
                        <div class="detail-about detail-about-reply">
                            <a class="fly-avatar" href="/fly_forum_master_war/user?method=youhome&id=${reply.userId}&loginuser=${loginUser.id}">

                                <c:forEach items="${userList}" var="user">
                                    <c:choose>
                                        <c:when test="${user.id==reply.userId}">
                                            <img src="${user.img}" ><%--发布者头像--%>
                                        </c:when>
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>



                            </a>
                            <div class="fly-detail-user">
                                <a href="" class="fly-link">


                                    <c:forEach items="${userList}" var="user">
                                        <c:choose>
                                            <c:when test="${user.id==reply.userId}">
                                                <%--<span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">分类：${category.name}</a></span>--%>
                                                <cite>${user.username}</cite>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                </a>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${topic.userId==reply.userId}"><span>(楼主)</span></c:when>--%>
                                    <%--<c:otherwise><span>普通用户</span></c:otherwise>--%>
                                <%--</c:choose>--%>
                            </div>
                            <div class="detail-hits">
                                <span>${reply.createTime}</span>
                            </div>
                        </div>
                        <div class="detail-body jieda-body photos">
                            ${reply.content}
                        </div>
                        <%--<div class="jieda-reply">--%>
              <%--<span type="reply">--%>
                <%--<i class="iconfont icon-svgmoban53"></i>--%>
                <%--回复--%>
              <%--</span>--%>
                            <%--<div class="jieda-admin">--%>
                                <%--<span type="edit">编辑</span>--%>
                                <%--<span type="del">删除</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </li>
</c:forEach>

                    <li class="fly-none">消灭零回复</li>
                </ul>







                <div class="layui-form layui-form-pane">
                    <form class="form-horizontal" role="form" action="/fly_forum_master_war/topic?method=replyByTopicId&topic_id=${param.topic_id}" method="post">
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <textarea id="L_content" name="content" required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">

                            <c:choose>
                                <c:when test="${empty loginUser}">
                                    <button type="button" class="layui-btn" onclick="alert('请先登陆后回复')">提交回复</button>

                                </c:when>

                                <c:otherwise>
                                    <button type="submit" class="layui-btn" lay-filter="*" lay-submit>提交回复</button>

                                </c:otherwise>
                            </c:choose>


                        </div>
                    </form>
                </div>







            </div>
        </div>

        <div class="layui-col-md4" STYLE="width: 100%; margin:40px 0 0 0;">
            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <dd><a href="http://www.3class.cc/" target="_blank">3C课堂</a><dd>
                    <dd><a href="http://www.flyskill.cn/" target="_blank">起航小站</a><dd>
                </dl>
            </div>

        </div>
    </div>
</div>

<div class="fly-footer">
    <p><a href="http://www.3class.cc/" target="_blank">3C论坛</a> 2021 &copy; <a href="http://www.3class.cc/" target="_blank">3class.cc 出品</a></p>

</div>


</body>
</html>



