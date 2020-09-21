<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script> -->
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
<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
	
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container {
	font-family: 'Noto Sans KR'; 
}
.brown{
	color:#b59e79; 
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
.roomy-300{
		padding-top:150px;
		padding-bottom:315px; 
}

.table2 {
	text-align: center;
    line-height: 3;
    border-top: 1px solid #ddd;
}
 .gray2{
	background-color:#f5f5f5;
}
.fontD {
	font-family: '나눔바른고딕';
	font-size: 40px;
}
.list-result{
	display: none;
	color: red;
	font-size: medium;
}
.list-result.on {
	display: inline-block;
}

.btn-list, .btn-date {
			vertical-align: middle;
			text-align: center;
			font-size: small;
			width: 75px;
			height: 35px;
			padding: 0.5rem;
		}
		
		.start, .finish {
			width: 28%;
			height: 35px;
			display: inline-block;
		}
		.start, .finish {
			margin-left: 10px;
			margin-right: 10px;
		}
		.inline-wrap{
			text-align: center;
			display: inline-block;
		}
		.btn-list {
			margin-left: 15px;
		}
		.detail-result{
			color: silver;
			font-size: x-small;
			display: inline-block;
		}



</style>
<script>
	$(function(){
		 
		// 기간 버튼 선택 시
    	$(".btn-date").click(function(){
    		var date = $(this).data("date");
    		axios({
    			url:"${pageContext.request.contextPath}/test/paydate?date="+date,
    			method:"get"
    		}).then(function(response){
    			$("input[name=start]").val(response.data.start);
    			$("input[name=finish]").val(response.data.finish);
    		});
    	});	
		

    	window.onload = function(){
            var options = {
                //대상 지정
                field: document.querySelector(".picker-start"),              
                //두 번째 대상 지정
                secondField: document.querySelector(".picker-end"),               
                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',              
                //한 화면에 표시될 달의 개수
                numberOfMonths: 1,              
                //시작일 지정
                // minDate:new Date(),//- 오늘부터 선택 가능
                minDate:moment(new Date()).add(-90, 'days'),
                //미래 날짜 선택불가
                maxDate: moment().endOf('today'),               
                //시작요일(1:월 ~ 7:일)
                firstDay: 7,              
                //선택 방향 제어
                selectForward: true,               
                //주말 제외
                disableWeekends:false,      
                //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                onSelect:function(start, end) {
                    if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                    var days = end.diff(start, 'days') + 1;
                    console.log(days);
                }
            };
            var picker = new Lightpick(options);		
    	};
    	
    	
	});
</script>
<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-300">
					<div class="card-body offset-2 col-8">
						<div class="fontD bold brown">주문 내역 조회</div> 
						<div>
							<p>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
							<span class="brown">결제취소는 결제 완료시에만</span> 가능합니다. </p>
							<br>
						</div>
						
						<div>
		            	<form action="list" method="post">
		                    <div class="inline-wrap">
		                    	<div CLASS="btn-group">
			                        <button class="btn btn-primary btn-date" type="button" data-date="7">1주일</button>
			                        <button class="btn btn-primary btn-date" type="button" data-date="1">1개월</button>
			                        <button class="btn btn-primary btn-date" type="button" data-date="3">3개월</button>
		                    	</div>
		                        <input type="text" class="picker-start form-control start" name="start" placeholder="시작일을 선택해주세요" value="${start}">
		                        <input type="text" class="picker-end form-control finish" name="finish" placeholder="종료일을 선택해주세요" value="${finish}">
		                    </div>
		                   	<button class="btn btn-sm btn-primary btn-block btn-list">검색</button>
		            	</form>
		            	</div>
						<br><hr><br> 

						<!--  결제 내역 목록  -->
						<div class="table-responsive">
							<table class="table2 table-bordered table-hover" width="100%" cellspacing="0"> 
								<thead class="bold gray2">
									<tr>
										<td>No</td>
										<td width="17%">주문번호</td>
										<td>주문일</td>
										<td>상품명</td>
										<td>상품 금액</td>
										<td>할인 금액</td>
										<td>결제 금액</td>
										<td>주문 상태</td>
										<td width="10%"></td>
									</tr>
								</thead>
										<c:forEach var="payInfoDto" items="${list}">
										<tr>
											<td>${payInfoDto.pay_his_no}</td>
											<td>
												<a href="${pageContext.request.contextPath}/member/pay/history?tid=${payInfoDto.tid_no}">${payInfoDto.tid_no}</a>
											</td>
											<td>${payInfoDto.pay_his_date2}</td>
											<td>${payInfoDto.license_time}시간</td>
											<td><fmt:formatNumber value="${payInfoDto.license_price}" pattern="#,###" /></td>
											<td class="">(-)<fmt:formatNumber value="${payInfoDto.pay_his_discount}" pattern="#,###" /></td> 
											<td class="bold"><fmt:formatNumber value="${payInfoDto.pay_his_price}" pattern="#,###" /></td>
											<td>
											<c:set var="status" value="${payInfoDto.pay_his_state}" />
												<c:choose>
													<c:when test="${status eq '결제취소'}"> 
														<span class="red">${payInfoDto.pay_his_state}</span>
													</c:when>
													<c:otherwise>
														<span class="blue">${payInfoDto.pay_his_state}</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
											
												<c:if test="${status eq '결제완료'}">
												<a href="${pageContext.request.contextPath}/member/pay/pay_delete?tid=${payInfoDto.tid_no}">
													<input type="submit" value="결제취소" class="btn"> 
												</a>
												</c:if>
											</td>
										</tr>
										
										</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
