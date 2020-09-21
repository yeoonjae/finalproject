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

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container {
	font-family: 'Noto Sans KR';
}

.table2 {
	font-size: 15px;
	text-align: center;
	line-height: 3;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
	border-left: 2px solid #ddd;
	border-right: 2px solid #ddd;
}

.table3 {
	font-size: 15px;
	text-align: center;
	line-height: 3;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
}

.width50 {
	width: 50%;
}

.red {
	color: #ed4b42;
}

.left {
	text-align: left;
}

.bold {
	font-weight: bold;
}

.lg {
	font-size: large;
}

.font20 {
	font-size: 20px;
}

.blue {
	color: #252399;
}
.brown{
	color:#b59e79; 
}
.padding20 {
	padding-left: 20px;
}

.padding3 {
	padding-top: 3%;
	padding-bottom: 3%;
}


/* .hr_bold{ */
/* 	border:0; */
/* 	height:2px; */
/* 	background-color:#ddd;  */
/* } */
.black {
	color: black;
}
.fontC{
	font-family: '나눔바른고딕';
	font-size: 20px;
	margin-bottom:40px;
}
.fontD {
	font-family: '나눔바른고딕';
	font-size: 30px;
}

.float_right {
	float: right;
}

.float_left {
	float: left;
}
.gray2{
	background-color:#ebebeb;
}
.result {
	box-sizing: border-box;
	background-color: #f7f7f7;
	width: 30%; 
	padding: 5%;
	margin-top: 30px; 
	/*  		position:fixed;  */
	/*  		right: 17%;  */
	/*  		bottom:20px;  */
}
.resultContainer {
	width: 100%;
	background-color: #f7f7f7;
	padding: 10%;
}
.resultType {
	text-align: left;
	width: 45%;
	padding-bottom: 7%;
	color: #999999;
	font-size: 17px;
}

.resultPrice {
	text-align: right;
	width: 50%;
	padding-bottom: 7%; 
	font-size: 20px;
}
.cancelPrice {
	text-align: right;
	width: 50%;
	padding-top:15%; 
	padding-bottom: 15%;
	font-size: 27px;
}
.cancel {
	text-align: left;
	width: 45%;
	padding-top:15%;
	padding-bottom: 15%;
	font-size: 20px;
}

.width100{
	width:100%;
}

.width90{
	width:90%;
}

.center{
	text-align:center;
}
.right{
	text-align:right;
	padding-right:5%;
}
</style>

<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">
					<div class="card-body offset-2 col-8">
						<br>
						
						<!--  주문 상세 내역 -->
						<div class="fontD bold">주문 상세 내역 조회</div>
						<br>
						<div class="table-responsive">
							<table class="table2" width="100%" cellspacing="0">
							<c:set var="status" value="${payInfoDto.pay_his_state}" />
								<thead class="bold gray2">
									<tr>
										<td width="20%">상품금액</td>
										<td width="10%">포인트</td>
										<td width="10%">쿠폰</td>
										<td width="10%">총 할인금액</td>
										<td width="10%">적립금</td>
										<td width="10%">결제 수단</td>
										<c:choose>
											<c:when test="${status eq '결제취소'}"> 
												<td class="red lg" width="20%">총 취소금액</td>
											</c:when>
											<c:otherwise>
												<td class="red lg" width="20%">총 결제금액</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</thead>
								<tbody class="gray"> 
									<tr>
										<td class="bold lg"><fmt:formatNumber value="${payInfoDto.license_price}" pattern="#,###" /></td>
										<td>(-)${payInfoDto.pay_use_point}P</td>
										<td>(-)<fmt:formatNumber value="${payInfoDto.coupon_discount}" pattern="#,###" /></td>
										<td class="red">(-)<fmt:formatNumber value="${payInfoDto.pay_his_discount}" pattern="#,###" /></td>
										<td class="blue">(+)${payInfoDto.reward}P</td>
										<td>${payInfoDto.pay_his_method}</td>
										<c:choose>
											<c:when test="${status eq '결제취소'}"> 
												<td class="red bold lg">(-)<fmt:formatNumber value="${payInfoDto.pay_his_price}" pattern="#,###" /></td>
											</c:when>
											<c:otherwise>
												<td class="red bold lg"><fmt:formatNumber value="${payInfoDto.pay_his_price}" pattern="#,###" /></td>
											</c:otherwise>
										</c:choose>
										
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br> <br>
	
						<hr class="hr_bold">
						<!--  주문 정보 출력  -->
						<div class="width50 float_left">
							<div class="font20 bold">주문 정보</div>
							<br>
							<div class="table-responsive">
								<table class="table3 table-hover width90" cellspacing="0">
									<thead class="width50">
										<tr>
											<th class="width50 padding20">주문번호</th>
											<td class="width50 left">${historyVO.tid}</td>
										</tr>
										<tr>
											<th class="width50 padding20">주문일자</th>
											<td class="width50 left">${payInfoDto.pay_his_date2}</td>
										</tr>
										<tr>
											<th class="width50 padding20">주문자</th>
											<td class="width50 left">${payInfoDto.member_name}</td>
										</tr>
										<tr>
											<th class="width50 padding20">주문상태</th> 
											<td class="width50 left">
												<c:choose>
													<c:when test="${status eq '결제취소'}"> 
														<span class="red bold">${payInfoDto.pay_his_state}</span>
													</c:when>
													<c:otherwise>
														<span class="blue bold">${payInfoDto.pay_his_state}</span>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
								</table>
							</div>
							<br>
						</div>

						<!-- 상품 정보 출력  -->
						<div>
							<div class="font20 bold width40">상품 정보</div> 
							<br> 
							<div class="table-responsive">
								<table class="table3  table-hover width90" cellspacing="0"> 
									<thead class="width50">
										<tr>
											<th class="width50 padding20">상품명</th>
											<td class="width50 left">${payInfoDto.license_time}시간</td>
										</tr>
										<tr>
											<th class="width50 padding20">상품가격</th>
											<td class="width50 left"><fmt:formatNumber value="${payInfoDto.license_price}" pattern="#,###" /></td>
										</tr>
								</table>
							</div>
						</div>
						
						<br><br>
						
						 <div class="right"> 							
							<a href="${pageContext.request.contextPath}/member/pay/pay_detail">
							<button class="btn btn-primary">목록으로 돌아가기</button></a>
						 </div>

					</div>
				</div>
			</div>
		</div>
	</section>
</main>


<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>


