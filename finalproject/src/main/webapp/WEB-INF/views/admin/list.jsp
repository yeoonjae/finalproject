<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<h1>관리자 목록</h1>
<table>
	<thead>
		<tr>
			<th>관리자 번호</th>
			<th>관리자 이름</th>
			<th>관리자 아이디</th>
			<th>관리자 비밀번호</th>
			<th>관리자 가입일자</th>
			<th>관리자 로그인일자</th>
			<th>관리 메뉴</th>
	</thead>
	<tbody>
		<c:forEach var="adminDto" items="${list}">
			<tr>
				<td>${adminDto.admin_no}</td>
				<td>${adminDto.admin_name}</td>
				<td>${adminDto.admin_id}</td>
				<td>${adminDto.admin_pw}</td>
				<td>${adminDto.admin_join}</td>
				<td>${adminDto.admin_login}</td>
				<td><a href="info/${adminDto.admin_no}">관리자 정보</a> | <a
					href="edit/${adminDto.admin_no}">수정</a> | <a
					href="delete/${adminDto.admin_no}">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>
