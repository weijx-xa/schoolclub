<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personal.css" />
    <script>
        <!--菜单样式-->
        $(document).ready(function(){
            //隐藏子集
            $("#sidebar dd").hide();
            //点击父层
            $("#sidebar dt").click(function(){
                //查找子集
                //移除类
                $(this).parent().find('dd').removeClass("menu_chioce");
                //隐藏子集
                $(".menu_chioce").slideUp();
                //通过滑动效果，在隐藏与显示之间切换
                $(this).parent().find('dd').slideToggle();
                //添加类
                $(this).parent().find('dd').addClass("menu_chioce");
            });
        });

        $(document).ready(function(){
            $("#info ul li button").each(function(){
                $(this).click(function(){
                    var idd = $(this).attr("id").replace('click', '');
                    var text=$("#inner"+idd)
                    var val=text.html();
                    text.html("<input type='text' id='n' value="+val+">");
                    $("#n").blur(function(){
                        var value=$("#n").val();
                        text.html(value);
                    })
                })
            })
        })

    </script>
    <style>
        #info{
            width:890px;
            height:850px;
            background-color: #ffffff;
//            border:1px solid red;
            position: absolute;
            margin-top: -870px;
            margin-left:305px;
            font-family: "微软雅黑";
        }
        #info .title{
            height:40px;
            text-align: center;
            font-size: 20px;
        }
        #info ul{
            width:850px;
            height:730px;
            margin: auto;
 //          border:1px solid black;
            overflow: hidden;
        }
        #info ul .club{
            width:150px;
            height:170px;
            list-style:none;
            display:inline-block;
            float:left;
            margin:15px 30px 30px 30px;
    //        border:1px solid red;

        }
        #info ul .club a{
            padding-right:35px;
        }
        #info ul .club .pic{
            width:130px;
            height:130px;
            margin: auto;
            z-index: auto;
            overflow: visible;
        }
        #info ul .club .pic img {
            position: relative;
            display: block;
            opacity: 1;
        }
        #info ul .club .pic figcaption {
            width:inherit;
            height:inherit;
            border-radius:50%;
  //          border:1px solid #000;
            z-index:1;
            position:relative;
            margin-top:-152px;
            background: #000;
            color: #fff;
            font-weight: 800;
            opacity: 0;
            -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
            transition: opacity 0.35s, transform 0.35s;
        }
        #info ul .club .pic:hover figcaption {
            opacity: 0.6;
        }
        #info ul .club .pic .text{
            font-family: "微软雅黑";
            font-size: 12px;
            height:auto;
            overflow:auto;
            text-align: center;
            position: absolute;
            margin-top: 30px;
            margin-left: 30px;
        }
        #info ul .club h3{
            margin-bottom:0px;
            margin-top: 20px;
            text-align:center;
            color:#333;
            font-size:18px;
            font-family:"微软雅黑";
        }
        #info ul .club .title:hover{
            cursor: pointer;
            color:#8080C0;
        }
        #info ul .club span {
        / / border : 1 px solid red;
            display: block;
            width: 100px;
            height: 30px;
            line-height: 30px;
            text-align: right;
            position: relative;
            margin-top: -13px;
            margin-left: 10px;
            font-size: 18px;
            font-family: "微软雅黑";
            color: #666;
            background-image: url(${pageContext.request.contextPath}/images/source/followbefore.png);
            background-repeat: no-repeat;
            background-position: 35px;
        }
        #info button{
            width:100px;
            height:30px;
            text-align: center;
            line-height: 30px;
            font-size: 16px;
            font-family: "微软雅黑";
            float: right;
            background-color:rgb(246,194,28);
        }
    </style>
    <link type="text/css" href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" />
</head>
<body>
<%@include file="smallpage/head1.jsp"%>
<div id="header2">
    <div id="logo">
        SchoolClub
    </div>
    <div id="navilist">
        <ul>
            <li><a href="personal.info.html">个人资料</a> </li>
            <li>个人中心</li>
            <li><a href="#">消息通知</a></li>
        </ul>
    </div>
</div>
<div id="content">
<%@include file="smallpage/sidebar.jsp"%>
    <div id="info">
            <h3 class="title">我加入的社团</h3>
            <ul>
            <c:forEach items="${clubList }" var="club">
                 <li class="club">
                    <figure class="pic">
                            <a href="${pageContext.request.contextPath}/club/detail?clubId=${club.id}"><img src="${club.logoImage }" style="width:100%;height: 100%;"/></a>
                         <a href="${pageContext.request.contextPath}/club/detail?clubId=${club.id}">
                        <figcaption>
                            <div class="text">
                                <p class="title">${club.name }</p>
                                <p class="address">江西师范大学</p>
                                <p class="number">现有人数：${club.count}</p>
                            </div>
                        </figcaption>
                        </a>
                    </figure>
                    <a href="${pageContext.request.contextPath}/club/detail?clubId=${club.id}"> <h3 class="title">${club.name }</h3></a>
                    <!--   <span class="follow"></span> -->
                </li>
            </c:forEach>
                
     
            </ul>
        <button id="nextpage">下一页</button>
    </div>
</div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>