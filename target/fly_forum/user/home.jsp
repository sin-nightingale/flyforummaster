
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content=" ">
    <meta name="description" content=" ">
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

        <a class="fly-logo" href="${pageContext.request.contextPath}/home.jsp">
            <img src="../images/logo.jpg" alt="layui">
            <span style="font-family: '青青子衿体';" id="">
      <b>3C论坛</b>

      </span>
        </a>
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
<c:forEach items="${userList}" var="user">
<div class="fly-home fly-panel" style="background-image: url('');">
    <img src="${user.img}" alt="${user.username}">
    <c:choose>
    <c:when test="${user.role==2}">
        <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
    </c:when>
    </c:choose>


    <h1>
            ${user.username}
        <c:choose>
        <c:when test="${user.role==2}">
        <span style="color:#c00;">（管理员）</span><span>uid:${user.id}
        </c:when>
        <c:otherwise>
            <span style="color:#c00;">（普通用户）</span><span>uid:${user.id}
        </c:otherwise>
    </c:choose>
    </h1>
    <a href = "javascript:void(0)" onclick = "document.getElementById('look').style.display='block';" alt="查看TA的关注">TA的关注数：${countfollower}个&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
    <a href = "javascript:void(0)" onclick = "document.getElementById('fans').style.display='block';" alt="查看TA的粉丝">TA的粉丝数：${countfans}</a>

    <p class="fly-home-info">
        <i class="iconfont icon-shijian"></i><span> ${user.username}加入时间${user.createTime}</span>
    </p>

    <p class="fly-home-sign">（不好好学习，每天都是未解之谜）</p>

    <div class="fly-sns" data-user="">
        <c:choose>
        <c:when test="${user.id==loginUser.id}">
            <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">我的主页</a>

        </c:when>
        <c:otherwise>


        <a href="${pageContext.request.contextPath}/user?method=relation&youid=${user.id}&loginuser=${loginUser.id}" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">${isfollow}</a>
            <a href="${pageContext.request.contextPath}/user?method=talk&youid=${user.id}&loginuser=${loginUser.id}" class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>

        </c:otherwise>
        </c:choose>

    </div>

</div>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6 fly-home-jie" style="width: 100%">
            <div class="fly-panel">
                <h3 class="fly-panel-title"> ${user.username} 最近的提问</h3>

                <ul class="jie-row">

                    <c:forEach items="${topicList}" var="topic">
                        <li>
                            <a class="jie-title" href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}" target="_blank">${topic.title}</a>
                            <i>${topic.createTime}</i>
                            <a class="mine-edit" href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">查看</a>
                            <em class="layui-hide-xs">${topic.pv}阅</em>
                        </li>
                    </c:forEach>
                    <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div> -->
                </ul>
            </div>
        </div>
    </div>
</div>

    <div id="fans" style="width: 285px;overflow: hidden;border-radius: 15px;box-shadow: -3px 2px 15px rgba(0,10,0,.7);margin: 0 0 0 15%;display: none;position: absolute;top: 10%;left: 52%;">
        <div style="width: 300px;background: #fff;height: 575px;overflow-y:scroll">
            <h3 style="border-bottom: 3px solid #eee;" class="fly-panel-title"  >粉丝</h3>
            <a href = "javascript:void(0)" onclick = "document.getElementById('fans').style.display='none';"><img src="/img/close.png" alt="关闭" style="width: 20px;position: absolute;top: 3%;left: 88%;"></a>
            <c:forEach items="${fanceList}" var="fans">
                <dl >
                    <c:forEach items="${usersList}" var="user">
                        <c:choose>
                            <c:when test="${fans.followerId==user.id}">
                                <dd  style="text-align:left;margin: 0 0 0 10px;border-bottom: 2px solid #eee;padding: 10px 0 10px 0;" >
                                    <a href="user/home.html">
                                        <img style="width: 50px;height: 50px" src="${user.img}">
                                        <cite>${user.username}</cite>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/user?method=gzfollower&youid=${user.id}&loginuser=${loginUser.id}" class="layui-btn layui-btn-primary fly-imActive" style="float: right;margin: 3px 18px 0 0;" data-type="addFriend">关注他</a>
                                </dd>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
    </div>


    <div id="look" style="width: 285px;overflow: hidden;border-radius: 15px;box-shadow: -3px 2px 15px rgba(0,10,0,.7);margin: 0 0 0 15%;display: none;position: absolute;top: 10%;">
        <div style="width: 300px;background: #fff;height: 575px;overflow-y:scroll">
            <h3 style="border-bottom: 3px solid #eee;" class="fly-panel-title"  >关注</h3>
            <a href = "javascript:void(0)" onclick = "document.getElementById('look').style.display='none';"><img src="/img/close.png" alt="关闭" style="width: 20px;position: absolute;top: 3%;left: 88%;"></a>
            <c:forEach items="${followerList}" var="follower">
                <dl >
                    <c:forEach items="${usersList}" var="user">
                        <c:choose>
                            <c:when test="${follower.userId==user.id}">
                                <dd  style="text-align:left;margin: 0 0 0 10px;border-bottom: 2px solid #eee;padding: 10px 0 10px 0;" >
                                    <a href="user/home.html">
                                        <img style="width: 50px;height: 50px" src="${user.img}">
                                        <cite>${user.username}</cite>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/user?method=qxfollower&youid=${user.id}&loginuser=${loginUser.id}" class="layui-btn layui-btn-primary fly-imActive" style="float: right;margin: 3px 18px 0 0;" data-type="addFriend">取消关注</a>
                                </dd>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
    </div>




</c:forEach>

<c:if test="${empty userList }">
    <div class="fly-none" style="min-height: 0; padding: 0;">
        <i class="iconfont icon-tishilian"style="-webkit-user-select:none;-moz-user-select:none-ms-user-select:none;user-select:none"></i>
    </div>

    <div class="notice layui-text" style="text-align: center;">
        该用户涉嫌违规，已被封号不可查看 <br> <span style="padding:0 5px;"></span><span style="padding:0 5px;"></span>
    </div>
</c:if>
<div class="fly-footer">
    <p><a href="http://www.3class.cc/" target="_blank">3C论坛</a> 2021 &copy; <a href="http://www.3class.cc/" target="_blank">3class.cc 出品</a></p>

</div>


</body>
</html>