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
<script>
	$(function(){
		$(".local-list").on("change",function(){
			var local = $(".local-list");
			var branch = $(".branch-list");
      		var local_no = $(".local-list").val();
			console.log(local_no);
        		axios({
        			url:"${pageContext.request.contextPath}/test/message/branchList?local_no="+local_no,
        			method : "get"
        		})
        		.then(function(response){
        			$(".branch-option").remove();
        			$.each(response.data,function(i){
        				$("<option>").attr("value",response.data[i].branch_no)
        				.attr("class","branch-option")
        				.text(response.data[i].branch_name)
        				.appendTo(branch);
        			})
        			
        		})
		});
	});
    //isValid의 결과에 따라서 입력창에 correct / incorrect 클래스를 추가
    //비밀번호를 검사하는 함수 : 반드시 true 또는 false를 반환해야 checkForm에서 사용이 가능하다
    function checkPwd() {

        var regex = /[0-9a-zA-Z]{8,20}/g;
        var pwTag = document.getElementById("pw");
        var isPw = regex.test(pwTag.value);
        pwTag.classList.remove("correct");
        pwTag.classList.remove("incorrect");
        console.log(isPw);
        if (!isPw) {
            pwTag.classList.add("incorrect");
            return false;
        } else {
            pwTag.classList.add("correct");
            return true;
        }
    }
    function checkCheckPw() {
        var pwTag = document.getElementById("pw");
        var checkPwTag = document.getElementById("checkPw");
        checkPwTag.classList.remove("correct");
        checkPwTag.classList.remove("incorrect");
        if (pwTag.value === checkPwTag.value) {
            checkPwTag.classList.add("correct");
        } else {
            checkPwTag.classList.add("incorrect");
        }
        return pwTag.value === checkPwTag.value;
    }

    
            function checkForm1() {
                console.log("이름" + checkName());
                console.log("비밀번호" + checkPwd());
           
                if (!checkName() || !checkPwd()||
                    !checkCheckPw()) {
                    return false;
                } else {
                    return true;
                }
            }
</script>			
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/check" method="post" onsubmit="return checkForm1();">
				<div class="form-group">
				회원 비밀번호 : <input type="password" class="form-control" name="member_pw" oninput="checkPw();">
				<span class="correct-message">올바른 비밀번호 형식입니다</span>
				<span class="incorrect-message">비밀번호는 영문대/소문자와 숫자로8~16자 내외로 구성하세요</span>
				</div>
				<div class="form-group">
                    비밀번호 확인: <input type="password" class="form-control intext" id="checkPw" oninput="checkCheckPw();"
                        maxlength="16"> <span class="correct-message">비밀번호가 일치합니다.</span> <span
                        class="incorrect-message">비밀번호가 불일치합니다.</span>
                </div>
				<div class="form-group">
				<input type="submit" value="확인">
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>