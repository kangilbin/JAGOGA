<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>회원 리스트 - 관리자 화면</title>
<%@include file="/template/footerFix.jsp"%>

<style type="text/css">
.table {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
}

td {
	border: 1px solid lightgray;
	vertical-align: middle;
	text-align: center;
}

#title {
	background-color: #f2f2f2;
}
</style>

</head>
<body>
	<jsp:include page="../template/header.jsp" />
	<main class="container-fluid">
	<div align="center">
		<h2>
			<b>전체 회원정보</b>
		</h2>
	</div>
	<div class="container">
		<div class="row" style="margin-bottom: 50px">
			<table class="table">
				<tr align="center">
					<td id=title>아이디</td>
					<td id=title>비밀번호</td>
					<td id=title>이름</td>
					<td id=title>성별</td>
					<td id=title>생년월일</td>
					<td id=title>이메일</td>
					<td id=title>전화</td>
					<td id=title>주소</td>
					<td id=title>가입일</td>
				</tr>

				<c:set var="memberList" value="${requestScope.memberList}" />
				<c:forEach var="member" items="${memberList}">
					<tr>
						<td>${member.member_id}</td>
						<td>${member.password}</td>
						<td>${member.member_name}</td>
						<td>${member.gender}</td>
						<td>${member.birthyy}</td>
						<td>${member.mail1}</td>
						<td>${member.phone}</td>
						<td>${member.address}</td>
						<td>${member.reg}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>
	</main>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>