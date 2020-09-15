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
			<li class="breadcrumb-item">인증번호 확인</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/find_pw_check" method="post">
				<div class="form-group">
				인증번호 확인
				<br>
				member_email: ${member_email}
				<input type="hidden" class="from-control" name="member_email" value="${member_email}">
				<input type="text" class="form-control" name="secret"  maxlength="6">
				</div>
				<div class="form-group">
				<input type="submit" value="인증하기" required>
				</div>
				<c:if test="${not empty param.error}">
            	<div class="form-label-group">
            		<font color="FF0000">입력하신 인증번호가 맞지  않거나 인증시간이 초과되었습니다.</font>
            	</div>
            </c:if>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>