<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
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
							<th>관리자 번호</th>
							<th>관리자 아이디</th>
							<th>관리자 비밀번호</th>
							<th>관리자 이름</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${adminDto.admin_no}</td>
							<td>${adminDto.admin_id}</td>
							<td>${adminDto.admin_pw}</td>
							<td>${adminDto.admin_name}</td>
						</tr>
					</tbody>
				</table>
				<div>
					<a href="edit?admin_no=${adminDto.admin_no}">관리자 정보 수정</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <button type="button" onclick="location.href='joinUs.jsp' ">회원가입</button> -->

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>