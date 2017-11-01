<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script src="js/jquery-1.8.3.js"></script>
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
        #info ul #clubname span:nth-child(3){
            font-size: 12px;
            margin-left: 50px;
            color:rgb(105,57,111);
        }
        #info ul #clubhead p{
            font-size: 12px;
            color:rgb(105,57,111);
            margin-left: 200px;
            margin-top: 20px;
        }
        #info ul #clubhead button{
            margin-left: 80px;
            width:70px;
            height:35px;
            line-height: 35px;
            background-color: rgb(105,57,111);
            font-family: "微软雅黑";
            font-size: 14px;
            color:#ffffff;
        }
        #info ul li input[type="text"]{
            font-family: "微软雅黑";
            height:25px;
            line-height: 25px;
        }
        #info ul li input[type="radio"]{
            margin-right: 5px;
        }
        #info ul li select {
            width: 120px;
            height: 25px;
            font-family: "微软雅黑";
        }
        #nextstep{
            position: absolute;
            margin-top: -200px;
            margin-left: 1250px;
        }
    </style>

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
        <h3 class="title">基本资料</h3>
        <ul>
            <li id="clubname">
                <span class="lititle">社团名称</span>
                <span><input type="text" name="clubname" placeholder="请输入社团名称"></span>
                <span>*社团名称不要加学校</span>
            </li>
            <li id="clubpro">
                <span class="lititle">社团属性</span>
                <span><input name="sex" type="radio" value=""/>校级社团
                <input name="sex" type="radio" value=""/>院级社团</span>
            </li>
            <li id="schoolname">
                <span class="lititle">社团名称</span>
                <span><input type="text" name="schoolname" placeholder="请输入学校名称"></span>
            </li>
            <li id="clubtype">
                <span class="lititle">社团分类</span>
                <form action="" style="display: inline-block;">
                    <select name="clubtype">
                        <option value="academic">专业学术</option>
                        <option value="entertainment">文化娱乐</option>
                        <option value="sports">体育竞技</option>
                        <option value="welfare">社会公益</option>
                        <option value="experience">职业实践</option>
                        <option value="others">其他</option>
                    </select>

                </form>
            </li>
            <li id="clubhead">
                <span class="lititle">社团头像</span>
                <span><img src="${pageContext.request.contextPath}/images/source/unloadhead.png"/></span>
                <span><button id="upload">点击上传</button></span>
                <p>*为了更好的展示效果建议上传120*120比例的jpg或png格式图片</p>
            </li>
        </ul>
    </div>
  <div id="nextstep">
    <a href="${pageContext.request.contextPath}/club/create2"><img src="${pageContext.request.contextPath}/images/source/next-step.png"/></a>
  </div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>