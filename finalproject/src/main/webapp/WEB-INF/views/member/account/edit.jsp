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
<script>
$(function(){
	$(".local-list").on("change",function(){
		$(".local-option").remove();
		$(".branch-option").remove();
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
<div id="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">회원 정보 수정</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<form action="${pageContext.request.contextPath}/member/account/edit" method="post" onsubmit="return checkForm1();">
				<div class="form-group">
				회원번호 : ${memberDto.member_no} 
				<input type="hidden" name="member_no" value="${memberDto.member_no}">
				</div>
				<div class="form-group">
				회원 이메일 : ${memberDto.member_email}
				</div>
				<div class="form-group">
				회원 이름:
				<input type="text" class="form-control intext" name="member_name" 
				id="name"value="${memberDto.member_name}" 
				placeholder="2~7자의 한글을 입력" onblur="checkName();">
				<span class="correct-message">올바른 이름 형식입니다</span>
				<span class="incorrect-message">이름은 한글 2~7자로 구성하세요</span>
				</div>
				<div class="form-group">
				회원 비밀번호 :
				<input type="password" class="form-control intext" id="pw" name="member_pw" onblur="checkPwd();">
				<span class="correct-message">올바른 비밀번호 형식입니다</span>
				<span class="incorrect-message">비밀번호는 영문대/소문자와 숫자로8~16자 내외로 구성하세요</span>
				</div>
				<div class="form-group">
				<input type="password" class="form-control intext" id="checkPw" onblur="checkCheckPw();">
				<span class="correct-message">비밀번호가 일치합니다.</span> 
				<span class="incorrect-message">비밀번호가 불일치합니다.</span>
				</div>
				 <div class="form-group">
                    <!-- 지역검색 -->
                    <select class="local-list custom-select" name="local_no">
	                   	<option value="${memberDto.local_no}"class="local-option">${memberDto.local_name}</option>                    	 
                    	<c:forEach var ="localDto" items="${localDto}">
                    		<option value="${localDto.local_no}">${localDto.local_name}</option>
                    	</c:forEach>
                    </select>
                    <!-- 지점선택 -->
                    <select class="branch-list custom-select" name="branch_no" required>
                        <option value="${memberDto.branch_no}" class="branch-option">${memberDto.branch_name}</option>
                    </select>
<!--                     <select  name="branch_no">					 -->
<%-- 					<c:forEach var="branchDto" items="${branchDto}"> --%>
<%-- 						<option class="form-control" value="${branchDto.local_no}">${branchDto.local_name}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 					</select> -->
                </div>
				<div class="form-group">
				<input type="submit" value="수정" required>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>