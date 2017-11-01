<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/images/lianxiwomen.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/images/personal.css" />
    <script src="../js/jquery-1.8.3.js"></script>
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
            height:800px;
            background-color: #ffffff;
        //    border:1px solid red;
            position: absolute;
            top:180px;
            left:550px;
            font-family: "微软雅黑";
        }
        #info .title{
            height:40px;
            width: 700px;
            text-align: center;
            font-size: 20px;
        }
        #info ul li{
            list-style:none;
            width:700px;
            border-bottom: 1px solid #CCCCCC;
            padding-top: 18px;
            padding-bottom: 18px;
            padding-left: 30px;
        }
        #info ul li span{
            display: inline-block;
        }
        #info .lititle{
            width:100px;
            text-align: center;
            letter-spacing: 3px;
            margin-right: 150px;

        }
        #info ul li span:nth-child(2){
            color:#626262;
            width:160px;
            margin-right: 190px;
        }
        #info ul li span:nth-child(3){
            width:60px;
            text-align: center;
        }
        #info ul li button{
            width:70px;
            height:35px;
            line-height: 35px;
            background-color: rgb(105,57,111);
            font-family: "微软雅黑";
            font-size: 14px;
            color:#ffffff;
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
            <li><a href="${pageContext.request.contextPath}/user/info">个人资料</a> </li>
            <li>个人中心</li>
            <li><a href="${pageContext.request.contextPath}/user/message">消息通知</a></li>
        </ul>
    </div>
</div>
<div id="content">
<%@include file="smallpage/sidebar.jsp"%>
    <div id="info">
        <h3 class="title">个人资料</h3>
        <ul>
            <li class="head">
                <span class="lititle" >个人头像</span>
                <span><img src="${pageContext.request.contextPath}/imagessource/unloadhead.png"/></span>
                <span><button id="upload">点击上传</button></span>
            </li>
            <li class="name">
                <span class="lititle">用户名</span>
                <span id="inner1">balabala</span>
                <span><button id="click1">修改</button></span>
            </li>
            <li class="password">
                <span class="lititle">登录密码</span>
                <span id="inner2">balabala</span>
                <span><button id="click2">修改</button></span>
            </li>
            <li class="realname">
                <span class="lititle">姓名</span>
                <span id="inner3">balabala</span>
                <span><button id="click3">修改</button></span>
            </li>
            <li class="sex">
                <span class="lititle">性别</span>
                <span>
                     <form  style="color:#626262">
                         <input name="sex" type="radio" value=""/>男
                         <input name="sex" type="radio" value=""/>女
                     </form>
                </span>
            </li>
            <li class="tel">
                <span class="lititle">手机</span>
                <span id="inner4">15179190283</span>
                <span><button id="click4">修改</button></span>
            </li>
            <li class="mail">
                <span class="lititle">邮箱</span>
                <span id="inner5">630980865@qq.com</span>
                <span><button id="click5">修改</button></span>
            </li>
            <li class="school">
                <span class="lititle">学校</span>
                <span id="inner6">江西师范大学</span>
                <span><button id="click6">修改</button></span>
            </li>
            <li class="academy">
                <span class="lititle">学院</span>
                <span id="inner7">软件学院</span>
                <span> <button id="click7">修改</button></span>
            </li>
            <li class="major">
                <span class="lititle">专业</span>
                <span id="inner8">软件技术</span>
                <span><button id="click8">修改</button></span>
            </li>
        </ul>
    </div>

</div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>