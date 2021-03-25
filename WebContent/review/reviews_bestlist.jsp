<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- star -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

<!-- Slick  -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
$(function star(){
var rating = $('.rating');
rating.each(function(){
	var targetScore = parseInt($(this).attr('data-rate'));
	console.log(targetScore);
	$(this).find('svg:nth-child(-n+' + targetScore + ')').css({color:'#FDD017'});
	});
});
</script>
<style>
	.lazy { position: relative; }
	.lazy button { position: absolute; z-index: 10; top: 50%; transform: translateY(-50%);
	width:71ipx; height:71px; border-radius:100%; background: rgba(0,0,0,.5); border: none;
	}
	.lazy button:before { font-family: 'xeicon'; color:#fff; font-size:30px;}
	.lazy button.slick-prev { left: 0px; font-size:0; color:transparent;}
	.lazy button.slick-prev:before { content:"\e93d"; }
	.lazy button.slick-next { right: 0px; font-size:0; color:transparent;}
	.lazy button.slick-next:before { content:"\e940"; }
</style>

<style type="text/css">
html, body {
	width: 100%; height: 100%; margin: 0px;
}
</style>

</head>
  <body>
    <div class="main" style="max-width:768px;min-width: 200px; margin-left:auto; margin-right:auto; height:100%; overflow:auto; background-color: #FFFFFF;">
      <!-- 위에 공간을 채우기 위해 -->                
		<div id="list_pp">
			<div id="real_contents">
				<c:forEach var="list" items="${listRecent}" varStatus="status">
					<div class="comment" style="height: auto; margin-bottom: 30px;">
						<div style="height: 66px; padding: 6px 0;margin:0 20px; border-top:1px solid; border-color:#e6e6e6;">
							<div class="smile-img" style=" width: 38px; height: 54px; margin-right: 14px; line-height: 54px; float: left;">
								<c:if test="${list.review_star_tt>='3'}">	  	      
								<img src="../img/smile.png" style="vertical-align: middle">
								</c:if>
								<c:if test="${list.review_star_tt<'3'}">
								<img src="../img/angry.png" style="vertical-align: middle">
								</c:if>				
							</div>
							<div class="best" style="width: 100%; height: 18px;">
							  <c:if test="${not empty list.review_file && list.review_star_tt=='5'}">
							  <img src="../img/BEST.png">
							  </c:if>
							</div>
							<div class="user-star" style="width: 100%; height: 18px; line-height: 18px;">	
								    <div class="rating_star" style="display: inline-block;">								      
								      <div class="rating" data-rate="${list.review_star_tt}">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>	
									  </div>
									</div>
								<div class="correct" style=" height: 18px; margin-left: 8px; display: inline-block;">바른후기</div>
								<div class="date" style="width:auto; height: 18px;float:right; display: inline-block;">
									<fmt:formatDate value="${list.review_dt}" pattern="yyyy년 MM월 dd일"/>
								</div>
							</div>
							 <div class="user-id" style="width: 100%; height: 18px; ">
							 	${list.member_id} | ${list.rooms_nm}
							 </div>
						</div>
						<div class="comment" style="height: 42px; padding: 10px 20px; background-color: white; overflow: hidden; height: auto;">
							${list.review_content}
						</div>
						<c:set var="rf" value="${list.review_file}"/>
						<c:choose>
						<c:when test="${empty rf}">
						<div style="height: 0px;">
						</div>
						</c:when>
						<c:otherwise>
						<div class="review-image" style="height: 132px; padding: 5px; margin:0 20px; border-top:1px solid; border-color:#e6e6e6;">
							<section class="lazy" style="min-width: 100%">

								<c:forTokens items="${list.review_file}" delims="," var="item">
									<div style="text-align: center;"><img src="${item}" style="width: 200px; height: 122px;"></div>
								</c:forTokens>
							</section>
						</div>
						</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
    <script type="text/javascript">
      $('.lazy').slick({
	  lazyLoad: 'ondemand',
	  slidesToShow: 3,
	  slidesToScroll: 1
	  });
    </script>     
  </body>
</html>