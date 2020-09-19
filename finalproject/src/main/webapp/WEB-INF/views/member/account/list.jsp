<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">회원 목록</li>
		</ol>
		<div class="card mb-3">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="auto" cellspacing="0">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>회원 이름</th>
								<th>회원 이메일</th>
								<th>회원 마일리지</th>
								<th>회원 가입일</th>
								<th>회원 로그인일자</th>
								<th>회원 충전금액</th>
								<th>관리자 메뉴</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberDto" items="${list}">
								<tr>
									<td>${memberDto.member_no}</td>
									<td>${memberDto.member_name}</td>
									<td>${memberDto.member_email}</td>
									<td>${memberDto.member_point}</td>
									<td>${memberDto.member_join}</td>
									<td>${memberDto.member_login}</td>
									<td>${memberDto.member_charge}</td>
									<td>
										<a href="info?member_no=${memberDto.member_no}">회원 정보</a>
										|
										<a href="edit?member_no=${memberDto.member_no}">수정</a>
										|
										<a href="delete?member_no=${memberDto.member_no}">삭제</a>
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