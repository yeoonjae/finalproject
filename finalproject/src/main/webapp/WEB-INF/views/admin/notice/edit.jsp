<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<style>
.detail_result {
	color: red;
	font-size: small;
}

.table {
	text-align: center;
}

.select-result.on {
	display: inline-block;
	color: red;
	font-size: small;
}

.select-result {
	display: none;
}
.textarea{
	 	width:500px; 
		height:100px; 
    	resize:none;
	 }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
<div id="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">공지사항</a></li>
			<li class="breadcrumb-item active">수정</li>
		</ol>
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<form action="${pageContext.request.contextPath}/admin/notice/edit" method="post" class="form">
					<input type="hidden" name="notice_no" value="${noticeDto.notice_no}">
					<div class="form-group">
						<label>제목</label> <span class="select-result on">수정할 유형을 아래 목록에서 선택해주세요</span>
						<input type="text" class="form-control" name="notice_title" value="${noticeDto.notice_title}"
							required>
					</div>
					<div class="form-group">
						<label>상세내용</label>
						<textarea name="notice_content" class="form-control" required>${noticeDto.notice_content}</textarea>
					</div>
					<div class="form-group">
						<input type="submit" class="form-control" value="수정">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>