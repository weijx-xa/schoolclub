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
    <link type="text/css" href="${pageContext.request.contextPath}/css/setupclub.css" rel="stylesheet" />
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
        #info ul #clubslogan input{
            width:430px;
            height:25px;
        }
        #info ul #clubslogan p{
            font-size: 12px;
            color:rgb(105,57,111);
            margin-left: 280px;
            margin-top: 10px;
        }
        #info ul #clubintro input{
            width:430px;
            padding-bottom: 100px;
        }
        #info ul #clubpic{
            height:135px;
            position: relative;
        }
        #info ul #clubpic .uploadpic{
            position: absolute;
            width:97px;
            height: 135px;
            background-color:#f9f9f9;
            border:1px dashed #dbdbdb;
            background-image: url("${pageContext.request.contextPath}/images/source/yellow+.png");
            background-repeat: no-repeat;
            background-position: center;
        }
        #info ul #clubpic p{
            font-size: 12px;
            color:rgb(105,57,111);
            margin-left: 360px;
            margin-top: 40px;
        }
        #prevstep{
            position: absolute;
            margin-top: -200px;
            margin-left: 100px;
        }
        #nextstep{
            position: absolute;
            margin-top: -200px;
            margin-left: 1250px;
        }
    </style>

</head>
<body>
<div id="header1">
    <div>
        <a style="color: #eeeeee" href="#">返回首页</a>
        <a style="color: #eeeeee" href="./login/login.html">登陆</a>
        <span style="color: #eeeeee">/</span>
        <a style="color: #eeeeee" href="register.html">注册</a>
    </div>
</div>
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
    <div id="info">
        <h3 class="title">主页资料</h3>
        <ul>
            <li id="clubslogan">
                <span class="lititle">社团口号</span>
                <span><input type="text" name="clubslogan"></span>
                <p>*一句话介绍你的社团</p>
            </li>
            <li id="clubintro">
                <span class="lititle">社团介绍</span>
                <span><input type="text" name="clubintro"></span>
            </li>
            <li id="clubpic">
                <span class="lititle">社团风采</span>
                <span class="uploadpic"></span>
                <p>*为了更好的展示效果建议上传540*400比例的jpg或png格式图片</p>
            </li>
        </ul>
    </div>
    <div id="prevstep">
        <a href="personal.setupclub.html#"><img src="${pageContext.request.contextPath}/images/source/prev-step.png"/></a>
    </div>
    <div id="nextstep">
        <a href="#"><img src="${pageContext.request.contextPath}/images/source/nextstep-submit.png"/></a>
    </div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>