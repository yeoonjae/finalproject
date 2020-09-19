<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<style>
    .intext {
        width: 100%;
        padding-left: 0.5rem;
        padding: 0.5rem;
    }

    .incorrect-message {
        display: none;
    }

    .correct-message {
        display: none;
    }

    .intext.correct~.correct-message {
        color: blue;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }

    .intext.incorrect~.incorrect-message {
        color: red;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }

</style>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">비밀번호 확인</li>
		</ol>	
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/check" method="post" >
				<div class="form-group">
				회원 비밀번호 : <input type="password" class="form-control intext"  name="member_pw" oninput="checkPw();">
				</div>
				<div class="form-group">
				<input type="submit" value="확인">
				</div>
				<div class="form-group">
				<c:if test="${not empty param.error}">
				<div class="form-label-group">
            		<font color="FF0000">입력하신 비밀번호가 정보에 맞지 않습니다.</font>
            	</div>
				</c:if>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>