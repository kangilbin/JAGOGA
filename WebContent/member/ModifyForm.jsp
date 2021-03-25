<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>

<title>회원정보 수정화면</title>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<style type="text/css">
#by {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
}

#title{
	border: 1px solid lightgray;
	vertical-align: middle;
	text-align: center;
}

#title {
	background-color: #f2f2f2;
}
</style>

<script type="text/javascript">
	function init() {
		setComboValue("${member.mail2}");
	}

	function setComboValue(val) {
		var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
		for (i = 0, j = selectMail.length; i < j; i++) // select 하단 option 수만큼 반복문 돌린다.
		{
			if (selectMail.options[i].value == val) // 입력된값과 option의 value가 같은지 비교
			{
				selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
				break;
			}
		}
	}

	// 비밀번호 입력여부 체크
	function checkValue() {
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>

</head>
<body onload="init()">
	<jsp:include page="/template/header.jsp" />
	<jsp:include page="/member/DaumAPI.jsp" />
	<div align="center">
		<h2>
			<b>회원정보 수정</b>
		</h2>
	</div>

	<!-- 회원정보를 가져와 member 변수에 담는다. -->
	<c:set var="member" value="${requestScope.memberInfo}" />

	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
	<!-- 값(파라미터) 전송은 POST 방식 -->
	<form method="post" action="MemberModifyAction.do" name="userInfo"
		onsubmit="return checkValue()">
		<div class="container">
			<div class="row" style="margin-bottom: 50px">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<table class="table" id="by">
						<tr>	
							<td id="title">아이디</td>
							<td id="title">${member.member_id}</td>
						</tr>

						<tr>
							<td id="title">비밀번호</td>
							<td><input type="password" name="password" maxlength="50"
								class="form-control input-md" value="${member.password}" required
								autofocus></td>
						</tr>

						<tr>
							<td id="title">이름</td>
							<td id="title">${member.member_name}</td>
						</tr>

						<tr>
							<td id="title">성별</td>
							<td id="title">${member.gender}</td>
						</tr>

						<tr>
							<td id="title">생일</td>
							<td id="title">${member.birthyy}년${member.birthmm}월${member.birthdd}일</td>
						</tr>

						<tr>
							<td id="title">이메일</td>
							<td><input type="text" name="mail1" maxlength="50"
								class="form-control input-md" value="${member.mail1}"
								style="width: 46%; display: inline-block;"> @ <select
								name="mail2" class="form-control input-md" id="mail2"
								style="width: 46%; display: inline-block;">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
							</select></td>
						</tr>

						<tr>
							<td id="title">휴대전화</td>
							<td><input type="text" name="phone" maxlength="50"
								class="form-control input-md" value="${member.phone}"></td>
						</tr>
						<tr>
							<td id="title">주소</td>
							<td><input type="text" name="address" id="sample5_address"
								class="form-control input-md" value="${member.address}"
								style="width: 70%; display: inline-block;" /><input
								type="button" onclick="sample5_execDaumPostcode()"
								class="btn btn-block" value="주소찾기"
								style="width: 30%; display: inline-block;"></td>

						</tr>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<input type="submit" value="수정" class="btn btn-block btn-success">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<input type="button" value="취소"
								onclick="javascript:window.location='MainForm.do'"
								class="btn btn-block btn-default">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>