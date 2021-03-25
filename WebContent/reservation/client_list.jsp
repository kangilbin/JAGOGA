<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String id = (String) session.getAttribute("sessionID");
%>

<%
	request.setCharacterEncoding("utf-8");
	List boardList = (List) request.getAttribute("boardlist");
	pageContext.setAttribute("boardList", boardList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<style>
.container {
	padding-top: 70px;
}

.pull-right {
	width: 150px;
	border-color: white;
}

.pull-right:hover, .pull-right:focus {
	background-color: gray;
	border-color: white;
	color: white;
}

@media ( min-width : 1200px) {
	.container {
		width: 850px;
	}
}

.list-group {
	float: left;
	width: 200px;
	margin-top: 60px;
	margin-right: 50px;
}

.groove {
	border: 2px solid #2E2E2E;
	border-bottom-style: none;
	font-size: 40px;
	padding: 20px;
	border-top-right-radius: 10px;
	font-family: 'Nanum Pen Script', cursive;
	color: black;
}

.ridge {
	border: 2px solid #2E2E2E;
	border-bottom-style: none;
	border-right-style: none;
	font-size: 40px;
	padding: 20px;
	border-top-left-radius: 10px;
	font-family: 'Nanum Pen Script', cursive;
	color: black;
}

.head {
	margin-bottom: 30px;
}

.pull-right {
	font-family: 'Jua', sans-serif;
	font-size: 18px;
}

.dropdown {
	float: right;
}

#dropdownMenu1 {
	background: #F2F2F2;
	border-color: #F2F2F2;
}

#dropdownMenu1:hover {
	background: #999;
}

a:hover {
	text-decoration: none;
}

.well {
	margin-top: 50px;
}

#select {
	background: #F2F2F2;
}

.center {
	border: 2px solid #2E2E2E;
	border-bottom-style: none;
	border-right-style: none;
	font-size: 40px;
	padding: 20px;
	font-family: 'Nanum Pen Script', cursive;
	color: black;
}
</style>
<script>
	function review(type) {
		location.href = "./UserReviewWriteBefore.re?rooms_nm=" + type;
	}
</script>
</head>
<body>

	<jsp:include page="/template/header.jsp" />

	<main class="container-fluid">
	<section id="reservation-category">
		<div class="container" style="background-color: #f9f9f9;">

			<div class="head">
				<h1>
					<a href="MemberInfoAction.do" class="ridge">내 정보</a><a href="./ClientList.bo"
						class="center" id="select">예약 내역</a><a href="./UserModifyList.re"
						class="groove">리뷰 내역 수정</a>
				</h1>
			</div>
			<div class="content">
				<c:forEach var="i" items="${boardList }">
					<div class="well">
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								<span class="glyphicon glyphicon-option-horizontal"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#"
									onclick="window.open('./ClientModify.bo?ord=${i.res_ord}','name','resizable=no width=600 height=600 left=600 top=200');return false">예약
										수정</a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="ClientDeleteAction.bo?ord=${i.res_ord}"
									onclick="return confirm('정말 예약 취소 하시겠습니까? ?');">예약 취소</a></li>
							</ul>
						</div>



						<p>
							객실 정보 : <strong><c:out value="${i.rooms_type}" /></strong>
						</p>
						<p>
							방문 일자 : <strong><c:out value="${i.startday}" /> ~ <c:out
									value="${i.endday}" /></strong>
						</p>
						<p>
							금 액 : <strong><fmt:formatNumber type="number"
									maxFractionDigits="3" value="${i.rooms_pay}" /> 원 </strong>
						</p>
						<div class="form-row float-right">
							<input type="button" value="리뷰 남기기" class="btn pull-right"
								onclick="review('${i.rooms_type}')">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>