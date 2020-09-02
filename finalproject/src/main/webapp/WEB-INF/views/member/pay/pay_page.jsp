<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이용권 결제 페이지</title>
	<script>
	
	</script>
</head>
<body>
<div>

	<div>
		<h1>이용권 결제</h1>
		<hr>
		
		<!-- 이용권 선택  -->
		<div id="license">
			<h3> 상품 선택</h3>
					
			<div id="license_select">
				<c:forEach var="licenseDto" items="${list}">
					<div>
						<input type="radio" name="1" value="${licenseDto.license_time}">
						<span>${licenseDto.license_time}시간 </span>
						<span>${licenseDto.license_price}원</span>
						<br>	
					</div>
				</c:forEach>
			</div>
			
		</div>
		<hr>
		
		<!-- 이용권 구매정보 -->
		<div id="info">
			<h3> 좌석 이용권 구매정보</h3>
			
			<table>
				<tr>
					<td>지점명</td>
					<td>초심 미아뉴타운점</td>
				</tr>
				<tr>
					<td>상품</td>
					<td> 6시간</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>5000원</td>
				</tr>
			</table>		
		</div>	
	</div>
	
</div>
	
</body>
</html>