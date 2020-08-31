<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 목록</title>
</head>
<body>
	<h1> 이용권 목록 </h1>
	<c:forEach var="licenseDto" items="${list}">
		<div>
			${licenseDto.license_no}) ${licenseDto.license_time}시간 ${licenseDto.license_price}원 
			<a href="license_edit/${licenseDto.license_no}">수정</a>
			<a href="license_delete/${licenseDto.license_no}">삭제</a>
		</div>
	</c:forEach>
</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include> --%>