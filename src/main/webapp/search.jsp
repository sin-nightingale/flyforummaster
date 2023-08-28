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

    <link rel="stylesheet" href="${pageContext.request.contextPath}css/swiper.css" />
    <script src="${pageContext.request.contextPath}js/swiper.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">

    <!--下拉框css-->

    <link rel="shortcut icon" href="${pageContext.request.contextPath}../favicon.ico">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/cs-select.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/cs-skin-border.css" />

    <%--搜索框--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}css/serch.css">


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
        #nav {
            width: 160px;
            margin: 0 auto;
            height: 40px;
            border: 1px solid #00a78e;
            font-size: 18px;
            font-family: 微软雅黑;
        }

        #nav ul li {
            float: left;
            /*包含块*/
            position:relative;
        }

        #nav ul li a {
            display: block;
            width: 150px;
            height: 40px;
            line-height: 40px;
            padding: 0 0 0 10px;
            color: #00a78e;
        }

        #nav ul li a:hover {
            color: black;
            background: #00a78e;
        }
        /*二级菜单样式*/
        #nav ul li ul {
            position:absolute;
            top:40px;
            left:-1px;
            display:none;
        }
        #nav ul li ul li {
            float:none;
        }
        #nav ul li ul li a{
            background:#fff;
            border-bottom:1px solid #00a78e;
            border-left:1px solid #00a78e ;
            border-right:1px solid #00a78e ;
        }
        /*一级菜单悬停时二级菜单可见*/
        #nav ul li:hover ul {
            display:block;
        }
    </style>


</head>
<body>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="${pageContext.request.contextPath}home.jsp">
            <img src="${pageContext.request.contextPath}images/logo.jpg" alt="3Cluntan">
            <span style="font-family: '青青子衿体';" id="">
      <b>3C论坛</b>

      </span>
        </a>

        <div class="search d7" style="position: relative;left: -32%;top: 8px;">
            <form style="position: relative" action="/topic?method=searchTopic" method="post">
                <input type="text" name="searchtitle" placeholder="搜索从这里开始...">
                <button href="submit" style="background:none;border: none;position: absolute;left: 82%;top: 15%">
                    <img style="width: 30px;height: 30px" src="${pageContext.request.contextPath}img/sou'suo.png">
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
                    <li style="float: right">
                        <a id="uploadbutton" href="${pageContext.request.contextPath}/publish.jsp">发布主题</a></li>
                    <li class="layui-nav-item">
                        <a class="fly-nav-avatar" href="${pageContext.request.contextPath}/">
                            <img src="${loginUser.img}">
                            <cite class="layui-hide-xs" style="margin: 0 0 0 12px;color:#f4f6fa ">${loginUser.username}</cite>
                        </a>
                    </li>
                    <li style="position: absolute;right: 30px;top:20px ">
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
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/usertitle.jsp">我发表的贴</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/usertitle.jsp">我收藏的贴</a></li>

                </ul>
                <div class="fly-column-right layui-hide-xs">
                    <span class="fly-search"><i class="layui-icon"></i></span>
                    <a href="publish.jsp" class="layui-btn">发表新帖</a>
                </div>
            </div>
        </div>

    </c:otherwise>
</c:choose>

<span style="font-size: 30px;color: #00a78e;margin: 0 16px 0 185px;">${key}</span><span style="font-size: 30px;font-weight: lighter;">的搜索结果如下...</span>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">

            <div class="fly-panel" style="margin-bottom: 0;position: relative;">

                <ul class="fly-list">


                    <c:forEach items="${search.list}" var="topic">

                        <li>
                            <a href="/user?method=youhome&id=${topic.userId}" class="fly-avatar">
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
                                <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">${topic.title}</a><%--标题--%>
                            </h2>
                            <div class="fly-list-info">
                                <a href="/user?method=youhome&id=${topic.userId}" link>

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
                    <div class="laypage-main">
                        <c:if test="${topicPage.totalPage>0}">
                            <c:forEach var="i" begin="0" end="${topicPage.totalPage-1}" step="1">
                                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i+1}">${i+1}</a>
                            </c:forEach>
                        </c:if>
                    </div>
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


            <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">回贴周榜</h3>
                <dl>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->

                    <dd>
                        <a href="user/home.html">
                            <img src="https://q1.qlogo.cn/g?b=qq&nk=167775665&s=640"><cite>CC小天才</cite><i>106次回答</i>
                        </a>
                    </dd>
                </dl>
            </div>

            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                <dd>
                    <a href="jie/detail.html">3c论坛</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>

                <!-- 无数据时 -->
                <!--
                <div class="fly-none">没有相关数据</div>
                -->
            </dl>



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
    <p><a href="http://erdangjiade.com/" target="_blank">3C论坛</a> 2021 &copy; <a href="http://www.3class.cc/" target="_blank">3class.cc 出品</a></p>

</div>

<script src="${pageContext.request.contextPath}/js/layui.js"></script>


<script src="js/classie.js"></script>

<script src="js/selectFx.js"></script>

<script>
    (function() {

        [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function(el) {

            new SelectFx(el);

        });

    })();
</script>


<script>
    layui.cache.page = '';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '${pageContext.request.contextPath}/images/logo.jpg'
        ,experience: 83
        ,sex: '男'
    };
    layui.config({
        version: "3.0.0"
        ,base: '${pageContext.request.contextPath}/js/mods/' //这里实际使用时，建议改成绝对路径
    }).extend({
        fly: 'index'
    }).use('fly');
</script>


</body>
</html>




