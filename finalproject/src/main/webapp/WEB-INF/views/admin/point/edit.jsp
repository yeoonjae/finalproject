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
		.select-result {
			color: red;
			font-size: small;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
<script>
        $(function(){
        	var span = document.querySelector(".select-result");
        	
            $("#order").change(function(){
            	document.querySelector(".list-form").submit();
            });
            
            $(".btn-select").click(function(){
            	var point_no = $(this).next().val();
            	axios({
            		url: "${pageContext.request.contextPath}/test/point/get?point_no="+point_no,
                    method:"get"
            	}).then(function(response){
            		if(response.data) {
            			var input = document.querySelector(".point_no");
            			var detail = document.querySelector("input[name=point_detail]");
            			var score = document.querySelector("input[name=point_score]");
            			var type = document.querySelector(".point_type");
            			
            			input.value = response.data.point_no;
            			detail.value = response.data.point_detail;
            			score.value = response.data.point_score;
            			type.value = response.data.point_type;
            		}
            	});
            	
            	span.textContent = "";
            });
            
            $(".btn-edit").click(function(e){
            	var point_no = document.querySelector(".point_no").value;
            	
            	if(!point_no) {
            		span.textContent = "수정할 유형을 아래 목록에서 선택해주세요";
            	}
            	
            	if(confirm("정말 수정하시겠습니까?")){
            		if(point_no){
            			document.querySelector(".form").submit();            			
            		} else {
            			e.preventDefault();
            		}
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
            	<li class="breadcrumb-item">
            		<a href="#">마일리지 유형</a>
            	</li>
            	<li class="breadcrumb-item active">수정</li>
         	</ol>
			<div class="row">
				<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
	                <form action="edit" method="post" class="form">
	                	<div class="form-group">
	                        <label>유형번호</label> <span class="select-result"></span>
	                		<input type="text" class="form-control point_no" name="point_no" value="${pointDto.point_no}" disabled required>
	                	</div>
	                    <div class="form-group">
	                        <label>유형선택</label>
	                        <select name="point_type" class="form-control point_type" required>
	                            <option ${pointDto.point_type=="적립"?'selected':''}>적립</option>
	                            <option ${pointDto.point_type=="차감"?'selected':''}>차감</option>
	                        </select>
	                    </div>
	                    <div class="form-group">
	                        <label>상세내용</label>
	                        <input type="text" name="point_detail" placeholder="상세내용을 입력하세요" class="form-control" value="${pointDto.point_detail}" required>
	                        <span class="detail_result"></span>
	                    </div>
	                    <div class="form-group">
	                        <label>마일리지</label>
	                        <input type="text" name="point_score" placeholder="마일리지를 입력하세요" class="form-control" value="${pointDto.point_score}" required>
	                    </div>
	                    <button class="btn btn-primary btn-block btn-edit">수정</button>
	                </form>
            	</div>
			</div>
			<br><br>
			<!-- DataTables Example -->	
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 마일리지 유형 목록
				</div>
				<div class="card-body offset-sm-1 col-sm-10 offset-md-1 col-md-10">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<!-- 유형별 정렬 방법 선택 -->
									<th>
										<form action="list2" method="post" class="list-form">
											<select name="point_type" id="order" class="form-control col-10">
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
										<td>${pointDto.point_type}</td>
										<td>${pointDto.point_detail}</td>
										<td>${pointDto.point_score}</td>
										<td>
											<button class="btn btn-primary btn-select">선택</button>
											<input name="point_no" type="hidden" value="${pointDto.point_no}">
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