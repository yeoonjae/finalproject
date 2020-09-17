<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="${pageContext.request.contextPath}/notice/write" method="post">
	<table>
	<tbody border="1">
		<tr>
		<th>제목</th>
		<td><input type="text" name="notice_title"></td>
		</tr>
		<tr>
		<th>내용</th>
		<td><input type="text" name="notice_content"></td>
		</tr>
	</tbody>
	</table>
</form>