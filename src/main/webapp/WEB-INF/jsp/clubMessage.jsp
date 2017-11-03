<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>unprocessedMessage</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/unprocessedMessage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleAlert.css" />
    <script src="${pageContext.request.contextPath}/js/simpleAlert.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script>

            //单次单选弹框
            $(".userName").click(function () {
                var onlyChoseAlert = simpleAlert({
                    "content": "<li><span>姓  名</span><span>李佳琪</span></li>" +
                    "<li><span>性  别</span><span>女</span></li>" +
                    "<li><span>手  机</span><span>15179190283</span></li>"+
                    "<li><span>邮  箱</span><span>630980865@qq.com</span></li>"+
                    "<li><span>学  校</span><span>江西师范大学</span></li>"+
                    "<li><span>学  院</span><span>软件学院</span></li>",
                    "buttons":{
                        "确定":function () {
                            onlyChoseAlert.close();
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<div id="header1">
    <div>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/">首页</a>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/user/login">登录</a>
    </div>
</div>
<div id="header2">
    <div id="logo">
        <img src="${pageContext.request.contextPath}/images/source/logo.png" style="width: 180px;height: 80px">
    </div>
   <div id="navilist">
			<p><a href="${pageContext.request.contextPath}/user/message">@你</a></p>
		</div>
		<div id="navilist">
			<p>
				社团消息
			</p>
		</div>

		<div id="navilist">
			<p>
				<a href="#">活动消息</a>
			</p>
		</div>
</div>
<div id="content">
    <ul id="messageList">
        <li class="list">
            <div class="messageInfo">
                <p><a class="userName">@watermelon.</a>向您发送了入团申请<a class="clubName">@吉他社</a></p>
            </div>
            <div class="handleButton">
                <button class="agree">同意</button>
                <button class="disagree">拒绝</button>
            </div>
        </li>
        <li class="list">
            <div class="messageInfo">
                <p><a class="userName">@watermelon.</a>向您发送了参与活动申请<a class="activityName">@周末狼人杀</a></p>
            </div>
            <div class="handleButton">
                <button class="agree">同意</button>
                <button class="disagree">拒绝</button>
            </div>
        </li>
        <li class="list">
            <div class="messageInfo">
                <p><a class="userName">@watermelon.</a>向您发送了参与活动申请<a class="activityName">@周末狼人杀</a></p>
            </div>
            <div class="handleButton">
                <button class="agree">同意</button>
                <button class="disagree">拒绝</button>
            </div>
        </li>
        <li class="list">
            <div class="messageInfo">
                <p><a class="userName">@watermelon.</a>向您发送了参与活动申请<a class="activityName">@周末狼人杀</a></p>
            </div>
            <div class="handleButton">
                <button class="agree">同意</button>
                <button class="disagree">拒绝</button>
            </div>
        </li>
        <li class="list">
            <div class="messageInfo">
                <p><a class="userName">@watermelon.</a>向您发送了参与活动申请<a class="activityName">@周末狼人杀</a></p>
            </div>
            <div class="handleButton">
                <button class="agree">同意</button>
                <button class="disagree">拒绝</button>
            </div>
        </li>
    </ul>
    <div id="nextPage">
        <ul>
            <li><span>上一页</span></li>
            <li><span>1</span></li>
            <li><span>2</span></li>
            <li><span>3</span></li>
            <li><span>4</span></li>
            <li><span>5</span></li>
            <li><span>下一页</span></li>
        </ul>
    </div>
</div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>