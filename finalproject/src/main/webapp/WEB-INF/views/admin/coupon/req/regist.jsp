<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>진행 목록</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
   <style>
	.table {
		text-align: center;
	}
	.state.red{
		color: red;
		font-weight: 600;
		}
	.state.blue{
		color: blue;
		font-weight: 600;
	}
	.state.navy{
		color: navy;
		font-weight: 600;
	}
	.font-span {
		color: #007bff;
	}
	.resp-span {
		color: blue;
		font-size: small;
	}
   </style>
   <script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   <script>
      $(function(){
         $('#reason-modal').modal("hide");
         
         $(".btn-modal").click(function(){
	         $('#reason-modal').modal("show");        	 
         });
         
         $(".order").change(function(){
        	$(".order-form").submit();
         });

      	 // 구분에 따라 글자 색상 설정
		 $.each($(".state"), function(i){
		 	var td = $(this).text();
			if(td=="대기"){
				$(this).addClass("navy");
			} else if(td=="승인"){
				$(this).addClass("blue");
			} else {					
				$(this).addClass("red");
			}
		 });
      	 
		// 사유 버튼 클릭 시
         $('.btn-reason').click(function(){
        	 $('#reason-modal').modal({backdrop:'static', show:'true'});
        	 $('.reason-comment').text($(this).data("detail"));
         });
		
        // 삭제 버튼 클릭 시
     	$(".btn-delete").click(function(){
     		var no = $(this).data("no");
     		
         	if(confirm("삭제 하시겠습니까?")){
         		axios({
         			url:"${pageContext.request.contextPath}/test/coupon/req/delete?coupon_req_no="+no,
         			method:"get"
         		 }).then(function(response){
         			 alert("요청 삭제가 완료되었습니다");
         			 location.reload();
         		 });
         	} else {
         		return;
         	}
     		
     	});
        
      });
      window.onload = function(){
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
//            minDate:new Date(),//- 오늘부터 선택 가능
 	        minDate:moment(new Date()).add(+1, 'days'),

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
	   };
  </script>
</head>
<body>
<br>
   <div id="content-wrapper">
		<div class="container-fluid">
			<div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10">
				<div class="card mb-3">
					<div class="card-header">
						<span class="font-span">쿠폰 요청</span>
					</div>
					<div class="card-body">
						<form action="regist" method="post">
							<div class="form-group">   
	                             <input type="hidden" name="branch_no" value="${admininfo.branch_no}">
	                             <div class="row">
	                                <div class="col-5">
	                                   <label>쿠폰명</label>
	                                   <input type="text" name="coupon_req_name" placeholder="쿠폰 내용을 입력하세요" class="form-control" required>
	                                   <span class="name_result"></span>
	                                </div>
	                                <div class="col-2">
	                                   <label>할인율</label>
	                                   <input type="number" name="coupon_req_discount" min="5" max="20" step="5" placeholder="할인율 %" class="form-control" required>
	                                </div>
	                                <div class="col-2">
	                                   <label>시작일</label>
	                                   <input type="text" class="picker-start form-control" name="coupon_req_start" placeholder="연도-월-일">							
	                                </div>
	                                <div class="col-2">
	                                   <label>종료일</label>
	                                   <input type="text" class="picker-finish form-control" name="coupon_req_finish" placeholder="연도-월-일">							
	                                </div>
	                                <div class="col-1">
	                                   <label style="color: white">요청</label>
	                                   <button class="btn btn-sm btn-primary btn-block btn-req" type="submit">요청</button>						
	                                </div>
	                             </div>
                        	</div>
						</form>
					</div>
					<div class="card-header">
					   	<i class="fas fa-table"></i> 진행 목록
					</div>
			      <div class="card-body">
			         <div class="table-responsive">
			            <table class="table table-hover table-condensed" id="dataTable" width="100%" cellspacing="0">
			               <thead>
			                  <tr>
			                     <th>
							      	<form action="regist" method="get" class="order-form">
				                        <select class="form-control form-inline order" name="order">
				                           <option value="" ${param.order=="all"?'selected':''}>전체</option>
				                           <option ${param.order=="승인"?'selected':''}>승인</option>
				                           <option ${param.order=="대기"?'selected':''}>대기</option>
				                           <option ${param.order=="거절"?'selected':''}>거절</option>
				                        </select>
							      	</form>
			                     </th>
			                     <th>쿠폰명</th>
			                     <th>할인율(%)</th>
			                     <th>기간</th>
			                     <th>요청일</th>
			                     <th>비고</th>
			                  </tr>
			               </thead>
			               <tbody>
			                  <c:forEach items="${list}" var="reqDto">
				                  <tr>
				                     <td class="state">${reqDto.coupon_req_state}</td>
				                     <td>${reqDto.coupon_req_name}</td>
				                     <td>${reqDto.coupon_req_discount}</td>
				                     <td>
				                        <p class="start-p">${reqDto.coupon_req_start}</p>
				                        <p class="finish-p">~ ${reqDto.coupon_req_finish}</p>
				                     </td>
				                     <td>
				                     	<span>${reqDto.coupon_req_date}</span>
				                     	<br>
				                     	<c:if test="${reqDto.coupon_req_resp!=null}">
					                     	<span class="resp-span">처리 : ${reqDto.coupon_req_resp}</span>
				                     	</c:if>
				                     </td>
				                     <td>
				                     	<c:if test="${reqDto.coupon_req_state eq '거절'}">
				                     		<button class="btn btn-sm btn-outline-secondary btn-reason" data-detail="${reqDto.coupon_req_detail}">사유</button>
				                     	</c:if>
				                     	<c:if test="${reqDto.coupon_req_state eq '대기'}">
				                     		<a href="edit?coupon_req_no=${reqDto.coupon_req_no}">
					                     		<button class="btn btn-sm btn-outline-secondary btn-edit">수정</button>
				                     		</a>
					                     		<button class="btn btn-sm btn-outline-secondary btn-delete" data-no="${reqDto.coupon_req_no}">삭제</button>
				                     	</c:if>
				                     </td>
				                  </tr>
			                  </c:forEach>	               
			               </tbody>
			            </table>
			         </div>
			      </div>
			      <div class="card-footer small text-muted">
					Updated yesterday at 11:59 PM
				</div>
			   </div>
		   </div>
      </div>
   </div>
   <div class="modal" id="reason-modal">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">거절 사유</h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
               <p class="reason-comment"></p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-sm btn-secondary btn-close" data-dismiss="modal">Close</button>
           </div>
         </div>
      </div>
   </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>