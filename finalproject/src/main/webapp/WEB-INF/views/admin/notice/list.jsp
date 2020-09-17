<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>공지사항</div>
<table>
	<thead>
		<tr>
			<th>공지 번호</th>
			<th>공지 제목</th>
			<th>공지 내용</th>
			<th>등록시간</th>
		</tr>
	</thead>
<tbody>
<c:forEach var="list" items="${list}">
	<tr>
	<td>${list.notice_no}</td>
	<td>${list.notice_title}</td>
	<td>${list.notice_content}</td>
	<c:if test="${admininfo.admin_auth eq '본사'}">
	<td>
	<a href="content?notice_no=${list.notice_no}">내용</a>
		|
		<a href="edit?notice_no=${list.notice_no}">수정</a>
		|
		<a href="delete?notice_no=${list.notice_no}">삭제</a>
	</td>
	</c:if>
	</tr>
</c:forEach>
</tbody>
</table>
