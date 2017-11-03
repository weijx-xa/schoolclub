<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="audio"></div>
<div id="header1">
    <div>
        <a style="color: #eeeeee" href="${pageContext.request.contextPath}/">首页</a>
        		<c:if test="${ not empty sessionScope.user}">
				 <a
			id="login" style="color: #eeeeee"
			href="${pageContext.request.contextPath}/user/info">${sessionScope.user.email }</a>
					/
			<a id="logout" style="color: #eeeeee"
				href="${pageContext.request.contextPath}/user/logout">退出</a>
		</c:if>
		<c:if test="${empty sessionScope.user}">
				 <a
			id="login" style="color: #eeeeee"
			href="${pageContext.request.contextPath}/user/login">登录</a>
		</c:if>
    </div>
</div>