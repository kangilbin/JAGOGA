<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 내역 수정</title>
<%@include file="/template/footerFix.jsp"%>
<jsp:include page="/template/link.jsp" />
<jsp:include page="/template/hfstyle.jsp" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<style>
	.container {  padding-top: 70px; }
	.pull-right { width:150px; border-color: white; }
	.pull-right:hover,
	.pull-right:focus { background-color: gray; border-color: white; 
						 color: white; }


@media (min-width: 1200px) {
  .container {
    width: 850px;
  }
}
.list-group{
  float: left;
  width: 200px;
  margin-top: 60px;
  margin-right: 50px;
}
.groove {background: #F2F2F2;
		border:2px solid #2E2E2E;
		 border-bottom-style: none;
		  font-size: 40px;
		  padding:20px;
		   border-top-right-radius: 10px;
		  font-family: 'Nanum Pen Script', cursive;
		   color:black;
		 
	}
.ridge {border:2px solid #2E2E2E;
		border-bottom-style: none;
		 font-size: 40px;
		  padding:20px;
		  border-top-left-radius: 10px;
		 font-family: 'Nanum Pen Script', cursive;
		 color:black;
		 
		}
.center {border:2px solid #2E2E2E;
		border-bottom-style: none;
		 border-right-style: none;
		 border-left-style: none;
		 font-size: 40px;
		  padding:20px;
		 font-family: 'Nanum Pen Script', cursive;
		 color:black;
		 
		}
.ridge:hover{ background: #F2F2F2; }
.head{
	margin-bottom:30px;
}
.pull-right{
			font-family: 'Jua', sans-serif;
			 font-size:18px;
}
.dropdown{
		float:right;
		
}
#dropdownMenu1{
	background: #F2F2F2;
	border-color:#F2F2F2;
	
}
#dropdownMenu1:hover{
		background: #999;
}
a:hover { text-decoration: none; }
.well { margin-top: 50px;}
.bg-body {
	background: #f1f3f5;
}
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

</style>
</head>
<body>

	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	 <section id="reservation-category">
    <div class="container" style="background-color: #f9f9f9;">  
    
	    <div class="head">
			 <h1><a href="MemberInfoAction.do" class="ridge">내 정보</a><a href="./ClientList.bo"  class="center">예약 내역</a><a href="./UserModifyList.re" class="groove" >리뷰 내역 수정</a></h1>
		</div>		
			<c:choose>
			<c:when test="${fn:length(listRecent) > 0}">
			<div id="list_pp">
				<div id="real_contents">
					<c:forEach var="list" items="${listRecent}" varStatus="status">
						<div class="panel panel-default">
							<div class="panel-heading">${list.member_id} |
								<fmt:formatDate value="${list.review_dt}"
									pattern="yyyy년 MM월 dd일" />  | ${list.rooms_nm} 	
								<form action="./UserModify.re" method="post"
									style="display: inline-block; margin-left: 100px">
									<button type="submit" class="btn btn-info" id="bt1"
										value="${list.review_id}" name="review_id">수정</button>
								</form>
								<button type="button" class="btn btn-danger" data-toggle="modal" id="bt2"
									data-target="#myModal">삭제</button>
								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">리뷰 삭제</h4>
											</div>
											<div class="modal-body">
												<p>리뷰를 삭제하시겠습니까?</p>
											</div>
											<div class="modal-footer">
												<form action="./UserDelete.re" method="post"
													style="display: inline-block;">
													<button type="submit" class="btn btn-primary"
														value="${list.review_id}" name="review_id">삭제하기</button>
												</form>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-body">${list.review_content}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:when>
			<c:otherwise>
				<div style="height: 15px;"></div>
				<h3>등록된 리뷰가 없습니다.</h3>
			</c:otherwise>
			</c:choose>
			<table style="margin-left: auto; margin-right: auto">
				<tr height="20">
					<td><c:set var="page" value="${page}" /> <c:choose>
							<c:when test="${page == '1'}">
											[ 이전 ]&nbsp;
					    				</c:when>
							<c:otherwise>
								<a href="./UserModifyList.re?page=${page-'1'}">[ 이전 ]</a>&nbsp;
					    				</c:otherwise>
						</c:choose> <c:forEach var="i" begin="${startpage}" end="${endpage}">
							<c:choose>
								<c:when test="${i == page}">
												[<c:out value="${i}" />]
						    				</c:when>
								<c:otherwise>
									<a href="./UserModifyList.re?page=${i}">[<c:out
											value="${i}" />]
									</a>&nbsp;
						    				</c:otherwise>
							</c:choose>
						</c:forEach> <c:set var="maxpage" value="${maxpage}" /> <c:choose>
							<c:when test="${page >= maxpage}">
											[다음]
					    				</c:when>
							<c:otherwise>
								<a href="./UserModifyList.re?page=${page+'1'}"> [ 다음 ]</a>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</div>
      </section>
         </main>
	<jsp:include page="/template/footer.jsp" />
</body>
</html>