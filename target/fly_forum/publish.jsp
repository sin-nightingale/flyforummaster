<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 发布主题</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/plugins/simditor/simditor.css" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">

    <!--下拉框css-->

    <link rel="shortcut icon" href="../favicon.ico">

    <link rel="stylesheet" type="text/css" href="css/normalize.css" />

    <link rel="stylesheet" type="text/css" href="css/demo.css" />

    <link rel="stylesheet" type="text/css" href="css/cs-select.css" />

    <link rel="stylesheet" type="text/css" href="css/cs-skin-border.css" />

    <style type="text/css">
        .textbutton a {
            font-family: Candara, sans-serif !important;
            color: #ffffff !important;
        }

        table {
            font-size: 15px;
            border: 0;
        }


        .menulink a {
            color: #414a51 !important;
            text-decoration: none;
        }

        .shuru1 {
            margin: 0 30px 0 0px;
            display: inline-block;
            vertical-align: middle;
            position: relative;
            text-align: left;
            background: #fff;
            z-index: 100;
            width: 100%;
            background: transparent;
            font-size: 1em;
            font-weight: 700;
            max-width: 301px;
            border-radius: 10px;
        }

        .shuru {
            border: 5px solid #000;
            border-color: inherit;
            display: block;
            position: relative;
            cursor: pointer;
            padding: 1em;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .uploadbutton {
            position: absolute;
            right: 45%;
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }

        .uploadbutton:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }


    </style>






</head>

<body class="gray-bg">



<form class="form-horizontal" role="form" action="/fly_forum_master_war/topic?method=addTopic" method="post">


    <table class="w3-ban" width="100%" height="350" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td bgcolor="#00a78e">
                <table width="620" border="0" cellspacing="0" cellpadding="0" align="center" class="scale">
                    <tr>
                        <td>

                            <a style="border-radius:30px ;position: absolute;left: 20px;width: 180px" class="uploadbutton uploadbutton1" href="/home.jsp" type="button">返回主页</a>



                            <table width="540" border="0" cellspacing="0" cellpadding="0" align="center" class="scale">
                                <tr>
                                    <td class="w3l-1h" height="54">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="wthree-logo" align="center">
                                        <a href="#" style="font-family:'Bell Gothic Std', sans-serif; color: #fefefe; font-size: 40px; text-decoration: none; padding: 12px 26px 13px 26px; border-radius: 4px; text-transform:uppercase">发布主题 </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="logo-w3l-h" height="54">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="agile-main" align="center" style="font-family:'Bell Gothic Std', sans-serif; color: #fefefe; font-size: 20px; line-height: 35px;" class="scale-center-both">

                                    </td>
                                </tr>
                                <tr>
                                    <td class="w3l-2h" height="54">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="250" border="0" cellspacing="0" cellpadding="0" align="left" class="scale">
                                            <select class="cs-select cs-skin-border" name="c_id">

                                                <option value="" disabled selected>主题类型</option>
                                                <c:forEach items="${categoryList}" var="category">
                                                    <option value="${category.id}">${category.name} </option>
                                                </c:forEach>


                                            </select>
                                        </table>
                                        <table style="outline: none"  width="250" border="0" cellspacing="0" cellpadding="0" align="right" class="scale">

                                            <div class="shuru1 " style="outline: none" tabindex="0">
													<span style="border-radius: 30px; outline: none" class="shuru">
																主题标题:<input   name="title" type="text" style="background: transparent;border: 0;color: #FFFFFF;outline: none;" />
															</span>
                                            </div>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w3l-3h" height="78">&nbsp;</td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>



    <div class="wrapper wrapper-content">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">

                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div style="color: #0f0f0f"  class="ibox-content">
                        <textarea name="content" id="editor" placeholder="这里输入内容" autofocus>
                        </textarea>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <button style="border-radius:30px ;" class='uploadbutton uploadbutton1'>发布主题</button>
</form>


<table style="margin-top: 100px" width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td bgcolor="#00a78e">
            <table width="620" border="0" cellspacing="0" cellpadding="0" align="center" class="scale">
                <tr>
                    <td>

                        <table width="540" border="0" cellspacing="0" cellpadding="0" align="center" class="smocale">
                            <tr>
                                <td class="mo" height="54">&nbsp;</td>
                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

        </td>
    </tr>
</table>

<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>



<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>


<!-- simditor -->
<script type="text/javascript" src="/js/plugins/simditor/module.js"></script>
<script type="text/javascript" src="/js/plugins/simditor/uploader.js"></script>
<script type="text/javascript" src="/js/plugins/simditor/hotkeys.js"></script>
<script type="text/javascript" src="/js/plugins/simditor/simditor.js"></script>

<!-- /container -->

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
    $(document).ready(function () {
        var editor = new Simditor({
            textarea: $('#editor'),
            defaultImage: 'img/a9.jpg'
        });
    });
</script>



</body>

</html>
