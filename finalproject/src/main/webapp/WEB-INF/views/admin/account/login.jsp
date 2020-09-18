<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<!-- 관리자 로그인 페이지 -->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 로그인</title>

    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" 
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" 
	crossorigin="anonymous">
	</script>
  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">관리자 로그인</div>
        <div class="card-body">
        
        <!-- 관리자 로그인 부분  -->
          <form action="${pageContext.request.contextPath}/admin/account/login" method="post">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="inputEmail" class="form-control" placeholder="아이디" required="required" autofocus="autofocus" name="admin_id">
                <label for="inputEmail">아이디</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" name="admin_pw">
                <label for="inputPassword">비밀번호</label>
              </div>
            </div>
            <div class="form-group">
            <c:if test="${not empty param.error}">
            	<div class="form-label-group">
            		<font color="FF0000">입력하신 로그인 정보가 맞지 않습니다.</font>
            	</div>
            </c:if>
            <input type="submit" class="btn btn-primary btn-block" value="Login">
            </div>
          </form>
          <div class="text-center">
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>
    