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
<script>
	$(function(){
	
		// 모달창 띄우기
	   	$('#myModal').on('shown.bs.modal', function () {
	   	  	$('#myInput').focus()
	   	});

		//외출 버튼 클릭 시 
		$('#out').click(function() {
			document.getElementById("qrcode").innerText = "";
			// 큐알코드 생성
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				text : "${sessionScope.memberinfo.member_no}",
				width : 150, //가로
				height : 150, //세로
				colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
				colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
				correctLevel : QRCode.CorrectLevel.H
			//qr코드 오류복원능력임 (L->M->Q->H)
			});
		});

			//퇴실 버튼 클릭 시 
			$('#end').click(function() {
				document.getElementById("qrcode").innerText = "";
				// 큐알코드 생성
				var qrcode = new QRCode(document.getElementById("qrcode"), {
					text : "${sessionScope.memberinfo.member_no}",
					width : 150, //가로
					height : 150, //세로
					colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
					colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
					correctLevel : QRCode.CorrectLevel.H
				//qr코드 오류복원능력임 (L->M->Q->H)
				});	
		});

		// 챗봇 모달창 띄우기
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').focus()
		});
		
		$(".type1").click(function(){
			var type_no = $(this).data().no;
			var chat_type = $(this).val();
			console.log(type_no);
			
			var str = '<div class="box my"><div class="innerBox"><div class="content">'
 				+chat_type+
 	           	'</div></div></div>'
 	           	
			$(".chatList").append(str);
 	           	
			axios({
				url:"${pageContext.request.contextPath}/member/search?type_no="+type_no,
				method:"get"
			}).then(function(response){
				//console.log(response.data);
				
				
				var str2=
					'<div class="box"><div class="imgBox">'
					+'<img class="chatimg" src="${pageContext.request.contextPath}/resources/m/images/pp.png"></div>'
					+'<div class="innerBox"><div class="name">공도리봇</div>'
					+'<div class="content">'
					+'<c:forEach items="${list}" var="chatDto">'
					+	'<input type="button" class="btn btn-size type1" value=${chatDto.chat_q} data-chat_no=${chatDto.chat_no}>'
					+'</c:forEach>'
					+'</div><br></div></div>'

				$(".chatList").append(str2);

			});
			
		});
		
		
});
</script>
<style>
 *{
     box-sizing: border-box;
 }


.modal-backdrop {
	z-index:-1;
}


.start{
	background-color:#d1cab0; 
	height:auto;
}
.chatimg{
	width:30px;
	height:30px;
	border-radius: 50%;
}
.box{
    display: flex;
    flex-direction: row;
    max-width: 70%;
	background-color:#d1cab0; 
	padding: 3%;
}

.box.my{
     margin-left: auto;
     flex-direction: row-reverse;
}
.content{
	background-color:white;
	height:auto;
	width:auto;
	padding:5%;
	border-radius: 0px 20px 20px 20px; 
}
.box.my .content{ 
	background-color:white;
	height:auto;
/* 	text-align:right; */
	padding:5%;
	padding-left:7%;
	border-radius: 20px 20px 0px 20px;
}
.name{
	font-size:13px;
	font-weight:bold;
	color:black;
	padding: 1%;

}

.box .my .imgBox{
    display: none;
}

.box .imgBox {
    width:50px;
}

.box.my .innerBox{
/* 	width:200px; */
}
.box .innerBox{
     flex-grow: 0.1;  
}
.btn-size{
	width: 100%;
    margin-bottom: 5px;
}
</style>

<section>
	<div class="container">
		<div class="row">
			<div class="roomy-100">
				<!--  user 메인 이미지  -->
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/m/images/background/study2.jpg"
						width="100%" height="450px">
				</div>

				<br>
				<br>

				<!-- qr코드 생성 -->
				<div class="qr">
					<div>
						<button type="button" id="out" class="btn-primary">외출</button>
						<button type="button" id="end" class="btn-primary">퇴실</button>
					</div>
					<br>
					<div id="qrcode"></div>
				</div>

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">챗봇</button>

				<!-- Modal -->
				<div class="modal" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">공도리 챗봇</h4>
							</div>
							<!--  챗봇 시작하기 -->
							<div class="modal-body">
								<div class="start">
								
									<!-- 공도리봇 -->
									<div class="box">
										<!-- 이미지 박스 -->
										<div class="imgBox">
											<img class="chatimg" src="${pageContext.request.contextPath}/resources/m/images/pp.png">
										</div>	
										<!-- 내용 박스 -->
										<div class="innerBox">
											<div class="name">공도리봇</div>
											<div class="content">
												안녕하세요 공도리입니당 ^_^<br>
												저희 공도리에 대해 문의사항이 있으시면 <br>
												공돌이봇을 이용해 주시기 바랍니다! <br><br>
												원하시는 유형을 선택하시면<br>
												해당 유형의 답변을 확인하실 수 있답니당♡<br><br> 										
												<input type="button" class="btn btn-size type1" value="결제 및 환불 관련" data-no="1">
												<input type="button" class="btn btn-size type2" value="예약 관련" data-no="2">
												<input type="button" class="btn btn-size type3" value="이용 관련" data-no="3">
												<input type="button" class="btn btn-size type4" value="쿠폰 및 마일리지" data-no="4">
											</div>
											<br>
										</div>
									</div>

									<div class="chatList">
										
									</div>
									<!-- 나 -->
<!-- 								    <div class="box my"> -->
<!-- 								        <div class="innerBox"> -->
<!-- 								            <div class="content"> -->
<!-- 								                결제 및 환불 관련  -->
<!-- 								            </div> -->
<!-- 								        </div>								        -->
<!-- 								    </div> -->
								    
								    
								    
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</section>




<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>