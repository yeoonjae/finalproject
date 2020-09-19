<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>

<!-- 관리자 로그인 페이지 -->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 로그인</title>

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
        <div class="card-header">회원 로그인</div>
        <div class="card-body">
        <script>
        $(document).ready(function(){
        	 
            // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
            var key = getCookie("key");
            $("#inputEmail").val(key); 
             
            if($("#inputEmail").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
                $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
            }
             
            $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
                if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                    setCookie("key", $("#inputEmail").val(), 7); // 7일 동안 쿠키 보관
                }else{ // ID 저장하기 체크 해제 시,
                    deleteCookie("key");
                }
            });
             
            // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
            $("#inputEmail").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
                if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                    setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
                }
            });
        });
         
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
         
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
         
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }

        </script>
        <!-- 관리자 로그인 부분  -->
          <form name="fform" action="${pageContext.request.contextPath}/member/account/login" method="post">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="inputEmail" class="form-control" placeholder="이메일" 
                required="required" autofocus="autofocus" name="member_email">              	
                <label for="inputEmail">이메일</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control"
                 placeholder="Password" required="required" name="member_pw">
                <label for="inputPassword">비밀번호</label>
              </div>
            </div>
            <div class="form-group">
              <div class="checkbox">
                <label>
                  <input type="checkbox" id="idSaveCheck" value="remember-me">
                	이메일 기억하기
                </label>
              </div>
            </div>
            <div class="form-group">
            <c:if test="${not empty param.error}">
            	<div class="form-label-group">
            		<font color="FF0000">입력하신 로그인 정보가 맞지 않습니다.</font>
            	</div>
            </c:if>
            <input type="submit" class="btn btn-primary btn-block" id="loginbtn"value="Login">
            </div>
          </form>
          <div class="text-center">
          	<br>
            <a class="d-block small" href="${pageContext.request.contextPath}/member/account/find_email">이메일 찾기</a>
            <a class="d-block small" href="${pageContext.request.contextPath}/member/account/find_pw">비밀번호 찾기</a>
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