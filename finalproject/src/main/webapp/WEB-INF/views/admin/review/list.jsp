<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<style>
	.sm-td{
		width: 150px;
	}
</style>
<script>

	$(function(){
		//parameter받아오는 코드
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = window.location.search.substring(1),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');

		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		};
		//파라미터가 있다면 지점선택을 보여줌
		if(getUrlParameter('branch_no')){
			$(".nav-all").removeClass("active");
			$(".nav-branch").addClass("active");
		}
		
		$(".nav-all").click(function(){
			location.href = "${pageContext.request.contextPath}/admin/review/list";
			$(".nav-branch").removeClass("active");
			$(".nav-all").addClass("active");
		});
	})
</script>
<div id="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">리뷰관리</a></li>
			<li class="breadcrumb-item active">목록</li>
		</ol>

		<div class="card-body">
			<c:if test="${admininfo.admin_auth eq '본사'}">
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
                        <c:forEach items="${branchDto}" var="branchDto">
                         <a class="dropdown-item branch-select" href="list?branch_no=${branchDto.branch_no}">${branchDto.branch_name}</a>
                        </c:forEach>
                        </div>
                    </li>
                </ul>
	        </c:if>
	         <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade show active" id="all">
                            <br>
			<table class="table table-bordered" id="dataTable" width="100%" id="dataTable" cellspacing="0" style="text-align: center;">
				<thead>
					<tr>
						<th class="sm-td">지역</th>
						<th class="sm-td">지점명</th>
						<th>제목</th>
						<th class="sm-td">관리메뉴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.local_name}</td>
						<td>${list.branch_name}</td>
						<td>${list.review_title}</td>
						<td>
							<a href="detail?review_no=${list.review_no}">
							<button class="btn btn-secondary btn-sm">상세보기</button>
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

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>