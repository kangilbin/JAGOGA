<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>탈퇴 화면</title>

<style type="text/css">
table {
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

<script type="text/javascript">
	// 비밀번호 미입력시 경고창
	function checkValue() {
		if (!document.deleteform.password.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>

</head>
<body>
	<jsp:include page="../template/header.jsp" />
	<div align="center">
		<h2>
			<b>회원 탈퇴</b>
		</h2>
	</div>

	<form name="deleteform" method="post" action="MemberDeleteAction.do"
		onsubmit="return checkValue()">
		<div class="container">
			<div class="row" style="margin-bottom: 50px">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<table class="table">
						<tr>
							<td id="title">비밀번호</td>
							<td><input type="password" name="password" maxlength="50"
								class="form-control input-md" required
								autofocus></td>
						</tr>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<input type="submit" value="탈퇴" class="btn btn-block btn-danger" />
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