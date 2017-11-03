<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>singleclub.html</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/css/singleclub.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/head1.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/lianxiwomen.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/confirmJoin.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/simpleAlert.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/reply.js"
	type="text/javascript"></script>
<script>
	$(function() {
	
		//确认弹出框
		$(".join").click(function() {
			var onlyChoseAlert = simpleAlert({
				"content" : "确认参加 <i>音乐社</i> 吗？",
				"buttons" : {
					"确定" : function() {
						onlyChoseAlert.close();
					}
				}
			})
			$(this).html("审核中");
			$(this).css('background', '#CCCCCC');
		})
	});
	$(document).ready(function() {
		menu();
		pictureRoll();
	});
	function menu() {
		$('.list >li').hover(function() {
			$(this).children('.hide').toggle();
			$(this).children('.hengtiao').toggle();
		});
	};
	function pictureRoll() {
		var flag = "left";
		function DY_scroll(wraper, prev, next, img, imga, speed, or) {
			var wraper = $(wraper); /*包装*/
			var prev = $(prev);
			var next = $(next);
			var img = $(img).find('ul');
			var imga = $(imga).find('ul li');
			var w = img.find('li').outerWidth(true);
			var s = speed;
			next.click(function() {
				img.animate({
					'margin-left' : -w
				}/*,1500,'easeOutBounce'*/, function() {
					img.find('li').eq(0).appendTo(img);
					img.css({
						'margin-left' : 0
					});
				});
				flag = "left";
			});
			prev.click(function() {
				img.find('li:last').prependTo(img);
				img.css({
					'margin-left' : -w
				});
				img.animate({
					'margin-left' : 0
				}/*,1500,'easeOutBounce'*/);
				flag = "right";
			});
			if (imga.length > 4) {
				if (or == true) {
					ad = setInterval(function() {
						flag == "left" ? next.click() : prev.click()
					}, s * 1000);
					wraper.hover(function() {
						clearInterval(ad);
					}, function() {
						ad = setInterval(function() {
							flag == "left" ? next.click() : prev.click()
						}, s * 1000);
					});
				}
			}

		}
		DY_scroll('#activity', '.leftbtn', '.rightbtn', '.activity1');
	};
	
	function askClubSubmit(){
		var askClubForm=$("#askClubForm");
		var url=askClubForm["0"].action;
		var data=askClubForm.serialize();
		
		$.ajax({
			type:"post",
			url:url,
			data:data,
			dataType:"json",
			success:function(data){
				if(data.status=="true")
					{
					location.reload() ;
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
	
	function askUserSubmit(obj){
		var askClubForm=$(obj).parent("#askUserSubmit");
		var url=askClubForm["0"].action;
		var data=askClubForm.serialize();
		
		$.ajax({
			type:"post",
			url:url,
			data:data,
			dataType:"json",
			success:function(data){
				if(data.status=="true")
					{
					location.reload() ;
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
	
	
	
	function nextPage(){
		var pageNum=$("#pageNum").val();
		var clubId=$("#clubId").val();
		var path="${pageContext.request.contextPath}"
		location.href=path+"/club/detail?pageNum=" + pageNum + "&clubId="+ clubId;

	}
</script>
</head>

<body>
	<%@include file="smallpage/head.jsp"%>
	<div id="singleclub">
		<div id="basicinfo">
			<div class="pic">
				<div class="picinfo">
					<img src="${club.logoImage }" />
					<div class="pictext">
						<h3>Welcome joining!</h3>
						<p>${club.name }</p>
					</div>
				</div>
				<div class="text">
					<span class="follow"><i></i>关注</span> <span class="join">申请加入</span>
				</div>
			</div>
			<div class="info">
				<ul>
					<li class="name">${club.name }</li>
					<li class="address">地点：江西师范大学</li>
					<li class="property">社团属性：校级社团</li>
					<li class="size">社团规模：${club.count}人</li>
					<li class="introduction">${club.description }</li>
				</ul>
			</div>
		</div>
		<div id="framework">
			<h2 class="title">框架</h2>
			<div id="department">
				<span class="department one">文艺部</span> <span class="department two">办公室</span>
				<span class="department three">宣传部</span> <span
					class="department four">外联部</span> <span class="department five">网络部</span>
			</div>
		</div>
		<div id="activity">
			<h2 class="title">活动</h2>
			<div class="leftbtn"></div>
			<div class="rightbtn"></div>
			<div class="activity1">
				<ul>
					<c:forEach items="${list}" var="activity">
						<li class="activity"><a href="#"><img
								src="${activity.image }" /></a>
							<h3>${activity.name}</h3>
							<p>社团：${club.name }</p>
							<p>
								活动时间：
								<fmt:formatDate value="${activity.beginDateTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</p></li>

					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="textarea">
			<div id="area">
				<p class="title">留言区</p>
				<div id="publish">
					<form
						action="${pageContext.request.contextPath}/club/askClubFormClub"
						id="askClubForm" onsubmit="event.preventDefault();">
						<textarea id="publisharea" name="content"></textarea>
						<input type="hidden" name="clubId" value="${club.id }"> <input
							type="submit" id="publishsubmit" value="发送"
							onclick="askClubSubmit()" />
					</form>
				</div>
				<div id="messageshow">
					<ul>

						<c:forEach items="${pageInfo.list }" var="question">
							<li class="message">
								<div class="headpic" style="width: 70px; height: 70px;">
									<img src="${question.headImage }"
										style="width: 100%; height: 100%;" />
								</div>
								<p class="username">
									<span class="user">by</span> <span class="name"> <c:if
											test="${not empty question.nickName}">
								     ${question.nickName}
								</c:if> <c:if test="${empty question.nickName}">
								     ${question.email}
								</c:if>

									</span>
								</p>
								<p class="usertext">${question.content }</p>
								<p class="publishtime">
									<span class="publish">发表于</span><span class="time"> <fmt:formatDate
											value="${question.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
									</span>
								</p>
								<button class="replybutton">回复</button>
								<div class="reply" style="display: none">
									<form
										action="${pageContext.request.contextPath}/club/askUserSubmit"
										id="askUserSubmit" onsubmit="event.preventDefault();">
										<textarea class="replytextarea"
											onfocus="if(this.innerHTML=='请输入内容'){this.innerHTML=''}"
											onblur="if(this.innerHTML==''){this.innerHTML='请输入内容'}"
											name="content"></textarea>
										<input type="hidden" name="questionId" value="${question.id }" />
										<input type="submit" class="replysubmit"
											onclick="askUserSubmit(this)" value="提交评论" />
									</form>
								</div>
								<div class="replyshow">
									<ul>
										<c:forEach items="${question.answerList}" var="answer">
											<li>
												<div class="headpic" style="width: 70px; height: 70px;">
													<img src="${answer.headImage }"
														style="width: 100%; height: 100%;" />
												</div>
												<p class="username">
													<span class="user">by</span> <span class="name"> <c:if
															test="${not empty answer.nickName}">
								     ${answer.nickName}
								</c:if> <c:if test="${empty answer.nickName}">
								     ${answer.email}
								</c:if>
													</span>
												</p>
												<p class="usertext">${answer.content }</p>
												<p class="publishtime">
													<span class="publish">发表于</span><span class="time">
														<fmt:formatDate value="${answer.createTime }"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</span>
												</p>
											</li>

										</c:forEach>
									</ul>
								</div>
							</li>

						</c:forEach>
					</ul>

					<input type="hidden" name="clubId" value="${club.id }" id="clubId" />
					<input type="hidden" name="pageNum" value="${pageNum+1 }"
						id="pageNum" />


					<button id="nextpage" onclick="nextPage()">下一页</button>
				</div>
			</div>
		</div>
		<div id="lianxiwomen">
			<div id="zhizuoren">School Club团队制作</div>
		</div>
	</div>
</body>
</html>