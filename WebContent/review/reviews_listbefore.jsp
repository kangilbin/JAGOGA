<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("sessionID", "sung12jae");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./UserReviewList.re" method="get">
<input type="text" name="rooms_nm" value ="삼성 JS 부띠끄호텔">
<input type="submit" value="확인">
</form>
</body>
</html>