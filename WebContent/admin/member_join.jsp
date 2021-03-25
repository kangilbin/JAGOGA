<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	height: 100%;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
	height: 100px;
	margin-top: -100px;
}
</style>
</head>
<body>
	<div>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">JAGOGA관리자</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="#">회원관리</a></li>
						<li><a href="#">숙소관리</a></li>
						<li><a href="#">예약관리</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="AdminLogoutAction.me"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container">
			<div id="Joinbox" class="box col-md-8 col-md-offset-2">
			<h3>회원 등록</h3>
			<hr>
			<div class="panel panel-default" style="padding: 30px;">
				<form name="JoinForm" action="./AdminJoinAction.me" method="post">
					<div class="form-group">
						<label for="usr">아이디:</label> <input type="text"
							class="form-control" id="usr" name="member_id">
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호:</label> <input type="password"
							class="form-control" id="pwd" name="password">
					</div>
					<div class="form-group">
						<label for="usr">이름:</label> <input type="text"
							class="form-control" id="usr" name="member_name">
					</div>
					<div class="form-group">
						<label for="usr">성별:</label><br> <label class="radio-inline">
							<input type="radio" name="optradio" name="gender"
							value="남자">남자
						</label> <label class="radio-inline"> <input type="radio"
							name="optradio" name="gender" value="여자">여자
						</label>
					</div>

					<!-- 			
				<div class="form-group">
					<label for="usr">년:</label> <input type="text"
						class="form-control" id="usr" name="birthyy">
				</div>
				<div class="form-group">
					<label for="usr">월:</label> <input type="text"
						class="form-control" id="usr" name="birthmm">
				</div>
				<div class="form-group">
					<label for="usr">일:</label> <input type="text"
						class="form-control" id="usr" name="birthdd">
				</div>
				 -->
					<div class="form-group">
						<label for="usr">생년월일: </label>
						<div class="form-group row">
							<div class="col-xs-4">
								<input type="text" class="form-control" name="birthyy"
									maxlength="4" placeholder="년(4자)" size="10">
							</div>
							<div class="col-xs-4">
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
							<div class="col-xs-4">
								<input type="text" class="form-control" name="birthdd"
									maxlength="2" placeholder="일" size="10">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="usr">이메일:</label> <input type="text"
							class="form-control" id="usr" name="mail">
					</div>
					<div class="form-group">
						<label for="usr">전화번호:</label> <input type="text"
							class="form-control" id="usr" name="phone">
					</div>
					<div class="form-group">
						<label for="usr">주소:</label> <input type="text"
							class="form-control" id="usr" name="address">
					</div>
					<div>
					<br>
					<input type="submit" class="btn btn-primary btn-block" value="등록하기">
					</div>
				</form>
			</div>
		</div>
		</div>
		<!-- 
		<footer class="container-fluid text-center">
			<p>
				Copyright &copy; 2021 team. All Rights Reserved.<br> <br>강일빈,
				김동휘, 신호선, 안성재, 하경호
			</p>
		</footer>
		 -->
	</div>
</body>
</html>
