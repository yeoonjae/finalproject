<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty admininfo.admin_auth}">
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
</c:if>
<div class="container-fluid">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">회원 정보 수정</li>
	</ol>
	<div class="card mb-3">
		<div class="card-body">
			<div class="card-body">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 이메일</th>
							<th>회원 비밀번호</th>
							<th>회원 이름</th>
							<th>회원 마일리지</th>
							<th>회원 가입일자</th>
							<th>회원 로그인일자</th>
							<th>회원 충전금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${memberDto.member_no}</td>
							<td>${memberDto.member_email}</td>
							<td>${memberDto.member_pw}</td>
							<td>${memberDto.member_name}</td>
							<td>${memberDto.member_point}</td>
							<td>${memberDto.member_join}</td>
							<td>${memberDto.member_login}</td>
							<td>${memberDto.member_charge}</td>
						</tr>
					</tbody>
				</table>
				<div>
					<a href="edit?member_no=${memberDto.member_no}">회원 정보 수정</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <button type="button" onclick="location.href='joinUs.jsp' ">회원가입</button> -->

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>