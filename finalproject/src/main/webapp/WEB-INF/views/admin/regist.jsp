<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${pageContext.request.contextPath}/admin/regist" method="post">

<h2>계정 등록</h2>
<div>
<label>번호</label>
${admin_no}
<label>아이디</label>
<input type="text" name="admin_id" required value="study${admin_no}">
</div>
<div>
<label>비밀번호</label>
<input type="text" name="admin_pw" required value="study${admin_no}">
</div>
<div>
<label>이름</label>
<input type="text" name="admin_name"required value="study${admin_no}">
</div>
<div>
<label>이메일</label>
<input type="text" name="email" placeholder="이메일" required>
</div>
<div>
	<input type="submit" value="계정 등록 /이메일 발송">
</div>
</form>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>