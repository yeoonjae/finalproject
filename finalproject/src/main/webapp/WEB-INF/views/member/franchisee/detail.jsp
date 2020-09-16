<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
<style>
	.box{
		overflow: hidden;
	    padding: 40px 50px;
	    border: 1px solid #ccc;
	    border-top: none;
	    border-top: 3px solid black;
	}
	.franchisee-list{
		float: right;
    	width: 59.44%;
	}
	.table-th{
		width: 81px;
		
	}
	.swiper-container {
            width: 1100px;

            justify-content: center;
     }
</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/swiper/css/swiper.min.css">
    <script src="${pageContext.request.contextPath}/resources/swiper/js/swiper.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48c8a7138671a611cf1a659c1b4ac73b&libraries=services,clusterer,drawing"></script>
	<script>
		// 창의 로딩이 완료되었을 때 실행할 코드를 예약
		window.addEventListener("load", function(){
			//swiper 관련 코드를 이곳에 작성
			// var mySwiper = new swiper('선택자', 옵션)
			var mySwiper = new Swiper('.swiper-container', {
				// Optional parameters
				// swiper에 적용할 옵션들을 작성
				direction : 'horizontal', // 표시방식(수직 : vartical / 수평 : horizontal)
				loop : true, // 순환모드 여부(마지막과 처음이 이어지는 것)
				// 자동재생 옵션그룹
				autoplay : {
					delay : 1500, // 자동재생 시간(1000 = 1초)
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
				// 커서 모양을 손모양으로 변경
				grabCursor : true,
				effect : 'slide', // 기본값
			});
		});	
		
		
		window.addEventListener("load", function(){			
			var goAddr = document.querySelector("#goAddr").value;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(goAddr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">지점위치</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 
		});
	</script>

	<section id="hello" class="home bg-mega">
		<div class="overlay"></div>
		<div class="container" style="height: 400px;">
			<div class="row">
				<div class="main_home_3">
					<div class="home_text">
						<h1 class="text-white">지점 스토리</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="service" class="service">
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">
					<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
						<div class="head_title text-center">
							<h2>공도리 스터디카페 지점 안내</h2>
							<div class="separator_auto" style="width: 400px;"></div>
						</div>
					</div>
					<div class="row col-xs-12">
						<!-- 지점 ul을 감싸는 영역 -->
						<div class="ul-wrapper">
							<!-- 하나의 지점을 감싸는 box -->
							<div class="box">
								<!-- 사진띄울 곳(left) -->
								<div style="float: left;">
									<img src="${pageContext.request.contextPath}/admin/branch/imagedownload_one/${branchDto.branch_no}" style="height: 210px; width: 312px;">
								</div>
								<!-- 지점 정보(right) -->
								<div class="franchisee-list">
									<h3 style="font-size: 23px;">${branchDto.branch_name}</h3>
									 <table class="table">
		                            	<tbody>
		                            		<tr>
		                            			<th class="table-th">주소</th>
		                            			<td style="font-size: 15px;">[${branchDto.local_name}] ${branchDto.branch_basic_addr} ${branchDto.branch_detail_addr}</td>
		                            		</tr>
		                            		<tr>
		                            			<th class="table-th">전화번호</th>
		                            			<td style="font-size: 15px;">${branchDto.branch_phone}</td>
		                            		</tr>
		                            		<tr>
		                            			<th class="table-th">영업시간</th>
		                            			<td style="font-size: 15px;">연중 무휴 24시간</td>
		                            		</tr>
		                            	</tbody>
		                            </table>
								</div>
							</div>
							<br><br>
							<!-- 매장 이미지 -->
							<div class="head_title text-centerl">
								<hr>
								<h4 style="text-align: center;">*매장 이미지*</h4>
								<hr>
								<!--이미지 슬라이더 영역 -->
		 					   <div class="swiper-container">
							        <!-- 필수 영역 -->
							        <div class="swiper-wrapper">
							            <!-- 배치되는 이미지 또는 화면 -->
							            <c:forEach var="img" items="${branchImg}">
							            	<div class="swiper-slide">
												<img src="${pageContext.request.contextPath}/admin/branch/imgdownload/${img.branch_img_no}" style="width: 1101px; height: 500px;">
											</div>
										</c:forEach>
							        </div>
							    </div>
							</div>
							<hr>
							<!-- 매장 지도 -->
							<div class="head_title text-centerl">
								<h4 style="text-align: center;">*매장 위치*</h4>
								<input type="hidden" id="goAddr" value="${branchDto.branch_basic_addr}">
								<hr>
								<div>
							    	 <div id="map" style="width:1140px; height:510px;"></div>
							    </div>
						    </div>
						</div>
                     </div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>