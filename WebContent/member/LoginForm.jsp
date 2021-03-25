<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/template/link.jsp"%>
<html>
<head>
<%
	// 인코딩 처리
	//    request.setCharacterEncoding("UTF-8");
%>
<title>로그인 화면</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<style type="text/css">
#title {
	background-color: lightgray;
}
</style>

<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "MainForm.do";
	}
</script>

</head>
<body>
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container">
		<div class="row" style="margin-bottom: 50px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form name="loginInfo" method="post" action="MemberLoginAction.do"
					onsubmit="return checkValue()">
					<fieldset>
						<h2 align="center">
							<b>로그인</b>
						</h2>
						<hr>
						<div class="form-group">
							<input type="text" name="id" maxlength="50"
								class="form-control input-lg" placeholder="아이디" required
								autofocus>
						</div>
						<div class="form-group">
							<input type="password" name="password" maxlength="50"
								class="form-control input-lg" placeholder="비밀번호">
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="로그인">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="./JoinForm.do"><input type="button"
									class="btn btn-lg btn-primary btn-block" value="회원가입"></a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<%-- 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            String loginMsg = (String)request.getAttribute("fail");
            
            if(loginMsg!=null && loginMsg.equals("0")){
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(loginMsg!=null && loginMsg.equals("-1")){    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
            
            위의 if 문을 EL과 JSTL로 변경한 것은 아래와 같다. 
        --%>
	<div align="center">
		<c:set var="failMessage" value="${requestScope.fail}" />
		<c:if test="${failMessage!=null}">
			<c:choose>
				<c:when test="${failMessage=='0'}">
					<br>
					<script>
						alert("비밀번호를 확인해 주세요."); // alert()는 경고창을 띄우는 함수입니다.
					</script>
				</c:when>
				<c:otherwise>
					<br>
					<script>
						alert("아이디를 확인해 주세요."); // alert()는 경고창을 띄우는 함수입니다.
					</script>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
	</main>
	<jsp:include page="../template/footer.jsp" />
</body>
</html>