<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
	<style>
		.detail_result {
			color: red;
			font-size: small;
		}
		.table {
			text-align: center;
		}
		.select-result.on {
			display: inline-block;
			color: red;
			font-size: small;
		}
		.select-result {
			display: none;
		}
		.btn-wrap {
			text-align: center;
		}
		
		.btn-edit{
			width: 40%;
			margin-right:10px;
		}
		
		.btn-list {
			width: 40%;
			margin-left:10px;
		}
		.state {
			font-weight: 900;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script>
        $(function(){
        	// 유형에 따라 글자 색상 설정
        	$.each($(".type"), function(i){
				var td = $(this).text();
				if(td=="적립"){
					$(this).addClass("navy");
				} else {					
					$(this).addClass("red");
				}
			});
        	
        	// 수정할 데이터 선택 시 input 창에 데이터 값 뜨게
            $(".btn-select").click(function(){
       			$(".coupon_req_no").val($(this).data("no"));
       			$(".coupon_req_name").val($(this).data("name"));
       			$(".coupon_req_discount").val($(this).data("discount"));
       			$(".coupon_req_start").val($(this).data("start"));
       			$(".coupon_req_finish").val($(this).data("finish"));   
       			
       			// 읽기전용 비활성화
       			$(".coupon_req_name").attr("readonly", false);
            	$(".coupon_req_discount").attr("readonly", false);
            	$(".coupon_req_start").attr("readonly", false);
            	$(".coupon_req_finish").attr("readonly", false);
       			
            	// 버튼 활성화
       			$(".btn-edit").attr("disabled", false);
            	// span 없애기
       			$(".select-result").removeClass("on");
            });
            
        	// 수정 버튼 클릭 시
            $(".btn-edit").click(function(e){
            	if(!$(".coupon_req_name").val() || !$(".coupon_req_discount").val() || 
            			!$(".coupon_req_start").val() || !$(".coupon_req_finish").val()){ // 비어있는 input이 있다면
            		return;
            	}
            	
            	if(confirm("수정 하시겠습니까?")){
            		document.querySelector(".edit-form").submit();
            	} else {
            		return;
            	}
            });
        	
        	// 삭제 버튼 클릭 시
        	$(".btn-delete").click(function(){
        		var no = $(this).data("no");
        		
            	if(confirm("삭제 하시겠습니까?")){
            		axios({
            			url:"${pageContext.request.contextPath}/test/coupon/req/delete?coupon_req_no="+no,
            			method:"get"
            		 }).then(function(response){
            			 alert("쿠폰 삭제가 완료되었습니다");
            			 location.reload();
            		 });
            	} else {
            		return;
            	}
        		
        	});
	        
        });
        
        $(window).on("load", function(){
	        // 등록 페이지에서 수정 버튼을 눌러서 올 경우 (파라미터에 번호가 있는 경우)
	        if($(".coupon_req_no").val()) {
        		$(".select-result").removeClass("on"); // 선택하라는 span 안보이게
        		$(".btn-edit").attr("disabled", false); // 버튼 비활성화
				// 읽기전용 비활성화
        		$(".coupon_req_name").attr("readonly", false);
            	$(".coupon_req_discount").attr("readonly", false);
            	$(".coupon_req_start").attr("readonly", false);
            	$(".coupon_req_finish").attr("readonly", false);
        	} 
	        
	        if($(".list-wrap").find("td").length == 0){
				$(".list-wrap").append("<tr>").append('<td colspan="6">승인 대기중인 쿠폰이 없습니다</td>');
	        }
	        
	        // datepicker
	        var options = {
	            //대상 지정
	            field: document.querySelector(".picker-start"),
	            
	            //두 번째 대상 지정
	            secondField: document.querySelector(".picker-finish"),
	            
	            //날짜 표시 형식 지정
	            format: 'YYYY-MM-DD',
	            
	            //한 화면에 표시될 달의 개수
	            numberOfMonths: 2,
	            
	            //시작일 지정
	            minDate:new Date(),//- 오늘부터 선택 가능
// 	            minDate:moment(new Date()).add(-90, 'days'),
	
	            //미래 날짜 선택불가
// 	            maxDate: moment().endOf('today'),
	            
	            //시작요일(1:월 ~ 7:일)
	            firstDay: 7,
	            
	            //선택 방향 제어
	            selectForward: true,
	            selectBackward: false,
	            
	            //주말 제외
	            disableWeekends:false,
	            
	            dropdowns:{
                    years:{
                        min:2020,
                        max:2030,
                    },
                    months:true,
	            },

	            
	            //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
	            onSelect:function(start, end) {
	                if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
	                var days = end.diff(start, 'days') + 1;
	                console.log(days);
	            }
	        };
	        var picker = new Lightpick(options);
	    });
    </script>
</head>
<body>
<div id="content-wrapper">
	<div class="container-fluid">
		<!-- DataTables Example -->	
		<div class="card mb-3">
			<div class="card-header">
				<span class="font-span">요청 수정</span>
			</div>
			<div class="card-body">
				<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
					<form action="edit" method="post" class="edit-form">
						<div class="form-group">   
                           	<input type="hidden" name="coupon_req_no" class="coupon_req_no" value="${couponReqDto.coupon_req_no}">
                           	<div class="row">
                               	<div class="col-8">
                                   	<label>쿠폰명</label>
                                   	<input type="text" name="coupon_req_name" placeholder="쿠폰 내용을 입력하세요" class="form-control coupon_req_name" required readonly value="${couponReqDto.coupon_req_name}">
                                   	<span class="select-result on">수정할 요청을 아래 목록에서 선택해주세요</span>
                                </div>
                                <div class="col-4">
                                   	<label>할인율(%)</label>
                                   	<input type="number" name="coupon_req_discount" min="5" max="20" step="5" placeholder="할인율" class="form-control coupon_req_discount" required readonly value="${couponReqDto.coupon_req_discount}">
                                </div>
                           	</div>
						</div>
                        <div class="form-group">
                        	<div class="row">
                            	<div class="col-6">
                                	<label>쿠폰 시작일</label>
                                    <input type="text" class="picker-start form-control coupon_req_start" name="coupon_req_start" placeholder="연도-월-일" readonly value="${couponReqDto.coupon_req_start}">							
                                </div>
                                <div class="col-6">
                                    <label>쿠폰 만료일</label>
                                    <input type="text" class="picker-finish form-control coupon_req_finish" name="coupon_req_finish" placeholder="연도-월-일" readonly value="${couponReqDto.coupon_req_finish}">							
                                </div>
                           </div>
                        </div>
                        <br>
                        <div class="btn-wrap">
                        	<button class="btn btn-primary btn-edit" disabled>수정</button>
	                    	&nbsp;&nbsp;&nbsp;
	                    	<a href="regist">
			               		<button class="btn btn-secondary btn-list" type="button">목록</button>
	                   		</a>
                    	</div>
                    	<br>
                	</form>
				</div>
			</div>
			<div class="card-header">
				<i class="fas fa-table"></i> 요청 대기 목록
			</div>
			<div class="card-body">
				<div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10">
					<div class="table-responsive">
				    	<table class="table table-hover table-condensed" width="100%" cellspacing="0">
				        	<thead>
				            	<tr>
				                    <th>구분</th>
				                    <th>쿠폰명</th>
				                    <th>할인율</th>
				                    <th>기간</th>
				                    <th>요청일</th>
				                    <th>비고</th>
				               </tr>
				            </thead>
				            <tbody class="list-wrap">
								<c:forEach items="${list}" var="reqDto">
					            	<tr>
				                    	<td class="state">대기</td>
					                    <td>${reqDto.coupon_req_name}</td>
					                    <td>${reqDto.coupon_req_discount}</td>
					                    <td>
					                    	<p>${reqDto.coupon_req_start}</p>
					                    	<p>~ ${reqDto.coupon_req_finish}</p>
					                    </td>
					                    <td>${reqDto.coupon_req_date}</td>
					                    <td>
						                	<button class="btn btn-sm btn-outline-secondary btn-select" data-no="${reqDto.coupon_req_no}"
						                 	data-name="${reqDto.coupon_req_name}" data-discount="${reqDto.coupon_req_discount}" 
						                 	data-start="${reqDto.coupon_req_start}" data-finish="${reqDto.coupon_req_finish}">선택</button>
							                <button class="btn btn-sm btn-outline-secondary btn-delete" data-no="${reqDto.coupon_req_no}">삭제</button>
					                    </td>
					                </tr>
				                </c:forEach>
				            </tbody>
				        </table>
				   	</div>
				</div>
			</div>
			<div class="card-footer small text-muted">
				Updated yesterday at 11:59 PM
			</div>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>