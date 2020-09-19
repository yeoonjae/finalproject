<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${not empty admininfo.admin_auth}">
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>	
</c:when>
<c:when test="${not empty memberinfo}">
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>	
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>	
</c:otherwise>
</c:choose>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<style>
.incorrect-message {
	display: none;
}
.insecret.incorrect ~.incorrect-message {
	color: red;
	font-size: 16;
	display: block;
	font-size: 13px;
	margin: 0.3rem;
}
</style>
<script>
	function cert(){
		var input = document.querySelector(".insecret");
		input.classList.remove("incorrect");
		var secret = input.value;
		axios(
				{
					url : "${pageContext.request.contextPath}/member_rest/cert_email?secret="
							+ secret,
					method : "get"
				}).then(function(response){
			if (!response.data) {//결과 없음 : 사용 가능한 이름
				input.classList.add("incorrect");
			}
		});
		return false;
	}
	function checkCert(){
		
        var checkSecret = document.querySelector(".insecret.incorrect");
        if(checkSecret!=null){
        	return false;
        }else{
        	return true;
        }
	}
</script>
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">인증번호 확인</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/cert_email" method="post" onsubmit="return checkCert();">
				<div class="form-group">
				<input type="hidden" class="from-control" name="member_no" value="${memberDto.member_no}">
				<input type="hidden" class="from-control" name="member_email" value="${memberDto.member_email}">
				<input type="hidden" class="from-control" name="member_name" value="${memberDto.member_name}">
				<input type="hidden" class="from-control" name="member_pw" value="${memberDto.member_pw}">
				<input type="hidden" class="from-control" name="branch_no" value="${memberDto.branch_no}">
				<input type="text" class="form-control insecret" id="secret" name="secret" maxlength="6" onblur="cert();" >
				<span class="incorrect-message">시간이 초과 했거나 인증번호가 불일치 합니다.</span> 
				</div>
				<div class="form-label-group">
            		<font color="FF0000">5분 안에 인증해주시기 바랍니다.</font>
            	</div>
				<div class="form-group">
					<input type="submit" value="인증하기" required>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>