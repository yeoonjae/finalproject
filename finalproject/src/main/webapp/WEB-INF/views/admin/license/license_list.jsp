<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 목록</title>
</head>
<body>
	<h1> 이용권 목록 </h1>
	<c:forEach var="licenseDto" items="${list}">
		<h3>${licenseDto.license_no}</h3>
		<h3>${licenseDto.license_time}</h3>
		<h3>${licenseDto.license_price}</h3>
	</c:forEach>
</body>
</html>