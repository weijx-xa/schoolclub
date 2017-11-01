<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Club.html</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/Club.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/head2.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/sideBar.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/MenuSidebar.js" language="javascript" type="text/javascript"></script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
<div id="club">
    <ul class="club-show">
        <li>
            <a class="club pic1">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="${pageContext.request.contextPath}/club/detail">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
        <li class="club">
            <a class="club pic2">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
        <li class="club">
            <a class="club pic3">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
        <li class="club">
            <a class="club pic4">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
        <li>
            <a class="club pic1">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
        <li class="club">
            <a class="club pic2">
                <div class="text">
                    <p class="smallTitle">xxxx社</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                <span class="follow"> <a href="#">关注</a></span>
            </div>
        </li>
    </ul>
</div>
<div id="leftBar">
</div>
<div id="rightBar">
    <ul>
        <li class="weixin">
            <div class="weixin-logo"></div>
        </li>
        <li class="suggestion"></li>
        <li class="app">
            <div class="app-logo"></div>
        </li>
        <li class="returnTop"></li>
    </ul>
</div>
<div class="pagecut">
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
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>
