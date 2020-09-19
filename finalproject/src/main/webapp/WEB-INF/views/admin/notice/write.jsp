<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	<style>
	 .textarea{
	 	width:500px; 
		height:100px; 
    	resize:none;
	 }
	</style>
<div id="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">공지 사항</a></li>
			<li class="breadcrumb-item active">작성</li>
		</ol>
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<form action="${pageContext.request.contextPath}/admin/notice/write" method="post">
					<div class="form-group">
						<label>제목</label>
						<input name="notice_title" class="form-control" required>
					</div>
					<div class="form-group">
						<label>상세내용</label>
						<textarea name="notice_content" class="form-control" required></textarea>
					</div>
					<input type="submit" value="제출">
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>