<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">관리자 정보 수정</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/admin/account/edit" method="post">
				<div class="form-group">
				관리자번호 : ${adminDto.admin_no} 
				<input type="hidden" name="admin_no" value="${adminDto.admin_no}">
				</div>
				<div class="form-group">
				관리자아이디 :${adminDto.admin_id} 
				</div>
				<div class="form-group">
				 관리자 비밀번호 :
				<input type="text" class="form-control" name="admin_pw" value="${adminDto.admin_pw}">
				</div>
				<div class="form-group">
				관리자 이름:
				<input type="text" class="form-control" name="admin_name" value="${adminDto.admin_name}">
				</div>
				<div class="form-group">
				<input type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>