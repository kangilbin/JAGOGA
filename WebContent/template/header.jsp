<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div tyle="height:100px;">
	<table>
		<td><h1 class="title">&nbsp;&nbsp;JAGOGA</h1></td>
		<td><h1 class="subtitle">&nbsp;&nbsp;MOTEL</h1></td>
	</table>
</div>
<nav class="navbar navbar-inverse" data-spy="affix"
	data-offset-top="197">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./" style="font-family: 'Playball', cursive;">JGG</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav" >
				<li><a href="./UserRoomsList.ro" class="room">숙소 보기</a></li>
				<c:if test="${sessionScope.sessionID=='admin'}">
				<li><a href="./AdminRoomsList.ro" class="room">숙소 관리</a></li>
				<li><a href="./ResList.admin" class="room">예약 관리</a></li>
				<li><a href="./AdminDeleteList.re" class="room">리뷰 관리</a></li>
				<li><a href="./AdminListAction.me" class="room">회원 관리</a></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.sessionID!=null}">
						<ul class="nav navbar-nav">
							<c:if test="${sessionScope.sessionID != 'admin'}">
							<li><a href="ClientList.bo" class="my">마이페이지</a></li>
							</c:if>
						</ul>
						<li class="log"><a href="./MemberLogoutAction.do"><span
								class="glyphicon glyphicon-log-out"></span> logOut</a></li>
					</c:when>
					<c:otherwise>
						<li class="log"><a href="./LoginForm.do"><span
								class="glyphicon glyphicon-log-in"></span> logIn</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
