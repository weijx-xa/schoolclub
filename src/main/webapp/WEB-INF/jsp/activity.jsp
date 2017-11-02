<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Activity.html</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/activity.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/head2.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/sideBar.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/MenuSidebar.js" language="javascript" type="text/javascript"></script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
<div id="activity">
	<h2 class="title">社团活动</h2>
	<ul>
		<li class="activity">
			<a href="${pageContext.request.contextPath}/activity/detail"><img src="${pageContext.request.contextPath}/images/activity/activity.jpg"/></a>
			<h3>大家一起来打羽毛球</h3>
			<p>社团：羽毛协会</p>
			<p>活动时间：2016年6月12日下午14:00</p>
		</li>
		<li class="activity">
			<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity2.jpg"/></a>
			<h3>大家一起来打羽毛球</h3>
			<p>社团：羽毛协会</p>
			<p>活动时间：2016年6月12日下午14:00</p>
		</li>
		<li class="activity">
			<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity3.jpg"/></a>
			<h3>大家一起来打羽毛球</h3>
			<p>社团：羽毛协会</p>
			<p>活动时间：2016年6月12日下午14:00</p>
		</li>
		<li class="activity">
			<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity.jpg"/></a>
			<h3>大家一起来打羽毛球</h3>
			<p>社团：羽毛协会</p>
			<p>活动时间：2016年6月12日下午14:00</p></li>
	</ul>
</div>
<!-- <div class="pagecut">
	<ul>
		<li><span>上一页</span></li>
		<li><span>1</span></li>
		<li><span>2</span></li>
		<li><span>3</span></li>
		<li><span>4</span></li>
		<li><span>5</span></li>
		<li><span>下一页</span></li>
	</ul>
</div> -->
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
