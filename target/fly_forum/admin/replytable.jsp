

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 盖楼查询</title>
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
    <form action="/admin?method=ReplydeleteAll" method="post">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基本</h5>
                    <div class="ibox-tools">
                        <input type="botton" class="btn btn-w-m btn-primary btn-circle" id="inverse" value="反选" onclick="notSelectAll(); " />

                        <input type="submit" value="删除选中" class="btn btn-w-m btn-danger btn-circle" />
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
                            <th><input type="checkbox"   id="selAll"  onclick="selectAll();"/></th>
                            <th>回复id</th>
                            <th>回复所在的主题</th>
                            <th>楼层</th>
                            <th>回复内容</th>
                            <th>回复者id</th>
                            <th>回复者名</th>

                            <th>创建时间</th>

                            <th>是否删除</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${replyPage.list}" var="reply">

                            <tr>
                                <td><input type="checkbox" value="${reply.id}" name="checkAll" id="checkAll"  onclick="setSelectAll();"/></td>
                                <td>${reply.id}</td>
                                <td>${reply.topicId}</td>
                                <td>${reply.floor}</td>
                                <td>${reply.content}</td>
                                <td>${reply.userId}</td>
                                <td>${reply.username}</td>
                                <td>${reply.createTime}</td>

                                <td>${reply.delete}</td>

                                <%--<td>--%>
                                    <%--<botton type="botton" class="btn btn-w-m btn-danger btn-circle isdelete" >删除</botton>--%>
                                <%--</td>--%>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <ul class="pagination">

                        <li><a href="#">&laquo;</a> </li>

                        <c:if test="${replyPage.totalPage>0}">

                            <c:forEach var="i" begin="0" end="${replyPage.totalPage-1}" step="1">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin?method=replyPage&page=${i+1}">${i+1} </a>
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


<script>
    var selAll = document.getElementById("selAll");
    function TopicId(id){
        if(confirm("删除返单？")){
            $.post("/admin?method=deleteUser&id="+id),
                setTimeout( $.post("/admin?method=topicPage"),500),
                setTimeout( window.location.reload(),500)


        }else {
            alert("删除失败");
        }
    }

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
