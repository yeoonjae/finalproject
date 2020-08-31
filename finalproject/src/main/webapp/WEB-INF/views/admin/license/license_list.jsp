<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<div id="content-wrapper">

	<div class="container-fluid">

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">이용권 관리</a></li>
			<li class="breadcrumb-item active">이용권 목록</li>
		</ol>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> 이용권 목록
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>시간</th>
								<th>가격</th>
								<th width="10%"> </th>
								<th width="10%"> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="licenseDto" items="${list}">
								<tr>
									<td>${licenseDto.license_no}</td>
									<td>${licenseDto.license_time}</td>
									<td>${licenseDto.license_price}</td>
									<td  align="center"><a href="license_edit/${licenseDto.license_no}">수정</a></td>
									<td  align="center"><a href="license_delete/${licenseDto.license_no}">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
		</div>
		</body>
		</html>
		<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>