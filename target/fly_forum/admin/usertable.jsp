

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

    <link rel="stylesheet" type="text/css" href="css/normalize.css" />

    <link rel="stylesheet" type="text/css" href="css/cs-skin-border.css" />

    <link rel="stylesheet" type="text/css" href="css/cs-select.css" />






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

    </style>




</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <form action="admin?method=deleteAll" method="post">
    <div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>基本</h5>
                <%--<a href="${pageContext.request.contextPath}/admin?method=userdown">本地下载</a>--%>

                <div class="ibox-tools">
                    <input type="botton" class="btn btn-w-m btn-primary btn-circle" id="inverse" value="反选" onclick="notSelectAll(); " />

                    <input type="submit" value="删除选中" class="btn btn-w-m btn-danger btn-circle" />
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="">
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
                    <tr><th><input type="checkbox"   id="selAll"  onclick="selectAll();"/></th>
                        <th>id</th>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>性别</th>
                        <th>注册日期</th>
                        <th>权限</th>
                        <th>修改</th>
                        <th>删除</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userPage.list}" var="user">

                        <tr>
                            <td><input type="checkbox" value="${user.id}" name="checkAll" id="checkAll"  onclick="setSelectAll();"/></td>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.phone}</td>


                            <td>
                                <c:choose>
                                    <c:when test="${user.sex==1}">男</c:when>
                                    <c:otherwise>女</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.createTime}</td>
                            <td><c:choose>
                                <c:when test="${user.role==1}">普通用户</c:when>
                                <c:otherwise>管理员</c:otherwise>
                            </c:choose></td>
                            <td>

                                <a class="btn btn-w-m btn-success btn-circle btn-circle "  href="${pageContext.request.contextPath}/admin?method=FindUserId&userid=${user.id}" >修改</a>

                            </td>

                            <td>

                                <botton type="botton" class="btn btn-w-m btn-danger btn-circle " onclick="UserId('${user.id}')">删除</botton>

                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <ul class="pagination">

                    <li><a href="#">&laquo;</a> </li>

                    <c:if test="${userPage.totalPage>0}">

                        <c:forEach var="i" begin="0" end="${userPage.totalPage-1}" step="1">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin?method=userPage&page=${i+1}">${i+1} </a>
                            </li>
                        </c:forEach>

                    </c:if>


                    <li><a href="#">&raquo;</a> </li>

                </ul>

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
        $('.isdelete').click(function () {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function (id) {

                swal("删除成功！", "您已经删除了这条信息。", "success"&id);
            });
        });
    });
</script>




<script>

    function UserId(id){
        if(confirm("删除返单？")){
            $.post("/admin?method=deleteUser&id="+id),
            setTimeout( $.post("/admin?method=userPage"),500),
                setTimeout( window.location.reload(),500)


        }else {
            alert("删除失败");
        }
    }

    var selAll = document.getElementById("selAll");
    function selectAll()
    {
        var obj = document.getElementsByName("checkAll");
        if(document.getElementById("selAll").checked == false)
        {
            for(var i=0; i<obj.length; i++)
            {
                obj[i].checked=false;
            }
        }else
        {
            for(var i=0; i<obj.length; i++)
            {
                obj[i].checked=true;
            }
        }

    }

    //当选中所有的时候，全选按钮会勾上
    function setSelectAll()
    {
        var obj=document.getElementsByName("checkAll");
        var count = obj.length;
        var selectCount = 0;

        for(var i = 0; i < count; i++)
        {
            if(obj[i].checked == true)
            {
                selectCount++;
            }
        }
        if(count == selectCount)
        {
            document.all.selAll.checked = true;
        }
        else
        {
            document.all.selAll.checked = false;
        }
    }

    //反选按钮
    function notSelectAll() {
        var checkboxs = document.getElementsByName("checkAll");
        for (var i = 0; i < checkboxs.length; i++) {
            var e = checkboxs[i];
            e.checked = !e.checked;
            setSelectAll();
        }
    }



</script>



</body>

</html>
