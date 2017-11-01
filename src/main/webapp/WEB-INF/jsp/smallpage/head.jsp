<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
    <div class="header">
            <a id="setUpClub"style="color: #eeeeee" href="${pageContext.request.contextPath}/club/create1">创建社团</a>
            <a id="login"style="color: #eeeeee" href="${pageContext.request.contextPath}/user/login">登陆</a>
        <div id="unprocessedMessageWrapper">
            <a id="unprocessedMessage" href="${pageContext.request.contextPath}/user/message">您有一条未处理消息</a>
        </div>
    </div>
    <div id="nav" >
        <div id="logo"><img src="${pageContext.request.contextPath}/images/source/logo.png" style="width: 180px;height: 80px"> </div>
        <div id="gif"></div>
        <div id="guide">
            <ul class="list">
                <li><a id="nav-homepage" href="${pageContext.request.contextPath}/">首页</a><div class="hengtiao"></div></li>
                <li><a id="nav-club" href="${pageContext.request.contextPath}/club/list">社团</a><div class="hengtiao"></div></li>
                <li>
                    <a id="nav-activity" href="#">活动</a>
                    <div class="hide">
                        <a href="${pageContext.request.contextPath}/activity/list">社团活动</a>
                        <a href="${pageContext.request.contextPath}/school/news">校园资讯</a>
                    </div>
                </li>
            </ul>
            <!-- 
            <div id="search">
                    <input type="text" id="input1" >
                    <button type="submit" id="button">搜索</button>
            </div>
            
             -->
        </div>
    </div>
    <div class="background">
        <div id="div02">
        </div>
    </div>
    <div id="a-wire"></div>
</div>