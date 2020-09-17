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
                <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->

                <div class="container">    
                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
<!--                          	<li class="search"><a href="#"> <i class="fa fa-shopping-bag"></i></a></li> -->
                            <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div>        
                    <!-- End Atribute Navigation -->

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/member/">
                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-display m-top-10" alt="">
                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-scrolled" alt="">

                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              
                            <li><a href="#about">소개글</a></li>                    
                            <li><a href="${pageContext.request.contextPath}/member/notice/list">공지사항</a></li>              
                            <li><a href="${pageContext.request.contextPath}/member/franchisee/list">지점 스토리</a></li>                    
                            <li><a href="#pricing">가맹 문의</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/account/join">회원가입</a></li>                      
                            <li><a href="${pageContext.request.contextPath}/member/account/login">로그인</a></li>                      
                        </ul>
                    </div>
                </div>  
 

            </nav>
