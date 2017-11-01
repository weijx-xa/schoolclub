<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Schoolnews</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/schoolnews.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/head2.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/sideBar.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.downCount.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/MenuSidebar.js"></script>
    <script type="text/javascript">
        $(document).ready(function (){
            $('.news1').downCount({
                date: '12/13/2018 21:25:00',
                offset: +10
            }, function () {
                alert('倒计时结束!');
            });
            $('.news2').downCount({
                date: '8/12/2018 21:25:00',
                offset: +10
            }, function () {
                alert('倒计时结束!');
            });
            $('.news3').downCount({
                date: '6/2/2018 21:25:00',
                offset: +10
            }, function () {
                alert('倒计时结束!');
            });
        });
        </script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
<div id="news">
    <ul class="newslist">
        <li class="news">
        <a href="${pageContext.request.contextPath}/school/detail"><img src="${pageContext.request.contextPath}/images/info/recruit.jpg"/></a>
        <p class="title"><a href="#">校园招聘会</a></p>
        <p class="address">地点：大学生活动中心二楼</p>
        <p class="time">时间：2016年12月25日上午9点</p>
            <div class="countdownWrapper">
            <p>距结束时间</p>
                <ul class="countdown news1">
                    <li> <span class="days">00</span>
                        <p class="days_ref">days</p>
                    </li>
                    <li class="seperator">.</li>
                    <li> <span class="hours">00</span>
                        <p class="hours_ref">hours</p>
                    </li>
                    <li class="seperator">:</li>
                    <li> <span class="minutes">00</span>
                        <p class="minutes_ref">minutes</p>
                    </li>
                </ul>
            </div>
        </li>
        <li class="news">
            <a href="#"><img src="${pageContext.request.contextPath}/images/info/recruit2.jpg"/></a>
            <p class="title"><a href="#">校园招聘会</a></p>
            <p class="address">地点：大学生活动中心二楼</p>
            <p class="time">时间：2016年12月25日上午9点</p>
            <div class="countdownWrapper">
                <p>距结束时间</p>
                <ul class="countdown news2">
                    <li> <span class="days">00</span>
                        <p class="days_ref">days</p>
                    </li>
                    <li class="seperator">.</li>
                    <li> <span class="hours">00</span>
                        <p class="hours_ref">hours</p>
                    </li>
                    <li class="seperator">:</li>
                    <li> <span class="minutes">00</span>
                        <p class="minutes_ref">minutes</p>
                    </li>
                </ul>
            </div>
        </li>
        <li class="news">
            <a href="#"><img src="${pageContext.request.contextPath}/images/info/recruit2.jpg"/></a>
            <p class="title"><a href="#">校园招聘会</a></p>
            <p class="address">地点：大学生活动中心二楼</p>
            <p class="time">时间：2016年12月25日上午9点</p>
            <div class="countdownWrapper">
                <p>距结束时间</p>
                <ul class="countdown news3">
                    <li> <span class="days">00</span>
                        <p class="days_ref">days</p>
                    </li>
                    <li class="seperator">.</li>
                    <li> <span class="hours">00</span>
                        <p class="hours_ref">hours</p>
                    </li>
                    <li class="seperator">:</li>
                    <li> <span class="minutes">00</span>
                        <p class="minutes_ref">minutes</p>
                    </li>
                </ul>
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
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>