<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<h1>관리자 정보</h1>
관리자 번호 : ${adminDto.admin_no}
<br>
관리자 아이디 : ${adminDto.admin_id}
<br>
관리자 비밀번호 : ${adminDto.admin_pw}
<br>
관리자 이름 : ${adminDto.admin_name}
<br>
<!-- <button type="button" onclick="location.href='joinUs.jsp' ">회원가입</button> -->
<button href="edit/${adminDto.admin_no}">관리자 정보 수정</button>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>