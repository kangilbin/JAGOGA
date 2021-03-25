<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="board.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("sessionID");
%>

<%
	request.setCharacterEncoding("utf-8");
	List boardList = (List) request.getAttribute("boardlist");
	pageContext.setAttribute("boardList", boardList);
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<style>
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

td {
	font-family: Tahoma
}

h2 {
	font-size: 50px;
	font-family: 'Nanum Pen Script', cursive;
}
</style>
<script type="text/javascript">
function Popupopen() {
	var popupWidth = 600;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open('./ResWrite.admin', '예약', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}
function resModify(ord) {
	var popupWidth = 600;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open("./resModify.admin?ord="+ord, '수정', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

function resDelete(ord){
    if(confirm("삭제됩니다!")==true){
        location.href="./AdminDeleteAction.admin?ord="+ord;
    }
}
function searchCheck(frm){
    //검색
   
    if(frm.keyWord.value ==""){
        alert("검색 단어를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    frm.submit();      
}

</script>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container">
		<table class="table table-striped">
			<tr>
				
				<th colspan="7"><h2 style="text-align: left">예약 관리</h2></th>
				<th align="right"><input type="button" value="예약"
					class="btn pull-right" onclick="Popupopen()"></th>
			</tr>
			<tr>
				<th>NO.</th>
				<th>TPYE</th>
				<th>ID</th>
				<th>NAME</th>
				<th>STARY</th>
				<th>END</th>
				<th>PERSONNEL</th>
				<th>PRICE</th>
			</tr>

			<c:forEach var="i" items="${boardList}">
				<tr>
					<td>${i.res_ord }</td>
					<td>${i.rooms_type }</td>
					<td>${i.id }</td>
					<td>${i.MEMBER_NAME }</td>
					<td>${i.startday}</td>
					<td>${i.endday }</td>
					<td>${i.rooms_pay}</td>
					<td><input id="bt1" type="button" value="삭제"
						onclick="resDelete('${i.res_ord}')" /> <input id="bt2"
						type="button" value="수정" onclick="resModify('${i.res_ord}')" /></td>
				</tr>
			</c:forEach>
			<tr height="20">
				<td colspan="8" align="center">
					<ul class="pagination">
						<%
							if (nowpage <= 1) {
						%>
						<li><span>«</span></li>
						<%
							} else {
						%>
						<li><a href="./ResList.admin?page=<%=nowpage - 1%>"><span>«</span></a></li>
						<%
							}
						%>

						<c:forEach var="j" begin="${startpage}" end="${endpage}">
							<li <c:if test="${nowpage == j}"> class="active"</c:if>><a
								href="./ResList.admin?page=${j}">${j}</a></li>
						</c:forEach>

						<%
							if (nowpage >= maxpage) {
						%>
						<li><span>»</span></li>
						<%
							} else {
						%>
						<li><a href="./ResList.admin?page=<%=nowpage + 1%>"><span>»</span></a></li>
						<%
							}
						%>
					</ul>
				</td>
			</tr>
		</table>

		<div>
			<form action="./ResList.admin" method="get">
				<div class="input-group">
					<div style="float: left;">
						<select name="search" style="height: 34px; border: none;">
							<option value="id">아이디</option>
							<option value="MEMBER_NAME">이 름</option>
							<option value="rooms_type">객 실</option>
						</select>
					</div>
					<input type="text" class="form-control" style="width: 50%;"
						name="searchText" placeholder="Search...">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</form>
		</div>

	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>
