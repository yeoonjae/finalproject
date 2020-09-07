<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div id="content-wrapper">
	<div class="container-fluid" >
		<ol class="breadcrumb">
			<li class="breadcrumb-item">회원가입</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/join" method="post">
				<div class="form-group">
				<input type="hidden" name="member_no" value="${member_no+1}">
				</div>
				<div class="form-group">
				회원 이메일 : 
				<input type="email" class="form-control" name="member_email">
				</div>
				<div class="form-group">
				회원 이름:
				<input type="text" class="form-control" name="member_name">
				</div>
				<div class="form-group">
				회원 비밀번호 :
				<input type="text" class="form-control" name="member_pw">
				</div>
				<div class="form-group">
				<input type="submit" value="가입">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>