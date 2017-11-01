<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>singlenews</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/singlenews.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/head1.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/lianxiwomen.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript">
        <!-- 菜单 -->
        $(document).ready(function (){
            $('.list >li').hover(function(){
                $(this).children('.hide').toggle();
                $(this).children('.hengtiao').toggle();
            });
        });
        </script>
</head>
<body>
<%@include file="smallpage/head.jsp"%>
<div id="singlenews">
    <img src="${pageContext.request.contextPath}/images/info/recruit.jpg"/>
    <p class="title">校园招聘会</p>
    <div class="hold">
        <p class="holder"><span>主办方</span>     <span>南昌银行</span></p>
        <p class="holderinfo"><span>主办方介绍</span>     <span>南昌银行 英文：Bank of Nanchang（已更名为：江西银行 JIANGXI BANK) 南昌银行是在原南昌市40家城市信用社基础上，由南昌市地方财政发起设立，1997年12月经中国人民银行批准成立，2008年8月6日经中国银行业监督管理委员会批准，更名为南昌银行股份有限公司，注册资本23.82亿元，南昌市财政局为第一大股东</span> </p>
    </div>
    <div class="news">
        <p class="title">活动详情</p>
        <p class="introduction">我也不知道要打什么反正是看样式就随便乱打一点吧3.7女生节，春风拂面，万物更新，奇集在阳光明媚的时节里送来春天的礼物啦！女生专属福利大放送，海量大礼即将倾巢而出。在这里只想问一句，女生同胞们，准备好了吗？！
            为了广大女性盆友的福利，奇集推出了私人订制心愿卡。
            主题：女生节，私人订制心愿卡
            说明：天上没有流星，但你可以来奇集，写下你的小心愿，将私人订制心愿分享男/女票、朋友、家人等，让他们帮你实现，小确幸就是这么不期而遇。
            活动对象：所有关注奇集微信公众号用户
            活动时间：3月7日开始</p>
    </div>
</div>
<div id="lianxiwomen">
    <div id="zhizuoren">
        School Club团队制作
    </div>
</div>
</body>
</html>