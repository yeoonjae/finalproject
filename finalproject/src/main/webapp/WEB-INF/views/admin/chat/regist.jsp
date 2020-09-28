<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챗봇 유형 및 내용 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<style>
		.detail_result {
			color: red;
			font-size: small;
		}
		.table {
			text-align: center;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
 
<script>
	$(function(){
		var result;
		
		// 상세내용 입력 시 
		$(".chat_q").on("input",function(){
			var input = document.querySelector(".chat_q");
			
			var q = input.value;
			
		});
		
		// 정렬 선택 시 해당 목록  불러오기
        $("#order").change(function(){
        	document.querySelector(".list-form").submit(); // form 전송
        });
		
    	// 등록 버튼 클릭 시
        $(".btn-regist").click(function(e){
        	// 값이 비어있으면 등록 취소
        	if(!$(".chat_q").val() || !$(".chat_a").val()){
        		return;
        	}   	
        	// 값이 있으면 알림창 띄우기
        	if(!result) {
        		if(confirm("등록하시겠습니까?")){
            		document.querySelector(".form").submit();
            	} else {
            		e.preventDefault();	// 취소
            	}
        	}
        });
    	
     	// 삭제 확인창 띄우기
        $(".link").click(function(e){
        	if(confirm("정말 삭제하시겠습니까?")){
        	} else {
        		e.preventDefault();	
        	}
        });
		
		
	});
</script>

<div id="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">챗봇 유형</a></li>
			<li class="breadcrumb-item active">등록</li>
		</ol>

		<!--  등록 내용 작성  -->
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<form action="regist" method="post" class="form">

					<!-- 유형명 작성 -->
					<div class="form-group">
						<label>유형선택</label> <select name="chat_type" class="form-control">
							<option>결제 및 환불</option>
							<option>이용</option>
							<option>예약</option>
							<option>쿠폰</option>
							<option>마일리지</option>
						</select>
					</div>

					<!-- 질문 작성 -->
					<div class="form-group">
						<label> 질문 </label> 
						<input type="text" name="chat_q"
							class="form-control chat_q" placeholder="질문을 입력하세요"> 
						<span class="q_result"></span>
					</div>

					<!-- 답변 작성 -->
					<div class="form-group">
						<label> 답변 </label> <input type="text" name="chat_a"
							class="form-control" placeholder="질문을 입력하세요"> <span
							class="a_result"></span>
					</div>

					<button class="btn btn-primary btn-block btn-regist">등록</button>
					<br>
				</form>
			</div>
		</div>
		<br><br>
		<!--  챗봇 목록 출력  -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> 챗봇 상세 목록
			</div>
			<div class="card-body offset-sm-1 col-sm-10 offset-md-1 col-md-10">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable"
						width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">
									<form action="list1" method="post" class="list-form">
										<select name="chat_type" id="order"
											class="form-control col-10">
											<option value="all">유형 전체</option>
											<option ${param.chat_type=="결제 및 환불"?'selected':''}>결제 및 환불</option>
											<option ${param.chat_type=="이용"?'selected':''}>이용</option>
											<option ${param.chat_type=="예약"?'selected':''}>예약</option>
											<option ${param.chat_type=="쿠폰"?'selected':''}>쿠폰</option>
											<option ${param.chat_type=="마일리지"?'selected':''}>마일리지</option>
										</select>
									</form>
								</th>
								<th width="30%">질문내용</th>
								<th width="40%">답변내용</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="chatDto">
								<tr>
									<td>${chatDto.chat_type}</td>
									<td>${chatDto.chat_q}</td>
									<td>${chatDto.chat_a}</td>
									<td><a class="link" href="delete/${chatDto.chat_no}">
											<button class="btn btn-primary del">삭제</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>