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
	
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	.container{
		text-align:center;
		font-family: 'Noto Sans KR';
	}
	.font40{
		font-size:40px;
	}
	.center{
		text-align:center; 
	}
	.roomy-140{
		padding-top:150px;
		padding-bottom:150px; 
	}
</style>


<main>
	<section>
		<div class="container">
			<div class="row">
				<div class="main_service roomy-140 center">
					<div>
						<img src="${pageContext.request.contextPath}/resources/m/images/check.jpg" width="100px" height="100px">
					</div>
					<div>
						<span class="font40">고객님의 주문이 완료 되었습니다.</span><br>
					</div>
					<div>
<!-- 						<span>주문 번호 : </span> -->
					</div>
					<br><br><br>
					<div>
						<a href="${pageContext.request.contextPath}/member/pay/pay_detail">
							<input type="button" value="결제내역조회" class="btn btn-primary btn-lg"> 
						</a>

						<a href="${pageContext.request.contextPath}/member/pay/pay_detail">
							<input type="button" value="홈으로 가기" class="btn btn-primary btn-lg">
						</a>				
					</div>	
									
				</div>
			</div>
		</div>
	</section>
</main>


<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>

