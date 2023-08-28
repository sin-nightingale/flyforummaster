<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>3c论坛</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">


    <%--<link rel="shortcut icon" href="favicon.ico"> <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">--%>
    <%--<link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">--%>
    <%--<link href="/css/animate.css" rel="stylesheet">--%>
    <%--<link href="/css/style.css?v=4.1.0" rel="stylesheet">--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}css/serch.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/swiper.css" />
    <script src="js/swiper.js"></script>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">


    <style type="text/css">
        #style{
            height: auto;
            border: 2px solid #CCC;
            border-radius: 30px;
            margin-top: 10px;
            width: 90%;
            margin-left: 10px;
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
            right: -140px;
            border-radius: 30px;
        }

        .container li{
            list-style: none;
            float: left;
        }
        .container ul img{
            width: 770px;
            height: auto;

        }
        .container{
            max-width: 770px;//容器大小要和图片大小保持一致。
        max-height: 433px;
            overflow: hidden;
            position: relative;
            border: 1px solid black;
        }
        .container ol{
            position: absolute;
            bottom: 0;
            left: 50%;
            padding: 10px;
            margin-left: -50px;
            z-index: 999;

        }
        .container ol li{
            width: 10px;
            height: 10px;
            background-color: #fff;
            border: 1px solid red;
            border-radius: 50%;
            margin: 0 10px;
        }

        .container ul{
            animation:Yui 9s cubic-bezier(0, 1, 0, 1) 3s infinite ;
            width: 400%;

        }
        @keyframes Yui{
            0% {
                transform: translateX(0px);
            }
            33% {
                transform: translateX(-770px);
            }
            66% {
                transform: translateX(-1540px);
            }
            100% {
                transform: translateX(0px);
            }

        }
        .container ol li {
            animation:focus 9s linear infinite ;//时间要和图片保持一致
        }
        ol li:nth-child(1) {
            animation-delay: 0s;
        }
        ol li:nth-child(2) {
            animation-delay: 3s;
        }
        ol li:nth-child(3) {
            animation-delay: 6s;
        }

        @keyframes focus {
            0% {
                background-color: #000;
            }
            20% {
                background-color: #000;
            }
            30% {
                background-color: #fff;
            }
        }
        /*.cid.active{ color:red;*/
            /*text-decoration:none;*/
        /*}*

    </style>


</head>
<body>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="home.jsp">
            <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="3Cluntan">
            <span style="font-family: '青青子衿体';" id="">
      <b>3C论坛</b>

      </span>
        </a>

        <div class="search d7" style="position: relative;left: -32%;top: 8px;">
            <form style="position: relative" action="/topic?method=searchTopic" method="post">
                <input type="text" name="searchtitle" placeholder="搜索从这里开始...">
                <button href="submit" style="background:none;border: none;position: absolute;left: 82%;top: 15%">
                    <img style="width: 30px;height: 30px" src="${pageContext.request.contextPath}/img/sou'suo.png">
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
            <li class="layui-hide-xs layui-this"><a href="${pageContext.request.contextPath}home.jsp">首页</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>


            <!-- 用户登入后显示 -->
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/fly_forum_master_war/user?method=usertitle&id=${loginUser.id}">我发表的贴</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/fly_forum_master_war/user?method=usertitle&id=${loginUser.id}">我收藏的贴</a></li>

        </ul>
        <div class="fly-column-right layui-hide-xs">
            <a href="publish.jsp" class="layui-btn" style="margin: 6px 0 0 0;">发表主题</a>
        </div>
    </div>
</div>

</c:otherwise>
</c:choose>

<div class="swiper">
    <ul class="pic">
<c:forEach items="${BannerList}" var="banner">
        <li ><a href="${banner.goHref}"><img src="${banner.bannerImg}" alt="${banner.title}" /></a></li>
</c:forEach>
    </ul>
    <ol class="cricle"></ol>
    <div class="btns">
        <a href="javascript:;" class="leftbtn" style="float: left; margin-left: 6px;"></a>
        <a href="javascript:;" class="rightbtn" style="float: right; margin-right: 6px;"></a>
    </div>
    <div class="leftBox"></div>
    <div class="rightBox"></div>
</div>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">







            <div class="fly-panel" style="margin-bottom: 0;position: relative;border-radius: 15px;">
                <div id="style" style="display:inline-block; _display:inline; zoom:1;width: 96%;border-radius: 15px">



















                    <ul class="fly-panel-title fly-filter">
                        <li style="float: left">
                            <a   href="/fly_forum_master_war/topic?method=list&c_id=0"> 全部分类</a>
                        </li>
                        <c:forEach items="${categoryList}" var="category">
                            <li style="float: left">
                                <a   href="/fly_forum_master_war/topic?method=list&c_id=${category.id}"> ${category.name}</a>
                            </li>
                        </c:forEach>
                    </ul>


































                </div>

                <%--<span id="paixu" class="fly-filter-right layui-hide-xs">--%>
            <%--<a href="" class="layui-this">按最新</a>--%>
            <%--<span class="fly-mid"></span>--%>
            <%--<a href="">按热议</a>--%>
          <%--</span>--%>








                <ul class="fly-list">

<c:forEach items="${topicPage.list}" var="topic">

                    <li>
                        <a href="/fly_forum_master_war/user?method=youhome&id=${topic.userId}&loginuser=${loginUser.id}" class="fly-avatar">
                            <c:forEach items="${userList}" var="user">
                                <c:choose>
                                    <c:when test="${user.id==topic.userId}">
                                        <img src="${user.img}" ><%--发布者头像--%>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        </a>
                        <h2>
                            <a href="/fly_forum_master_war/topic?method=findDetailById&topic_id=${topic.id}">${topic.title}</a><%--标题--%>
                        </h2>
                        <div class="fly-list-info">
                            <a href="/user?method=youhome&id=${topic.userId}&loginuser=${loginUser.id}" link>

                                <c:forEach items="${userList}" var="user">
                                    <c:choose>
                                        <c:when test="${user.id==topic.userId}">
                                            <%--<span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">分类：${category.name}</a></span>--%>
                                            <cite>${user.username}</cite>
                                        </c:when>
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </a>
                                <c:forEach items="${categoryList}" var="category">
                                    <c:choose>
                                        <c:when test="${category.id==topic.cId}">
                                            <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a  style="color: #fff;" href="">分类：${category.name}</a></span>
                                        </c:when>
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>



                            <span>${topic.updateTime}</span>
                            <span class="fly-list-nums">
                                <img style="width: 16px;height: 16px" src="${pageContext.request.contextPath}/images/pv.png" title="浏览量">
                                <i class="glyphicon glyphicon-eye-open"></i>
                               <span> ${topic.pv}</span>
                <%--<i class="iconfont icon-pinglun1" title="回答"></i> 楼层--%>
              </span>
                        </div>
                    </li>

</c:forEach>
                </ul>




                <div style="text-align: center">
                    <div class="laypage-main" style="border:0px;border-left: 1px solid #009E94;">
                        <c:if test="${topicPage.totalPage>0}">
                        <c:forEach var="i" begin="0" end="${topicPage.totalPage-1}" step="1">
                                <a style="    border-top: 1px solid #009E94;" href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i+1}">${i+1}</a>
                        </c:forEach>
                    </c:if>
                        <a style="border: 0px;background: none;" href="#" class="laypage-next"></a></div>
                </div>


                <%--<div style="text-align: center" class="laypage-main" >--%>
                    <%--<ul style="border: 0px;padding: 0" class="pagination" >--%>
                        <%--<li href="/jie/page/2/" class="laypage-next" style="width: 60px">上一页</li>--%>


                        <%--<li href="/jie/page/2/" class="laypage-next">下一页</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>

            </div>
        </div>
        <div class="layui-col-md4">


            <div class="fly-panel" style="border-radius: 15px;">
                <div class="fly-panel-title fly-filter">
                    <a>热门</a>
                </div>
                <ul class="fly-list">
                    <c:forEach items="${topicPage.list}" var="topic">
                        <c:choose>
                            <c:when test="${topic.hot==1}">
                                <li style="padding: 10px 0px 10px 12px;">
                                    <h2>
                                        <a style="max-width: 100%;" href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">${topic.title}</a><%--标题--%>
                                    </h2>
                                    <div class="fly-list-info">
                                        <a href="/user?method=youhome&id=${topic.userId}&loginuser=${loginUser.id}" >

                                            <c:forEach items="${userList}" var="user">
                                                <c:choose>
                                                    <c:when test="${user.id==topic.userId}">
                                                        <%--<span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">分类：${category.name}</a></span>--%>
                                                        <cite>${user.username}</cite>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </a>
                                        <c:forEach items="${categoryList}" var="category">
                                            <c:choose>
                                                <c:when test="${category.id==topic.cId}">
                                                    <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a  style="color: #fff;" href="">分类：${category.name}</a></span>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <img src="img/hot.png" style="width: 22px;height: 22px;">
                                        <img src="img/hot.png" style="width: 22px;height: 22px;">
                                        <img src="img/hot.png" style="width: 22px;height: 22px;">
                                    </div>
                                </li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>



            <div class="fly-panel fly-link" style="border-radius: 15px;">
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

<script src="${pageContext.request.contextPath}/js/layui.js">
</script>

    <%--<script>--%>
<%--jQuery(function(){--%>
<%--$('ul>li a').click(function(){--%>
<%--$(this).addClass('cid').parent().siblings('li').children('a').removeClass('cid');--%>
<%--});--%>
<%--});--%>

<%--</script>--%>

</body>
</html>




