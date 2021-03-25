<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>첫화면</title>
</head>
<body>
	<!-- 로그인 안되었을 경우 -->
	<c:if test="${sessionScope.sessionID==null}">
		<jsp:include page="index.jsp" />
	</c:if>
	<!-- 로그인 -->
	<c:if test="${sessionScope.sessionID!=null}">
		<div style="position: absolute; left: 0%; right: 0%; text-align: right;">${sessionScope.sessionID}님 환영합니다.</div>
		<jsp:include page="index.jsp" />
	</c:if>
</body>
</html>