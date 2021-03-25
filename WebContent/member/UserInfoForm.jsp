<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>현재 유저정보 출력화면</title>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<style type="text/css">
.table {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
}

#title {
	border: 1px solid lightgray;
	vertical-align: middle;
	text-align: center;
}

#title {
	background-color: #f2f2f2;
}
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
	background: #F2F2F2;
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

.ridge {
	background: #F2F2F2;
}
.center {border:2px solid #2E2E2E;
		border-bottom-style: none;
		 border-right-style: none;
		 font-size: 40px;
		  padding:20px;
		 font-family: 'Nanum Pen Script', cursive;
		 color:black;
		 
		}
</style>

<script type="text/javascript">
	function changeForm(val) {
		if (val == "-1") {
			location.href = "./";
		} else if (val == "0") {
			location.href = "MemberModifyFormAction.do";
		} else if (val == "1") {
			location.href = "DeleteForm.do";
		}
	}
</script>

</head>
<body>
	<jsp:include page="/template/header.jsp" />
		<section id="reservation-category">
		<div class="container" style="background-color: #f9f9f9;">
	
	<div class="head">
				<h1 style="text-align: center;">
					<a href="MemberInfoAction.do" class="ridge">내 정보</a><a href="./ClientList.bo"
						class="center" id="select">예약 내역</a><a href="./UserModifyList.re"
						class="groove">리뷰 내역 수정</a>
				</h1>
			</div>
	<!-- 회원정보를 가져와 member 변수에 담는다. -->
	<c:set var="member" value="${requestScope.memberInfo}" />
	<div class="container">
		<div class="row" style="margin-bottom: 50px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<!-- 가져온 회원정보를 출력한다. -->
				<table class="table">
					<tr>
						<td class="col-xs-6 col-sm-6 col-md-6" id="title">아이디</td>
						<td>${member.member_id}</td>
					</tr>

					<tr>
						<td id="title">비밀번호</td>
						<td>${member.password}</td>
					</tr>

					<tr>
						<td id="title">이름</td>
						<td>${member.member_name}</td>
					</tr>

					<tr>
						<td id="title">성별</td>
						<td>${member.gender}</td>
					</tr>

					<tr>
						<td id="title">생일</td>
						<td>${member.birthyy}년${member.birthmm}월${member.birthdd}일</td>
					</tr>

					<tr>
						<td id="title">이메일</td>
						<td>${member.mail1}@${member.mail2}</td>
					</tr>

					<tr>
						<td id="title">휴대전화</td>
						<td>${member.phone}</td>
					</tr>
					<tr>
						<td id="title">주소</td>
						<td>${member.address}</td>
					</tr>
				</table>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4">
						<input type="button" value="회원정보 변경" onclick="changeForm(0)"
							class="btn btn-block btn-success">
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<input type="button" value="회원탈퇴" onclick="changeForm(1)"
							class="btn btn-block btn-danger">
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<input type="button" value="뒤로" onclick="changeForm(-1)"
							class="btn btn-block btn-default">
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	<br>
	</div>
	</section>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>