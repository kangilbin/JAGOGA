<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>결과 페이지</title>
<%@include file="/template/footerFix.jsp"%>
</head>
<body>
	<jsp:include page="../template/header.jsp" />

	<main class="container-fluid"> <!-- 
        String msg = (String)session.getAttribute("msg");
    
        if(msg != null)
        {
            if(msg.equals("0"))
                out.println("<font size='6'>회원정보가 수정되었습니다.</font>");
            else if(msg.equals("1"))
                out.println("<font size='6'>회원가입을 축하드립니다.</font>");
            
            session.removeAttribute("msg");
        }
        else
        {
            out.println("<font size='6'>회원정보가 삭제되었습니다.</font>");
        }
        //이 부분을 아래와 같이 EL과 JSTL을 이용해 변경하였다.
     -->
	<div align="center">
		<c:set var="msg" value="${sessionScope.msg}" scope="session" />
		<c:choose>
			<c:when test="${msg!=null && msg=='0'}">
				<h2>
					<b>회원정보가 수정되었습니다.</b>
				</h2>
				<c:remove var="msg" scope="session"></c:remove>
			</c:when>
			<c:when test="${msg!=null && msg=='1'}">
				<h2>
					<b>회원가입을 축하드립니다.</b>
				</h2>
				<c:remove var="msg" scope="session"></c:remove>
			</c:when>
			<c:otherwise>
				<h2>
					<b>회원정보가 삭제되었습니다.</b>
				</h2>
			</c:otherwise>
		</c:choose>
		<input type="button" value="메인으로"
			onclick="javascript:window.location='./'"
			class="btn btn-block btn-default" style="width: 10%; margin: auto;" />
	</div>
	<br>
	</main>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>