<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마일리지 유형 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
	<style>
		.table {
			text-align: center;
		}
		label{
			font-weight: 600;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
 	<script>
	 	$(function(){
	 		
	 		// 발급 대상 선택 시
	 		$("#target").change(function(){
	 			var val = $(this).val();
	 			
	 			if(!val) { // 전체 발급일 경우
	 				$("#local").prop("hidden", true);
	 				$("#branch").prop("hidden", true);
	 			} else if(val=="local") { // 지역 발급일 경우
	 				$("#local").prop("hidden", false);
	 				$("#branch").prop("hidden", true);
	 			} else { // 지점 발급일 경우
	 				$("#local").prop("hidden", true);
	 				$("#branch").prop("hidden", false);
	 			}
	 			
	 		});
	 		
	 		// 대상 선택 시
	 		$(".btn-select").click(function(){
	 			var val = $("#target").val();
	 			var tr = $("<tr>");
	 			var td = $("<td>");
	 			var btn = $("<button>");
	 			
	 			// 지역 발급일 경우
	 			if(val=="local"){
	 				// 데이터 없다는 문구 삭제
	 				if($(".list-wrap").find("td").text().indexOf("선택")!=-1){
	 					$(".list-wrap").children().remove(); // 전체 삭제
	 				}
	 				// 지역명 추출
	 				var local = $("#local").find("option:selected").data("name");
	 				
	 				// 지점이 있는 경우 추가 방지
	 				// 1) 지점이 있는 tr 삭제
	 				$(".list-wrap td").filter(function(){
						// console.log(this, this.text);
						return $(this).text() == '지점';//if($(this).val()==no) return true; else return false;
					}).parent().remove();
	 				// 2) 지점에 해당하는 input 삭제
	 				$("input[name=branch_no]").filter(function(){
						//console.log(this, this.value);
						return $(this).attr("type") == "hidden";//if($(this).val()==no) return true; else return false;
					}).remove();
	 				
	 				// 지역명이 같은 td가 없을 경우 추가(중복방지)
	 				if($(".list-wrap").find("td").text().indexOf(local) < 0){
		 				// 지역번호 추출
		 				var local_no = $("#local").find("option:selected").val();
		 				// tr 생성
		 				$(".list-wrap").append(tr);
		 				// td 생성
		 				$(tr).append('<td>지역</td><td data-no="'+local_no+'">'+local+' 전체</td><td class="btn-location"></td>');
		 				// 삭제버튼 생성
		 				$(btn).text("삭제")
		 					.attr("type","button")
		 					.attr("class", "btn btn-sm btn-outline-secondary")
	 						// 삭제버튼 클릭 시
		 					.click(function(){
		 						// 해당 input 삭제
		 						var no = $(this).parents('td').prev().data('no');
		 						// 방법 1) 되긴하지만 비추
// 								$("input[name=local_no][value="+no+"]").remove();
		 						// 방법 2) 추천!
								$("input[name=local_no]").filter(function(){
									//console.log(this, this.value);
									return $(this).val() == no;//if($(this).val()==no) return true; else return false;
								}).remove();
		 						// 해당 행 삭제
		 						$(this).parents("tr").remove();
		 						// 선택된 대상이 없을 경우
		 						if($(".list-wrap").find("td").length == 0){
		 							$(".list-wrap").append("<tr>").append('<td colspan="3">선택된 데이터가 없습니다</td>');
		 						}
		 					})
		 					.appendTo(".list-wrap > tr > .btn-location:last");		
		 				// input hidden 생성하여 해당 지역번호 값 넣기
		 				$("<input>").attr("type", "hidden").attr("name", "local_no").val(local_no).appendTo(".hidden-wrap");
	 				};
	 			} else if(val=="branch") { // 지점 발급일 경우
	 				// 데이터 없다는 문구 삭제
	 				if($(".list-wrap").find("td").text().indexOf("선택")!=-1){
	 					$(".list-wrap").children().remove(); // 전체 삭제
	 				}
		 			// 지점명 추출
	 				var branch = $("#branch").find("option:selected").data("name");
	 				
		 			// 지역이 있는 경우 추가 방지
		 			// 1) 지역이 있는 tr 삭제
	 				$(".list-wrap td").filter(function(){
						// console.log(this, this.text);
						return $(this).text() == '지역';//if($(this).val()==no) return true; else return false;
					}).parent().remove();
		 			
		 			// 2) 지역에 해당하는 input 삭제
	 				$("input[name=local_no]").filter(function(){
						//console.log(this, this.value);
						return $(this).attr("type") == 'hidden';//if($(this).val()==no) return true; else return false;
					}).remove();
		 			
	 				// 지점명이 같은 td가 없을 경우 추가(중복방지)
	 				if($(".list-wrap").find("td").text().indexOf(branch) < 0){
	 					// 지점 번호 추출
	 					var branch_no = $("#branch").find("option:selected").val();
	 					// tr 생성
		 				$(".list-wrap").append(tr);
	 					// td 생성
		 				$(tr).append('<td>지점</td><td data-no="'+branch_no+'">'+branch+'</td><td class="btn-location"></td>');
	 					// 삭제버튼 생성
		 				$(btn).text("삭제")
		 					.attr("type","button")
		 					.attr("class", "btn btn-sm btn-outline-secondary")
		 					// 삭제버튼 클릭 시 
		 					.click(function(){
		 						// 해당 input 삭제
		 						var no = $(this).parents('td').prev().data('no');
		 						$("input[name=branch_no]").filter(function(){
									//console.log(this, this.value);
									return $(this).val() == no;//if($(this).val()==no) return true; else return false;
								}).remove();
		 						// 해당 행 삭제
		 						$(this).parents("tr").remove();
		 						// 선택된 대상이 없을 경우
		 						if($(".list-wrap").find("td").length == 0){
		 							$(".list-wrap").append("<tr>").append('<td colspan="3">선택된 데이터가 없습니다</td>');
		 						}
		 					})
		 					.appendTo(".list-wrap > tr > .btn-location:last");
		 				// input hidden 생성하여 해당 지점번호 값 넣기
		 				$("<input>").attr("type", "hidden").attr("name", "branch_no").val(branch_no).appendTo(".hidden-wrap");
	 				}
	 			} else { // 전체 발급일 경우
	 				$(".list-wrap").children().remove(); // 전체 행 삭제
	 				// tr 생성
	 				$(".list-wrap").append(tr);
	 				// td 생성
	 				$(tr).append('<td>전체</td><td>전체 발급</td><td class="btn-location"></td>');
	 				// 삭제버튼 생성
	 				$(btn).text("삭제")
 					.attr("type","button")
 					.attr("class", "btn btn-sm btn-outline-secondary")
 					// 삭제버튼 클릭 시
 					.click(function(){
 						// 해당 행 삭제
 						$(this).parents("tr").remove();
 						// 선택버튼 활성화
 						$(".btn-select").prop("disabled", false);
 						// 선택된 데이터가 없음을 안내
 						$(".list-wrap").append("<tr>").append('<td colspan="3">선택된 데이터가 없습니다</td>');
 					})
 					.appendTo(".list-wrap > tr > .btn-location:last");
	 				
	 				// 선택버튼 비활성화
	 				$(".btn-select").prop("disabled", true);
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
	    };
 	</script>
 </head>
 <body>
 <div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
          	<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">쿠폰 발급</a>
            	</li>
            	<li class="breadcrumb-item active">등록</li>
         	</ol>
			<div class="row">
				<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
					<!-- 쿠폰 발급할 지역 및 지점 선택 -->
					<div class="form-group local-wrap">
						<label>발급 대상</label>
						<select id="target" class="form-control">
							<option value="">전체 발급</option>
							<option value="local">지역 발급</option>
							<option value="branch">지점 발급</option>
						</select>
						<select id="local" name="local_no" class="form-control" hidden>
							<c:forEach items="${localList}" var="localDto">
								<option value="${localDto.local_no}" data-name="${localDto.local_name}">${localDto.local_name}</option>
							</c:forEach>
						</select>
						<select id="branch" name="branch_no" class="form-control" hidden>
							<c:forEach items="${branchList}" var="branchDto">
								<option value="${branchDto.branch_no}" data-name="${branchDto.branch_name}">${branchDto.branch_name}</option>
							</c:forEach>
						</select>
						<br>
						<button type="button" class="btn btn-secondary btn-block btn-select">선택</button>
					</div>
					<div class="form-group">
						<label>대상 목록</label>
						<table class="table table-bordered" width="100%" cellspacing="0">
		                	<thead>
		                    	<tr>
			                      	<th>분류</th>
			                      	<th>대상</th>
			                      	<th>비고</th>
			                    </tr>
			                </thead>
			                <tbody class="list-wrap">
			                	<tr>
			                		<td colspan="3">선택된 대상이 없습니다</td>
			                	</tr>
			                </tbody>
						</table>
					</div>
						<!-- 쿠폰 내용 작성 -->
					<form action="regist" method="post">
						<div class="hidden-wrap">
							<input type="hidden" name="admin_no" value="${admininfo.admin_no}">
						</div>
						<div class="form-group">
							<label>쿠폰명</label>
							<input type="text" name="coupon_name" placeholder="발급할 쿠폰 내용을 입력하세요" class="form-control" required>
							<span class="name_result"></span>
						</div>
						<!-- 할인률 선택 -->
						<div class="form-group">
							<label>할인률</label>
							<input type="number" name="coupon_discount" min="5" max="20" step="5" placeholder="할인률을 입력하세요" class="form-control" required>
						</div>
						<!-- 쿠폰 시작일 설정 -->
						<div class="form-group">
							<div class="row">
								<div class="col-6">
									<label>쿠폰 시작일</label>
									<input type="text" class="picker-start form-control" name="coupon_start" placeholder="연도-월-일">
								</div>
								<div class="col-6">
									<label>쿠폰 만료일</label>
									<input type="text" class="picker-finish form-control" name="coupon_finish" placeholder="연도-월-일">
								</div>
							</div>
						</div>
						<br>
						<button class="btn btn-primary btn-block btn-regist">등록</button>
						<br><br>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>