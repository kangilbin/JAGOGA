<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/template/link.jsp"%>
<%
	// 인코딩 처리
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
        String contentPage=request.getParameter("contentPage");
        if(contentPage==null)
            contentPage="FirstView.jsp";
            
        이 부분을 EL과 JSTL로 변경하면 아래와 같다.    
    --%>

<html>
<head>
<title>메인 화면</title>

<style>
/*
레이아웃 전체 가운데 정렬 태그  - margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다. 전체를 감싸주는 태그 #wrap
#wrap {
	width: 950px;
	margin: 0 auto 0 auto;
}

#main {
	float: left;
	width: 950px;
	height: 500px;
	background-color: #FFFFFF;
	text-align: center;
	vertical-align: middle;
}
*/
.btn {
	width: 100px;
}

#myCarousel {
	height: 200px;
}
/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

.list-group-item {
	height: 40px;
}

.tabcontent {
	height: 200px;
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="main">
			<!-- contentPage가 없을 경우 FirstView.jsp를 보여준다. -->
			<c:set var="contentPage" value="${param.contentPage}" />
			<c:if test="${contentPage==null}">
				<jsp:include page="FirstView.jsp" />
			</c:if>
			<jsp:include page="${contentPage}" />
		</div>
	</div>
</body>
</html>