<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<form action="${pageContext.request.contextPath}/admin/edit" method="post">
<input type="hidden" name="admin_no" value="${adminDto.admin_no}">
<h1>편집</h1>
관리자번호 : ${adminDto.admin_no}
<br>
관리자아이디 :${adminDto.admin_id}
<br>
관리자 비밀번호 :<input type="text" name="admin_pw"value="${adminDto.admin_pw}">
<br>
관리자 이름:<input type="text" name="admin_name" value="${adminDto.admin_name}">
<br>
<input type="submit" value="수정">
</form>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>