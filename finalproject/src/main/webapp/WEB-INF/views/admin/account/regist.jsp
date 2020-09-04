<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">계정 등록</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/admin/account/regist" method="post">
					<div class="form-group">
						<label>관리자 번호 : ${admin_no+1}</label>
						<input type="hidden" name="admin_no" value="${admin_no+1}">
					</div>
					<div class="form-group">
						<label>아이디 : study${admin_no+1}</label>
						<input type="hidden" name="admin_id" required value="study${admin_no+1}">
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input class="form-control" type="text" name="admin_pw" required value="study${admin_no+1}">
					</div>
					<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" name="admin_name" required value="study${admin_no+1}">
					</div>
				<div class="form-group">
					<label>이메일</label>
					<input type="email" class="form-control" name="email" placeholder="이메일" required>
				</div>
				<div class="form-group">
					<input type="submit" value="계정 등록 /이메일 발송">
				</div>	
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>