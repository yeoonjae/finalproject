<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>

 <html class="no-js" lang="en">
    
    <!--Designerd by: http://bootstrapthemes.co-->
    <head>
        <meta charset="utf-8">
        <title>GONDORI MAIN PAGE</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/slick.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/slick-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/fonticons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/bootsnav.css">



        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/m/css/responsive.css" />

        <script src="${pageContext.request.contextPath}/resources/m/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
            <!--Home page style-->


            <nav class="navbar navbar-default navbar-fixed no-background bootsnav">
<!--                 Start Top Search -->
<!--                 <div class="top-search"> -->
<!--                     <div class="container"> -->
<!--                         <div class="input-group"> -->
<!--                             <span class="input-group-addon"><i class="fa fa-search"></i></span> -->
<!--                             <input type="text" class="form-control" placeholder="Search"> -->
<!--                             <span class="input-group-addon close-search"><i class="fa fa-times"></i></span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <!-- End Top Search -->

                <div class="container">    
                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                         	<li class="search"><a href="#"><i class="fa fa-user-circle-o "></i></a></li>
<!--                             <li class="search"><a href="#"><i class="fa fa-search"></i></a></li> -->
                            <li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
                        </ul>
                    </div>        
                    <!-- End Atribute Navigation -->

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="#brand">

                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-display m-top-10" alt="">
                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-scrolled" alt="">

                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              
                            <li><a href="#about">상품 충전</a></li>                    
                            <li><a href="#service">개인석</a></li>                    
                            <li><a href="#portfolio">스터디룸</a></li>                    
                            <li><a href="#pricing">리뷰</a></li>  
                            <li><a href="${pageContext.request.contextPath}/member/account/logout">로그아웃</a></li>   
                                               
<!--                             <li><a href="#blog">Blog</a></li>                     -->
<!--                             <li><a href="#contact">Contact</a></li>   -->
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>  
 

                <!-- 사이드 메뉴 -->
                <div class="side">
                    <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                    <div class="widget">
                        <h6 class="title">Custom Pages</h6>
                        <ul class="link">
	                        <li><a href="#">공도리 홈</a></li>
                         	<li><a href="#">소개글</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">지점 스토리</a></li>
                            <li><a href="#">가맹 문의</a></li>
                        </ul>
                    </div>
                    <div class="widget">
                        <h6 class="title">Member Pages</h6>
                        <ul class="link">
                            <li><a href="${pageContext.request.contextPath}/member/account/info?member_no=${memberinfo.member_no}">마이페이지</a></li>
                            <li><a href="#">상품 충전</a></li>
                            <li><a href="#">좌석 예약</a></li>
                            <li><a href="#">스터디룸 예약</a></li>
                            <li><a href="#">리뷰</a></li>
                            <li><a href="#">1:1문의</a></li>
                        </ul>
                    </div>
                </div>
                <!-- End Side Menu -->

            </nav>
		<!--  메뉴는 끝 ! -->
		

	<!--  여기서부터 섹션이 나뉨 -->
      <section id="" class="">
		<div class="container">
			<div class="row">
				<div class="roomy-100">					
					<div> 
						<img src="${pageContext.request.contextPath}/resources/m/images/background/study2.jpg" width="100%" height="450px">	
					</div>

					
				</div>
			</div>
		</div>
	</section>


	<!--  여기서부터 섹션이 나뉨 -->
      <section id="" class="">
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100">					
					

					
				</div>
			</div>
		</div>
	</section>

		<footer id="footer" class="footer bg-black">
			<div class="container">
				<div class="row">
					<div class="main_footer text-center p-top-40 p-bottom-30">
						<p class="wow fadeInRight" data-wow-duration="1s">
							Made with <i class="fa fa-heart"></i> by <a target="_blank"
								href="http://bootstrapthemes.co">Bootstrap Themes</a> 2016. All
							Rights Reserved
						</p>
						<p>
							KH 공도리 | 공동이사 : 정연재 김진영 김혜정 오한민 | 사업자 등록번호 : 100-41004-10 <br>주소
							: 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F (T: 1544-9970 / F:
							02-2163-8560) <br>COPYRIGHT KH 공도리 ALL RIGHTS RESERVED.
						</p>

					</div>
				</div>
			</div>
		</footer>

	</div>

	<!-- JS includes -->

	<script
		src="${pageContext.request.contextPath}/resources/m/js/vendor/jquery-1.11.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/vendor/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/m/js/jquery.magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/jquery.collapse.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/bootsnav.js"></script>


	<!-- paradise slider js -->


	<script
		src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script
		src="${pageContext.request.contextPath}/resources/m/js/gmaps.min.js"></script>

	<script>
		function showmap() {
			var mapOptions = {
				zoom : 8,
				scrollwheel : false,
				center : new google.maps.LatLng(-34.397, 150.644),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(
					document.getElementById('map_canvas'), mapOptions);
			$('.mapheight').css('height', '350');
			$('.maps_text h3').hide();
		}
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/m/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/m/js/main.js"></script>
</body>
</html>
