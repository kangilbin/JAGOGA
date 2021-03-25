<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="./AdminRoomsList.ro">
	<div class="input-group">
		<div class="input-group-btn search-panel">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<span id="search_concept">검색</span> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#name">제목</a></li>
				<li><a href="#contents">내용</a></li>
				<li><a href="#date">날짜</a></li>
			</ul>
		</div>
		<input type="hidden" name="search_param" value="all" id="search_param">
		<input type="text" class="form-control" placeholder="Search"
			name="searchName"><span class="input-group-addon"><button>
				<i class="glyphicon glyphicon-search"></i>
			</button></span>
	</div>
</form>