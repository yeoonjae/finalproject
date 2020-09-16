<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!-- 	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>

<%-- <script src="${pageContext.request.contextPath}/resources/qr/jquery.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/qr/qrcode.js"></script>
<style>

/* 	.qr{ */
/* 		width:30%; */
/* 		text-align:center; */
/* 	} */
/* 	#qrcode{ */
/* 		text-align:center; */
/* 	} */
	
	
</style>
<script>
	$(function() {

		// 입실 버튼 클릭 시 
		$('#in').click(function() {
			document.getElementById("qrcode").innerText="";
			// 큐알코드 생성
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				text : "${sessionScope.memberinfo.member_no}",
				width : 150, //가로
				height : 150, //세로
				colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
				colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
				correctLevel : QRCode.CorrectLevel.H//qr코드 오류복원능력임 (L->M->Q->H)
			});
			
	});
});

// 		//퇴실 버튼 클릭 시 
// 		$('#out').click(function() {
// 			document.getElementById("qrcode").innerText = "";

// 			// 큐알코드 생성
// 			var qrcode = new QRCode(document.getElementById("qrcode"), {
// 				text : "${sessionScope.memberinfo.member_no}",
// 				width : 200, //가로
// 				height : 200, //세로
// 				colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
// 				colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
// 				correctLevel : QRCode.CorrectLevel.H
// 			//qr코드 오류복원능력임 (L->M->Q->H)
// 			});

// 		});

</script>


<section>
	<div class="container">
		<div class="row">
			<div class="roomy-100">
				<!--  user 메인 이미지  -->
				<div>
					<img src="${pageContext.request.contextPath}/resources/m/images/background/study2.jpg" width="100%" height="450px">
				</div>				
				
				<br><br>
				
				<!-- qr코드 생성 -->
				<div class="qr">				
					<div>
						<button type="button" id="in" class="btn-primary">입/퇴실하기</button>
<!-- 					<button type="button" id="out" class="btn-primary">퇴실</button> -->
					</div>
					<br>
					<div id="qrcode"></div>
				</div>
				
				
			</div>
		</div>
	</div>
</section>




<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>