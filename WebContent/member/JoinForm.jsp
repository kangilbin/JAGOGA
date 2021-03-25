<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<title>회원가입 화면</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />

<script type="text/javascript">
	// 회원가입 화면의 입력값들을 검사한다.
	function checkValue() {
		var form = document.userInfo;

		if (!form.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form.password.value != form.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

		if (!form.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!form.birthyy.value) {
			alert("년도를 입력하세요.");
			return false;
		}

		if (isNaN(form.birthyy.value)) {
			alert("년도는 숫자만 입력가능합니다.");
			return false;
		}

		if (form.birthmm.value == "00") {
			alert("월을 선택하세요.");
			return false;
		}

		if (!form.birthdd.value) {
			alert("날짜를 입력하세요.");
			return false;
		}

		if (isNaN(form.birthdd.value)) {
			alert("날짜는 숫자만 입력가능합니다.");
			return false;
		}

		if (!form.mail1.value) {
			alert("메일 주소를 입력하세요.");
			return false;
		}

		if (!form.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}

		if (isNaN(form.phone.value)) {
			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
			return false;
		}

		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
	}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "MainForm.do";
	}

	// 아이디 중복체크 화면open
	function openIdChk() {

		window.name = "parentForm";
		window.open("member/IdCheckForm.jsp", "chkForm",
				"width=500, height=300, resizable = no, scrollbars = no");
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.userInfo.idDuplication.value = "idUncheck";
	}
</script>

</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid"> <jsp:include
		page="/member/DaumAPI.jsp" />
	<div class="container">
		<div class="row" style="margin-bottom: 50px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
				<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
				<form method="post" action="MemberJoinAction.do" name="userInfo"
					onsubmit="return checkValue()">
					<fieldset>
						<h2 align="center">
							<b>회원가입</b>
						</h2>
						<hr>
						<div class="row">
							<div class="col-xs-8 col-sm-8 col-md-8">
								<input type="text" name="id" maxlength="50"
									onkeydown="inputIdChk()" class="form-control input-md"
									placeholder="아이디" required autofocus>
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4">
								<input type="button" onclick="openIdChk()" value="중복확인"
									class="btn btn-block"> <input type="hidden"
									name="idDuplication" value="idUncheck">
							</div>
						</div>
						<br>
						<div class="form-group">
							<input type="password" name="password" maxlength="50"
								class="form-control input-md" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="password" name="passwordcheck" maxlength="50"
								class="form-control input-md" placeholder="비밀번호 확인">
						</div>
						<div class="form-group">
							<input type="text" name="name" maxlength="50"
								class="form-control input-md" placeholder="이름">
						</div>
						<div class="form-group">
							<div class="col-md">
								<label class="radio-inline"><b>성별</b></label> <label
									class="radio-inline"><input type="radio" name="gender"
									value="남" checked>남</label> <label class="radio-inline"><input
									type="radio" name="gender" value="여">여</label>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-4 col-sm-4 col-md-4">
									<input type="text" name="birthyy" maxlength="4"
										class="form-control input-md" placeholder="년(4자)">
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<select class="form-control" name="birthmm">
										<option value="00">월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<input type="text" name="birthdd" maxlength="2"
										class="form-control input-md" placeholder="일">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="text" name="mail1" maxlength="50"
										class="form-control input-md" placeholder="이메일"
										style="width: 47%; display: inline-block;"> @ <select
										class="form-control" name="mail2"
										style="width: 47%; display: inline-block;">
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<input type="text" name="phone" class="form-control input-md"
								placeholder="휴대전화">
						</div>
						<div class="row">
							<div class="col-xs-8 col-sm-8 col-md-8">
								<input type="text" name="address" id="sample5_address"
									class="form-control input-md" placeholder="주소">
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4">
								<input type="button" onclick="sample5_execDaumPostcode()"
									class="btn btn-block" value="주소찾기">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-md btn-success btn-block"
									value="가입">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="reset" class="btn btn-block btn-default"
									value="다시 쓰기">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>