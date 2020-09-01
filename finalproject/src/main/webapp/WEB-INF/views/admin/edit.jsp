<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<h1>편집</h1>
<form action="${pageContext.request.contextPath}/admin/edit/${adminDto.admin_no}" method="post">
관리자번호 : ${adminDto.admin_no}
<br>
관리자아이디 :${adminDto.admin_id}
<br>
관리자 비밀번호 :<input type="text" name="admin_pw" values="${adminDto.admin_pw}">
<br>
관리자 이름:<input type="text" name="admin_name" values="${adminDto.admin_name}">
<br>
<input type="submit" value="수정">
</form>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>