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
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
    <script>
        $(function(){
        	// 수정버튼 클릭 시
        	// input창에 데이터 입력되도록
            $(".btn-edit").click(function(){
                $(".member_name").val($(this).data("name"));
                $(".member_email").val($(this).data("email"));
                $(".member_no").val($(this).data("no"));
                
                $(".select-result").text("");
                $(".btn-regist").attr("disabled", false); // 등록 버튼 활성화
                
        	});
            
        	// 등록버튼 클릭 시
            $(".btn-regist").click(function(e){
            	var name = $(".membr_name").val();
            	var email = $(".member_email").val();
           		var member_no = $(".member_no").val();
           		var point_score = $(".point_his_score").val(); 
            	
            	if(!name || !email){ // 비어있는 input창이 있을 경우
            		e.preventDefault();
            	}
            	
            	// 적립인지 차감인지 확인
            	var point_no = $(".point_no").val();
            	
            	if(confirm("수정 하시겠습니까?")){
            		
            		if(point_no != 1){ // 차감일 경우
	            		// 회원 보유 마일리지 확인
	            		axios({
	            			url:"${pageContext.request.contextPath}/test/point/checkMax?member_no="+member_no,
	            			method:"get"
	            		}).then(function(response){
	            			var maxPoint = response.data;
	            			
	            			if(maxPoint < point_score) {
	            				alert("회원이 보유한 포인트 "+maxPoint+"점 이상으로 차감할 수 없습니다.");
			            		e.preventDefault();
	            			} else {
	            				$(".form").submit();
	            			}
	            		});
            			
            		} else {
            			$(".form").submit();
            		}
            	} else {
            		e.preventDefault();
            	}
            });
            
        	// 정렬 선택 시 form 전송
            $("#order").change(function(){
            	document.querySelector(".list-form").submit();
            });
        });
        
        // 다른 페이지에서 넘어올 경우 (파라미터가 있는 경우)
        $(window).on("load", function(){
        	if($(".membr_name").val()) {
        		$(".select-result").removeClass("on");	// 회원 선택하라는 span 숨김
        		$(".btn-regist").attr("disabled", false); // 등록버튼 활성화
        	}
        });
    </script>
</head>
<body>
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">마일리지</a>
            </li>
            <li class="breadcrumb-item active">적립 및 차감</li>
        </ol>
        <div class="row">
            <div class="offset-sm-4 col-sm-4 offset-md-4 col-md-4">
            	<div class="form-group">
                	<label>회원명</label> <span class="select-result on">수정할 회원을 아래 목록에서 선택해주세요</span>
                    <input type="text" name="member_name" class="form-control member_name" disabled>
                </div>
                <div class="form-group">
                	<label>이메일</label>
                    <input type="text" name="member_email" class="form-control member_email" disabled>
                </div>
                <form action="addRemove" method="post" class="form">
                	<input type="hidden" name="member_no" class="member_no">
                    <div class="form-group">
	                	<label>유형 및 마일리지</label>
	                    <div class="row">
	                    	<div class="col-3">
	                        	<select name="point_no" class="form-control point_no">
	                            	<option value="1">적립</option>
	                                <option value="2">차감</option>
	                            </select>
	                        </div>
	                        <div class="col-9">
	                           <input type="text" name="point_his_score" placeholder="마일리지를 입력하세요" class="form-control point_his_score" required>
	                        </div>
	                    </div>
	                </div>
	                <div class="form-group">
	                	<label>상세내용</label>
	                	<input type="text" name="point_his_detail" placeholder="적립 및 차감 사유를 입력하세요" class="form-control" required>
	                </div>
	                <button type="submit" class="btn btn-primary btn-block btn-regist" disabled>등록</button>
               	</form>
            </div>
        </div>
        <br><br>
        <!-- 회원 검색 -->
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i> 회원 검색
            </div>
            <div class="card-body offset-sm-1 col-sm-10 offset-md-1 col-md-10">
                <div class="table-responsive">
                    <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>
                                	<form action="list3" method="post" class="list-form">
										<select name="branch_no" id="order" class="form-control col-10">
											<option value="0">지점 전체</option>
											<c:forEach items="${branchList}" var="branchDto">
												<option ${param.branch_no==branchDto.branch_no?'selected':''} value="${branchDto.branch_no}">
													${branchDto.branch_name}
												</option>
											</c:forEach>
										</select>
									</form>
                                </th>
                                <th>회원명</th>
                                <th>이메일</th>
                                <th>보유 마일리지</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="memberDto">
                                <tr>
                                	<td>${memberDto.branch_name}</td>
                                    <td>${memberDto.member_name}</td>
                                    <td>${memberDto.member_email}</td>
                                    <td>${memberDto.member_point}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary btn-edit" data-name="${memberDto.member_name}" 
                                        data-email="${memberDto.member_email}" data-no="${memberDto.member_no}">선택</button>
                                        <a href="his_list?member_no=${memberDto.member_no}">
                                            <button class="btn btn-sm btn-secondary del">내역조회</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br><br>
                </div>
            </div>
            <div class="card-footer small text-muted">
                Updated yesterday at 11:59 PM
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>