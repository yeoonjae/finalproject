<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">비밀번호 확인</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/check_delete" method="post">
				<div class="form-group">
				회원 비밀번호 : <input type="password" class="form-control" name="member_pw">
				</div>
				<div class="form-group">
				<input type="submit" value="확인">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>