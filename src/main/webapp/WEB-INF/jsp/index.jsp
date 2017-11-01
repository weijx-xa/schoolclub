<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>shouye</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shouye.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/head2.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sideBar.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/MenuSidebar.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            var curr = 0;
                    $("#num a.trigger").each(function(i){
                        $(this).click(function(){
                        curr = i;
                    $("#pol img").eq(i).fadeIn("fast").siblings("img").fadeOut("fast");
                });
                        var timer = setInterval(function(){  //设置定时器
                            var go = (curr + 1) % 5;
                            $("#num a.trigger").eq(go).click();
                        },2000);
                        $("#pol").hover(function(){ //hover在图片时，清除定时器
                            clearInterval(timer);
                        },function(){
                            timer = setInterval(function(){
                                var go = (curr + 1) % 5;
                                $("#num a.trigger").eq(go).click();
                            },2000);
                        });
            })
        });


    </script>
</head>
<body>
<%@include file="smallpage/head.jsp"%>
<div class="content">
    <div id="headline">
        <div class="title"><img src="images/source/headlines.jpg"/> </div>
        <div class="headline-pic">
          <div class="lunbo">
                  <div id="po" class="po">
                      <div id="pol">
                          <img src="${pageContext.request.contextPath}/images/lunboimages/lunbo1.jpg" />
                          <img src="${pageContext.request.contextPath}/images/lunboimages/lunbo2.jpg" />
                          <img src="${pageContext.request.contextPath}/images/lunboimages/lunbo3.jpg" />
                          <img src="${pageContext.request.contextPath}/images/lunboimages/lunbo4.jpg" />
                          <img src="${pageContext.request.contextPath}/images/lunboimages/lunbo5.jpg" />
                      </div>
                      <div id="lunbobg"></div>
                      <div id="num" class="num">
                          <a class="trigger imgSelected" href="javascript:void(0)">1</a>
                          <a class="trigger" href="javascript:void(0)">2</a>
                          <a class="trigger" href="javascript:void(0)">3</a>
                          <a class="trigger" href="javascript:void(0)">4</a>
                          <a class="trigger" href="javascript:void(0)">5</a>
                      </div>
                  </div>
          </div>
            <div class="headline-text">
                <ul>
                    <li>“2016年赴美、赴澳实习项目”校园经理火热招募</li>
                    <li>“18岁的我长这样”奇集女生节颜值大赏有奖活动</li>
                    <li>“2016年赴美、赴澳实习项目”校园经理火热招募</li>
                    <li>“18岁的我长这样”奇集女生节颜值大赏有奖活动</li>
                    <li>3.7奇集女生节私人订制心愿</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="club">
        <div class="title"><img src="${pageContext.request.contextPath}/images/source/club.jpg"/> </div>
        <ul class="club-show">
            <li>
                <a class="club pic1">
                    <div class="text">
                        <p class="smallTitle">xxxx社</p>
                        <p class="address">江西师范大学</p>
                    </div>
                </a>
                <div class="footer-text">
                    <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                    <span class="follow"> <a href="#">关注</a></span>
                </div>
            </li>
            <li class="club">
                <a class="club pic2">
                    <div class="text">
                        <p class="smallTitle">xxxx社</p>
                        <p class="address">江西师范大学</p>
                    </div>
                </a>
                <div class="footer-text">
                    <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                    <span class="follow"> <a href="#">关注</a></span>
                </div>
            </li>
            <li class="club">
                <a class="club pic3">
                    <div class="text">
                        <p class="smallTitle">xxxx社</p>
                        <p class="address">江西师范大学</p>
                    </div>
                </a>
                <div class="footer-text">
                    <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                    <span class="follow"> <a href="#">关注</a></span>
                </div>
            </li>
            <li class="club">
                <a class="club pic4">
                    <div class="text">
                        <p class="smallTitle">xxxx社</p>
                        <p class="address">江西师范大学</p>
                    </div>
                </a>
                <div class="footer-text">
                    <h3 class="clubtitle"><a href="#">xxxxxx社</a></h3>
                    <span class="follow"> <a href="#">关注</a></span>
                </div>
            </li>
        </ul>
        <div class="Club-button">
            <a href="Club.html">查看更多社团</a>
        </div>
    </div>
    <div id="activity">
        <div class="title"><img src="${pageContext.request.contextPath}/images/source/Activity.jpg"/> </div>
        <div class="activity1">
            <ul>
                <li class="activity">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity.jpg"/></a>
                    <h3>大家一起来打羽毛球</h3>
                    <p>社团：羽毛协会</p>
                    <p>活动时间：2016年6月12日下午14:00</p></li>
                <li class="activity">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity2.jpg" /></a>
                    <h3>大家一起来打羽毛球</h3>
                    <p>社团：羽毛协会</p>
                    <p>活动时间：2016年6月12日下午14:00</p></li>
                <li class="activity">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/activity/activity3.jpg" /></a>
                    <h3>大家一起来打羽毛球</h3>
                    <p>社团：羽毛协会</p>
                    <p>活动时间：2016年6月12日下午14:00</p></li>
            </ul>
        </div>
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
</div>
<div id="lianxiwomen">
        <div id="zhizuoren">
            School Club团队制作
        </div>
</div>
</body>
</html>