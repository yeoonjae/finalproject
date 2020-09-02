<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<div id="content-wrapper">
	
		<div class="container-fluid">
	
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">지역등록</a></li>
				<li class="breadcrumb-item active">한글 2글자로 등록해주세요. ex)경기,충남,서울 </li>
			</ol>
	
			<br><br>
			<form action="local_regist" method="post">
				<input class="input-name" type="text" name="local_name"> <input type="submit" value="지역등록">
				<span></span>
			</form>
		</div>
		<br><br>
		
		<!-- 지역 목록  -->
		<div class="container-fluid">
		<h6>등록된 지역</h6>
			<div class="breadcrumb">
				<c:forEach var="localDto" items="${list}">
					<h6>${localDto.local_name}</h6><hr>
				</c:forEach>
				
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>