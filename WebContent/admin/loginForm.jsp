<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAGOGA관리자 로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Playball&display=swap" rel="stylesheet">
</head>
<body>
	<form name="Loginform" action="./AdminLoginAction.me" method="post">
		<div class="container">
		<div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-default" style="padding: 50px;">
				<h1 style="text-align: center; font-family: 'Playball', cursive;">JAGOGA Admin</h1><hr><br>
				<input type="text" class="form-control input-lg" id="id" placeholder="아이디" name="member_id"><br> 
				<input type="password" class="form-control input-lg" id="pwd" placeholder="비밀번호" name="password"><br> 
				<input type="submit" class="btn btn-primary btn-lg btn-block" value="로그인"><br><br>
			</div>
			</div>
		</div>
	</form>
</body>
</html>