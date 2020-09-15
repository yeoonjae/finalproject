<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${not empty admininfo.admin_auth}">
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>	
</c:when>
<c:when test="${not empty memberinfo}">
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>	
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>	
</c:otherwise>
</c:choose>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">이메일 찾기</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/find_email" method="post">
				<div class="form-group">
				회원 이름:
				<input type="text" class="form-control" name="member_name" placeholder="2~7자의 한글로 입력하세요" maxlength="21">
				</div>
				<div class="form-group">
				<input type="submit" value="이메일 찾기" required>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>