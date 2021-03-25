<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	$(document).ready(function(e) {
		//페이지 이동 전 검색 메뉴 가져오기
		if ('${search_param}' != null) {
			$('.search-panel span#search_concept').text('${search_param}');
			$('.input-group #search_param').val('${search_param}');
		}

		//
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	});
</script>

<form action="./UserRoomsList.ro">
	<div class="input-group">
		<div class="input-group-btn search-panel">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<span id="search_concept">검색</span> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#제목">제목</a></li>
				<li><a href="#내용">내용</a></li>
				<li><a href="#날짜">날짜</a></li>
			</ul>
		</div>
		<input type="hidden" name="search_param" id="search_param" value="all">
		<input type="text" class="form-control" placeholder="Search"
			name="searchName" value="${searchName}"><span
			class="input-group-addon"><button>
				<i class="glyphicon glyphicon-search"></i>
			</button></span>
	</div>
</form>
