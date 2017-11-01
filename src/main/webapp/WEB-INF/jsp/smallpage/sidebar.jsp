<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="sidebar">
        <div id="side">
            <div class="myclub">
                <dt><a href="#">我的社团</a></dt>
                    <dd><a href="${pageContext.request.contextPath}/user/joinclub">我加入的社团</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/user/followclub">我关注的社团</a></dd>
            </div>
            <div class="myactivity">
                <dt><a href="${pageContext.request.contextPath}/user/joinAc">我的活动</a></dt>
                    <dd><a href="${pageContext.request.contextPath}/user/joinAc">我报名的活动</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/user/followAc">我关注的活动</a></dd>
            </div>
            <div class="setupClub">
                <a href="personal.setupclub.html">创建社团</a>
            </div>
        </div>
    </div>