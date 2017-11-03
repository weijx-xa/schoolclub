<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head lang="en">
<meta charset="UTF-8">
<title>unprocessedMessage</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/unprocessedMessage.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/lianxiwomen.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/simpleAlert.css" />
<script src="${pageContext.request.contextPath}/js/simpleAlert.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/js/laypage/laypage.js" language="javascript" type="text/javascript"></script>
<script>
	//单次单选弹框
	$(".userName").click(
					function() {
						var onlyChoseAlert = simpleAlert({
							"content" : "<li><span>姓  名</span><span>李佳琪</span></li>"
									+ "<li><span>性  别</span><span>女</span></li>"
									+ "<li><span>手  机</span><span>15179190283</span></li>"
									+ "<li><span>邮  箱</span><span>630980865@qq.com</span></li>"
									+ "<li><span>学  校</span><span>江西师范大学</span></li>"
									+ "<li><span>学  院</span><span>软件学院</span></li>",
							"buttons" : {
								"确定" : function() {
									onlyChoseAlert.close();
								}
							}
						})
					})
</script>
</head>
<body>
<%@include file="smallpage/head1.jsp"%>
	<div id="header2">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/images/source/logo.png"
				style="width: 180px; height: 80px">
		</div>
		<div id="navilist">
			<p>@你</p>
		</div>
		<div id="navilist">
			<p>
				<a href="${pageContext.request.contextPath}/user/clubMessage">社团消息</a>
			</p>
		</div>

		<div id="navilist">
			<p>
				<a href="">活动消息</a>
			</p>
		</div>
	</div>
	<div id="content">
	<a href="${pageContext.request.contextPath}/user/delMessage">清空所有消息</a>
		<ul id="messageList">

		</ul>

    
        <script type="text/javascript">

        function ajaxPage(data){
            $.post('<%=path%>/user/getCommonMessage',null
            		,function (result) {

            	if(result.status=="false")
            		{
            		   alert(result.value);
            		    return;
            		}
            	
            	for(var i=0;i<result.value.length;i++)
            		{
            		   var data=result.value[i];
   //         		   var clubId=data.clubId;
   //         		   var clubName=data.clubName
   //         		   var userId=data.userId;
  //         		   var content=data.content;
  //          		   var email=data.email;
 //           		   var nickName=data.nickName;
//            		   var createTime=data.createTime;
//            		   var username;
//            		   if(nickName==null)
  //          			   {
 //           			      username=email;
 //           			   }
//            		   else{
//            			   username=nickName;
//            		   }
                         var userId=data.byId;
                         var username=data.byName;             
                         var content=data.content;
                         var str="";
                       if(data.questionId!=null)
                    	   {
                    	   var	 li1="	<li class=\"list\">";
               			var div1="<div class=\"messageInfo\">";		
               			var p1="<p>";	
               			var a="<a class=\"userName\">"+username+":  </a>"+content+"<a class=\"activityName\"></a>";		
               			var p2="</p>";	
               			var div2="</div>";
               			var div3="<div class=\"handleButton\">";
              			var button1="<button class=\"agree\">回复</button>";
              			var button2="<button class=\"agree\">已读</button>";
               			var div4="</div>";
               			var li2="</li>";
               			str+=(li1+div1+p1+a+p2+div2+div3+button1+button2+div4+li2);
                    	   }
                       else{
                    	   var	 li1="	<li class=\"list\">";
                  			var div1="<div class=\"messageInfo\">";		
                  			var p1="<p>";	
                  			var a="<a class=\"userName\">"+username+":  </a>"+content+"<a class=\"activityName\"></a>";		
                  			var p2="</p>";	
                  			var div2="</div>";
                  			var div3="<div class=\"handleButton\">";
                  			var button1="<button class=\"agree\">回复</button>";
                  			var button2="<button class=\"agree\">已读</button>";
                  			var div4="</div>";
                  			var li2="</li>";
                  			str+=(li1+div1+p1+a+p2+div2+div3+button1+button2+div4+li2);
                       }
                      $("#messageList").append(str);
            		}
                },'json'
            );
        }

        ajaxPage();//需要主动调用一次此函数
        
        
    </script>
    
    
    
    
    
	</div>
	<div id="lianxiwomen">
		<div id="zhizuoren">School Club团队制作</div>
	</div>
</body>
</html>