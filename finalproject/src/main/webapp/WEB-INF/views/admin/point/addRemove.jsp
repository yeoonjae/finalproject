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
        	
            $(".btn-edit").click(function(){
            	var no = $(this).next().val();
                axios({
                    url:"${pageContext.request.contextPath}/test/member/list?member_no="+no,
                    method:"get"
                }).then(function(response){
                    var member_name = response.data.member_name;
                    var member_email = response.data.member_email;
                    var member_no = response.data.member_no;

                    $("input[name=member_name]").val(member_name);
                    $("input[name=member_email]").val(member_email);
                    $(".member_no").val(member_no);
            	});   		
            	span.textContent = "";
        	});
            
            $(".btn-regist").click(function(e){
            	var name = document.querySelector("input[name=member_name]").value;
            	var email = document.querySelector("input[name=member_email]").value;
            	
            	if(!name || !email) {
            		span.textContent = "수정할 회원을 아래 목록에서 선택해주세요";
            	}
            	
            	if(confirm("수정 하시겠습니까?")){
            		if(name || email){
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
            <div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
                    <div class="form-group">
                        <label>회원명</label> <span class="select-result"></span>
                        <input type="text" name="member_name" class="form-control" disabled>
                    </div>
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="text" name="member_email" class="form-control" disabled>
                    </div>
                    <form action="addRemove" method="post" class=".form">
                        <input type="hidden" name="member_no" class="member_no">
                        <div class="form-group">
                        <label>유형 및 마일리지</label>
                        <div class="row">
                            <div class="col-3">
                                <select name="point_no" class="form-control">
                                    <option value="1">적립</option>
                                    <option value="2">차감</option>
                                </select>
                            </div>
                            <div class="col-9">
                                <input type="text" name="point_his_score" placeholder="마일리지를 입력하세요" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>상세내용</label>
                        <input type="text" name="point_his_detail" placeholder="적립 및 차감 사유를 입력하세요" class="form-control" required>
                    </div>
                    <button class="btn btn-primary btn-block btn-regist">등록</button>
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
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>회원명</th>
                                <th>이메일</th>
                                <th>보유 마일리지</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="memberDto">
                                <tr>
                                    <td>${memberDto.member_name}</td>
                                    <td>${memberDto.member_email}</td>
                                    <td>${memberDto.member_point}</td>
                                    <td>
                                        <button class="btn btn-primary btn-edit">수정</button>
                                        <input type="hidden" name="member_no" value="${memberDto.member_no}">
                                        <a href="list">
                                            <button class="btn btn-primary del">내역</button>
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
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>