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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
    <script>
        $(function(){
        	$(".btn-search").click(function(){
        		var member_name = $(".member_name").val();
        		var branch_no = $(".branch_no").val();
        		
        		axios({
        			url:"${pageContext.request.contextPath}/test/member/search?member_name="+member_name+"&branch_no="+branch_no,
        			method:"get"
        		}).then(function(response){
                	var str;
                	var button = $("<button>");
                	
                	$(".list-table").html("");
                	
                	$.each(response.data , function(i){
                        var str = '<tr><td>' + response.data[i].branch_name + '</td><td>' + response.data[i].member_name + '</td><td>' + response.data[i].member_email 
                        		+ '</td><td><button class="btn-primary btn edit" data-dismiss="modal">선택</button></td></tr>';
    	               $(".list-table").append(str);
                    });
        		});
        	});
        	
            $('#test-modal').modal({backdrop:'static'});
        });
    </script>
</head>
<body>
    <!-- 모달 -->
    <div class="modal" id="test-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">회원 검색</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                    	<div class="form-group">
                        	<!-- 지점 선택 -->
                            <div class="row">
                            	<div class="col-3">
                                	<select name="branch_no" class="form-control col-10 branch_no">
										<option value="0">지점 전체</option>
										<c:forEach items="${branchList}" var="branchDto">
											<option value="${branchDto.branch_no}">${branchDto.branch_name}</option>
										</c:forEach>
									</select>
                                </div>
                                <div class="col-9">
                                	<!-- 이름 검색 -->
                                    <input type="text" class="member_name form-control" name="member_name" placeholder="회원명을 입력하세요">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block btn-search">검색</button>
                    </div>
                </div>
                <!-- 회원 목록 -->
                <div class="modal-footer">
                    <table class="table table-bordered table-hover" width="100%">
                        <thead>
                            <tr>
                                <th>지점명</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody class="list-table">
                        	<%-- <c:forEach items="${list}" var="memberDto">
                                <tr>
                                	<td>${memberDto.branch_name}</td>
                                    <td>${memberDto.member_name}</td>
                                    <td>${memberDto.member_email}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">선택</button>
                                    </td>
                                </tr>
                            </c:forEach> --%>
                        </tbody>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>