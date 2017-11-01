<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>singleclub.html</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/singleclub.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/head1.css" rel="stylesheet"/>
	<link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet"/>
	<link type="text/css" href="${pageContext.request.contextPath}/css/confirmJoin.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/simpleAlert.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/reply.js" type="text/javascript"></script>
	<script>
		$(function () {
			//确认弹出框
			$(".join").click(function () {
				var onlyChoseAlert = simpleAlert({
					"content": "确认参加 <i>音乐社</i> 吗？",
					"buttons": {
						"确定": function () {
							onlyChoseAlert.close();
						}
					}
				})
				$(this).html("审核中");
				$(this).css('background','#CCCCCC');
			})
		});
		$(document).ready(function (){
			menu();
			pictureRoll();
		});
		function menu(){
			$('.list >li').hover(function(){
				$(this).children('.hide').toggle();
				$(this).children('.hengtiao').toggle();
			});
		};
		function pictureRoll(){
			var flag = "left";
			function DY_scroll(wraper,prev,next,img,imga,speed,or){
				var wraper = $(wraper); /*包装*/
				var prev = $(prev);
				var next = $(next);
				var img = $(img).find('ul');
				var imga = $(imga).find('ul li');
				var w = img.find('li').outerWidth(true);
				var s = speed;
				next.click(function(){
					img.animate({'margin-left':-w}/*,1500,'easeOutBounce'*/,function(){
						img.find('li').eq(0).appendTo(img);
						img.css({'margin-left':0});
					});
					flag = "left";
				});
				prev.click(function(){
					img.find('li:last').prependTo(img);
					img.css({'margin-left':-w});
					img.animate({'margin-left':0}/*,1500,'easeOutBounce'*/);
					flag = "right";
				});
				if(imga.length>4){
					if (or == true){
						ad = setInterval(function() {
							flag == "left" ? next.click() : prev.click()},s*1000);
						wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() {flag == "left" ? next.click() : prev.click()},s*1000);});
					}
				}

			}
			DY_scroll('#activity','.leftbtn','.rightbtn','.activity1');
		};
	</script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
<div id="singleclub">
<div id="basicinfo">
<div class="pic">
	<div class="picinfo">
		<img src="${pageContext.request.contextPath}/images/club/club1.png"/>
		<div class="pictext">
			<h3>Welcome joining!</h3>
			<p>xxxxxx社</p>
		</div>
	</div>
	<div class="text">
		<span class="follow"><i></i>关注</span>
		<span class="join">申请加入</span>
	</div>
</div>
<div class="info">
<ul>
<li class="name">足球协会</li>
<li class="address">地点：江西师范大学</li>
<li class="property">社团属性：校级社团</li>
<li class="size">社团规模：120人</li>
<li class="introduction">简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200。</li>
</ul>
</div>
</div>
<div id="framework">
<h2 class="title">框架</h2>
<div id="department">
<span class="department one">文艺部</span>
<span class="department two">办公室</span>
<span class="department three">宣传部</span>
<span class="department four">外联部</span>
<span class="department five">网络部</span>
</div>
</div>
<div id="activity">
<h2 class="title">活动</h2>
<div class="leftbtn"></div>
<div class="rightbtn"></div>
<div class="activity1">
<ul>
<li class="activity">
<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity.jpg"/></a>
<h3>大家一起来打羽毛球</h3>
<p>社团：羽毛协会</p>
<p>活动时间：2016年6月12日下午14:00</p></li>
<li class="activity">
<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity2.jpg"/></a>
<h3>大家一起来打羽毛球</h3>
<p>社团：羽毛协会</p>
<p>活动时间：2016年6月12日下午14:00</p></li>
<li class="activity">
<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity3.jpg"/></a>
<h3>大家一起来打羽毛球</h3>
<p>社团：羽毛协会</p>
<p>活动时间：2016年6月12日下午14:00</p></li>
<li class="activity">
<a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity.jpg"/></a>
<h3>大家一起来打羽毛球</h3>
<p>社团：羽毛协会</p>
<p>活动时间：2016年6月12日下午14:00</p></li>
</ul>
</div>
</div>
	<div id="textarea">
		<div id="area">
			<p class="title">留言区</p>
			<div id="publish">
				<form action="">
					<textarea id="publisharea"></textarea>
					<input type="submit" id="publishsubmit" value="发送"/>
				</form>
			</div>
			<div id="messageshow">
				<ul>
					<li class="message">
						<div class="headpic"style="width: 70px;height: 70px;">
							<img src="${pageContext.request.contextPath}/images/userhead/head1.png" style="width: 100%;height: 100%;"/>
							</div>
						<p class="username"><span class="user">by</span> <span class="name">ljq.</span></p>
						<p class="usertext">哈哈哈哈哈哈哈哈</p>
						<p class="publishtime"><span class="publish">发表于</span><span class="time">2016.12.25 15:48</span></p>
						<button class="replybutton">回复</button>
						<div class="reply" style="display: none">
							<form action="" >
								<textarea class="replytextarea" onfocus="if(this.innerHTML=='请输入内容'){this.innerHTML=''}"  onblur="if(this.innerHTML==''){this.innerHTML='请输入内容'}" name="c"></textarea>
								<input type="submit" class="replysubmit" value="提交评论"/>
							</form>
						</div>
						<div class="replyshow">
							<ul>
								<li>
									<div class="headpic"style="width: 70px;height: 70px;">
									    <img src="${pageContext.request.contextPath}/images/userhead/head1.png" style="width: 100%;height: 100%;"/>
								    </div>
									<p class="username"><span class="user">by</span> <span class="name">ljq.</span></p>
									<p class="usertext">哈哈哈哈哈哈哈哈</p>
									<p class="publishtime"><span class="publish">发表于</span><span class="time">2016.12.25 15:48</span></p>
								</li>
								<li>
									<div class="headpic"style="width: 70px;height: 70px;">
										<img src="${pageContext.request.contextPath}/images/userhead/head1.png" style="width: 100%;height: 100%;"/>
									</div>
									<p class="username"><span class="user">by</span> <span class="name">ljq.</span></p>
									<p class="usertext">哈哈哈哈哈哈哈哈</p>
									<p class="publishtime"><span class="publish">发表于</span><span class="time">2016.12.25 15:48</span></p>
								</li>
							</ul>
						</div>
					</li>
				</ul>
				<button id="nextpage">下一页</button>
			</div>
		</div>
	</div>
	<div id="lianxiwomen">
		<div id="zhizuoren">
			School Club团队制作
		</div>
	</div>
</div>
</body>
</html>