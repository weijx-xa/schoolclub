<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>singleActivity</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/singleActivity.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/head1.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/confirmJoin.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/reply.js" language="javascript" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/simpleAlert.js" language="javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jQuery-jcLightBox.js" language="javascript" type="text/javascript"></script><!--图片点击放大-->
<script type="text/javascript">
	$(function () {
		//确认弹出框
		$(".join").click(function () {
			var onlyChoseAlert = simpleAlert({
				"content": "确认参加 <i>一起来玩狼人杀</i> 吗？",
				"buttons": {
					"确定": function () {
						onlyChoseAlert.close();
					}
				}
			})
		})
	});
	<!-- 菜单 -->

	$(document).ready(function (){
		menu();
		pictureBox();
		pictureRoll();
	});
	function menu(){
		$('.list >li').hover(function(){
			$(this).children('.hide').toggle();
			$(this).children('.hengtiao').toggle();
		});
	};
	<!-- 图片盒子 -->
	function pictureBox(){
		$("#jingcai1").jcLightBox();

		$("#jingcai").jcLightBox({
			speed : 200,
			listSpeed : 200,
			setLood : {
				path : "img/loading.gif",
				width : 32,
				height : 32
			},
			setModal : {
				bgColor : "#000",
				opacity : .6
			},
			state : "fade"
		});
	};
 <!--图片滚动-->
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
					ad = setInterval(function() { flag == "left" ? next.click() : prev.click()},s*1000);
					wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() {flag == "left" ? next.click() : prev.click()},s*1000);});
				}
			}

		}
		DY_scroll('#jingcaishunjian','.leftbtn','.rightbtn','.jingcaishunjian1');
		// true为自动播放，不加此参数或false就默认不自动
	};

</script>
</head>

<body>
<%@include file="smallpage/head.jsp"%>
<div id="basicinfo">
	<div class="pic">
		<img src="${pageContext.request.contextPath}/images/activity/activity3.jpg" width="320px" height="420px"/>
	</div>
	<div class="info">
		<ul>
			<li class="name">音乐社招新活动火热进行中,欢迎您的参与</li>
			<li class="holder">举办方:音乐社</li>
			<li class="time">时间：2016年9月18日—2016年9月25日</li>
			<li class="address">地点：江西师范大学二食堂门口摆摊</li>
			<li class="joinumber">参加人数：50人</li>
		</ul>
		<div class="click">
			<span class="join"><a href="#">参加</a></span>
			<span class="follow"><a href="#">关注</a></span>
			<span class="share"><a href="#">分享</a></span>
		</div>
		<div class="welcome">
			<p>精彩活动，等你加入</p>
		</div>
	</div>
</div>
<div id="content">
	<div id="holder">
		<p class="title">举办方</p>
		<div class="club">
			<div class="picture"><img src="${pageContext.request.contextPath}/images/club/club2.png"/></div>
			<h3 class="clubname"><a href="#">xxxxxx社</a></h3>
			<p class="follow">关注</p>
			<p class="join">申请加入</p>
			<p class="introduction">简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200。</p>
		</div>
		<div class="club">
			<div class="picture"><img src="${pageContext.request.contextPath}/images/club/club2.png"/></div>
			<h3 class="clubname"><a href="#">xxxxxx社</a></h3>
			<p class="follow">关注</p>
			<p class="join">申请加入</p>
			<p class="introduction">简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200。</p>
		</div>
		<div class="club">
			<div class="picture"><img src="${pageContext.request.contextPath}/images/club/club2.png"/></div>
			<h3 class="clubname"><a href="#">xxxxxx社</a></h3>
			<p class="follow">关注</p>
			<p class="join">申请加入</p>
			<p class="introduction">简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200。</p>
		</div>
	</div>
	<div id="huodongxiangqing">
		<p class="title">活动详情</p>
		<p class="information">一年一度的音乐社招新又将来临，欢迎各位小鲜肉小鲜花的加入哦！~对我们有兴趣的可以在每天下午五点十分到六点半之间来二食堂门口欣赏我们社团的相关表演哦 音乐舞蹈棒棒的</p>
	</div>
	<div id="jingcaishunjian">
		<p class="title">精彩瞬间</p>
		<div class="leftbtn"></div>
		<div class="rightbtn"></div>
		<div class="jingcaishunjian1">
			<ul id="jingcai" class="jingcaiList">
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong1.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong1.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a></li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong2.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong2.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong3.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong3.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong4.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong4.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong1.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong1.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong2.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong2.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a></li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong3.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong3.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
				<li>
					<a rel="${pageContext.request.contextPath}/images/activity/huodong4.jpg" width="540" height="400" group="group1" title="Wonderful Moment">
						<figure>
							<img src="${pageContext.request.contextPath}/images/activity/huodong4.jpg"/>
							<figcaption>Moment</figcaption>
						</figure>
					</a>
				</li>
			</ul>
		</div>
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
								<p class="usertext">哈哈哈哈哈哈哈哈</p><p class="publishtime"><span class="publish">发表于</span><span class="time">2016.12.25 15:48</span></p>
							</li>
						</ul>
					</div>
				</li>
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
</body>
</html>
