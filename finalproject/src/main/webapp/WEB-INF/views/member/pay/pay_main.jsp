<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!-- 	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>


<script>
	$(function() {

		// 이용권 선택
		$(".license_type").change(function() {

			var price = $(this).data().price; // 가격 불러오기 
			var time = parseInt($(this).data().time);// 시간 불러오기 
			var price2 = price.toLocaleString();// 세자리 단위로 , 붙이기
			var no = $(this).data().no;
			var point = parseInt(0);

			$(".time").text(time + "시간").css("font-weight", "bold"); // 시간 설정 
			$(".price").text(price2 + "원").css("font-weight", "bold"); //가격 설정

 			$(".use_point").val(""); // 마일리지 초기화 
 			$(".use_point").text(""); // 사용 마일리지 초기화 
			
			// 최종 결제금액 설정 
			var total_price = calcResult();
			$(".total_price").text(total_price);
			// 최종 할인금액 설정
			var sale_price = salePrice();			
			//적립금 계산 
			var reward = pointReward();
			$(".reward").text(reward);
			
			// 카카오페이에 전송
			$(".total_amount").val(total_price);
			$(".sale_price").val(sale_price);
			$(".use_point2").val(point);
			$(".reward").val(reward);
			$(".item_name").val(time + "시간 이용권");
			$(".license_no").val(no);
			$(".license_time").val(time);
			
		});

		// 마일리지 값 입력
		$(".use_point").on("input", function() {
			// 상품이 선택되어 있지 않은 경우 경고창 띄우기 
			if (isChecked() == false) {
				alert("상품을 선택하세요.");
				$(".use_point").val("");
			} 
			else {
				var totalPrice = calcResult(); //최종 결제 금액 계산값 읽어오기
				var license_price = $("input[name=license]:checked").data("price");
				var use_point = parseInt($(this).val()); // 입력 마일리지 값 읽어오기 
				
				var member_point = $(".use_all_point").data().point; //회원 보유 마일리지 값 
				var member_point2 = parseInt(member_point).toLocaleString(); //소수점 찍기 				

				$(".use_point").text(use_point); // 마일리지 할인 금액에 해당 값 설정 
				$(".total_price").text(totalPrice);

				///// 입력 마일리지 > 회원 마일리지 일 경우 
				if (use_point > parseInt(member_point)) { // 숫자로 변환 
					var use_point=0;
					$(".use_point").val("");
					$(".use_point").text("");

					$(".total_price").text(license_price);
					totalPrice = license_price;
					alert("사용 가능 마일리지는 " + member_point2 + "P 입니다.");
				}
				////// 입력 마일리지 > 총 가격 일 경우
				if(use_point > totalPrice){
					use_point=0;
					$(".use_point").val("");
					$(".use_point").text("");

					$(".total_price").text(license_price);
					totalPrice = license_price;
					alert("마일리지는 총 결제금액을 초과하여 사용할 수 없습니다.");
				}
				
				if(isNaN(use_point)){
					use_point=0;
					$(".use_point").val("");
					$(".use_point").text("");

					$(".total_price").text(license_price);
					totalPrice = license_price;
				}

				// 최종 할인금액 계산
				var sale_price = salePrice();
				
				//적립금 계산
				var reward = pointReward();
				$(".reward").text(reward);
				
				// 카카오페이에 최종 결제금액+최종 할인금액 전송
				$(".total_amount").val(totalPrice);
				$(".sale_price").val(sale_price);
				$(".use_point2").val(use_point);
				$(".reward").val(reward);
				
				console.log("총가격"+totalPrice);
				console.log("적립"+reward);
				console.log("사용포인트"+use_point);
			}
		});

		// 마일리지 전액 사용 버튼 선택  
		$(".use_all_point").click(function() {
			if (isChecked() == false) {
				alert("상품을 선택하세요.");
				$(".use_point").val("");
			} 
			else {
				// 총 결제금액 계산  
				var total_price = calcResult();
				var point = $(this).data().point;
				
				// 적립금이 총 결제금액보다 많을 경우 
				if (total_price < point) {				
					$(".use_point").val(total_price);
					$(".use_point").text(total_price);

					point = total_price;
					total_price = total_price - point;
				} 
				else { 
					$(".use_point").val(point);
					$(".use_point").text(point);

					total_price = calcResult();
				}
				$(".total_price").text(total_price);
				
				// 최종 할인금액 계산
				var sale_price = salePrice();
				
				//적립금 계산 
				var reward = pointReward();
				$(".reward").text(reward);				

				// 카카오페이에 최종 결제금액 전송
				$(".total_amount").val(total_price);
				$(".sale_price").val(sale_price);
				$(".use_point2").val(point);
				$(".reward").val(reward);
				
				console.log("총가격"+total_price);
				console.log("적립"+reward);
				console.log("사용포인트"+point);
			}
		});

	});

	//전체를 계산하는 함수
	// - 상품 정보 확인
	// - 마일리지 여부 확인
	// - 최종 금액 계산
	function calcResult() {
		var license = $("input[name=license]:checked").data("price");
		var point = $("input.use_point").val() || 0;
		var total_price = parseInt(license) - parseInt(point);
		
		return total_price;
	}

	// 체크 여부 판단
	function isChecked() {
		var is = $("input:radio[name='license']").is(":checked");
		//console.log(is);
		return is; // 체크가 되어있지 않으면 false반환
	}

	// 적립예정 포인트 계산 
	function pointReward() {
		var total_price = $(".total_price").text();
		var reward = parseInt(parseInt(total_price) * 0.02);
		//console.log(reward);

		return reward;
	}
	
	// 할인 금액 계산 
	function salePrice(){
		var point = $("input.use_point").val() || 0;
		var coupon = 0;		
		var sum = parseInt(point) + parseInt(coupon);
		return sum;
	}

	
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

/* 	input[type="radio"]:checked + .fontBold{ */
/* 			font-weight: bold; */
/* 	} */

/* 	.container{ */
/* 		box-sizing:border-box; */
/* 		width: 100%; */
/* 		height: auto; */
/* 		margin-bottom:10%; */
/* 		margin-top:5%; */
/* 		padding-left:3%; */
/* 		padding-right:3%; */
/* 		font-family:'Noto Sans KR'; */
/* 	} */
.container {
	font-family: 'Noto Sans KR';
}

.bold {
	font-weight: bold;
}

.padding10 {
	padding-left: 10%;
}

.padding7 {
	padding-left: 7%;
}

.padding5 {
	padding-top: 5%;
}

.padding3 {
	padding-top: 3%;
}

.float_right {
	float: right;
}

.float_left {
	float: left;
}

.detail {
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 5%;
	color: #4f4d48;
}

.pay_way {
	padding-top: 3%;
	padding-left: 5%;
}

.use_design {
	width: 40%;
	height: 50px;
	border: 1px solid #ebebeb;
	font-size: 17px;
}

.use_point {
	
}

.subContainer {
	box-sizing: border-box;
	width: 60%;
	height: auto;
	padding-top: 1%;
	padding-bottom: 2%;
}

.result {
	box-sizing: border-box;
	background-color: #f7f7f7;
	width: 38%;
	padding: 5%;
	/*  		position:fixed;  */
	/*  		right: 17%;  */
	/*  		bottom:20px;  */
}

.licenseContainer {
	width: 80%;
	height: 10px;
}

.licenseTime {
	text-align: left;
	width: 60%;
	padding-top: 2%;
	font-size: 17px;
}

.licensePrice {
	text-align: left;
	width: 40%;
	padding-top: 2%;
	font-size: 17px;
}

.infoContainer {
	width: 100%;
	font-size: 17px;
}

.info {
	padding-left: 15%;
}

.resultContainer {
	width: 100%;
	background-color: #f7f7f7;
	padding: 10%;
}

.resultType {
	text-align: left;
	width: 45%;
	padding-bottom: 3%;
	color: #999999;
	font-size: 17px;
}

.resultPrice {
	text-align: right;
	width: 50%;
	padding-bottom: 3%;
}

.resultFont {
	font-size: large;
	font-weight: bold;
}

.total_price {
	color: red;
	font-size: 30px;
}

.width50 {
	width: 60%;
}
</style>
<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">
					<div>
						<!-- 			<h1>이용권 결제</h1> -->
						<hr>

						<!--  총 결제금액  -->
						<div class="result float_right">

							<!-- 결제 내역 -->
							<table class="resultContainer">
								<tr>
									<td class="resultType">상품 금액</td>
									<td class="resultPrice"><span class="resultFont price">0원</span>
									</td>
								</tr>
								<tr>
									<td class="resultType">쿠폰 할인</td>
									<td class="resultPrice">(-) <span></span> <span>원</span>
									</td>
								</tr>
								<tr>
									<td class="resultType">마일리지 사용</td>
									<td class="resultPrice">(-) 
									<span
										class="resultFont use_point"></span> <span>원</span>
									</td>
								</tr>
								<tr>
									<td class="resultType">최종 결제 금액</td>
									<td class="resultPrice">
									<span class="resultFont total_price">0</span> 
									<span style="color: red">원</span></td>
								</tr>
							</table>
							<hr>

							<!--  구매 혜택  -->
							<div>
								<h4 class="bold">구매혜택</h4>
								<div>
									<div class="detail">
										<p>총 결제금액의 2%가 적립됩니다.</p>
										<span>적립예정 마일리지 :</span> <span class="reward bold">0</span><span
											class="bold">P</span>
									</div>
									<hr>
								</div>
							</div>

							<!--  결제 정보 입력 -->
							<div>
								<h4 class="bold">결제정보입력</h4>
								<div class="detail">결제 수단을 선택하신 후 구매하기 버튼을 클릭하세요.</div>
								<div class="pay_way">
									<input type="checkbox" checked> <Label>카카오페이</Label>&nbsp;&nbsp;&nbsp;

									<input type="checkbox"> <Label>무통장입금</Label>
								</div>
							</div>
							<hr>

							<div align="right">
								<!--  카카오페이에 상품명, 총 금액 전송  -->
								<form action="prepare" method="post">
									<input type="hidden" name="reward" class="reward"><!--  적립금  -->
									<input type="hidden" name="use_point2" class="use_point2"> <!--  사용한 마일리지  -->
									<input type="hidden" name="sale_price" class="sale_price"><!-- 할인 금액 -->
									<input type="hidden" name="license_time" class="license_time"> <!-- 이용권 번호 -->
									<input type="hidden" name="license_no" class="license_no"> <!-- 이용권 번호 -->
									<input type="hidden" name="item_name" class="item_name"><!-- 상품명 -->
									<input type="hidden" name="total_amount" class="total_amount"><!-- 총 결제금액 -->
									<input type="submit" value="구매하기" class="btn btn-primary">
								</form>
							</div>

						</div>


						<div>
							<!-- 이용권 선택  -->
							<div>
								<h4 class="bold">상품 선택</h4>

								<div class="col-md-6">
									<div class="about_accordion wow fadeIn">
										<div id="faq_main_content" class="faq_main_content">
											<h6>
												<i class="fa fa-angle-right"></i>상품을 선택하세요.
											</h6>
											<div>
												<div class="content">
													<c:forEach var="licenseDto" items="${list}">
														<table class="licenseContainer">
															<tr>
																<td class="licenseTime"><input type="radio"
																	class="license_type" name="license"
																	data-time="${licenseDto.license_time}"
																	data-price="${licenseDto.license_price}"
																	data-no="${licenseDto.license_no}"> <span
																	class="padding7 fontBold">${licenseDto.license_time}시간</span>
																</td>
																<td class="licensePrice">
																<span class="fontBold"><fmt:formatNumber value="${licenseDto.license_price}" pattern="#,###" />원</span>
																</td>
															</tr>
														</table>
													</c:forEach>
												</div>
												<!-- End off accordion item-1 -->
											</div>
										</div>
									</div>
								</div>

							</div>

							<hr align="left" class="width50">


							<!-- 이용권 구매정보 -->
							<div class="subContainer">
								<h4 class="bold">좌석 이용권 구매정보</h4>

								<div class="padding5">
									<table class="infoContainer">
										<tr>
											<td>지점명</td>
											<td class="info bold"><span>|</span> <span>${memberBranchDto.branch_name}</span>
											</td>
										</tr>
										<tr>
											<td>시간</td>
											<td class="info"><span>|</span> <span class="time bold">선택없음</span>
											</td>
										</tr>
										<tr>
											<td>가격</td>
											<td class="info"><span>|</span> <span class="price bold">선택없음</span>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<hr align="left" class="width50 align_left">

							<!-- 마일리지 사용 -->
							<div class="subContainer">
								<h4 class="bold">마일리지 사용</h4>
								<div>
									<div class="padding5 ">
										<input type="text" class="use_point use_design" placeholder="0원"> 
										<span> 
											<input type="button" class="use_all_point btn btn-primary" data-point=" ${memberBranchDto.member_point}" value="전액 사용">
										</span>
									</div>
									<div>
										(사용 가능 마일리지 : <span style="color: red"><fmt:formatNumber value="${memberBranchDto.member_point}" pattern="#,###" />P</span> )
									</div>
								</div>
							</div>
							<hr align="left" class="width50">

							<!--  쿠폰 사용  -->
							<div>
								<h4 class="bold">쿠폰 선택</h4>
							</div>


						</div>
						<!--End off row -->
					</div>
					<!--End off container -->
				</div>
			</div>
		</div>
	</section>
	<!--End off Featured section-->
</main>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
