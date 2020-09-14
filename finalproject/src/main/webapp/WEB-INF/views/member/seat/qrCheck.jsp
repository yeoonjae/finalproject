<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="${pageContext.request.contextPath}/resources/qr/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/qr/qrcode.js"></script>
 
<script>
	$(function() {
		
		// 입실 버튼 클릭 시 
		$('#in').click(function() {		
			document.getElementById("qrcode").innerText="";
			
			// 큐알코드 생성
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				text : "${sessionScope.memberinfo.member_no}",
				width : 200, //가로
				height : 200, //세로
				colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
				colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
				correctLevel : QRCode.CorrectLevel.H//qr코드 오류복원능력임 (L->M->Q->H)
			});	
			
		});
		
		//퇴실 버튼 클릭 시 
		$('#out').click(function() {		
			document.getElementById("qrcode").innerText=""; 		
			
			// 큐알코드 생성
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				text : "${sessionScope.memberinfo.member_no}",
				width : 200, //가로
				height : 200, //세로
				colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
				colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
				correctLevel : QRCode.CorrectLevel.H//qr코드 오류복원능력임 (L->M->Q->H)
			});	
			
		});

	})
</script>
<div>
	<button type="button" id="in" class="btn btn-primary">입실</button>
	<button type="button" id="out">퇴실</button>
</div>

<div id="qrcode"></div>
