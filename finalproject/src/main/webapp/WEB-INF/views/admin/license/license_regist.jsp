<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이용권 등록</title>
</head>
<body>
	<h1>이용권등록 페이지</h1>
	<form action="license_regist" method="post">
		시간 <input type="text" name="license_time"> <br>
		가격 <input type="text" name="license_price"> <br>
		<input type="submit"	value="이용권 등록">
	</form>
</body>
</html>