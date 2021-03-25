<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 보기</title>
<%@include file="/template/footerFix.jsp"%>
<%@include file="/template/link_rooms_list.jsp"%>
<jsp:include page="/template/hfstyle.jsp" />

<style>
.panel-body {
	padding: 0;
	bg-color: red;
}

.container {
	padding-bottom: 15px;
	background: #f9f9f9;
}

img {
	min-height: 200px;
	max-height: 200px;
	min-width: 100%;
	max-width: 100%;
}

h2 {
	font-size: 50px;
	font-family: 'Nanum Pen Script', cursive;
}
</style>
<script type="text/javascript">
function resModify(roomsName, id) {
	if(id == 'admin') {
		alert('관리자는 예약할 수 없습니다.')
		return false;
	} 
	if (id == null) {
		alert('로그인을 해주시기 바랍니다.')
		location.href = "./LoginForm.do";
	}
	var popupWidth = 600;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open("./ClientResWrite.bo?roomsName="+roomsName, '수정', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

	function link(name) {
		var pUri;
		pUri = "./UserRoomsList.ro";
		location.href = "./RoomsDetail.ro?name=" + name + "&pUri=" + pUri;
	}
</script>
</head>
<body class="bg-body">
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container text-center">

		<h2 style="text-align: left">객실 리스트</h2>
		<%@include file="SearchUser.jsp"%>
		<hr>
		<c:choose>
			<%-- 리스트가 있을 시 --%>
			<c:when test="${fn:length(roomsList) gt 0}">

				<%-- 이미지 표시 조건문 --%>
				<c:set var="roomsSize" value="${fn:length(roomsList)}" />
				<c:set var="roomsLine" value="0" />
				<c:set var="roomsStart" value="0" />
				<c:set var="roomsEnd" value="${roomsSize-1}" />
				<c:if test="${roomsSize > 3}">
					<c:set var="roomsLine" value="1" />
					<c:set var="roomsEnd" value="2" />
				</c:if>

				<c:forEach begin="0" end="${roomsLine}">
					<div class="row">
						<c:forEach var="imageNum" begin="${roomsStart}" end="${roomsEnd}">
							<div class="col-sm-4">
								<div class="panel panel-danger"
									style="border: 1px solid #ccccccc;">
									<div class="panel-heading"
										style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 100%; background-color: #f5f5f5; font-size: 20px;">
										<strong>${roomsList[imageNum].rooms_nm}</strong>
									</div>
									<div class="panel-body" style="background-color: #f1f3f5">
										<a
											href="./RoomsDetail.ro?name=${roomsList[imageNum].rooms_nm}&pUri=./UserRoomsList.ro"><img
											src="./rooms/roomsImages/${roomsList[imageNum].rooms_thumbnail}"
											class="img-responsive" alt="Image"></a>
									</div>
									<div class="panel-footer" style="padding: 0px;">
										<div class="btn-group" style="width: 100%">
											<a
												href="javascript:resModify('${roomsList[imageNum].rooms_nm}', '${sessionID}');"
												class="btn btn-danger"
												style="background-color: rgb(222, 46, 95); border-color: #de2e5f; width: 48%; margin-right: 4%">예약하기</a>

											<a onClick="link('${roomsList[imageNum].rooms_nm}')"
												class="btn btn-danger"
												style="background-color: rgb(222, 46, 95); border-color: #de2e5f;; width: 48%;">상세보기</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<c:set var="roomsSize" value="${roomsSize-3}" />
					<c:set var="roomsStart" value="3" />
					<c:set var="roomsEnd" value="${roomsSize+2}" />
				</c:forEach>

				<%-- 페이징 --%>
				<ul class="pagination">
					<c:choose>
						<c:when test="${page <= 1}">
							<li><a href="">이전</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="./UserRoomsList.ro?page=${page - 1}&searchName=${searchName}&search_param=${search_param}">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="startNum" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${startNum eq page}">
								<li class="active"><a href="">${startNum}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="./UserRoomsList.ro?page=${startNum}&searchName=${searchName}&search_param=${search_param}">${startNum}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${page ge maxPage}">
							<li><a href="">다음</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="./UserRoomsList.ro?page=${page + 1}&searchName=${searchName}&search_param=${search_param}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>

			</c:when>
			<%-- 리스트가 없을 시 --%>
			<c:otherwise>
			등록된 객실이 없습니다!
			</c:otherwise>
		</c:choose>
	</div>
	</main>

	<jsp:include page="/template/footer.jsp" />
</body>
</html>