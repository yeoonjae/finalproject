<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <jsp:include page="/WEB-INF/views/member/template/header.jsp"></jsp:include> --%>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
<!-- 	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" -->
<!-- 	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" -->
<!-- 	crossorigin="anonymous"></script> -->
<script>
	$(function() {

		// 상품이 선택되어 있지 않은 경우 경고창 띄우기 
		$(".use_point").on("input",function() {
			if(isChecked()==false){
				alert("상품을 선택하세요.");
				$(".use_point").val("");
			}
		});
		
		// 이용권 선택
		$(".license_type").change(function() {
			
			//CSS 설정 
			//$(this).children().css("font-weight","bold");
			var price = $(this).data().price; // 가격 불러오기 
			var time = $(this).data().time;// 시간 불러오기 
			var price2 = $(this).data().price.toLocaleString();// 세자리 단위로 , 붙이기
			var totalPrice = calcResult(); 		
			
			
			$(".time").text(time+"시간").css("font-weight","bold"); // 시간 설정 
			$(".price").text(price2+"원").css("font-weight","bold"); //가격 설정
			
			
			$(".total_price").text(totalPrice); // 최종 결제 금액으로 이용권 가격 설정 
			$(".use_point").val(""); // 마일리지 초기화 
			$(".use_point").text(""); // 사용 마일리지 초기화 
			
			var reward = pointReward();
			$(".reward").text(reward);
			
			console.log(totalPrice);
			console.log(reward);
			console.log("---");
			
			// 마일리지 값 입력
			$(".use_point").on("input",function() {

				var use_point = $(this).val(); // 입력 마일리지 값 읽어오기 
				var member_point = $(".use_all_point").data().point; //회원 보유 마일리지 값 
				
				//console.log("회원 마일리지 :"+member_point);
				console.log("입력 금액 : "+use_point);
				
				$(".use_point").text(use_point); // 마일리지 할인 금액에 해당 값 설정 
				
				///// 입력 마일리지 > 회원 마일리지 일 경우 
				if(parseInt(use_point)> parseInt(member_point)){ // 숫자로 변환 
					alert("사용 가능 마일리지는"+member_point+"P 입니다.");
				
					$(".use_point").val("");
					$(".use_point").text("");
					$(".total_price").text(price);
				}
				
				var total_price = calcResult();
				// 최종 결제금액 설정 
				$(".total_price").text(total_price);

				var reward = pointReward();
				//적립예정 금액 설정
				$(".reward").text(parseInt(reward));
				//console.log("이용권 가격 : "+$(".total_price").text());
				//console.log("입력 마일리지 : "+ parseInt($(".use_point").val()));
				//console.log("총 결제 금액" +  totalPrice);
				//console.log("---")
					


			});
					
			// 마일리지 전액 사용 버튼 선택  
			$(".use_all_point").click(function() {

				var point = $(this).data().point;
				$(".use_point").val(point);
				$(".use_point").text(point);
				
				var total_price = calcResult();
				// 최종 결제금액 설정 
				$(".total_price").text(total_price);
				
				var reward = pointReward();
				
				$(".reward").text(reward);
			});
			
		});

	});
	
	//전체를 계산하는 함수
	// - 상품 정보 확인
	// - 마일리지 여부 확인
	// - 최종 금액 계산
	function calcResult(){
		var license = $("input[name=license]:checked").data("price");
		//console.log("license", license);		
		var point = $("input.use_point").val() || 0;
		//console.log("point",point);	
		var total_price = parseInt(license)-parseInt(point);
		
		return total_price;
	}
	
	// 체크 여부 판단
	function isChecked(){
		var is = $("input:radio[name='license']").is(":checked");
		//console.log(is);
		return is; // 체크가 되어있지 않으면 false반환
	}
	
	// 적립예정 포인트 계산 
	function pointReward(){
		var total_price = $(".total_price").text();
		var reward = parseInt(total_price) * 0.02;
		//console.log(reward);

		return reward;	
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
	
	.bold{
		font-size:bold;
	}
	
	.padding10{
		padding-left:10%;
	}
	
	.padding7{
		padding-left:7%;
	}
	.padding5{
		padding-top:5%;
	}
	.padding3{
		padding-top:3%;
	}

	.float_right {
		float : right;
	}
	
	.float_left {
		float : left;
	}
	
	.detail{
		padding-left:5%;
		padding-right:5%;
		padding-top:5%;
		color:#4f4d48;
	}
	
	.pay_way{
		padding-top:3%;
		padding-left:5%;
	}
	
	.use_point{
		width: 50%;
	}
	
	.subContainer{
		box-sizing:border-box;
		width:50%;
		height: auto;
		padding-top:1%;
		padding-bottom:2%;

	} 
	
	.result{
		box-sizing:border-box;
		background-color:#f7f7f7;
		width:28%;
		padding:2%;
/*  		position:fixed;  */
/*  		right: 17%;  */
/*  		bottom:20px;  */
	}
 
	.licenseContainer{
		width : 50%; 
		height: 10px;
	}

	.licenseTime{
		text-align : left;
		width:60%;
		padding-top:2%;
		font-size:17px;
	}
	
	.licensePrice{
		text-align : left;
		width:25%;
		padding-top:2%;
		font-size:17px;
	}
 
 	.infoContainer{
 		width:100%;
 	}
 	.info{
 		padding-left:15%;
 	}

	.resultContainer{
 		width : 100%; 
		background-color:#f7f7f7;
	}
	
	.resultType{
		text-align : left;
		width:45%;
		padding-bottom:3%;
		color:#999999;
	} 
	
	.resultPrice{
		text-align : right;
		width:50%;
		padding-bottom:3%;
		
	}

	.resultFont{
		font-size: large;
		font-weight: bold;
	}
	.total_price{
		color:red;
		font-size:30px; 
	}
	
	.width50{
		width:60%;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>이용권 결제</h1>
		<hr>
				<!--  총 결제금액  -->
				<div class="result float_right">
				
				<!-- 결제 내역 -->
					<table class="resultContainer">
						<tr>
							<td class="resultType">상품 금액</td>
							<td class="resultPrice">
								<span class="resultFont price">0원</span>
							</td>
						</tr>
						<tr>
							<td class="resultType">쿠폰 할인</td>
							<td class="resultPrice">
								(-)
								<span></span>
								<span>원</span>
							</td>
						</tr> 
						<tr>
							<td class="resultType">마일리지 사용</td>
							<td class="resultPrice">
								(-)
								<span class="resultFont use_point"></span>
								<span>원</span>
							</td>
						</tr>
						<tr>
							<td class="resultType">최종 결제 금액</td>
							<td class="resultPrice">
								<span class="resultFont total_price">0</span>
								<span style="color:red">원</span>
							</td>
						</tr>
					</table>
					<hr>
					
					<!--  구매 혜택  -->
					<div>
						<h4>구매혜택</h4>
						<div>
							<div class="detail">
								<span class="padding5">적립예정 포인트 : <span class="reward">0</span>P</span>
							</div><hr>
						</div> 
					</div>
					 
					 <!--  결제 정보 입력 -->
					<div>
						<h4> 결제정보입력 </h4>
							<div class="detail"> 결제 수단을 선택하신 후 구매하기 버튼을 클릭하세요.</div>
						<div class="pay_way" >
							<input type="checkbox" checked> 
								<Label>카카오페이</Label>&nbsp;&nbsp;&nbsp;

							<input type="checkbox"> 
								<Label>무통장입금</Label>
						</div>
					</div>
					<hr>
					
					<div align="right">
						<input type="button" value="구매하기" class="btn btn-default">
					</div>
					
				</div>


		<div> 
			<!-- 이용권 선택  -->
			<div class="subContainer">
				<h4>상품 선택</h4> 

				<div class="padding3">
					<c:forEach var="licenseDto" items="${list}">
							<table class="licenseContainer">
								<tr>
									<td class="licenseTime">
										<input type="radio" class="license_type" name="license"
											data-time="${licenseDto.license_time}" data-price="${licenseDto.license_price}">
										<span class="padding7 fontBold">${licenseDto.license_time}시간</span>			
									</td>
									<td class="licensePrice">
										<span class="fontBold">${licenseDto.license_price}원</span>
									</td>
								</tr>
							</table>	
					</c:forEach>
				</div>

			</div>
			<hr align="left" class="width50">


			<!-- 이용권 구매정보 -->
			<div class="subContainer">
				<h4>좌석 이용권 구매정보</h4>
				
				<div class="padding5">
				<table class="infoContainer">
					<tr>
						<td>지점명</td>
						<td class="info bold">
							<span>|</span>
							<span>${memberBranchDto.branch_name}</span>
						</td>
					</tr>
					<tr>
						<td>시간</td>
						<td class="info">
							<span>|</span>
							<span class="time bold">선택없음</span>
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td class="info">
							<span>|</span>
							<span class="price bold">선택없음</span>
						</td>
					</tr>
				</table>
				</div>
			</div>
			<hr align="left" class="width50 align_left">

			<!-- 마일리지 사용 -->
			<div class="subContainer">
				<h4>마일리지 사용</h4>
				<div>
					<div class="padding5 ">
						<input type="text" class="use_point" name="" placeholder="0원">
						<span>
							<input type="button" class="use_all_point btn btn-primary btn-sm"
							data-point=" ${memberBranchDto.member_point}" value="전액 사용">
						 </span>
					</div>
					<div>
						(사용 가능 마일리지 : 
						<span style="color:red"> ${memberBranchDto.member_point}P</span>
						)
					</div>
				</div>
			</div>
			<hr align="left" class="width50">

			<!--  쿠폰 사용  -->
			<div class = "subContainer">
				<h4> 쿠폰 사용 </h4>
				<div>
					
				</div>
			</div>

		</div>
	</div>
</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include> --%>
