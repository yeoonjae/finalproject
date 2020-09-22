<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
    integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
</script>
<style>
nav.navbar.bootsnav.no-background.white .attr-nav>ul>li>a, nav.navbar.bootsnav.navbar-transparent.white .attr-nav>ul>li>a,
	nav.navbar.bootsnav.navbar-transparent.white ul.nav>li>a, nav.navbar.bootsnav.no-background.white ul.nav>li>a
	{
	color: black !important;
}
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

    .unoverlap-message {
        display: none;
    }

    .overlap-message {
        display: none;
    }

    .email-input.unoverlap~.unoverlap-message {
        color: red;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }

    .email-input.overlap~.overlap-message {
        color: blue;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
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

    .inemail.correct~.correct-message {
        color: blue;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }

    .inemail.incorrect~.incorrect-message {
        color: red;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }
</style>
<script>
function checkEmail() {
    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/gi;
    var mailTag = document.getElementById("email");

    var isMail = regex.test(mailTag.value);

    mailTag.classList.remove("incorrect");
    mailTag.classList.remove("correct");

    if (!isMail) {
        mailTag.classList.add("incorrect");
        return false;
    } else {
        mailTag.classList.add("correct");
        var input = document.querySelector(".email-input");
        input.classList.remove("overlap");
        input.classList.remove("unoverlap");
        var member_email = input.value;
        //axios를 이용하여 비동기 통신을 보낸다
        //      		axios({옵션}).then(성공코드).catch(오류코드);
        axios({
            url: "${pageContext.request.contextPath}/member_rest/overlap?member_email=" +
                member_email,
            method: "get"
        }).then(function (response) {
            console.log("리스폰트 데이터" + response.data);
            if (!response.data) { //결과 없음 : 사용 가능한 이름
                input.classList.add("unoverlap");
            } else { //결과 있음 : 사용 불가능한 이름
                input.classList.add("overlap");
            }
        });
        return false;
    }
}
function checkCheckEmail() {
    var overlap = document.querySelector(".email-input.overlap");
    var checkEmail = document.querySelector(".inemail.correct");
    if (overlap != null && checkEmail != null) {
    	
        return true;
    } else {
        return false;
    }
}

function checkForm1() {
	console.log(checkForm1);
    if (!checkCheckEmail()) {
        return false;
    } else {
        return true;
    }
}
</script>
<div id="content-wrapper">
	<div class="container-fluid">
	<br><br><br>
		<ol class="breadcrumb">
			<li class="breadcrumb-item">이메일 인증번호 발송</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/find_pw" method="post" onsubmit="return checkForm1();">
				<div class="form-group">
					이메일:
					<input type="email" class="form-control email-input inemail" name="member_email" id="email" onblur="checkEmail();">
				<span class="correct-message">올바른 이메일 형식입니다</span>
                    <span class="incorrect-message">부적절한 이메일 형식입니다.</span>
                    <span class="overlap-message">확인</span>
                    <span class="unoverlap-message">이 이메일은 가입이 되어 있지 않습니다. </span>
				</div>
				<div class="form-group">
					<input type="submit" value="이메일 전송" required>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>