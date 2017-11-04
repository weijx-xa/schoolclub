<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
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
<div id="header1">
    <div>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/">首页</a>
        		<c:if test="${ not empty sessionScope.user}">
				 <a
			id="login" style="color: #eeeeee"
			href="${pageContext.request.contextPath}/user/info">${sessionScope.user.email }</a>
					/
			<a id="logout" style="color: #eeeeee"
				href="${pageContext.request.contextPath}/user/logout">退出</a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
				 <a
			id="login" style="color: #eeeeee"
			href="${pageContext.request.contextPath}/user/login">登录</a>
		</c:if>
    </div>
    
 
</div>