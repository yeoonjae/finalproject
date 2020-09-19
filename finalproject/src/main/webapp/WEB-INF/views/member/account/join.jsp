<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
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

<br>
<br>
<br>
<br>
<br>
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

    .unoverlap-message {
        display: none;
    }

    .overlap-message {
        display: none;
    }

    .email-input.unoverlap~.unoverlap-message {
        color: blue;
        font-size: 16;
        display: block;
        font-size: 13px;
        margin: 0.3rem;
    }

    .email-input.overlap~.overlap-message {
        color: red;
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
	$(function(){
		$(".local-list").on("change",function(){
			var local = $(".local-list");
			var branch = $(".branch-list");
      		var local_no = $(".local-list").val();
			var local_no = $(this).val();
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

    function checkName() {
        var regex = /[가-힣]{2,7}/g;
        var nameTag = document.getElementById("name");

        var isName = regex.test(nameTag.value);
        nameTag.classList.remove("correct");
        nameTag.classList.remove("incorrect");

        if (!isName) {
            nameTag.classList.add("incorrect");
            return false;
        } else {
            nameTag.classList.add("correct");
            return true;
        }
    }

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
        var unoverlap = document.querySelector(".email-input.unoverlap");
        var checkEmail = document.querySelector(".inemail.correct");
        console.log("중복" + unoverlap);
        console.log("체크" + checkEmail);
        if (unoverlap != null && checkEmail != null) {
        	
            return true;
        } else {
            return false;
        }
    }
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
           
                if (!checkName() || !checkCheckEmail() || !checkPwd()||
                    !checkCheckPw()) {
                    return false;
                } else {
                	
                    return true;
                }
            }
</script>
<div id="content-wrapper">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">회원가입</li>
        </ol>
        <div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
            <form class="form" action="${pageContext.request.contextPath}/member/account/join" method="post"
                onsubmit="return checkForm1();">
                <div class="form-group">
                    <input type="hidden" name="member_no" value="${member_no+1}">
                </div>
                <div class="form-group">
                    회원 이메일 : <input type="email" class="form-control email-input inemail" name="member_email" id="email"
                        onblur="checkEmail();" maxlength="300" placeholder="이메일 형식으로 입력하세요">
                    <span class="correct-message" id="checkEmail">올바른 이메일 형식입니다</span>
                    <span class="incorrect-message">부적절한 이메일 형식입니다.</span>
                    <span class="overlap-message">중복된 이메일이 있습니다.</span>
                    <span class="unoverlap-message" id="unoverlap">사용 가능한 이메일입니다.</span>
                </div>
                <div class="form-group">
                    회원 이름: <input type="text" class="form-control intext" id="name" onblur="checkName();"
                        name="member_name" placeholder="2~7자의 한글로 쓰세요"> 
                        <span class="correct-message">올바른 이름
                        형식입니다</span> <span class="incorrect-message">이름은 한글 2~7자로 구성하세요</span>
                </div>
                <div class="form-group">
                    회원 비밀번호 : <input type="password" class="form-control intext" id="pw" onblur="checkPwd();"
                        name="member_pw" maxlength="16" placeholder="8~16자의 영문/숫자로 구성하세요"> <span
                        class="correct-message">올바른 비밀번호 형식입니다</span> <span class="incorrect-message">비밀번호는 영문대/소문자와 숫자로
                        8~16자 내외로 구성하세요</span>
                </div>
                <div class="form-group">
                    비밀번호 확인: <input type="password" class="form-control intext" id="checkPw" oninput="checkCheckPw();"
                        maxlength="16"> <span class="correct-message">비밀번호가 일치합니다.</span> <span
                        class="incorrect-message">비밀번호가 불일치합니다.</span>
                </div>
                <div class="form-group">
                    <!-- 지역검색 -->
                    <select class="local-list custom-select" name="local_no">
	                   	<option value="">지역 검색</option>                    	 
                    	<c:forEach var ="localDto" items="${localDto}">
                    		<option value="${localDto.local_no}">${localDto.local_name}</option>
                    	</c:forEach>
                    </select>
                    <!-- 지점선택 -->
                    <select class="branch-list custom-select" name="branch_no" required>
                        <option value="">지점 검색</option>
                    </select>
<!--                     <select  name="branch_no">					 -->
<%-- 					<c:forEach var="branchDto" items="${branchDto}"> --%>
<%-- 						<option class="form-control" value="${branchDto.local_no}">${branchDto.local_name}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 					</select> -->
                </div>
                <div class="form-group">
                    <input type="submit" class="form-control" value="이메일 인증">
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>