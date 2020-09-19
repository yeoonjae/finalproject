<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${not empty memberinfo}">
		<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	</c:when>
	<c:when test="${not empty admininfo.admin_auth}">
		<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
	</c:when>
</c:choose>
<style>
.row-wrap{
	margin-top: 10px;
	display:block;
}
</style>
<div class="container-fluid row-wrap">
	<br>
	<br>
	<br>
	<br>
	
	<ol class="breadcrumb">
		<li class="breadcrumb-item">회원 정보</li>
	</ol>
	<div class="card mb-3">
		<div class="card-body">
			<div class="card-body">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<tbody>
							<tr>
							<th>회원 번호</th>
							<td>${memberDto.member_no}</td>
							</tr>
							<tr>
							<th>회원 이메일</th>
							<td>${memberDto.member_email}</td>
							</tr>
							<tr>
							<th>회원 이름</th>
							<td>${memberDto.member_name}</td>
							</tr>
							<tr>
							<th>소속 지점</th>
							<td>${memberDto.branch_name}</td>
							</tr>
							<tr>
							<th>회원 마일리지</th>
							<td>${memberDto.member_point}</td>
							</tr>
							<tr>
							<th>회원 가입일자</th>
							<td>${memberDto.member_join}</td>
							</tr>
							<tr>
							<th>회원 로그인일자</th>
							<td>${memberDto.member_login}</td>
							</tr>
							<tr>
							<th>회원 충전금액</th>
							<td>${memberDto.member_charge}</td>
							</tr>
					</tbody>
				</table>
				<c:if test="${not empty memberinfo}">
				<div>
					<a href="check?member_no=${memberDto.member_no}">회원 정보 수정</a>
				</div>
				<div>
					<a href="check_delete?member_no=${memberDto.member_no}">회원 탈퇴</a>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- <button type="button" onclick="location.href='joinUs.jsp' ">회원가입</button> -->
<c:choose>
<c:when test="${not empty admininfo}">
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>
</c:when>
<c:when test="${not empty memberinfo}">
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
</c:when>
</c:choose>