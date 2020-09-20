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
      <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
       <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/m/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
         <script>
            $(function(){
                axios({
                url:"${pageContext.request.contextPath}/test/message/count_member",
                method:"get"
             })
             .then(function(response){
                if(response.data==0){
                    $(".readCount").hide();
                 }else{
                   $(".readCount").text(response.data);
                 }
             })  
            });
         </script>
         <style>
            .badge{
               background-color: red;
            }
         </style>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
            <!--Home page style-->


            <nav class="navbar navbar-default navbar-fixed no-background bootsnav">

                <div class="container">    
                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="search" onclick="location.href='${pageContext.request.contextPath}/member/account/info?member_no=${memberinfo.member_no}'">
                               <a href="${pageContext.request.contextPath}/member/account/info?member_no=${memberinfo.member_no}">
                                  <i class="fa fa-user-circle-o"></i>
                               </a>
                            </li>
                            <li class="search" onclick="location.href='${pageContext.request.contextPath}/member/message/message'">
                              <a href="${pageContext.request.contextPath}/member/message/message">
                                  <i class="fa fa-envelope" aria-hidden="true"></i>
                                  <span class="badge badge-danger readCount"></span>
                              </a>
                            </li>
                            <li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
                        </ul>
                    </div>        
                    <!-- End Atribute Navigation -->

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/member/user/">

                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-display m-top-10" alt="">
                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-scrolled" alt="">

                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              
                            <li><a href="${pageContext.request.contextPath}/member/pay/pay_main">상품 충전</a></li>                    
                            <li><a href="#service">개인석</a></li>                    
                            <li><a href="#portfolio">스터디룸</a></li>                    
                            <li><a href="${pageContext.request.contextPath}/member/review/list">리뷰</a></li>  
                            <li><a href="${pageContext.request.contextPath}/member/account/logout">로그아웃</a></li>   
                                               
                        </ul>
                    </div>
                </div>  
 

                <!-- 사이드 메뉴 -->
                <div class="side">
                    <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                    <div class="widget">
                        <h6 class="title">Custom Pages</h6>
                        <ul class="link">
                           <li><a href="#">공도리 홈</a></li>
                            <li><a href="#">소개글</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/notice/noticeList">공지사항</a></li>
                            <li><a href="#">지점 스토리</a></li>
                            <li><a href="#">가맹 문의</a></li>
                        </ul>
                    </div>
                    <div class="widget">
                        <h6 class="title">Member Pages</h6>
                        <ul class="link">
                        	
                            <li><a href="${pageContext.request.contextPath}/member/account/info?member_no=${memberinfo.member_no}">마이페이지</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/pay/pay_main">상품 충전</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/pay/pay_detail">결제내역조회</a></li>
                            <li><a href="#">좌석 예약</a></li>
                            <li><a href="#">스터디룸 예약</a></li>
                            <li><a href="#">리뷰</a></li>
                            <li><a href="#">1:1문의</a></li>
                        </ul>
                    </div>
                    
                    
                </div>
                <!-- End Side Menu -->

            </nav>