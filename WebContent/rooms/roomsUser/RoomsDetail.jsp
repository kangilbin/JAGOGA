<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세보기</title>
<%@include file="/template/footerFix.jsp"%>
<%@include file="/template/link.jsp"%>
<jsp:include page="/template/hfstyle.jsp" />

<style>
.carousel-inner>.item>img {
	min-width: 100%;
	min-height: 300px;
	max-height: 300px;
}

.container {
	padding-bottom: 15px;
	border-bottom: 1px solid #d3d3d3;
	background: #ffffff;
}

.bg-body {
	background: #f1f3f5;
}
</style>
<!-- star -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

<!-- Slick  -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
function resModify(roomsName) {
	var popupWidth = 600;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open("./ClientResWrite.bo?roomsName="+roomsName, '수정', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

	$(function star() {
		var rating = $('.rating');
		rating.each(function() {
			var targetScore = parseInt($(this).attr('data-rate'));
			console.log(targetScore);
			$(this).find('svg:nth-child(-n+' + targetScore + ')').css({
				color : '#FDD017'
			});
		});
	});
</script>
<style>
.lazy {
	position: relative;
}

.lazy button {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	width: 71ipx;
	height: 71px;
	border-radius: 100%;
	background: rgba(0, 0, 0, .5);
	border: none;
}

.lazy button:before {
	font-family: 'xeicon';
	color: #fff;
	font-size: 30px;
}

.lazy button.slick-prev {
	left: 0px;
	font-size: 0;
	color: transparent;
}

.lazy button.slick-prev:before {
	content: "\e93d";
}

.lazy button.slick-next {
	right: 0px;
	font-size: 0;
	color: transparent;
}

.lazy button.slick-next:before {
	content: "\e940";
}
</style>
</head>
<body class="bg-body">
	<jsp:include page="/template/header.jsp" />
	<main class="container-fluid">
	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">
					<img src="./rooms/roomsImages/${rooms.rooms_thumbnail}"
						alt="대표 이미지">
				</div>
				<c:forEach var="image" items="${images}">
					<div class="item">
						<img src="./rooms/roomsImages/${image}" alt="이미지">
					</div>
				</c:forEach>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<h1>${rooms.rooms_nm}</h1>
		<p>
			<c:choose>
				<c:when test="${count > 0}">
					<img src="./img/starnofull.png">&nbsp;5.0/${startt_avg} 후기 ${count}개</c:when>
				<c:otherwise>후기가 없습니다!</c:otherwise>
			</c:choose>
		</p>
		<h3>남은 객실 : ${rooms.rooms_amt}</h3>
		<h3>
			<fmt:formatNumber value="${rooms.rooms_pay}" pattern="#,###" />
			원
		</h3>
		<div class="btn-group btn-group-justified">
		<c:if test="${sessionID ne 'admin'}">
			<a class="btn btn-danger btn-lg"
				href="javascript:resModify('${rooms.rooms_nm}');">예약하기</a>
		</c:if>
		</div>
		
	</div>

	<div class="container">
		<h3>객실 소개</h3>
		${fn:replace(rooms.rooms_intro, replaceChar, "<br />")}
	</div>

	<div class="container">
		<h3>편의시설 및 테마</h3>
		${fn:replace(rooms.rooms_contents, replaceChar, "<br />")}
	</div>

	<div class="container">
		<h3>이용안내</h3>
		${fn:replace(rooms.rooms_info, replaceChar, "<br />")}
	</div>
	<br>

	<div class="container text-center">
		<div
			style="padding: 12px 0; font-size: 16px; font-weight: bold; margin: 0 20px; text-align: left;">
			<h3>후기</h3>
		</div>

		<div id="list_pp">
			<div id="real_contents">
				<c:choose>
					<c:when test="${fn:length(listRecent) gt 0}">
						<c:forEach var="list" items="${listRecent}" varStatus="status">
							<div class="comment"
								style="height: auto; margin-bottom: 30px; text-align: left;">
								<div
									style="height: 66px; padding: 6px 0; margin: 0 20px; border-top: 1px solid; border-color: #e6e6e6; border-bottom: 1px solid; border-color: #e6e6e6;">
									<div class="smile-img"
										style="width: 38px; height: 54px; margin-right: 14px; line-height: 54px; float: left;">
										<c:if test="${list.review_star_tt>='3'}">
											<img src="./img/smile.png" style="vertical-align: middle">
										</c:if>
										<c:if test="${list.review_star_tt<'3'}">
											<img src="./img/angry.png" style="vertical-align: middle">
										</c:if>
									</div>
									<div class="best" style="width: 100%; height: 18px;">
										<c:if
											test="${not empty list.review_file && list.review_star_tt=='5'}">
											<img src="./img/BEST.png">
										</c:if>
									</div>
									<div class="user-star"
										style="width: 100%; height: 18px; line-height: 18px;">
										<div class="rating_star" style="display: inline-block;">
											<div class="rating" data-rate="${list.review_star_tt}">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
										</div>
										<div class="correct"
											style="height: 18px; margin-left: 8px; display: inline-block;">바른후기</div>
										<div class="date"
											style="width: auto; height: 18px; float: right; display: inline-block;">
											<fmt:formatDate value="${list.review_dt}"
												pattern="yyyy년 MM월 dd일" />
										</div>
									</div>
									<div class="user-id" style="width: 100%; height: 18px;">
										${list.member_id} | ${list.rooms_nm}</div>
								</div>
								<div class="comment"
									style="height: 42px; margin: 10px 20px; padding-bottom: 10px; white; overflow: hidden; height: auto; border-color: #e6e6e6;">
									${list.review_content}</div>
								<c:set var="rf" value="${list.review_file}" />
								<c:choose>
									<c:when test="${empty rf}">
										<div style="height: 0px;"></div>
									</c:when>
									<c:otherwise>
										<div class="review-image"
											style="height: 132px; padding: 5px; margin: 0 20px; border-color: #e6e6e6;">
											<section class="lazy" style="min-width: 100%">

												<c:forTokens items="${list.review_file}" delims=","
													var="item">
													<div style="text-align: center;">
														<img src="./reviewUpload/${item}"
															style="width: 200px; height: 122px;">
													</div>
												</c:forTokens>
											</section>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
						<div style="padding: 12px 0; font-size: 16px; font-weight: bold;">
							<a href="./UserReviewList.re?rooms_nm=${rooms.rooms_nm}">전체후기
								보기</a>
						</div>
					</c:when>
					<c:otherwise>
						등록된 후기가 없습니다!
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
		<a href="${pUri}" class="btn btn-default">목록</a>
	</div>
	</main>
	<jsp:include page="/template/footer.jsp" />

	<script type="text/javascript">
		$('.lazy').slick({
			lazyLoad : 'ondemand',
			slidesToShow : 3,
			slidesToScroll : 1
		});
	</script>
</body>
</html>