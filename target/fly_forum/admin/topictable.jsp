

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 主题查询</title>
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
    <form action="/admin?method=TopicdeleteAll" method="post">
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
                            <th>主题id</th>
                            <th>主题名</th>
                            <th>所属分类</th>
                            <th>发布者id</th>
                            <th>发布者名</th>
                            <th>是否热门</th>
                            <th>是否删除</th>
                            <%--<th>主题内容</th>--%>
                            <th>浏览量</th>
                            <th>创建时间</th>
                            <th>修改</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${topicPage.list}" var="topic">

                            <tr>
                                <td><input type="checkbox" value="${topic.id}" name="checkAll" id="checkAll"  onclick="setSelectAll();"/></td>
                                <td>${topic.id}</td>
                                <td>${topic.title}</td>
                                <td>${topic.cId}</td>
                                <td>${topic.userId}</td>
                                <td>${topic.username}</td>
                                <td>${topic.hot}</td>
                                <td>${topic.delete}</td>
                                <%--<td>${topic.content}</td>--%>
                                <td>${topic.pv}</td>
                                <td>${topic.createTime}</td>
                                <td>
                                    <a class="btn btn-w-m btn-success btn-circle btn-circle "  href="${pageContext.request.contextPath}/admin?method=FindTopicId&topicid=${topic.id}" >修改</a>
                                </td>
                                <%--<td>--%>

                                    <%--<botton type="botton" class="btn btn-w-m btn-danger btn-circle isdelete"  onclick="TopicId('${topic.id}')" >删除</botton>--%>

                                <%--</td>--%>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <ul class="pagination">

                        <li><a href="#">&laquo;</a> </li>

                        <c:if test="${topicPage.totalPage>0}">

                            <c:forEach var="i" begin="0" end="${topicPage.totalPage-1}" step="1">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin?method=topicPage&page=${i+1}">${i+1} </a>
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
    });
</script>



<script>
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
