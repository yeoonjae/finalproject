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
		.type.navy {
			color: navy;
			font-weight: 600;
		}
		.type.red {
			color: red;
			font-weight: 600;
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
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
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
        	
        	// 정렬 선택 시 form 전송
            $("#order").change(function(){
            	document.querySelector(".list-form").submit();
            });
            
        	// 수정할 데이터 선택 시 input 창에 데이터 값 뜨게
            $(".btn-select").click(function(){
       			$(".point_no").val($(this).data("no"));
       			$(".point_type").val($(this).data("type"));
       			$(".point_detail").val($(this).data("detail"));
       			$(".point_score").val($(this).data("score"));   
       			
       			$(".point_score").attr("readonly", false);
            	$(".point_detail").attr("readonly", false);
       			
       			$(".btn-edit").attr("disabled", false);
       			$(".select-result").removeClass("on");
            });
            
        	// 수정 버튼 클릭 시
            $(".btn-edit").click(function(e){
            	if(!$(".point_score").val() || !$(".point_detail").val()){ // 비어있는 input이 있다면
            		return;
            	}
            	
            	if(confirm("정말 수정하시겠습니까?")){
            		document.querySelector(".form").submit();
            	} else {
            		e.preventDefault();
            	}
            });
        });
        
        // 등록 페이지에서 수정 버튼을 눌러서 올 경우 (파라미터에 번호가 있는 경우)
        $(window).on("load", function(){
        	if($(".point_no").val()) {
        		$(".select-result").removeClass("on"); // 선택하라는 span 안보이게
        		$(".btn-edit").attr("disabled", false); // 버튼 비활성화
        		$(".point_score").attr("readonly", false);
            	$(".point_detail").attr("readonly", false);
        	}
        });
    </script>
<body>
<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
          	<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">마일리지 유형</a>
            	</li>
            	<li class="breadcrumb-item active">수정</li>
         	</ol>
			<div class="row">
				<div class="offset-sm-4 col-sm-4 offset-md-4 col-md-4">
	                <form action="edit" method="post" class="form">
	                	<input type="hidden" class="form-control point_no" name="point_no" required value="${pointDto.point_no}">
	                    <div class="form-group">
	                    	<div class="row">
	                    		<div class="col-5">
			                        <label>유형</label>
			                        <select name="point_type" class="form-control point_type" required value="${pointDto.point_type}">
			                            <option>적립</option>
			                            <option>차감</option>
			                        </select>
			                    </div>
	                    		<div class="col-7">
			                        <label>마일리지</label>
			                        <input type="text" name="point_score" placeholder="마일리지를 입력하세요" class="form-control point_score" required readonly value="${pointDto.point_score}">
	                    		</div>
	                    	</div>
	                    </div>
	                    <div class="form-group">
	                        <label>상세내용</label>
	                        <input type="text" name="point_detail" placeholder="상세내용을 입력하세요" class="form-control point_detail" value="${pointDto.point_detail}" readonly required>
		                    <span class="select-result on">수정할 유형을 아래 목록에서 선택해주세요</span>
	                    </div>
	                    <br>
	                    <div class="btn-wrap">
		                    <button class="btn btn-primary btn-edit" disabled>수정</button>
		                    &nbsp;&nbsp;&nbsp;
		                    <a href="regist">
				                <button class="btn btn-secondary btn-list" type="button">목록</button>
		                    </a>
	                    </div>
	                </form>
            	</div>
			</div>
			<br><br>
			<!-- DataTables Example -->	
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 마일리지 유형 목록
				</div>
				<div class="card-body offset-sm-2 col-sm-8 offset-md-2 col-md-8">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<!-- 유형별 정렬 방법 선택 -->
									<th>
										<form action="list2" method="post" class="list-form">
											<select name="point_type" id="order" class="form-control form-inline">
												<option value="all">전체</option>
												<option ${param.point_type=="적립"?'selected':''}>적립</option>
												<option ${param.point_type=="차감"?'selected':''}>차감</option>
											</select>
										</form>
									</th>
									<th>상세내용</th>
									<th>점수</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="pointDto">
									<tr>
										<td class="type">${pointDto.point_type}</td>
										<td>${pointDto.point_detail}</td>
										<td>${pointDto.point_score}</td>
										<td>
											<button class="btn btn-sm btn-primary btn-select"
											data-no="${pointDto.point_no}" data-type="${pointDto.point_type}" 
											data-detail="${pointDto.point_detail}" data-score="${pointDto.point_score}">선택</button>
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
			<br><br>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>