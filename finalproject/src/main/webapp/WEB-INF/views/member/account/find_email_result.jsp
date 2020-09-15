<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${not empty admininfo.admin_auth}">
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>	
</c:when>
<c:when test="${not empty memberinfo}">
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>	
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>	
</c:otherwise>
</c:choose>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">회원 이메일</li>
		</ol>
		<div class="card mb-3">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered"  width="70%" >
						<thead>
							<tr>			
								<th>회원 이메일</th>
								<th>비밀번호 찾기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member_email" items="${member_email}">
								<tr>
									<td>${member_email}</td>
									<td>
										<a href="find_pw">비밀번호 찾기</a>
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
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>