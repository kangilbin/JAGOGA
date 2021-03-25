<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 숙소 관리</title>
<%@include file="/template/footerFix.jsp"%>
<%@include file="/template/link_rooms_list.jsp"%>
<jsp:include page="/template/hfstyle.jsp" />

<script type="text/javascript">
	$(document).ready(function(e) {
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	});

	function link(number, name) {
		var uri;
		var pUri;
		if (number === 1) {
			uri = "./RoomsDetail.ro?name=";
		} else if (number === 2) {
			uri = "./RoomsModifyView.ro?name=";
		} else if (number === 3) {
			var result = confirm("정말 삭제 하시겠습니까?");
			if (result == false) {
				return result;
			}
			uri = "./RoomsDelete.ro?name=";
		}
		pUri = window.location.href;
		location.href = uri + name + "&pUri=" + pUri;
	}
</script>
<style type="text/css">
table {
	text-align: center;
}

.container {
	padding-bottom: 15px;
	border-bottom: 1px solid #d3d3d3;
	background: #ffffff;
}

.bg-body {
	background: #f1f3f5;
}

#bt1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -5px;
}

#bt2 {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#bt1, #bt2 {
	border: 2px solid gray;
	background-color: rgba(0, 0, 0, 0);
	color: gray;
	padding: 5px;
}

#bt1:hover, #bt2:hover {
	color: white;
	background-color: gray;
}

.pull-right {
	color: white;
	background-color: gray;
}

h2 {
	font-size: 50px;
	font-family: 'Nanum Pen Script', cursive;
}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container text-center" style="background-color: #f9f9f9;">
		<div class="head">
			<h2 style="text-align: left">숙소 관리</h2>
		</div>
		<%@include file="SearchAdmin.jsp"%>
		<br> <a href="./RoomsWrite.ro" class="btn btn-success btn-lg">객실
			등록</a>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<td>이미지</td>
					<td>객실 이름</td>
					<td>객실 수</td>
					<td>숙박비</td>
					<td>등록 날짜</td>
					<td>관리</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rooms" items="${roomsList}">
					<tr>
						<td onClick="link(1,'${rooms.rooms_nm}')" style="cursor: pointer;"><img
							src="./rooms/roomsImages/${rooms.rooms_thumbnail}"
							class="img-rounded" alt="이미지" height="50px" width="50px"></td>
						<td onClick="link(1,'${rooms.rooms_nm}')" style="cursor: pointer;">${rooms.rooms_nm}</td>
						<td onClick="link(1,'${rooms.rooms_nm}')" style="cursor: pointer;">${rooms.rooms_amt}</td>
						<td onClick="link(1,'${rooms.rooms_nm}')" style="cursor: pointer;"><fmt:formatNumber
								value="${rooms.rooms_pay}" pattern="#,###" /></td>
						<td onClick="link(1,'${rooms.rooms_nm}')" style="cursor: pointer;">${rooms.rooms_date}</td>
						<td>
							<button type="button" id="bt1"
								onclick="link(2,'${rooms.rooms_nm}')">수정</button>
							<button type="button" id="bt2"
								onclick="link(3,'${rooms.rooms_nm}')">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>