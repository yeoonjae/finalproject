<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" -->
<!-- 	crossorigin="anonymous"></script> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 결제 페이지</title>
<script>
	$(function() {

		// 이용권 선택 시 
		$(".license_type").change(function() {
			//console.log($(this).data().time);

			var price = $(this).data().price; // 가격 불러오기 
			var time = $(this).data().time;// 시간 불러오기 
			var price2 = price.toLocaleString(); // 세자리 단위로 , 붙이기 

			$(".time").text(time); // 시간 설정 
			$(".price").text(price2); //가격 설정

			$(".total_price").text(price2); // 최종 결제 금액으로 이용권 가격 설정 

		});

		// 마일리지 값 입력할 때마다 
		$(".use_point").on("input",function(){
			//console.log($(this).val());
			var use_point = $(this).val(); // 회원 마일리지 값 읽어오기 
			var member_point = $(".use_all_point").data().point;
			
			console.log("회원 마일리지 :"+member_point);
			console.log("입력 금액 : "+use_point);
			
			$(".use_point").text(use_point); // 마일리지 할인 금액에 해당 값 설정 
			
			// 입력 마일리지 > 회원 마일리지 일 경우 
			if(parseInt(use_point)> parseInt(member_point)){ // 숫자로 변환 
				alert("사용 가능 마일리지는"+member_point+"P 입니다.");
				$(".use_point").val("");
				$(".use_point").text("");
			}
			
		})
				
		// 전액 사용 버튼 눌렀을 때 
		$(".use_all_point").click(function() {

			var point = $(this).data().point;
			$(".use_point").val(point+"원");

			//console.log($(".use_point").val());
		});

	});
</script>
<style>
	.container{
		width: 100%;
		height: auto;
		margin-bottom:10%;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>이용권 결제</h1>
		<hr>

		<div> 
			<!-- 이용권 선택  -->
			<div id="license">
				<h3>상품 선택</h3>

				<div id="license_select">
					<c:forEach var="licenseDto" items="${list}">
						<div>
							<input type="radio" class="license_type" name="license"
								data-time="${licenseDto.license_time}" data-price="${licenseDto.license_price}"> 
							<span>${licenseDto.license_time}시간</span>
							<span>${licenseDto.license_price}원</span> <br>
						</div>
					</c:forEach>
				</div>

			</div>
			<hr>

			<!-- 이용권 구매정보 -->
			<div id="info">
				<h3>좌석 이용권 구매정보</h3>

				<table border="1">
					<tr>
						<td>지점명</td>
						<td><span>${memberBranchDto.branch_name}</span></td>
					</tr>
					<tr>
						<td>시간</td>
						<td><span class="time">선택없음</span></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><span class="price">선택없음</span></td>
					</tr>
				</table>
			</div>
			<hr>

			<!-- 마일리지 사용 -->
			<div>
				<h3>마일리지 사용</h3>
				<div>
					<div>
						<input type="text" class="use_point" name="" placeholder="0원">
					</div>
					<div>
						(사용 가능 마일리지 : <span> ${memberBranchDto.member_point}P</span>)
					</div>
					<div>
						<input type="button" class="use_all_point"
							data-point=" ${memberBranchDto.member_point}" value="전액 사용">
					</div>
				</div>
			</div>
			<hr>

			<!--  쿠폰 사용  -->
			<div>
				<h3> 쿠폰 사용 </h3>
				<div>
					
				</div>
			</div>
			<hr>
				
			<!--  총 결제금액  -->
			<div>
				<h3>결제 금액</h3>
				<div>
					<table>
						<tr>
							<td>상품 금액</td>
							<td><span class="price">0</span><span>원</span></td>
						</tr>
						<tr>
							<td>쿠폰 할인</td>
							<td>
								(-)<span></span><span>원</span>
							</td>
						</tr> 
						<tr>
							<td>마일리지 사용</td>
							<td>
								(-)<span class="use_point"></span><span>원</span>
							</td>
						</tr>
						<tr>
							<td>최종 결제 금액</td>
							<td><span class="total_price">0</span><span>원</span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>