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
   <style>
	.table {
		text-align: center;
	}
	.font-span {
		color: #007bff;
	}
	.state.red{
		color: red;
		font-weight: 900;
	}
	.state.blue{
		color: blue;
		font-weight: 900;
	}
	.state.navy{
		color: navy;
		font-weight: 900;
	}
	.btn-select {
		font-size: small;
		height: 38px;
		width: 44px;
	}
	.resp-span {
		color: blue;
		font-size: small;
	}
   </style>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   <script>
      $(function(){
         $('.modal').modal("hide");
         
      	 // 파라미터 조회
		 $.urlParam = function(name) {
     	     var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
     	     if (results == null) {
     	         return 0;
     	     }
     	     return results[1] || 0;
     	 }
      	 
      	 if($.urlParam("branch_no")){
      		 $('.wait-list').attr('hidden', true);
      	 }
      	 
      	 if(!$.urlParam("branch_no")){
      		 $('.order').attr('readonly', true);
      		 $('.branch-list').attr('hidden', true);
      	 }
      	 
         
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
      	 
         $('.branch-select').change(function(){
        	 $('.branch-form').submit();
         });
         $('.order').change(function(){
        	 $('.order-branchno').val($('.branch-select').val());
        	 $('.order-form').submit();
         });
         
         // 승인버튼 클릭 시 
         $('.btn-approval').click(function(){
        	 var no = $(this).data("no");
        	 
        	 if(confirm("쿠폰을 승인하시겠습니까?")){
        		 axios({
        			url:"${pageContext.request.contextPath}/test/coupon/req/approval?coupon_req_no="+no,
        			method:"get"
        		 }).then(function(response){
        			 alert("쿠폰 승인이 완료되었습니다");
        			 location.reload();
        		 });
        	 } else {
        		 return;
        	 }
         });
         
         // 거절버튼 클릭 시
         $('.btn-refuse').click(function(){
        	 var no = $(this).data("no");
        	 // 모달 띄우기
        	 $('#refuse-modal').modal({backdrop:'static', show:'true'});
        	 $('.btn-confirm').click(function(){
        		 var detail = $('.req_detail').val();
        		 axios({
        			url:"${pageContext.request.contextPath}/test/coupon/req/refuse?coupon_req_no="+no+"&coupon_req_detail="+detail,
         			method:"get"
        		 }).then(function(response){
        			 alert("쿠폰 거절이 완료되었습니다");
        			 location.reload();
        		 });
        	 });
         });
         
         // 사유 버튼 클릭 시
         $('.btn-reason').click(function(){
        	 $('#reason-modal').modal({backdrop:'static', show:'true'});
        	 $('.reason-comment').text($(this).data("detail"));
         });

      });
  </script>
</head>
<body>
   <div id="content-wrapper">
		<div class="container-fluid">
<!-- 			<div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10"> -->
				<div class="card mb-3">
					<div class="card-header">
					   	<span class="font-span">지점 선택</span>
					</div>
					<div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10">
						<div class="card-body">
							<div class="form-group">
								<div class="row">
									<div class="col-3">
										<label>지점명</label>
										<form action="list" method="get" class="branch-form">
											<select class="form-control branch-select" name="branch_no">
												<option value="">전체 요청대기</option>
												<c:forEach items="${branchList}" var="branch">
													<option ${param.branch_no==branch.branch_no?'selected':''} value="${branch.branch_no}">${branch.branch_name}</option>
												</c:forEach>
											</select>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-header">
					   	<i class="fas fa-table"></i> 쿠폰요청 진행 목록
					</div>
				  <div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10">
			      <div class="card-body">
			         <div class="table-responsive">
			            <table class="table table-hover table-condensed" id="dataTable" width="100%" cellspacing="0">
			               <thead>
			                  <tr>
			                     <th class="branch-list">
			                        <form action="list" method="get" class="order-form">
			                        	<input type="hidden" name="branch_no" class="order-branchno">
				                        <select class="form-control form-inline order" name="order">
				                           <option value="" ${param.order=="all"?'selected':''}>전체</option>
				                           <option ${param.order=="승인"?'selected':''}>승인</option>
				                           <option ${param.order=="대기"?'selected':''}>대기</option>
				                           <option ${param.order=="거절"?'selected':''}>거절</option>
				                        </select>
							      	</form>
			                     </th>
			                     <th class="wait-list">지점명</th>
			                     <th>쿠폰명</th>
			                     <th>할인율</th>
			                     <th>기간</th>
			                     <th>요청일</th>
			                     <th>비고</th>
			                  </tr>
			               </thead>
			               <tbody>
							  <c:forEach items="${list}" var="reqDto">
				                  <tr>
			                      	 <c:choose>
				                     	<c:when test="${reqDto.coupon_req_state eq '거절'}">
						                     <td class="state branch-list">
						                     	${reqDto.coupon_req_state}
						                     	<br>
						                    </td>
					                    </c:when>
					                    <c:otherwise>
					                    	<td class="state branch-list">${reqDto.coupon_req_state}</td>
					                    	</c:otherwise>
				                   	 </c:choose>
				                   	 <td class="wait-list">${reqDto.branch_name}</td>
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
				                     <c:if test="${reqDto.coupon_req_state eq '대기'}">
					                     <td>
				                     		<button class="btn btn-sm btn-primary btn-approval" data-no="${reqDto.coupon_req_no}">승인</button>
				                     		<button class="btn btn-sm btn-danger btn-refuse" data-no="${reqDto.coupon_req_no}">거절</button>
					                     </td>
				                     </c:if>
				                     <c:if test="${reqDto.coupon_req_state eq '거절'}">
					                     <td>
						                    	<button class="btn btn-sm btn-outline-secondary btn-modal btn-reason" data-detail="${reqDto.coupon_req_detail}">사유</button>
					                     </td>
						             </c:if>
						             <c:if test="${reqDto.coupon_req_state eq '승인'}">
						             	<td></td>
						             </c:if>
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
<!-- 		   </div> -->
      </div>
   </div>
   <!-- 거절 사유 작성 모달 -->
   <div class="modal" id="refuse-modal">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">요청 거절</h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
               <div class="container-fluid">
                     <div class="row">
                        <div class="offset-sm-1 col-sm-10 offset-md-1 col-md-10">
                           <!-- 쿠폰 내용 작성 -->
                           <div class="form-group">
                              <label>거절 사유</label>
                              <input type="text" name="coupon_req_detail" placeholder="거절 사유를 작성하세요" class="form-control req_detail" required>
                           </div>
                        </div>
                  	</div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-sm btn-primary btn-confirm">확 인</button>
               <button type="button" class="btn btn-sm btn-secondary btn-close" data-dismiss="modal">Close</button>
           </div>
         </div>
      </div>
   </div>
   <!-- 거절  사유 모달 -->
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