<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">JAGOGA 관리자</a>
		  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
   			 	<span class="navbar-toggler-icon"></span>
			</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">숙소관리</a></li>
				<li class="nav-item"><a class="nav-link" href="./ResList.admin">예약관리</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="text-center">번호</th>
						<th scope="col" class="text-center">아이디</th>
						<th scope="col" class="text-center">이름</th>
						<th scope="col" class="text-center">성별</th>
						<th scope="col" class="text-center">나이</th>
						<th scope="col" class="text-center">연락처</th>
						<th scope="col" class="text-center">등록일</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>
			Copyright &copy; 2021 team. All Rights Reserved.<br>
			<br>강일빈, 감동휘, 김성재, 신호선, 하경호
		</p>
	</div>

</body>
</html>
