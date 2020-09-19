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
	<style>
		.detail_result {
			color: red;
			font-size: small;
		}
		.table {
			text-align: center;
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
		.target {
			width: 150px;
		}
		
	</style>
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
        	
        	var result;
        	
        	// 상세내용 입력 시
            $(".point_detail").on("input",function(){
                var input = document.querySelector(".point_detail");
                var valid = document.querySelector(".valid-feedback");
                var invalid = document.querySelector(".invalid-feedback");
                
                var detail = input.value;
                
                // 입력창이 비었을 경우
                if(!detail){
                	// 전체 초기화
               	 	$(input).removeClass("is-valid");
               	 	$(input).removeClass("is-invalid");
                	$(valid).hide();
                	$(invalid).hide();
                	
                    return;
                }
                
                axios({
                    url: "${pageContext.request.contextPath}/test/point/regist?point_detail="+detail,
                    method:"get"
                }).then(function(response){
                	result = response.data;
                	
                	// 사용 가능할 경우 (데이터가 없을 경우)
                    if(!result){
                    	// input창이 초록색 으로 나타나게
                    	 $(input).removeClass("is-invalid")
                    	 	.attr("id", "inputValid")
                    	 	.addClass("is-valid");
                    	
                    	// 사용가능 글자 표시
                    	 $(invalid).hide();
                    	 $(valid).show();
                    	 
                    	// 등록 버튼 비활성화
                         $(".btn-regist").prop("disabled", false);
                     } else { // 동일한 값이 있는 경우 (데이터가 있는 경우)
                     	// input창이 빨간색으로 나타나게
                    	 $(input).removeClass("is-valid")
                    	 		.attr("id", "inputInvalid")
                    	 		.addClass("is-invalid");
                     
                     	// 사용불가 글자 표시
                    	 $(valid).hide();
                    	 $(invalid).show();
                    	 
                    	// 등록 버튼 활성화 
                         $(".btn-regist").prop("disabled", true);
                     }
                });
            });
            
        	// 삭제 확인창 띄우기
            $(".link").click(function(e){
            	if(confirm("정말 삭제하시겠습니까?")){
            	} else {
            		e.preventDefault();	
            	}
            });
            
        	// 정렬 선택 시 해당 목록  불러오기
            $("#order").change(function(){
            	document.querySelector(".list-form").submit(); // form 전송
            });
            
        	// 등록 버튼 클릭 시
            $(".btn-regist").click(function(e){
            	// 값이 비어있으면 등록 취소
            	if(!$(".point_score").val() || !$(".point_detail").val()){
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
        });
</script>
</head>
	<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
          	<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">마일리지 유형</a>
            	</li>
            	<li class="breadcrumb-item active">등록</li>
         	</ol>

			<div class="row">
				<div class="offset-sm-4 col-sm-4 offset-md-4 col-md-4">
					<form action="regist" method="post" class="form">
						<!-- 마일리지 유형 선택 -->
						<div class="form-group">
							<div class="row">
								<div class="col-5">
									<label>유형</label> <select name="point_type" class="form-control target">
										<option>적립</option>
										<option>차감</option>
									</select>
								</div>
								<!-- 마일리지 점수 입력 -->
								<div class="col-7">
									<label>마일리지</label> <input type="text" name="point_score"
										placeholder="마일리지를 입력하세요" class="form-control point_score" required>
								</div>
							</div>
						</div>
						<!-- 마일리지 상세내용 작성 -->
						<div class="form-group">
							<label>상세내용</label> <input type="text" name="point_detail"
								placeholder="상세내용을 입력하세요" class="form-control point_detail" required>
							<div class="valid-feedback">사용 가능한 유형입니다</div>
							<div class="invalid-feedback">동일한 유형이 존재합니다</div>
						</div>
						<br>
						<div class="btn-wrap">
							<button class="btn btn-primary btn-block btn-regist">등 록</button>		                    
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
				<div class="card-body offset-md-2 col-md-8 offset-sm-2 col-sm-8">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<!-- 유형별 정렬 방법 선택 -->
									<th>
										<form action="list1" method="post" class="list-form">
											<select name="point_type" id="order" class="form-control col-10">
												<option value="all">유형 전체</option>
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
											<a href="edit?point_no=${pointDto.point_no}">
												<button class="btn btn-sm btn-primary">수정</button>
											</a>
											&nbsp;&nbsp;
											<a class="link" href="delete/${pointDto.point_no}">
												<button class="btn btn-sm btn-danger del">삭제</button>
											</a>
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