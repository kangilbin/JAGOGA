<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 객실 수정</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />

<script>
	function check() {
		if ($('input[name="name"]').val() == '') {
			alert('방 이름을 입력해주세요!')
			return false;
		}
		if ($('input[name="amt"]').val() == '') {
			alert("방 갯수는 필수 입력사항입니다!");
			return false;
		}
		if ($('input[name="pay"]').val() == '') {
			alert("숙박비는 필수 입력사항입니다!");
			return false;
		}
	}
</script>
<style>
.container {
	padding-bottom: 15px;
	border-bottom: 1px solid #d3d3d3;
	background: #ffffff;
}

.bg-body {
	background: #f1f3f5;
}
</style>
</head>
<body class="bg-body">
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container text-center">
		<form action="./RoomsModify.ro" method="post">
			<h3>객실 수정</h3>
			<label for="name">*는 필수 입력 사항입니다!</label>
			<hr>
			<div>
				<label for="name">객실 이름*</label> <input type="text"
					class="form-control" name="name" id="name"
					value="${rooms.rooms_nm}" readonly maxlength="20">
			</div>
			<hr>
			<div>
				<label for="intro">객실 소개</label>
				<textarea class="form-control" rows="10" name="intro" id="intro"
					placeholder="1000자 이내로 입력해 주세요!" maxlength="1000">${rooms.rooms_intro}</textarea>
			</div>
			<hr>
			<div>
				<label for="contents">편의시설 및 테마</label>
				<textarea class="form-control" rows="10" name="contents"
					id="contents" placeholder="1000자 이내로 입력해 주세요!" maxlength="1000">${rooms.rooms_contents}</textarea>
			</div>
			<hr>
			<div>
				<label for="info">이용 안내</label>
				<textarea class="form-control" rows="10" name="info" id="info"
					placeholder="1000자 이내로 입력해 주세요!" maxlength="1000">${rooms.rooms_info}</textarea>
			</div>
			<hr>
			<div>
				<label for="amt">남은 객실*</label> <input class="form-control"
					name="amt" type="number" min='0' max='10' id="amt"
					value="${rooms.rooms_amt}" placeholder="1~10 입력">
			</div>
			<hr>
			<div>
				<label for="pay">숙박비*</label> <input class="form-control" name="pay"
					type="number" min='0' max='1000000' id="pay"
					value="${rooms.rooms_pay}" placeholder="1원~1,000,000원 입력">
			</div>
			<hr>
			<div>
				<input type="submit" class="btn btn-default" value="수정하기"
					onclick="return check()">
			</div>
			<hr>
		</form>
		<div>
			<input type="button" class="btn btn-default" value="목록"
				onclick="location='./AdminRoomsList.ro'">
		</div>
	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>