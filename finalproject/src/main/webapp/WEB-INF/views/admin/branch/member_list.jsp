<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<style>
	.btn-right{
		float: right;
	}
</style>
<div class="container-fluid">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">관리자 정보 수정</li>
	</ol>
	<div class="card mb-3">
		<div class="card-body">
			<div class="card-body">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>보유 충전시간</th>
							<th>보유 포인트</th>
							<th>가입일</th>
							<th>최근 로그인 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="list" items="${list}">
							<tr>
								<td>${list.member_no}</td>
								<td>${list.member_name}</td>
								<td>${list.member_email}</td>
								<td>${list.member_charge}</td>
								<td>${list.member_point}</td>
								<td>${list.member_join}</td>
								<td>${list.member_login}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<a href="list">
						<button class="btn btn-outline-secondary right btn-right">목록보기</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>