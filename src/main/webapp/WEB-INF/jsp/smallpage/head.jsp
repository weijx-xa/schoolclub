<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"
	type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

$(function(){
	getNotifications();
	setInterval(function(){
		getNotifications();
	},10000);
	var i=0;
	setInterval(function(){
		$("#unprocessedMessage").css("color",(i%2==0?'red':'blue'));
		i++;
	},500);
});
var i=1;
var size=0;
function getNotifications(){
	$.ajax({
		type:"post",
		url:"<%=path%>/getNotifications",
			dataType : "json",
			data : null,
			success : function(data) {
				if (data.status == "true") {
					
				      if(data.value!=null){
				    	  var audio = "<audio src=\"${pageContext.request.contextPath}/images//source/tips.mp3\" autoplay=\"autoplay\"></audio>";
				    	  console.log(data.value.number);
				    	  if(data.value.number==1)
	                    	  {
	                    	  $("#audio").html("");
	                    	   $("#audio").append(audio);
	                    	  }
				    	 
	                       if(i==1&&data.value.list!=null&&data.value.list.length>0)
	                    	   {
	                    	   var path="${pageContext.request.contextPath}"  ;
	                    	   
	                    	   var a=" <a id='unprocessedMessage' href='"+path+"/user/message\'>您有消息未处理</a>  ";
	                    	   $("#unprocessedMessageWrapper").html(a);
	                    	    i=0;
	                    	   }
	                       
	                     size=data.value.list.length;
				      }
				}
				 else {
				   console.log(data.value);
				}
			},
			error : function() {
				windows.reload();
			}
		});
	}
</script>
<div id="audio"></div>
<div id="wrapper">
	<div class="header">
		<a id="setUpClub" style="color: #eeeeee"
			href="${pageContext.request.contextPath}/club/create1">创建社团</a>

		<c:if test="${ not empty sessionScope.user}">
			<a id="login" style="color: #eeeeee"
				href="${pageContext.request.contextPath}/user/info"> <c:if
					test="${ not empty sessionScope.user.nickName }">
			    ${sessionScope.user.nickName }
			</c:if> <c:if test="${empty sessionScope.user.nickName  }">
			${sessionScope.user.email }
			</c:if>

			</a>
			/
			<a id="logout" style="color: #eeeeee"
				href="${pageContext.request.contextPath}/user/logout">退出</a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<a id="login" style="color: #eeeeee"
				href="${pageContext.request.contextPath}/user/login">登录</a>
			
		</c:if>

		<div id="unprocessedMessageWrapper">
			
		</div>
	</div>
	<div id="nav">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/images/source/logo.png"
				style="width: 180px; height: 80px">
		</div>
		<div id="gif"></div>
		<div id="guide">
			<ul class="list">
				<li><a id="nav-homepage"
					href="${pageContext.request.contextPath}/">首页</a>
					<div class="hengtiao"></div></li>
				<li><a id="nav-club"
					href="${pageContext.request.contextPath}/club/list">社团</a>
					<div class="hengtiao"></div></li>
				<li><a id="nav-activity" href="#">活动</a>
					<div class="hide">
						<a href="${pageContext.request.contextPath}/activity/list">社团活动</a>
						<a href="${pageContext.request.contextPath}/school/news">校园资讯</a>
					</div></li>
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
		<div id="div02"></div>
	</div>
	<div id="a-wire"></div>
</div>