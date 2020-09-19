<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<style>
	.sm-td{
		width: 150px;
	}
</style>
<div id="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">리뷰관리</a></li>
			<li class="breadcrumb-item active">목록</li>
		</ol>

		<c:if test="${admininfo.admin_auth eq '본사'}">
			<div class="card-header">
				<select class="form-control" style="width: 20%; display: inline-block; margin-left: 15x;">
					<option>전체보기</option>
					<option>지역별</option>
					<option>지점별</option>
				</select>
			</div>
		</c:if>
		<div class="card-body">
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
						<td>${list.review_title }</td>
						<td><button class="btn btn-secondary btn-sm">상세보기</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>