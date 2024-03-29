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
            height:880px;
            background-color: #ffffff;
  //         border:1px solid red;
            position: absolute;
            margin-top: -890px;
            margin-left:305px;
            font-family: "微软雅黑";
        }
        #info .title{
            height:40px;
            width: 890px;
            text-align: center;
            font-size: 20px;
        }
        #info ul{
    //        border: 1px solid #000000;
            width: 850px;
            height:700px;
            margin:auto;
        }
        #info .activity{
            position:relative;
            list-style:none;
            width:240px;
            height:370px;
            float:left;
            display:inline-block;
            margin:10px 17px 10px 20px;
            -webkit-transition: all 0.5s ease; /* 过渡 */
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
        }
        #info .activity:hover{
            -webkit-box-shadow:0 0 3px #888888; /* 过渡 */
            -moz-box-shadow:0 0 3px #888888;
            -ms-box-shadow:0 0 3px #888888;
            -o-box-shadow:0 0 3px #888888;
            box-shadow:0 0 3px #888888;
            background-color:rgba(239,243,245,0.5)
        }

        #info .activity img{
            position:relative;
            margin-left:18px;
            margin-top:15px;
            -webkit-transition: all 0.5s ease; /* 过渡 */
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;

        }
        #info .activity h3{
            display:inline-block;
            margin-left:20px;
            margin-bottom:5px;
            font-size: 14px;
        }
        #info .activity p{
            display:inline-block;
            margin-left:20px;
            margin-top:0;
            margin-bottom:3px;
            font-size: 14px;
        }

        #info .activity:hover img{
            -webkit-transform:scale(1.05); /* Safari Chrome*/
            -moz-transform:scale(1.05); /* Firefox */
            -ms-transform: scale(1.05); /* IE */
            -o-transform: scale(1.05); /* Opera */
            transform:scale(1.05); /* 标准语法 */
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
            margin-top: 20px;
        }
    </style>
    <link type="text/css" href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" />
</head>
<body>
<div id="header1">
    <div>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/">返回首页</a>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/user/login">登陆</a>
    </div>
</div>
<div id="header2">
    <div id="logo">
        SchoolClub
    </div>
    <div id="navilist">
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/info">个人资料</a> </li>
            <li>个人中心</li>
            <li><a href="${pageContext.request.contextPath}/user/ac">消息通知</a></li>
        </ul>
    </div>
</div>
<div id="content">
    <%@include file="smallpage/sidebar.jsp"%>
    <div id="info">
        <h3 class="title">我报名的活动</h3>
        <ul>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
            <li class="activity">
                <a href="#"><img src="${pageContext.request.contextPath}/imagesactivity/activity.jpg" style="width:200px;height: 260px;"/></a>
                <h3>大家一起来打羽毛球</h3>
                <p>社团：羽毛协会</p>
                <p>活动时间：2016年6月12日下午14:00</p></li>
            </li>
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