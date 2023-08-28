

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 基础表格</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- 引入Sweet Alert插件 -->
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">



    <!--下拉框css-->

    <link rel="shortcut icon" href="../favicon.ico">

    <link rel="stylesheet" type="text/css" href="/css/normalize.css" />


    <link rel="stylesheet" type="text/css" href="/css/cs-select.css" />

    <link rel="stylesheet" type="text/css" href="/css/cs-skin-border.css" />




    <style type="text/css">
        .col-sm-6{
            width: 33%;
        }
        .form-control{
            width: 150px;
        }
        #upload
        {margin-right: 50px;
        }
        #uploadtitle{

        }
        .textbutton a {
            font-family: Candara, sans-serif !important;
            color: #ffffff !important;
        }

        table {
            font-size: 15px;
            border: 0;
        }

        .iebg {
            background: #ffffff;
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
            max-width: 300px;
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
        .cs-select span{
            padding: 4px;
        }
        .cs-skin-border.cs-active > span{
            background: #fff;
            border-color: #000;
        }
        .b-r{
            border-right: 0px solid #e7eaec;
        }

        .cs-skin-border > span {
            border: 2px solid #cfdadd;
        }
        .modal-content {
            border-radius: 30px;
            box-shadow: 0 20px 20px rgba(0, 0, 0, 0.8);
        }
        #back{
            margin-top: -40px;
        }
        .cs-select span{
            width: 150px;
        }

        #uploadtitle input{
            width: 34px;
            border: 0px;
        }
    </style>






</head>

<div class="modal-dialog">

    <form class="form-horizontal" role="form" action="/admin?method=uploadBanner" method="post">
        <div class="modal-content">
            <div class="modal-body"><h3 id="uploadtitle" class="m-t-none m-b">修改轮播图信息：<input type="label" value="${isBanner.id}"   readonly="readonly"  name="id" > 号轮播图</h3>

                <a id="back" class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" href="${pageContext.request.contextPath}/admin?method=userPage">><strong>返回</strong>
                </a>

                <div class="row">
                    <div class="col-sm-6 b-r" style="width: 50%">
                        <div class="form-group">
                            <label>轮播图标题：</label>
                            <input type="text"  name="title" placeholder="请输入标题名" value="${isBanner.title}" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>图片地址：</label>
                            <input type="text" name="bannerImg" placeholder="请输入图片地址" class="form-control" value="${isBanner.bannerImg}">
                        </div>
                    </div>
                    <div class="col-sm-6 b-r"style="width: 50%">


                        <div class="form-group">
                            <label>地址指向：</label>
                            <input type="text" name="goHref" placeholder="请输入地址指向" class="form-control" value="${isBanner.goHref}">
                        </div>

                        <div class="form-group" style="padding: 0 16px 0 0;">
                            <label>是否显示：</label>
                            <table width="250" border="0" cellspacing="0" cellpadding="0" align="left" class="scale">
                                <select   name="isShow" class="cs-select cs-skin-border">

                                    <c:choose>
                                        <c:when test="${isBanner.isShow==1}"><option name="isShow" value="0" selected="selected">是</option><option name="isShow" value="1">否</option></c:when>
                                        <c:otherwise><option name="isShow" value="0">是</option><option name="isShow" value="1" selected="selected">否</option></c:otherwise>
                                    </c:choose>

                                </select>
                            </table>
                        </div>
                        <div>
                            <button style="margin: 6px 91% 0 0;" id="upload" class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>保存修改</strong>
                            </button>
                            <label></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>


<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>



<!-- Peity -->
<script src="/js/plugins/peity/jquery.peity.min.js"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>


<!-- iCheck -->
<script src="/js/plugins/iCheck/icheck.min.js"></script>

<!-- Peity -->
<script src="/js/demo/peity-demo.js"></script>
<!-- Sweet alert -->
<script src="/js/plugins/sweetalert/sweetalert.min.js"></script>



<!--
    作者：offline
    时间：2021-06-03
    下拉框

-->

<script src="/js/classie.js"></script>

<script src="/js/selectFx.js"></script>

<script>
    (function() {

        [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function(el) {

            new SelectFx(el);

        });

    })();
</script>


<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>


<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
        $('.isdelete').click(function () {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {
                swal("删除成功！", "您已经删除了这条信息。", "success");
            });
        });
    });
</script>



</body>

</html>
