<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberBean member = (MemberBean) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드 회원목록</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<script type="text/javascript">
	function fnSubmit() {
		if (confirm("정말 수정하시겠습니까?")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">

	<div class="container">
		<div id="infobox" class="box col-md-8 col-md-offset-2">
			<h3>회원 정보</h3>
			<hr>
			<div class="panel panel-default" style="padding: 30px;">
				<form name="AdminUpdate" action="./AdminModifyAction.me"
					method="post" onsubmit="fnSubmit()">
					<div class="form-group">
						<label for="usr">아이디:</label> <input type="text"
							class="form-control" id="usr" name="member_id"
							value=<%=member.getMember_id()%> readonly>
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호:</label> <input type="password"
							class="form-control" id="pwd" name="password"
							value=<%=member.getPassword()%>>
					</div>
					<div class="form-group">
						<label for="usr">이름:</label> <input type="text"
							class="form-control" id="usr" name="member_name"
							value=<%=member.getMember_name()%> readonly>
					</div>
					<div class="form-group">
						<label for="usr">성별:</label><br> <label class="radio-inline">
							<input type="radio" name="optradio" name="gender" value="남자"
							disabled>남자
						</label> <label class="radio-inline"> <input type="radio"
							name="optradio" name="gender" value="여자" disabled>여자
						</label>
					</div>
					<div class="form-group">
						<label for="usr">생년월일:</label> <input type="text"
							class="form-control" id="usr" name="birth"
							value="<%=member.getBirthyy()%>/<%=member.getBirthmm()%>/<%=member.getBirthdd()%>"
							readonly>
					</div>
					<!-- 			
				<div id="title">생일
                    
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
                        <select name="birthmm">
                            <option value="00">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
                    </div>
				 -->
					<div class="form-group">
						<label for="usr">이메일:</label> <input type="text"
							class="form-control" id="usr" name="mail"
							value=<%=member.getMail()%>>
					</div>
					<div class="form-group">
						<label for="usr">전화번호:</label> <input type="text"
							class="form-control" id="usr" name="phone"
							value=<%=member.getPhone()%>>
					</div>
					<div class="form-group">
						<label for="usr">주소:</label> <input type="text"
							class="form-control" id="usr" name="address"
							value=<%=member.getAddress()%>>
					</div>
					<div>
						<br> <input type="submit" class="btn btn-primary btn-block"
							value="수정하기">
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>
