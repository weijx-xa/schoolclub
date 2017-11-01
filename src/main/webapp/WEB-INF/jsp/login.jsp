<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<link type="text/css" href="<%=path%>/css/login.css" rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/head1.css" rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"
	language="javascript" type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.luara.0.0.1.min.js"
	language="javascript" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		menu();
	});
	function menu() {
		$('.list >li').hover(function() {
			$(this).children('.hide').toggle();
			$(this).children('.hengtiao').toggle();
		});
	};
	$(document).ready(function() {
		$("#loginRegister").slideDown(500);
		$("#login-title").addClass("titleBg");
		$("#register-title").click(function() {
			$("#login-title").removeClass("titleBg");
			$("#loginForm").hide(500);
			$(this).addClass("titleBg");
			$("#registerForm").show(500);
		});
		$("#login-title").click(function() {
			$("#register-title").removeClass("titleBg");
			$(this).addClass("titleBg");

			$("#loginForm").show(500);
			$("#registerForm").hide(500);
		});
	});
	$(function() {
		<!--调用Luara示例-->
		$("#left-slide").luara({
			width : "700",
			height : "560",
			interval : 4500,
			selected : "seleted",
			deriction : "left"
		});

	});
</script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
	<div class="container">
		<div id="left-slide">
			<ul>
				<li><img
					src="${pageContext.request.contextPath}/images/source/loginLunbo01.png" /></li>
				<li><img
					src="${pageContext.request.contextPath}/images/source/loginLunbo02.png" /></li>
				<li><img
					src="${pageContext.request.contextPath}/images/source/loginLunbo03.png" /></li>
				<li><img
					src="${pageContext.request.contextPath}/images/source/loginLunbo04.png" /></li>
			</ul>
			<ol>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ol>
		</div>
		<div id="loginRegister">
			<div id="loginRegisterBg">
				<img src="${pageContext.request.contextPath}/images/source/car.gif" />
			</div>
			<div id="loginRegister-title">
				<p id="login-title">登录</p>
				<p id="register-title">注册</p>
			</div>
			<div id="loginForm">
				<form action="">
					<!--   <h1>账户登录</h1>-->
					<div class="Login-tel">
						<input type="text" placeholder="telephone" name="login-telephone" />
					</div>
					<div class="Login-password">
						<input type="password" placeholder="Password"
							name="login-password" />
					</div>
					<div class="Login-submit">
						<input type="submit" value="Log in" />
					</div>
					<div id="forgetPW">
						<span>忘了密码?</span><a href="#">忘了密码?</a>
					</div>
					<div id="register">
						<span>还没有账号?</span><a href="#">注册</a>
					</div>

				</form>
				<div id="thirdLogin">
					<h1>合作账户登录</h1>
					<ul>
						<li id="qq"><a href="#"><img
								src="${pageContext.request.contextPath}/images/loginpic/qq.png" /></a></li>
						<li id="weixin"><a href="#"><img
								src="${pageContext.request.contextPath}/images/loginpic/weixin.png" /></a></li>
						<li id="weibo"><a href="#"><img
								src="${pageContext.request.contextPath}/images/loginpic/weibo.png" /></a></li>
					</ul>
				</div>
			</div>
			<div id="registerForm">
				<form action="${pageContext.request.contextPath}/user/register" method="post">
					<!--  <h1>个人注册</h1>-->
					<div class="Register-tel">
						<input type="text" placeholder="telephone"
							name="register-telephone" />
					</div>
					<div class="Register-password">
						<input type="password" placeholder="Password"
							name="register-password" />
					</div>
					<div class="Register-code">
						<input type="text" placeholder="请输入验证码" name="register-code" /> <input
							type="button" id="code-btn" value="获取验证码" onclick="settime(this)" />
					</div>
					<div class="register-submit">
						<input type="submit" value="注册" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="lianxiwomen">
		<div id="zhizuoren">School Club团队制作</div>
	</div>
</body>
</html>
