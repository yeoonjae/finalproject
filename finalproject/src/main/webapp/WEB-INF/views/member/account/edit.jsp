<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty admininfo.admin_auth}">
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>	
</c:if>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">회원 정보 수정</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/edit" method="post">
				<div class="form-group">
				회원번호 : ${memberDto.member_no} 
				<input type="hidden" name="member_no" value="${memberDto.member_no}">
				</div>
				<div class="form-group">
				회원 이메일 : ${memberDto.member_email}
				</div>
				<div class="form-group">
				회원 이름:
				<input type="text" class="form-control" name="member_name" value="${memberDto.member_name}">
				</div>
				<div class="form-group">
				회원 비밀번호 :
				<input type="text" class="form-control" name="member_pw">
				</div>
				<div class="form-group">
				<input type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>