<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/swiper/css/swiper.min.css">
	<style>
		.table{
			text-align: center;
			width: 60%;
			align-content: center;
		}
		.table-wrapper{
			text-align: center;
		}
   		#c{
            background-color: grey;
        }
        .swiper-container {
            width: 674px;
            justify-content: center;
     	}

	</style>
<div id="content-wrapper">

<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fabric@3.6.3/dist/fabric.js"></script>
    <script src="${pageContext.request.contextPath}/resources/swiper/js/swiper.min.js"></script>
	<script>
		// 창의 로딩이 완료되었을 때 실행할 코드를 예약
		window.onload = function() {
			//swiper 관련 코드를 이곳에 작성
			// var mySwiper = new swiper('선택자', 옵션)
			var mySwiper = new Swiper('.swiper-container', {
				// Optional parameters
				// swiper에 적용할 옵션들을 작성
				direction : 'horizontal', // 표시방식(수직 : vartical / 수평 : horizontal)
				loop : true, // 순환모드 여부(마지막과 처음이 이어지는 것)
				// 자동재생 옵션그룹
				autoplay : {
					delay : 3000, // 자동재생 시간(1000 = 1초)
				},
				// 페이지 네비게이터 옵션그룹
				pagination : {
					el : '.swiper-pagination', // 적용대상의 선택자
					type : 'bullets', // 네비게이터 모양(bullets, fraction, progressbar)
				},
				// 이전/다음 이동버튼 설정그룹
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
				// 스크롤바 옵션
				//scrollbar: {
				//    el: '.swiper-scrollbar',
				//},
				// 커서 모양을 손모양으로 변경
				grabCursor : true,
				// 슬라이드 전환효과
				// effect: 'coverflow',
				// effect: 'cube',
				// effect: 'fade'
				// effect: 'flip',
				effect : 'slide', // 기본값
			});
		};	
	</script>

	<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">지점</a></li>
				<li class="breadcrumb-item active">상세보기</li>
			</ol>
			<div class="table-wrapper container-form offset-sm-3">
			<h2>${list}</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="table-active" scope="col" colspan="2">${branchDto.branch_name}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">지점번호</th>
						<td>${branchDto.branch_no}</td>
					</tr>
					<tr>
						<th scope="row">지점 관리자</th>
						<td>${branchDto.admin_name}</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>[${branchDto.branch_post}]${branchDto.branch_basic_addr}</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td>${branchDto.branch_phone}</td>
					</tr>
					<tr>
						<th scope="row">평수</th>
						<td>${branchDto.branch_size} 평</td>
					</tr>
					<tr>
						<th scope="row">스터디룸 수</th>
						<td>${branchDto.branch_room_cnt} 룸</td>
					</tr>
					<tr>
						<th scope="row">개인석 좌석수</th>
						<td>${branchDto.branch_seat_cnt} 석</td>
					</tr>
					<tr>
						<th scope="row">사물함 수</th>
						<td>${branchDto.branch_locker_cnt} 개</td>
					</tr>
					<tr>
						<td scope="row" colspan="2">
						 	<div class="swiper-container">
					        <div class="swiper-wrapper">
					            <c:forEach var="img" items="${branchImg}">
									<img src="${pageContext.request.contextPath}/admin/branch/imgdownload/${img.branch_img_no}" style="height: 100px; width: 140px;padding-left: 5px;">
								</c:forEach>
					        </div>
					        <div class="swiper-pagination"></div>
					        <div class="swiper-button-prev"></div>
					        <div class="swiper-button-next"></div>
					      </div>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="2">배치도</th>
					</tr>
					<tr>
						<th scope="row" colspan="2"><p><canvas id="c" width="650" height="400" class="disabled"></canvas></th>
					</tr>
					<tr>
						<th scope="row" colspan="2">
							<a href="edit?branch_no=${branchDto.branch_no}">
								<button class="btn col-sm-2 btn-outline-secondary">수정</button>
							</a>
							<c:choose>
								<c:when test="${empty branchDto.branch_layout}">
								<a href="layout_regist?branch_no=${branchDto.branch_no}">
									<button class="btn col-sm-2 btn-outline-secondary">배치도 등록</button>	
								</a>
								</c:when>
							</c:choose>
							<a href="delete?branch_no=${branchDto.branch_no}">
								<button class="btn col-sm-2 btn-outline-secondary">지점삭제</button>
							</a>
							<a href="list">
								<button class="btn col-sm-2 btn-outline-secondary">목록보기</button>
							</a>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
var canvas = new fabric.Canvas('c');
canvas.loadFromJSON('${branchDto.branch_layout}');
for(var i=0;i<${branchDto.branch_layout}.objects.length;i++){
	canvas.item(i).selectable = false;	
}
console.log(${branchDto.branch_layout}.objects);
</script>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>