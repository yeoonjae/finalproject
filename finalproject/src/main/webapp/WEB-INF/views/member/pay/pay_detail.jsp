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

	.container{
		font-family: 'Noto Sans KR';
	}
	
	.tContainer{
		width:100%;
		border:1px solid lightgray;
		text-align:center;
		height:auto;
	}
	
</style>
<script>
	function AddComma(data_value) {
		return Number(data_value).toLocaleString();
	}

</script>
<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">
				<h3> 결제 내역 조회 </h3>
						<table class="tContainer">
						<tr>
							<td>주문번호</td>
							<td>주문일</td>
							<td>상품명</td>
							<td>상품 금액</td>
							<td>할인 금액</td>
							<td>결제 금액</td>
<!-- 							<td>적립 포인트</td> -->
							<td>상태</td>
						</tr>
						<c:forEach var="payInfoDto" items="${list}">
						<tr>
							<td>${payInfoDto.tid_no}</td>
							<td>${payInfoDto.pay_his_date.toLocaleString()}</td>
							<td>${payInfoDto.license_time}시간 이용권</td>
							<td>${payInfoDto.license_price}</td>
							<td>${payInfoDto.pay_his_discount}</td>
							<td>${payInfoDto.pay_his_price}</td>
<%-- 							<td>${payHisDto.}</td> --%>
							<td>${payInfoDto.pay_his_state}</td>
						</tr>
						</c:forEach>
					</table>


				</div>
			</div>
		</div>
	</section>
</main>


<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
