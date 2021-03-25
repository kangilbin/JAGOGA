<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("id");
%>
<%
	request.setCharacterEncoding("utf-8");
	List memberlist = (List) request.getAttribute("memberlist");
	pageContext.setAttribute("memberlist", memberlist);
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
<title>관리자모드 회원목록</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<style>
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container">
		<div class="row content">
			<div>
				<h3>회원 목록</h3>
				<hr>
				<div class="panel panel-default" style="padding: 10px;">
					<a href="./AdminJoin.me"><button type="button"
							class="btn btn-default">회원등록</button></a>
					<table class="table">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${memberlist}">
								<tr>
									<td>${i.member_id }</td>
									<td>${i.member_name }</td>
									<td>${i.phone}</td>
									<td>${i.mail }</td>
									<!-- 			<td ><input id="bt1" type="button" value="상세 정보" onclick="javascript:openWin('${i.member_id}')"/></td>  -->
									<td><a href="AdminViewAction.me?member_id=${i.member_id }"><input
											id="bt1" type="button" value="상세정보"></a></td>
									<td><c:if test="${i.member_id ne 'admin'}">
											<a href="AdminDeleteAction.me?member_id=${i.member_id }"><input
												id="bt1" type="button" value="삭제"></a>
										</c:if></td>
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
										<li><a href="./Adminlist.me?page=<%=nowpage - 1%>"><span>«</span></a></li>
										<%
											}
										%>

										<c:forEach var="j" begin="${startpage}" end="${endpage}">
											<li <c:if test="${nowpage == j}"> class="active"</c:if>>
												<a href="./Adminlist.me?page=${j}">${j}</a>
											</li>
										</c:forEach>

										<%
											if (nowpage >= maxpage) {
										%>
										<li><span>»</span></li>
										<%
											} else {
										%>
										<li><a href="./Adminlist.me?page=<%=nowpage + 1%>"><span>»</span></a></li>
										<%
											}
										%>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<form action="./AdminListAction.me" method="get">
							<div class="input-group">
								<div style="float: left;">
									<select name="search" style="height: 34px; border: none;">
										<option value="member_id">아이디</option>
										<option value="member_name">이 름</option>
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
			</div>
		</div>
	</div>
	<div>
		<!-- 		<footer class="container-fluid text-center">
			<p>
				Copyright &copy; 2021 team. All Rights Reserved.<br> <br>강일빈,
				감동휘, 신호선, 안성재, 하경호
			</p>
		</footer> -->
	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>
