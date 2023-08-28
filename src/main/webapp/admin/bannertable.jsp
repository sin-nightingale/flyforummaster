

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

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基本</h5>
                    外联：<a href="http://yun.flyskill.cn/">http://yun.flyskill.cn/</a>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">

                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table class="table">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>轮播图</th>
                            <th>跳转地址</th>
                            <th>显示</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bannerPage.list}" var="banner">

                            <tr>
                                <td>${banner.id}</td>
                                <td>${banner.title}</td>
                                <td>${banner.bannerImg}</td>
                                <td>${banner.goHref}</td>
                                <td>${banner.isShow}</td>


                                <td>
                                    <a href="${pageContext.request.contextPath}/admin?method=FindBannerId&bannerid=${banner.id}" >
                                        <input type="botton" class="btn btn-w-m btn-success btn-circle" value="修改"/>
                                    </a>
                                </td>
                                <td>

                                    <botton type="botton" class="btn btn-w-m btn-danger btn-circle isdelete" >删除</botton>

                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <ul class="pagination">

                        <li><a href="#">&laquo;</a> </li>

                        <c:if test="${banner.totalPage>0}">

                            <c:forEach var="i" begin="0" end="${banner.totalPage-1}" step="1">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin?method=banenrPage&page=${i+1}">${i+1} </a>
                                </li>
                            </c:forEach>

                        </c:if>


                        <li><a href="#">&raquo;</a> </li>

                    </ul>



                </div>
            </div>
        </div>
    </div>
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
