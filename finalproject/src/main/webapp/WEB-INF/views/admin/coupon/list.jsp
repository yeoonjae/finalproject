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
		.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
			vertical-align: middle;
			text-align: center;
		}
		.coupon_issue.red{
			color: red;
			font-weight: 900;
		}
		.coupon_issue.blue{
			color: blue;
			font-weight: 900;
		}
		.coupon_issue.navy{
			color: navy;
			font-weight: 900;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
	<script>
		$(function(){
			$('.modal').modal('hide');
			
			// 구분에 따라 글자 색상 설정
			$.each($(".coupon_issue"), function(i){
				var td = $(this).text();
				if(td=="유효"){
					$(this).addClass("red");
				} else if(td=="예정"){
					$(this).addClass("blue");
				} else {					
					$(this).addClass("navy");
				}
			});
			
			// 파라미터 조회
			$.urlParam = function(name) {
        	    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
        	                      .exec(window.location.href);
        	    if (results == null) {
        	         return 0;
        	    }
        	    return results[1] || 0;
        	}
        	
			// 파라미터에 지점번호가 있으면
			// = 지점별 목록일 경우 네비 '전체' 비활성화
        	if($.urlParam('branch_no')){
				$(".nav-all").removeClass("active");
				$(".nav-branch").addClass("active");
        	}
        	
			// 네비 '전체' 클릭 시 활성화
			$(".nav-all").click(function(){
				location.href = "${pageContext.request.contextPath}/admin/coupon/list";
				$(".nav-branch").removeClass("active");
				$(this).addClass("active");
			});
			
			// 삭제 클릭 시
			$(".btn-delete").click(function(e){
				if($(this).data("issue")=='유효') {
					e.preventDefault();
					alert("기간이 만료되지 않은 쿠폰은 삭제할 수 없습니다");
				} else {
					if(confirm("정말 삭제 하시겠습니까?")){
	            	} else {
	            		e.preventDefault();
	            	}
				}
			});
			
			// 수정 클릭 시
			$(".btn-edit").click(function(e){
				if($(this).data("issue")=='만료') {
					e.preventDefault();
					alert("기간이 만료된 쿠폰은 수정할 수 없습니다");
				} else if($(this).data("issue")=='유효') {
					e.preventDefault();
					alert("이미 발급된 쿠폰은 수정할 수 없습니다");
				} else {
					$(".modal").modal("show");
				}
			});
			
			// 정렬 선택 시 
			$(".order").change(function(){
				var order = $(this).val();
				if(!$.urlParam('branch_no')){
					location.href = "${pageContext.request.contextPath}/admin/coupon/list?order="+order;
				} else {				
					location.href = "${pageContext.request.contextPath}/admin/coupon/list?order="+order+"&branch_no="+$.urlParam('branch_no');
				}
			});
			
		});
	</script>
</head>
<body>
    <div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
          	<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">쿠폰 목록</a>
            	</li>
            	<li class="breadcrumb-item active">조회</li>
            </ol>
            <div class="row">
                <div class="offset-md-1 col-md-10 offset-sm-1 col-sm-10">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link nav-all active" data-toggle="tab" href="#all">전체 대상</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-branch disabled" data-toggle="tab" href="#branch">지점 대상</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">지점선택</a>
                            <div class="dropdown-menu" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 40px, 0px);" x-placement="bottom-start">
                            <c:forEach items="${branchList}" var="branchDto">
	                            <a class="dropdown-item branch-select" href="list?branch_no=${branchDto.branch_no}">${branchDto.branch_name}</a>
                            </c:forEach>
                            </div>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade show active" id="all">
                            <br>
                                <table class="table table-hover table-condensed" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>
                                            	<select class="form-control order" name="order">
                                            		<option value="">전체</option>
                                            		<option value="start" ${param.order=="start"?'selected':''}>예정</option>
                                            		<option value="ing" ${param.order=="ing"?'selected':''}>유효</option>
                                            		<option value="finish" ${param.order=="finish"?'selected':''}>만료</option>
                                            	</select>
                                            </th>
                                            <th>발급대상</th>
                                            <th>쿠폰명</th>
                                            <th>할인률(%)</th>
                                            <th>기간</th>
                                            <th>발급일</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list-wrap">
                                    	<c:forEach items="${couponList}" var="couponDto">
                                        <tr>
                                        	<td class="coupon_issue">${couponDto.coupon_issue}</td>
                                        	<c:choose>
	                                        	<c:when test="${couponDto.coupon_category != '전체'}">
		                                            <td>${couponDto.branch_name}</td>	
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        		<td>${couponDto.coupon_category}</td>
	                                        	</c:otherwise>
                                        	</c:choose>
                                            <td>${couponDto.coupon_name}</td>
                                            <td>${couponDto.coupon_discount}</td>
                                            <td>
                                                <p>
                                                    ${couponDto.coupon_start}
                                                </p>
                                                <p>
                                                    ~ ${couponDto.coupon_finish}
                                                </p>
                                            </td>
                                            <td>${couponDto.coupon_date}</td>
                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                        	<hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>