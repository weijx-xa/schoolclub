<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


   function showReply(obj){

	   

		  $(obj).parent().next().css("display","block");
	

	  
   }


 	//单次单选弹框
	$(function () {
		

		
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
	}) 
	$(function(){
//	    $(".replyButton").click(function(){
//	        var focus = $(this).parents("ul li").find(".replyArea");
//	        if(focus.css("display")=="none")
//	        {
//	            focus.show();
//	            this.innerHTML = "收起";
//	        }else
//	        {
//	            focus.hide();
//	            this.innerHTML = "回复";
//	        }
//	    });
	});
</script>
</head>
<body>
<%@include file="smallpage/head1.jsp"%>
	<div id="header2">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/images/source/logo.png"
				style="width: 180px; height: 80px">
		</div>
		<ul id="navilist">
			<li><a href="${pageContext.request.contextPath}/user/message">@我</a></li>
			<li>
			<p>
				<a href="${pageContext.request.contextPath}/user/clubMessage">社团消息</a>
			</p>
			</li>
			<li>
			<p>
				<a href="">活动消息</a>
			</p>
			</li>
		</ul>
	<div id="content">
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
              			var button1="<button class=\"replyButton\" onclick='showReply(this)'>回复</button>";
              			var button2="<button class=\"readButton\" onclick='$(this).parent().parent().remove()' >已读</button>";
               			var div4="</div>";
               			var div5="<div class=\"replyArea\">";
               			var form1="<form  id=\"askClubFormClub\"  onsubmit=\"event.preventDefault();\" action=\"<%=path%>/club/askUserSubmit\">";
               			var textarea1="<textarea class=\"replyTextarea\"   name='content'>";
               			var textarea2="</textarea>";
               		 var input="<input type='hidden' name='questionId' value="+data.questionId+">"
               			var input1="<input type=\"submit\" class=\"replysubmit\"   onclick='askUserSubmit(this)' value=\"提交评论\" />";
               			var form2="</form>";
               			var div6="</div>";
               			var li2="</li>";
               			str+=(li1+div1+p1+a+p2+div2+div3+button1+button2+div4+div5+form1+input+textarea1+textarea2+input1+form2+div6+li2);
                    	   }
                       else{
                    	   var	 li1="	<li class=\"list\">";
                  			var div1="<div class=\"messageInfo\">";		
                  			var p1="<p>";	
                  			var a="<a class=\"userName\">"+username+":  </a>"+content+"<a class=\"activityName\"></a>";		
                  			var p2="</p>";	
                  			var div2="</div>";
                  			var div3="<div class=\"handleButton\">";
                  			var button1="<button class=\"replyButton\" onclick='showReply(this)' >回复</button>";
                  			var button2="<button class=\"readButton\"  onclick='$(this).parent().parent().remove()' >已读</button>";
                  			var div4="</div>";
                  			var div5="<div class=\"replyArea\">";
                  			var form1="<form id=\"askUserSubmit\"  onsubmit=\"event.preventDefault();\" action=\"<%=path%>/club/askUserSubmit\">";
                  			   var input="<input type='hidden' name='answerId' value="+data.answerId+">"
                  				var textarea1="<textarea class=\"replyTextarea\"   name='content'>";
                   			var textarea2="</textarea>";
                   			var input1="<input type=\"submit\" class=\"replysubmit\"  onclick='askUserSubmit(this)'value=\"提交评论\" />";
                   			var form2="</form>";
                   			var div6="</div>";
                  			var li2="</li>";
                  			str+=(li1+div1+p1+a+p2+div2+div3+button1+button2+div4+div5+form1+input+textarea1+textarea2+input1+form2+div6+li2);
                       }
                      $("#messageList").append(str);

            		}
                },'json'
            );
        }

        ajaxPage();//需要主动调用一次此函数
        
      
       
   
     
        
    </script>
    <div id=delMessage>
    <a  href="${pageContext.request.contextPath}/user/delMessage">清空所有消息</a>
    </div>
    
    
    
    
	</div>
	<div id="lianxiwomen">
		<div id="zhizuoren">School Club团队制作</div>
	</div>
</body>
</html>