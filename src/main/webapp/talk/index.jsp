<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>聊天界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/talk/css/chat.css"/>
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/talk/js/flexible.js"></script>
</head>
<body>
<header class="header">
    <a class="back" href="javascript:history.back()"></a>
<c:forEach items="${youList}" var="you">
    <h5 class="tit">${you.username}</h5>
</c:forEach>
    <div class="right"> </div>
</header>
<div id="message">
<c:forEach items="${youList}" var="you">
    <div class="reply">
        <div class="msg">
            <img src="${you.img}" alt=""/>
            <span class="name">${you.username}</span>
            <p>
                <i class="msg_input"></i>
                你好在不在呀，妹子！
            </p>
        </div>
    </div>
</c:forEach>



    <div class="ask">
        <div class="time">05/22 06:30</div>
        <div class="msg">
            <img src="${pageContext.request.contextPath}/talk/images/touxiangm.png" alt=""/>
            <p>
                <i clas="msg_input"></i>
                你好你好你好
            </p>
        </div>
    </div>

</div><c:forEach items="${youList}" var="you"> <form href="${pageContext.request.contextPath}/user?method=talks&youid=${you.id}&loginuser=${loginUser.id}" method="post">
    </c:forEach><div id="footer">

    <img src="${pageContext.request.contextPath}/talk/images/hua.png" alt=""/>
    <img src="${pageContext.request.contextPath}/talk/images/xiaolian.png" alt=""/>
    <input class="my-input" type="text" name="text"/>
    <button type="submit">发送</button>

</div> </form>

</body>
</html>
