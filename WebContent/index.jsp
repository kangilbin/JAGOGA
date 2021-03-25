<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="rooms.db.user.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("sessionID");
%>

<%
	List<RoomsBean> roomsList = null;
	List<RoomsBean> roomsRandomList = null;
	roomsList = RoomsDAO.roomsNameList();
	roomsRandomList = RoomsDAO.indexRanmdomList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자고가</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />



<script type="text/javascript">
	$(function() {
		$('#datetimepicker7').datetimepicker({
			format : 'YYYY-MM-DD',
			minDate : new Date()
		});
		$('#datetimepicker7').on("change.datetimepicker", function(e) {
			$('#datetimepicker8').datetimepicker('minDate', e.date);
		});
		$('#datetimepicker8').datetimepicker({
			format : 'YYYY-MM-DD',
			useCurrent : false

		});
		$('#datetimepicker8').on("change.datetimepicker", function(e) {
			$('#datetimepicker7').datetimepicker('maxDate', e.date);
		});
	});
	function addboard() {
		boardform.submit();
	}
</script>
<style>
.btn {
	width: 100px;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	position: relative;
}

body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
}

a {
	color: #92badd;
	display: inline-block;
	text-decoration: none;
	font-weight: 400;
}

h2 {
	text-align: center;
	font-size: 16px;
	font-weight: 600;
	text-transform: uppercase;
	display: inline-block;
	margin: 20px 8px 10px 8px;
	color: #cccccc;
}

.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 104%;
	min-height: 100%;
	margin: -20px;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 20px;
	width: 110%;
	max-width: 480px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

#formFooter {
	background-color: #f6f6f6;
	border-top: 1px solid #dce8f1;
	padding: 25px;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
}

h2.inactive {
	color: #cccccc;
}

h2.active {
	color: #0d0d0d;
	border-bottom: 2px solid #5fbae9;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #56baed;
	border: none;
	color: white;
	padding: 13px 55px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 20px 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 80%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
	color: #cccccc;
}

.fadeInDown {
	-webkit-animation-name: fadeInDown;
	animation-name: fadeInDown;
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

@
-webkit-keyframes fadeInDown { 0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}

100%
{
opacity






:



 



1;
-webkit-transform






:



 



none






;
transform






:



 



none






;
}
}
@
keyframes fadeInDown { 0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}

100%
{
opacity






:



 



1;
-webkit-transform






:



 



none






;
transform






:



 



none






;
}
}

/* Simple CSS3 Fade-in Animation */
@
-webkit-keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-moz-keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.fadeIn {
	opacity: 0;
	-webkit-animation: fadeIn ease-in 1;
	-moz-animation: fadeIn ease-in 1;
	animation: fadeIn ease-in 1;
	-webkit-animation-fill-mode: forwards;
	-moz-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	-webkit-animation-duration: 1s;
	-moz-animation-duration: 1s;
	animation-duration: 1s;
}

.fadeIn.first {
	-webkit-animation-delay: 0.4s;
	-moz-animation-delay: 0.4s;
	animation-delay: 0.4s;
}

.fadeIn.second {
	-webkit-animation-delay: 0.6s;
	-moz-animation-delay: 0.6s;
	animation-delay: 0.6s;
}

.fadeIn.third {
	-webkit-animation-delay: 0.8s;
	-moz-animation-delay: 0.8s;
	animation-delay: 0.8s;
}

/* OTHERS */
*:focus {
	outline: none;
}

.ta1 {
	width: 50px;
}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<section class="row">
		<!-- fastReservation -->
		<div style="width: auto; position: absolute; left: 10%; z-index: 2;"
			class="well">
			<div class="row">



				<div class="wrapper fadeInDown">
					<div id="formContent">
						<!-- Tabs Titles -->

						<div>
							<h2>빠른 예약</h2>
						</div>
						<!-- Login Form -->
						<form action="./ClientAddAction.bo" method="post" name="boardform">
							<table class="ta1">
								<tr>
									<td><div class="form-group">
											<div class="input-group date" id="datetimepicker7"
												data-target-input="nearest">
												<input type="text" name="startday"
													class="form-control datetimepicker-input"
													data-target="#datetimepicker7" />
												<div class="input-group-append"
													data-target="#datetimepicker7" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div></td>
									<td><div class="form-group">
											<div class="input-group date" id="datetimepicker8"
												data-target-input="nearest">
												<input type="text" name="endday"
													class="form-control datetimepicker-input"
													data-target="#datetimepicker8" />
												<div class="input-group-append"
													data-target="#datetimepicker8" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<td>TYPE</td>
									<td><select class="form-control" name="type"
										style="height: 40px; width: 80%; margin-left: 17px;">
											<option>--------</option>
											<%
												for (int i = 0; i < roomsList.size(); i++) {
											%>
											<option value="<%=roomsList.get(i).getRooms_nm()%>"><%=roomsList.get(i).getRooms_nm()%></option>
											<%
												}
											%>
									</select></td>
								</tr>
								<tr>
									<td><input type="button" value="예 약" onclick="addboard()"></td>
									<td><input type="reset" value="지우기"></td>
								<tr>
							</table>
						</form>
					</div>
				</div>




			</div>
		</div>
		<!-- Carousel -->
		<div style="position: relative; z-index: 1;" id="myCarousel"
			class="carousel slide" data-ride="carousel" data-interval="false">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="img/main4.jpg" alt="Image">
				</div>

				<div class="item">
					<img src="img/banner.jpg" alt="Image">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div style="height: 20px;"></div>
		<!-- bestReview -->

		<div class="container">

			<div class="row">

				<div class="col-xs-6 col-sm-6 col-md-6">

					<div class="list-group"
						style="margin-top: 35px; width: 60%; margin-left: auto; margin-right: 40px;">

						<%
							for (int i = 0; i < roomsRandomList.size(); i++) {
						%>

						<a href="#" class="list-group-item"
							onclick="myPage(event, '리뷰<%=i + 1%>이미지')" id="defaultOpen"><%=roomsRandomList.get(i).getRooms_nm()%></a>

						<%
							}
						%>

					</div>

				</div>

				<div class="col-xs-6 col-sm-6 col-md-6">

					<%
						for (int i = 0; i < roomsRandomList.size(); i++) {
					%>

					<div id="리뷰<%=i + 1%>이미지" class="tabcontent"
						style="margin-left: 40px;">

						<a style="width: auto%;"
							href="./RoomsDetail.ro?name=<%=roomsRandomList.get(i).getRooms_nm()%>&pUri=./UserRoomsList.ro"><img
							src="./rooms/roomsImages/<%=roomsRandomList.get(i).getRooms_thumbnail()%>"
							style="height: 300px;" /></a>



					</div>

					<%
						}
					%>

				</div>

			</div>

		</div>
		<script>
			function myPage(evt, pageName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("list-group-item");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
				document.getElementById(pageName).style.display = "block";
				evt.currentTarget.className += " active";
			}

			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
		</script>
	</section>
	</main>
	<%@include file="/template/footer.jsp"%>
</body>
</html>