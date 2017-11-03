<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/head1.css" rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"
	language="javascript" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/lunbo.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		menu();
	});
	var countdown=60;
    function settimefunction(obj) {
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value="免费获取验证码";
            countdown = 60;
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
                    settimefunction(obj) }
                ,1000)
    }
	
	function menu() {
		$('.list >li').hover(function() {
			$(this).children('.hide').toggle();
			$(this).children('.hengtiao').toggle();
		});
	};
	function settime(obj)
	{
		var to=$("#registerEmail").val();
		$.ajax({
			type:"post",
			url:'${pageContext.request.contextPath}/sendEmail',
			data:{
				to:to
			},
			dataType:"json",
			success:function(data){
				if(data.status=="true")
					{
					    //调用倒计时方法，下面的alert可以注释
					  //  alert("验证码发送成功");
					    settimefunction(obj);
					}
				else{
					alert(data.value);
				}
			},
			error:function(){
				alert("服务器出错了，请稍后尝试");
			}
			
		});
	}
	
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
</script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
	<div class="container">
		<div id="left-slide">
        <ul class="banner-inner">
            <li><img src="${pageContext.request.contextPath}/images/source/a1.png"  alt="" name="0"/></li>
            <li><img src="${pageContext.request.contextPath}/images/source/a2.png"  alt="" name="1" /></li>
            <li><img src="${pageContext.request.contextPath}/images/source/a3.png"  alt="" name="2"/></li>
            <li><img src="${pageContext.request.contextPath}/images/source/a4.png"  alt="" name="3"/></li>
        </ul>
        <ol class="pageCtrl">
            <li class="active"></li>
            <li></li>
            <li></li>
            <li></li>
        </ol>
    </div>
    </script>
		<div id="loginRegister">
			<div id="loginRegisterBg">
				<img src="${pageContext.request.contextPath}/images/source/car.gif" />
			</div>
			<div id="loginRegister-title">
				<p id="login-title">登录</p>
				<p id="register-title">注册</p>
			</div>
			<div id="loginForm">
			<span id="message" style="color:red">
			   ${message }
			</span>
				<form action="${pageContext.request.contextPath}/user/login" method="post">
					<!--   <h1>账户登录</h1>-->
					<div class="Login-tel">
						<input type="text" placeholder="telephone" name="account" value="844704781@qq.com"/>
					</div>
					<div class="Login-password">
						<input type="password" placeholder="Password"
							name="password" value="123123"/>
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
			<span id="message"  style="color:red">
			   ${message }
			</span>
				<form action="${pageContext.request.contextPath}/user/register" method="post">
					<!--  <h1>个人注册</h1>-->
					<div class="Register-tel">
						<input type="text" placeholder="email" id="registerEmail"
							name="email" value="844704781@qq.com"/>
					</div>
					<div class="Register-password">
						<input type="password" placeholder="password"
							name="password" value="123123"/>
					</div>
					<div class="Register-code">
						<input type="text" placeholder="请输入验证码" name="code" /> <input
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
