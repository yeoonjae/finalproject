<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
<!-- <link rel="stylesheet" -->
<!--    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!--    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!--    crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" 
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
    <script>
        $(function(){
        	
        	if($(".his-list").find("td").length == 0){
        		$(".his-list").html("");
					$(".his-list").append("<tr>").append('<td colspan="4">검색 결과가 없습니다</td>');
        	}
        	
        	// 기간 버튼 선택 시
        	$(".btn-date").click(function(){
        		var date = $(this).data("date");
        		axios({
        			url:"${pageContext.request.contextPath}/test/date?date="+date,
        			method:"get"
        		}).then(function(response){
        			$("input[name=start]").val(response.data.start);
        			$("input[name=finish]").val(response.data.finish);
        		});
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
                numberOfMonths: 2,
                
                //시작일 지정
                // minDate:new Date(),//- 오늘부터 선택 가능
                minDate:moment(new Date()).add(-3, 'month'),

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
    </script>
    	<style>
		.hover-line:hover {
			color: black;
			background-color: #f5f5f5;
		}
		.btn{
			radius:15%;
		}
		 .gray2{
			background-color:#f5f5f5;
		}
		.form-control{
			width: 160px;
			float: right;
		}
		.head_title{
			padding-bottom: 0px;		
		}
		.main_service{
			height: 800px;
			padding-top: 120px;
		}
		.table2 {
			text-align: center;
		    line-height: 3;
		    border-top: 1px solid #ddd;
		    margin: 0;
		}
		 .gray2{
			background-color:#f5f5f5;
		}
		.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
			vertical-align: middle;
			text-align: center;
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
		.his-type.red{
			color: #ab9c78;
			font-weight: 600;
		}
		.his-type{
			color: gray;
			font-weight: 600;
		}
		.target:hover > .his-score, .target:hover > .his-detail {
			font-weight: 600;
		}
		.fontD {
			font-family: '나눔바른고딕';
			font-size: 40px;
		}
		.bold{
			font-weight:bold;
		}
		.brown{
			color:#b59e79; 
		}
	</style>
</head>
<body>
<section>
      <div class="container">
         <div class="row">
			<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
            <div class="main_service roomy-100">
            <br><br>
            	<div class="fontD bold brown" style="margin-bottom:10px;">마일리지 내역 조회</div> 
						<div>
							<p>기간을 선택하시면 해당 기간에 대한 상세내역을 확인하실 수 있습니다.<br>
							<span class="brown">마일리지 내역은 최대 3개월 이전 까지만</span> 조회 가능합니다. </p>
						</div><hr>
            	<div>
            	<form action="list" method="post">
                    <div class="inline-wrap">
                    	<div CLASS="btn-group">
	                        <button class="btn btn-primary btn-date" type="button" data-date="7">1주일</button>
	                        <button class="btn btn-primary btn-date" type="button" data-date="1">1개월</button>
	                        <button class="btn btn-primary btn-date" type="button" data-date="3">3개월</button>
                    	</div>
                        <input type="text" class="picker-end form-control finish" name="finish" placeholder="종료일을 선택해주세요" value="${finish}">
                        <input type="text" class="picker-start form-control start" name="start" placeholder="시작일을 선택해주세요" value="${start}">
                    </div>
                   	<button class="btn btn-sm btn-primary btn-block btn-list" type="submit">검색</button>
            	</form>
            	</div>
            	<!-- 테이블 -->
          		  <hr><br>
                    <table class="table table2 table-hover" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <!-- 마일리지 내역 항목 -->
                                <th>날짜</th>
                                <th>유형</th>
                                <th>상세내용</th>
                                <th>마일리지</th>
                            </tr>
                        </thead>
                        <tbody class="his-list check">
                        	<c:choose>
                        		<c:when test="${list != null}">
                        	<c:forEach items="${list}" var="pointHisDto">
                        	<tr class="target">
                        		<td>${pointHisDto.point_his_date}</td>
                        		<td class="his-type <c:if test="${pointHisDto.point_type eq '적립'}">red</c:if>">${pointHisDto.point_type}</td>
                        		<td class="his-detail">
                        			<c:choose>
                        				<c:when test="${pointHisDto.point_no eq 1 || pointHisDto.point_no eq 2}">
		                        			${pointHisDto.point_detail}                        					
		                        			<br><span class="detail-result">사유 : ${pointHisDto.point_his_detail}</span>
                        				</c:when>
                        				<c:otherwise>
		                        			${pointHisDto.point_detail}                       					
                        				</c:otherwise>
                        			</c:choose>
                        		</td>
                        		<td class="his-score">${pointHisDto.point_his_score}점</td>
                        	</tr>
                        	</c:forEach>
                        		</c:when>
                        		<c:otherwise>
                        			<td colspan="4">최근 일주일 간 내역이 없습니다</td>
                        		</c:otherwise>
                        	</c:choose>
                        </tbody>
                    </table>
           		</div>
           	</div>
       	</div>
   	 </div>
 </section>   

</body>
</html>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>