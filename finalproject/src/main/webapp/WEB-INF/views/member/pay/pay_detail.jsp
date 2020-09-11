<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	$(function(){
		
	});
</script>
  
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container {
	font-family: 'Noto Sans KR';
}

.red{
	color:#ed4b42;
}
.blue{
	color:#3962d4;
}
.bold{
	font-weight:bold;
}
.list-result{
	display: none;
	color: red;
	font-size: medium;
}
.list-result.on {
	display: inline-block;
}
.span-wrap{
	text-align: center;
}

.table2 {
	text-align: center;
    line-height: 3;
    border-top: 1px solid #ddd;
}
 
</style>

<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">
					<div class="card-body offset-2 col-8">
						<h4>결제 내역 조회</h4> 
						<div class="table-responsive">
							<table class="table2 table-bordered table-hover" width="100%" cellspacing="0"> 
								<thead>
									<tr>
										<td>No</td>
										<td width="17%">주문번호</td>
										<td>주문일</td>
										<td>상품명</td>
										<td>상품 금액</td>
										<td>할인 금액</td>
										<td>결제 금액</td>
										<td>적립금</td>
										<td>주문 상태</td>
										<td width="10%"></td>
									</tr>
								</thead>
								<tbody class="his-list check">
										<c:forEach var="payInfoDto" items="${list}"> 
										<tr>
											<td>${payInfoDto.pay_his_no}</td>
											<td>
												<a href="${pageContext.request.contextPath}/member/pay/history?tid=${payInfoDto.tid_no}">${payInfoDto.tid_no}</a>
											</td>
											<td>${payInfoDto.pay_his_date2}</td>
											<td>${payInfoDto.license_time}시간</td>
											<td><fmt:formatNumber value="${payInfoDto.license_price}" pattern="#,###" /></td>
											<td class="red">-${payInfoDto.pay_his_discount}</td>
											<td class="bold"><fmt:formatNumber value="${payInfoDto.pay_his_price}" pattern="#,###" /></td>
											<td class="blue">+${payInfoDto.reward}P</td>
											<td>${payInfoDto.pay_his_state}</td>
											<td>
											<c:set var="status" value="${payInfoDto.pay_his_state}" /> 
												<c:if test="${status eq '결제완료'}">
													<form action="delete" method="get">
														<input type="submit" value="결제취소" class="btn">
														<input type="hidden" name="cancel_amount" value="${payInfoDto.pay_his_price}"> 
														<input type="hidden" name="license_time" value="${payInfoDto.license_time}">
														<input type="hidden" name="tid" value="${payInfoDto.tid_no}">
														<input type="hidden" name="reward" value="${payInfoDto.reward}"> 
														<input type="hidden" name="pay_use_point" value="${payInfoDto.pay_use_point}">
													</form>
												</c:if>
											</td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 						<br> -->
						<!-- 						<br> -->
						<!-- 						<br> -->
						<!-- 						<br> -->
						<!-- 						<div class="span-wrap"> -->
						<!-- 							<span class="list-result">최근 일주일 간의 내역이 존재하지 않습니다</span> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
