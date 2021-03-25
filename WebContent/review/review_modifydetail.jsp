<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰후기 수정</title>
<!-- Viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- Slick  -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script type="text/javascript">
  $(function(){
    $('.make_star svg').click(function(){
    	var targetNum = $(this).index() + 1;
    	$('.make_star svg').css({color:'#000'});
    	$('.make_star svg:nth-child(-n+' + targetNum +')').css({color:'#F05522'});
    	$('.makestar').val(targetNum).prop("selected",true);
    	console.log(targetNum)
    });
  });
</script>
</head>
<body style="background-color:#f2f2f2;">
	<c:forEach var="list" items="${listRecent}" varStatus="status">
    <div class="main" style="max-width:768px;min-width: 200px; margin-left:auto; margin-right:auto; height:100%; overflow:auto; background-color: #FFFFFF;">
	  <div class="navbar navbar-inverse navbar-fixed-top" style="  background-color: #FFFFFF; height:50px;border:0px;">
        <div class="navbar-inner" style="max-width:768px;margin-left:auto;margin-right:auto;height:100%; background-color: #FFFFFF; display: flex; flex-direction: row;">	
           <a href="javascript:window.history.back();"><div class="glyphicon glyphicon-menu-left" style="width:44px; padding-top:15px;font-size:16px;text-align: center;"></div></a>
           <div class="review-count" style="width: 200px; display:inline-flex; padding-top:12px;font-size:16px;font-weight:bold;margin-left:300px;">바른후기 남기기</div>
        </div>
      </div>
    
      <!-- 위에 공간을 채우기 위해 -->
      <div class="navbar-top" style="height: 50px; background-color: #555555"></div>
	  <div class="suckso" style="height: 88px; padding: 8px 0; background-color: #FFFFFF;margin:0 20px; border-top:1px solid; border-color:#e6e6e6; ">
	    <div class="empty" style="height: 22px;">
	    </div>
	    <div class="suckso-main" style="height: 22px;">
	      <div class="sucks-info" style="height: 22px; display: inline-block;font-weight:bold;">
	           숙소정보
	      </div>
	      <div class="suckso-name" style="height: 22px; margin-left: 70px; display: inline-block;">
            <c:out value="${list.rooms_nm}"/>
	      </div>	        
	    </div>
	    <div class="suckso-user" style="height: 22px;">
	      <div class="sucks-user-info" style="height: 22px; display: inline-block;font-weight:bold;">
	          아이디
	      </div>
	      <div class="sucks-user-name" style="height: 22px; margin-left: 85px; display: inline-block;">
            <c:out value="${sessionScope.id}"/>
	      </div>
	    </div>
	  </div>
	  <form action="./UserModifyDetail.re" method="post" enctype="multipart/form-data">	
	  <div class="star-check" style="height: 88px; padding: 8px 0; background-color: #FFFFFF; margin:0 20px; border-top:1px solid; border-color:#e6e6e6;">
	    <div class="empty" style="height: 22px;">
	    </div>
        <div class="exper" style="height: 22px; font-size: 17px;">
	        <strong>이곳에서의 경험은 어떠셨나요?</strong>
	    </div>
	    <div class="make_star">
	      <select class="makestar" name="start_tt" style="display: none">
		    <option value="1">1</option>
		    <option value="2">2</option>
		    <option value="3">3</option>
		    <option value="4">4</option>
		    <option value="5">5</option>
	      </select>
	      <div class="rating" data-rate="3">
		    <i class="fas fa-star"></i>
		    <i class="fas fa-star"></i>
		    <i class="fas fa-star"></i>
		    <i class="fas fa-star"></i>
		    <i class="fas fa-star"></i>	
	      </div>
	    </div>	      
	  </div>
	    <textarea required="required" class="form-control" name="review_content" placeholder="이곳에서 머물렀던 기억을 작성해주세요~" rows="10" cols="40" style="width:50%; height: 100%; margin: 0 20px;">${list.review_content}</textarea>
	  	<div style="margin:20px 20px;">
	  	이미지 업로드1 : <input class="custom-file-input" type="file" accept="image/*" name="image1">
	  	이미지 업로드2 : <input class="custom-file-input" type="file" accept="image/*" name="image2">
	  	이미지 업로드3 : <input class="custom-file-input" type="file" accept="image/*" name="image3">
	  	이미지 업로드4 : <input class="custom-file-input" type="file" accept="image/*" name="image4">
	  	이미지 업로드5 : <input class="custom-file-input" type="file" accept="image/*" name="image5">
	  	<input type="hidden" name="rooms_nm" value="${list.rooms_nm}">
	  	<input type="hidden" name="review_id" value="${list.review_id}">		
	  	<button type="submit" style="height: 44px; width: 100%; margin-top: 10px; background-color: rgb(222, 46, 95);;border: .1rem solid #de2e5f; color:#fff;border-radius: .4rem;
	  	font-size: 1.6rem; font-weight: 700;
	  	 ">등록하기</button>
	  	</div>
	  </form>
    </div>
    </c:forEach>
</body>
</html>