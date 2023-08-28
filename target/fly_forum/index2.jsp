<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta>
    <title>GameLife首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/head1.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/layout.css"/>
    <%
        Object login_in = request.getAttribute("login_in");
        Object register_in = request.getAttribute("register_in");
        int change_type=0;
        String ch1=(String) login_in;
        String ch2=(String) register_in;
        if (ch1=="login"||ch2=="register"){
            change_type=1;
        }

    %>
    <script>
        var change_main="<%=change_type%>";
        window.left_windows = 'on';

        function onclick_reload() {
            location.reload();
        }

        function onclick_left_windows_control() {
            if (left_windows == 'on') {
                document.getElementById('left_box_id').style.transform = 'translateX(20px)';
                window.left_windows = 'off';
            } else {
                document.getElementById('left_box_id').style.transform = 'translateX(-250px)';
                window.left_windows = 'on';
            }
        }
        function change(){
            var img1=document.getElementById("iconList2")
            var img2=document.getElementById("iconList3")
            let a1=document.getElementById("jump_a1")
            let a2=document.getElementById("jump_a2")
            if (change_main==1){
                alert("登录成功");
                img1.src="${pageContext.request.contextPath}/static/images/img_10.png";
                img2.src="${pageContext.request.contextPath}/static/images/img_11.png";
                a1.href="${pageContext.request.contextPath}/pages/info/player_info.jsp"
                a2.href="${pageContext.request.contextPath}/index.jsp"
            }

        }

        function out(){
            let a1=document.getElementById("jump_a1")
            let a2=document.getElementById("jump_a2")
            if (change_main==1){
                alert("登出成功");
                window.location.replace("${pageContext.request.contextPath}/index.jsp");
            }
        }
    </script>

    <style type="text/css">

        .box {
            filter: opacity(0.6);
            border-radius: 10px 10px 0 0;
        }
    </style>
</head>
<body onload="change()">
<%

%>

<div class="mod2">
    <div class="group">
        <div class="primary">
            <img alt=""
                 class="iconList" id="iconList1" onclick="onclick_left_windows_control()"
                 src="${pageContext.request.contextPath}/static/images/img_0.png"/>
            <img alt=""
                 class="iconText"
                 src="${pageContext.request.contextPath}/static/images/img_1.png"/>
            <select style="opacity: 0.4" id="text">
                <option class="option">主   页</option>
                <a href="${pageContext.request.contextPath}/pages/module/pc.jsp"><option class="option">单机论坛</option>  </a>
                <option class="option">主机论坛</option>
                <option class="option">手游论坛</option>
                <option class="option">杂谈论坛</option>
                <option class="option" >视   频</option>
            </select>

        </div>

        <div class="search">
            <img src="${pageContext.request.contextPath}/static/images/img_7.png" class="search_img" alt="">
            <input type="search" class="search2">
        </div>

        <div class="side">
            <a class="info" href="${pageContext.request.contextPath}/pages/user/login.jsp" id="jump_a1"><img src="${pageContext.request.contextPath}/static/images/img_8.png" alt="" class="iconList" id="iconList2"></a>

            <a class="info" href="${pageContext.request.contextPath}/pages/user/regist.jsp" id="jump_a2"><img src="${pageContext.request.contextPath}/static/images/img_9.png" alt="" class="iconList" id="iconList3" onclick="out()"></a>

            <img onclick="onclick_reload()" alt=""
                 class="iconRefresh"
                 src="${pageContext.request.contextPath}/static/images/img_5.png"/>


        </div>
    </div>
</div>

<div class="left_box1" id="left_box_id">
    <div class="left_box_in" id="left_box_id2">
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_12.png" alt="" class="search_img">
            <a href="index.jsp" class="left_box_a">主    页</a>
        </div>
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_13.png" alt="" class="search_img">
            <a href="${pageContext.request.contextPath}/pages/module/pc.jsp" class="left_box_a">单机论坛</a>
        </div>
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_14.png" alt="" class="search_img">
            <a href="index.jsp" class="left_box_a">主机论坛</a>
        </div>
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_15.png" alt="" class="search_img">
            <a href="index.jsp" class="left_box_a">手游论坛</a>
        </div>
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_16.png" alt="" class="search_img">
            <a href="${pageContext.request.contextPath}/pages/message/message.jsp" class="left_box_a">杂谈论坛</a>
        </div>

        <hr style="height:2px;border:none;border-top:6px groove skyblue;"/>
        <div class="left_box_con">
            <img src="${pageContext.request.contextPath}/static/images/img_17.png" alt="" class="search_img">
            <a href="${pageContext.request.contextPath}/pages/module/video.jsp" class="left_box_a">视    频</a>
        </div>

    </div>
</div>

<div class="all_box">
    <div id="left_box">
        <div class="right_box_in">
            <div class="right_box_con1">
                <div class="right_box_title">
                    <img src="${pageContext.request.contextPath}/static/images/img_18.png" class="right_box_img" alt="">
                    <span class="right_box_span" >   在线用户</span>
                </div>
                <hr style="height:2px;border:none;border-top:2px groove skyblue;">
                <div class="right_box_thin">
                    <span class="right_box_span2">注册用户在线：</span>
                    <span class="right_box_span2">0</span>
                </div>
                <div class="right_box_thin">
                    <span class="right_box_span2">访客在线：</span>
                    <span class="right_box_span2">0</span>
                </div>
                <div class="right_box_thin">
                    <span class="right_box_span2">在线总数：</span>
                    <span class="right_box_span2">0</span>
                </div>
            </div>
            <div class="right_box_con2">
                <div class="right_box_title">
                    <img src="${pageContext.request.contextPath}/static/images/img_19.png" class="right_box_img" alt="">
                    <span class="right_box_span" >   最新讨论</span>
                </div>
                <hr style="height:2px;border:none;border-top:2px groove skyblue;">
                <br>
                <div class="right_box_large">
                    <img src="${pageContext.request.contextPath}/static/images/img_20.png" class="right_box_img2" alt="">
                    <div class="right_box_discuss">
                        <div class="right_box_discuss2_title" >
                            <a href="index.jsp">能不能以EA不兑现玩家承诺申请退款？</a>
                        </div>
                        <div class="right_box_discuss2_span">
                            <span>不在乎那70块钱，实在是这一口气咽不下去。后面的内容就是换皮继续筑基，想退说超时了不让退，一股诈骗味</span>
                        </div>
                        <div class="right_box_discuss2_a">
                            <a href="index.jsp">单机论坛</a>
                            <span>回复于刚刚</span>
                        </div>
                    </div>
                </div>

                <div class="right_box_large">
                    <img src="${pageContext.request.contextPath}/static/images/img_21.png" class="right_box_img2" alt="">
                    <div class="right_box_discuss">
                        <div class="right_box_discuss2_title" >
                            <a href="index.jsp">来个大佬帮帮妹妹，妹妹太难了!</a>
                        </div>
                        <div class="right_box_discuss2_span">
                            <span>妹妹有道题不会做，听说碧蓝人均研究生，于是妹妹我来问问善良热情的吧友们。题目就是</span>
                        </div>
                        <div class="right_box_discuss2_a">
                            <a href="index.jsp">手游论坛</a>
                            <span>回复于3分钟前</span>
                        </div>
                    </div>
                </div>

            </div>
            <div class="right_box_con1">
                <div class="right_box_title">
                    <img src="${pageContext.request.contextPath}/static/images/img_18.png" class="right_box_img" alt="">
                    <span class="right_box_span" >   论坛统计</span>
                </div>
                <hr style="height:2px;border:none;border-top:2px groove skyblue;">
                <div class="right_box_thin">
                    <span class="right_box_span2">帖子：</span>
                    <span class="right_box_span2">0</span>
                </div>
                <div class="right_box_thin">
                    <span class="right_box_span2">留言：</span>
                    <span class="right_box_span2">0</span>
                </div>
                <div class="right_box_thin">
                    <span class="right_box_span2">用户：</span>
                    <span class="right_box_span2">0</span>
                </div>
                <div class="right_box_thin">
                    <span class="right_box_span2">最新用户：</span>
                    <span class="right_box_span2">null</span>
                </div>
            </div>
        </div>
    </div>

    <div id="pageWrapper">
        <div id="top_box" style="overflow:visible">

        </div>
        <div id="p-body-header">
            <h1 id="p-title-values">论坛列表</h1>
        </div>
        <div id="samCodUnit"></div>
        <div id="uix_contentWrapper">
            <a href="/#discussion.6" style="color: #333333;font-size: 18px; text-decoration:none">讨论</a>
        </div>
        <div id="model">
            <div class="model_left">
                <div class="bkgd" class="box">
                    <a href="${pageContext.request.contextPath}/pages/Tip/post.jsp"><img src="${pageContext.request.contextPath}/static/images/game_1.png" class="box"/></a>
                    <div class="min_title">
                        <a href="${pageContext.request.contextPath}/pages/Tip/post.jsp"><p style="text-decoration:none; position: absolute;">单机论坛</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC1.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">这里有着最新的单机游戏新闻，讨论，公告，行业八卦，销售数据和评论。掌握单机游戏的脉搏</div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC1_1.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">我是唯一一个无法进入GAAS/MMO游戏的人吗？</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
            <div class="model_right">
                <div class="bkgd" class="box">
                    <a href=""><img src="${pageContext.request.contextPath}/static/images/game_2.png" class="box"/></a>
                    <div class="min_title">
                        <a href=""><p style="text-decoration:none; position: absolute;">主机论坛</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC2.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">
                        如果是与主机游戏相关的社区，就在这里。官方主机主题论坛，买卖/交易市场，游戏媒体粉丝群，配对，工会和群组。
                    </div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC2_2.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">您曾经珍视了哪些主机套装/捆绑游戏...</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
            <div class="model_left">
                <div class="bkgd" class="box">
                    <a href=""><img src="${pageContext.request.contextPath}/static/images/game_3.png" class="box"/></a>
                    <div class="min_title">
                        <a href=""><p style="text-decoration:none; position: absolute;">手游论坛</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC3.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">了解最新手游咨询，关注厂商动态和抢先体验测试版。
                    </div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC3_3.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">瓜游药丸</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
            <div class="model_right">
                <div class="bkgd" class="box">
                    <a href=""><img src="${pageContext.request.contextPath}/static/images/game_4.png" class="box"/></a>
                    <div class="min_title">
                        <a href=""><p style="text-decoration:none; position: absolute;">杂谈论坛</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC4.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">
                        其他一切。时事、娱乐、科技、生活、食物、政治、以及介于其中之间或是其他的任何事物。
                    </div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC4_4.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">寂静岭社区：在我们不安的梦想中，我们看到了那个小..</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
            <div class="model_left">
                <div class="bkgd" class="box">
                    <a href=""><img src="${pageContext.request.contextPath}/static/images/game_5.png" class="box"/></a>
                    <div class="min_title">
                        <a href=""><p style="text-decoration:none; position: absolute;">公告</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC5.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">资源和员工沟通</div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC5_5.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">广告招标</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
            <div class="model_right">
                <div class="bkgd" class="box">
                    <a href=""><img src="${pageContext.request.contextPath}/static/images/game_6.png" class="box"/></a>
                    <div class="min_title">
                        <a href=""><p style="text-decoration:none; position: absolute;">避难所</p></a>
                    </div>
                    <div class="tubiao" class="box">
                        <img class="box" src="${pageContext.request.contextPath}/static/images/Min_PC6.jpg"/>
                    </div>
                    <div class="font" style="position: absolute;">回忆珍贵的过去。</div>
                    <div class="tubiao_2">
                        <img src="${pageContext.request.contextPath}/static/images/Min_PC6_6.jpg"/>
                    </div>
                    <div class="font_2" style="position: absolute;">2022年 GameLife 年度游戏奖</div>
                    <a class="uix" href="../.." style="color:yellowgreen; text-decoration:none">➡️ 更多</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="foot">
    <div id="biankuang">
        <div id="tubiao">
            <a class="tubiao-1" href="">
                <img class="chicun" src="${pageContext.request.contextPath}/static/images/wx_ico.png"/>
            </a>
            <a class="tubiao-1" href="">
                <img class="chicun" src="${pageContext.request.contextPath}/static/images/wb_ico.png"/>
            </a>
            <a class="tubiao-1" href="">
                <img class="chicun" src="${pageContext.request.contextPath}/static/images/bili_ico.png"/>
            </a>
            <a class="tubiao-1" href="">
                <img class="chicun" src="${pageContext.request.contextPath}/static/images/Tmall_icon.png"/>
            </a>
        </div>
    </div>
    <!-- <p class="foot-wenzi">
        <a href="" class="lianjie-2" target="_blank">上海碧汉网络科技有限公司</a>
    </p> -->
    <!-- <div class="photo-5">
        <a href="" target="_blank" class="photo-5">
            <img src="${pageContext.request.contextPath}/static/images/gameRFID.png" />
        </a>
   </div > -->


    <div id="photo-6">
        <a href="" target="_blank" class="photo-5">
            <img src="${pageContext.request.contextPath}/static/images/Logo_1.jpg"/>
        </a>
    </div>
    <p class="foot-wenzi">
        沪网文（20xx）0000-0xx号 <a href="" id="lianjie-2" target="_blank" style="text-decoration: none;color:#710058">沪ICP备xxxxxxxx号</a>
        | 增值电信业务经
        营许可证: xx-xxxxxxxx | 互联网非法及不良信息举报电话(不提供客户服务): xxx-xxxxxxx (工作日 9:30- 18:00)
    </p>

</div>

</div>

<br/>


</body>
</html>