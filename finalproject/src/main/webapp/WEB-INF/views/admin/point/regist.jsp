<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>마일리지 유형 등록</h1>
<form action="regist" method="post">
	<select name="point_type">
		<option>적립</option>
		<option>차감</option>
	</select>
	<h3>상세내용</h3>
	<input type="text" name="point_detail" placeholder="상세내용을 입력하세요">
	<h3>마일리지</h3>
	<input type="text" name="point_score" placeholder="마일리지를 입력하세요">
	<input type="submit" value="등록">
</form>