<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Club.html</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/Club.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/head2.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/sideBar.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/MenuSidebar.js" language="javascript" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/laypage/laypage.js" language="javascript" type="text/javascript"></script>
</head>

<body>

<%@include file="smallpage/head.jsp"%>
<div id="club">
    <ul class="club-show">
        <li class="clubM">
            <a class="club pic0">
                <div class="text">
                    <p class="smallTitle">xxxx社1</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="${pageContext.request.contextPath}/club/detail">xxxxxx社</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic1">
                <div class="text">
                    <p class="smallTitle">xxxx社2</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic2">
                <div class="text">
                    <p class="smallTitle">xxxx社3</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic3">
                <div class="text">
                    <p class="smallTitle">xxxx社4</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社5</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic4">
                <div class="text">
                    <p class="smallTitle">xxxx社4</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社5</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic5">
                <div class="text">
                    <p class="smallTitle">xxxx社6</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                
            </div>
        </li>
          
          <li class="clubM">
            <a class="club pic6">
                <div class="text">
                    <p class="smallTitle">xxxx社7</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                
            </div>
        </li>
        <li class="clubM">
            <a class="club pic7">
                <div class="text">
                    <p class="smallTitle">xxxx社8</p>
                    <p class="address">江西师范大学</p>
                </div>
            </a>
            <div class="footer-text">
                <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                
            </div>
        </li>
        
        
    </ul>
</div>
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




<!-- 分页 -->

    <div id="pagination" >
    <input type="hidden" name="pageNum" id="pageNum" />
    </div>
    
       <script type="text/javascript">

        function ajaxPage(data){
        	var pageNum=$("#pageNum").val();
        	if(pageNum==undefined)
        		{
        		pageNum=data;
        		}
            $.post('<%=path%>/club/getData',{
            	pageNum:pageNum
            },function (result) {
                 var $club=$(".clubM");
                 
                    var i=0;
                 $club.each(function(){
                	
                	 
                	  var pic=$(this).find('.pic'+i);
                	  var currData=result.value.list[i];
                	  try
                	  {
                		  $(this).show();
                		  currData.id
                	  }
                	  catch(e){
                		  $(this).hide();
         		         return ;
                	  }
                	  pic.css("background-image","url('"+currData.logoImage+"')");
                	  
                	
                    	var smallTitle=$(this).find(".smallTitle");
                    	smallTitle.attr("href","<%=path%>/club/detail?clubId="+currData.id);
                    	smallTitle.html(currData.name);
                    //	var address=$(this).find(".address").html(); 暂时不做学校的，固定江西师范大学
                    	var clubtitle=$(this).find(".clubtitle").find("a");
                    	clubtitle.attr("href","<%=path%>/club/detail?clubId="+currData.id);
                    	clubtitle.html(currData.name);
                    	var follow=$(this).find(".follow");
                    	follow.attr("href","<%=path%>/club/detail?clubId="+currData.id);
                    	i++;
                    });
            //	alert('数据返回成功');
                    //创建分页栏
                    laypage({
                        cont:"pagination",
                        pages:result.value.pages,
                        curr:result.value.pageNum,
                        jump:function(options,first){
                            if(!first){
                                $("#pageNum").val(options.curr);
                                ajaxPage(options.curr);//点击分页栏中按钮时执行此函数
                            }
                        }
                    });
                },'json'
            );
        }

        ajaxPage();//需要主动调用一次此函数
    </script>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>
