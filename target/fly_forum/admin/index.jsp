<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/25
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title> 3C论坛- 后台主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
</head>


<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">3C论坛</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">3C论坛
                    </div>
                </li>

                <li>
                    <a class="J_menuItem" href="/admin?method=updateIndex">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">用户管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">

                        <li>
                            <a class="J_menuItem"href="/admin/adduser.jsp">添加用户</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="/admin?method=userPage">用户列表</a>
                        </li>
                    </ul>
                </li>
                <li class="line dk"></li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">分类</span>
                </li>

                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">基本分类</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/admin/addcategory.jsp">添加分类</a>
                        </li>
                        <li><a class="J_menuItem" href="/admin?method=categoryPage">分类查询</a>
                        </li>


                    </ul>
                </li>
                <li>
                    <a class="J_menuItem" href="/home.jsp"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span></a>
                <li class="line dk"></li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">主题</span>
                </li>
                <li>
                    <a class="J_menuItem" href="/admin?method=topicPage"><i class="fa fa-flask"></i> <span class="nav-label">主题查询</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="/admin/topicgather.jsp"><i class="fa fa-flask"></i> <span class="nav-label">采集主题</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="/admin?method=replyPage"><i class="fa fa-table"></i> <span class="nav-label">盖楼查询</span></a>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">站点设置</span>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">站点设置</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/admin/addBanner.jsp">添加轮播图</a>
                        </li>
                        <li><a class="J_menuItem" href="/admin?method=bannerPage">轮播图设置</a>
                        </li>


                    </ul>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">主题</span>
                </li>
                <li>
                    <a href="/admin?method=logout"><i class="fa fui-exit"></i> <span class="nav-label">退出登陆</span></a>
                </li>


            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="/admin/search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="/admin/mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/admin/profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="/admin/notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="/admin/index_v1.jsp?v=4.0" frameborder="0" data-id="/admin/index_v1.html" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/index.js"></script>

<!-- 第三方插件 -->
<script src="/js/plugins/pace/pace.min.js"></script>

</body>


</html>
