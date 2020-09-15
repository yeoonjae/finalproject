<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->

<script>
	$(function() {
		 
		$(".edit").click(function() {
					// this : 클릭한 수정버튼 
					// 제일먼저 span으로 가야함 
					// span에 있는 값을 변수로 옮겨주고 
					// span 숨기고 .hide()
					// input text 생성해서 
					// value 넣어주기 

					//console.log($(this));

					var time = $(this).parents("td").prev().prev().children("#license_time").text();
					var price = $(this).parents("td").prev().children("#license_price").text();

					var input1 = document.createElement("input");
					var input2 = document.createElement("input");
					var button1 = document.createElement("input"); // 완료 버튼 
					var button2 = document.createElement("input"); // 취소 버튼 
					
					
					// 수정 완료 버튼 생성 
					button1.setAttribute("type","button");
					button1.setAttribute("value","완료");
					button1.setAttribute("class","btn btn-warning btn-sm finish");
					// 수정 취소 버튼 생성 
					button2.setAttribute("type","button");
					button2.setAttribute("value","취소");
					button2.setAttribute("class","btn btn-danger btn-sm cancel");
					
					// 시간 수정 input 생성
					input1.setAttribute("type", "text");
					input1.setAttribute("name", "license_time");
					input1.setAttribute("class", "time");
					input1.setAttribute("value", time);
					
					// 가격 수정 input 생성
					input2.setAttribute("type", "text");
					input2.setAttribute("name", "license_price");
					input2.setAttribute("class", "price");
					input2.setAttribute("value", price);
				

					$(this).parents("td").prev().children("#license_price").hide();
					$(this).parents("td").prev().prev().children("#license_time").hide();
					$(this).hide(); //수정 버튼 숨김
					$(this).parent().append(button1); // 완료 버튼 생성
					$(this).parent().append(button2); // 취소 버튼 생성
					 
					$(this).parents("td").prev().prev().append(input1);
					$(this).parents("td").prev().append(input2);

					// 취소 버튼을 누를 경우 
					$(".cancel").click(function(){
						console.log($(this));
						$(this).parents("td").prev().children("#license_price").show();
						$(this).parents("td").prev().prev().children("#license_time").show();
						$(this).parents("td").children(".edit").show(); //수정버튼 다시 보여주기
						$(this).parents("td").prev().children(".price").remove(); //input창 삭제
						$(this).parents("td").prev().prev().children(".time").remove(); //input창 삭제
						$(this).parents("td").children(".finish").remove(); // 완료버튼 삭제 
						$(this).remove(); // 취소버튼 삭제 
					});
					
					//완료 버튼을 누를 경우 
					$(".finish").click(function(){

						var time = $(this).parents("td").prev().prev().children(".time").val(); // 수정된 시간 가져오기 
						var price = $(this).parents("td").prev().children(".price").val(); // 수정된 가격 가져오기 
						var no = $(this).parents("td").prev().prev().prev().children("#license_no").text(); // 이용권 번호 가져오기
						
						var data = {"license_no" : no, "license_time" : time, "license_price" : price};
						//console.log(data);
						
						$.ajax({
								url : "${pageContext.request.contextPath}/admin/license/license_edit",
								type:"post",
								data : data,
								success : function(data){
									
 									// var price = $(".finish").parents("td").prev().children(".price").val(); // 수정된 가격 가져오기 
 									$(".finish").parents("td").prev().children("#license_price").text(price);
 									$(".finish").parents("td").prev().children("#license_price").show();

 									//var time = $(this).parents("td").prev().prev().children(".time").val();
 									$(".finish").parents("td").prev().prev().children("#license_time").text(time);
 									$(".finish").parents("td").prev().prev().children("#license_time").show();
 									
									$(".finish").parents("td").children(".edit").show(); //수정버튼 다시 보여주기
									$(".finish").parents("td").prev().children(".price").remove(); //input창 삭제
									$(".finish").parents("td").prev().prev().children(".time").remove(); //input창 삭제
									$(".finish").parents("td").children(".cancel").remove(); // 취소버튼 삭제 
									$(".finish").remove(); // 완료버튼 삭제 
								},error : function(request,status,error){

								}	
						});					
					});
		});
	});
		
</script>
<div id="content-wrapper">

	<div class="container-fluid">
	
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="license_regist">이용권
					등록하기</a></li>
			<li class="breadcrumb-item active">이용권 목록</li>
		</ol>
		
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> 이용권 목록
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
					
						<thead>
							<tr>
								<th width="20%">이용권 번호</th>
								<th>시간</th>
								<th>가격</th>
								<th width="10%"></th>
								<th width="10%"></th>
							</tr>
						</thead>
						
						<tfoot>
							<tr>
								<th width="20%">이용권 번호</th>
								<th>시간</th>
								<th>가격</th>
								<th width="10%"></th>
								<th width="10%"></th>
							</tr>
						</tfoot>
						
						<tbody>
							<c:forEach var="licenseDto" items="${list}">
								<tr>
									<td>
										<span id="license_no">${licenseDto.license_no}</span></td>
									<td>
										<span id="license_time">${licenseDto.license_time}</span>
									</td>
									<td>
										<span id="license_price">${licenseDto.license_price}</span>
									</td>
									<td align="center" width="10%">
										<input type="button" class="btn btn-primary edit" value="수정">
									</td>
									<td align="center">										
										<a href="license_delete/${licenseDto.license_no}" onclick="if(!confirm('삭제하시겠습니까?')){return false;}">
											<button class="btn btn-primary">삭제</button>
										</a>
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
</body>
</html>

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>