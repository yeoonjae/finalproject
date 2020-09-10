<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<style>
        /* 입력창 관련 스타일 */
        .form-input {
            border: 1px solid black;
        }

        .form-input.correct {
            border: 1px solid blue;
        }

        .form-input.incorrect {
            border: 1px solid red;
        }

        .correct-message {
            color: blue;
        }

        .incorrect-message {
            color: red;
        }

        /* 메시지 관련 스타일 */
        .correct-message,
        .incorrect-message {
            display: none;
        }

        .form-input.correct~.correct-message {
            display: block;
        }

        .form-input.incorrect~.incorrect-message {
            display: block;
        }
</style>
<script >
   
function pwCheck() {

    var regex = /[A-Za-z\d]{8,20}/g;
    var pwTag = document.querySelector('input[name=member_pw]');

    var isCheckPw = regex.test(pwTag.value);


    pwTag.classList.remove('correct');
    pwTag.classList.remove('incorrect');

    if (!isCheckPw) {
        pwTag.classList.add('incorrect');
        return false;
    }
    else{
        return true;
    }
}
    
  function nameCheck() {
    var regex = /[가-힣]{2,7}/g;
	var nameTag = document.querySelector('input[name=member_name]');
    
	var isName = regex.test(nameTag.value);
	
	nameTag.classList.remove("incorrect");
	
    if (!isName) {
        nameTag.classList.add('incorrect');
        return false;
    }
    else {
        return true;
    }
    
}
    
function mailCheck() {
   var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/gi;
    var mailTag = document.querySelector('input[name=member_mail]');
    
    var isMail = regex.test(mailTag.value);
    
    mailTag.classList.remove("incorrect");
    
    if (!isMail) {
    	mailTag.classList.add("incorrect");
        return false;
    }
    else {
        return true;
    }
    
}

    

//폼 전송 여부를 판정하는 함수
function checkForm() {
    var nameIsValid = checkName();
    var pwIsValid = checkPw();
    var checkPwIsValid = checkCheckPw();
    //아이디가 맞는 경우는 전송될테니까 추가적인 작업이 필요하지 않지만 틀린 경우는 처리를 해야한다.
    var nameTag = document.getElementById("name");
    var pwTag = document.getElementById("pw");
    var checkPwTag = document.getElementById("checkPw"); 
    //뭐가 붙어있을지 모르니 둘 다 삭제
    nameTag.classList.remove("correct");
    nameTag.classList.remove("incorrect");
    pwTag.classList.remove("correct");
    pwTag.classList.remove("incorrect");
    checkPwTag.classList.remove("correct");
    checkPwTag.classList.remove("incorrect");
    if (nameIsValid == false) {
        nameTag.classList.add("incorrect");
    } else {
        nameTag.classList.add("correct");
    }
    if (pwIsValid == false) {
        pwTag.classList.add("incorrect");
    } else{
        pwTag.classList.add("correct");
    }
	if(checkPwIsValid==false){
    checkPwTag.classList.add("incorrect");
	}else{
    checkPwTag.classList.add("correct");
	}
    if(!pwIsValid ||!nameIsValid || !checkPwIsValid){
        return false;
    }else{
        return true;
    }
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script> 
<script>
	function checkOverLap(){
		var email =document.querySelector(".email_input");
		var span = document.querySelector(".email_input+.email_span");
		var name= email.value;
		console.log(name);
		if(!name){
			return;
		}
		axios({
			url:"${pageContext.request.contextPath}/member_rest/overlap?member_email="+member_email,
		method:"get"
		})
		.then(function(response){
			console.log(response.data);
			if(!response.data){
				span.textContext = "사용 가능한 이메일입니다."
			}else{
				span.textContext = "이미 사용 중인 이메일입니다."
			}
		})
	}
</script>
<div id="content-wrapper">
	<div class="container-fluid" >
		<ol class="breadcrumb">
			<li class="breadcrumb-item">회원가입</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/join" method="post" onsubmit="return checkForm();">
				<div class="form-group">
				<input type="hidden" name="member_no" value="${member_no+1}">
				</div>
				<div class="form-group">
				회원 이메일 : 
				<input type="email" class="form-control email_input" name="member_email" onblur="checkOverlap();" maxlength="300">
				<span class="email_span"></span>
				</div>
				<div class="form-group">
				회원 이름:
				<input type="text" class="form-control" id="name" name="member_name">
				</div>
				<div class="form-group">
				회원 비밀번호 :
				<input type="password" class="form-control" id="pw" name="member_pw">
				</div>
				<div class="form-group">
				비밀번호 확인:
				<input type="password" class="form-control" id="checkPw">
				</div>
				<div class="form-group">
				<input type="submit" class="form-control" value="가입">
				</div>
			</form>
		</div> 
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>