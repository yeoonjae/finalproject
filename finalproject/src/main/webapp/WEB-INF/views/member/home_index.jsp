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


            <nav class="navbar navbar-default navbar-fixed white no-background bootsnav">
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
                            <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div>        
                    <!-- End Atribute Navigation -->

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="#brand">

                            <img src="${pageContext.request.contextPath}/resources/m/images/logo.png" class="logo logo-display m-top-10" alt="">
                            <img src="${pageContext.request.contextPath}/resources/m/images/logo2.png" class="logo logo-scrolled" alt="">

                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              
                            <li><a href="#about">소개글</a></li>                    
                            <li><a href="${pageContext.request.contextPath}/member/notice/list">공지사항</a></li>                    
                            <li><a href="#portfolio">지점 스토리</a></li>                    
                            <li><a href="#pricing">가맹 문의</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/account/join">회원가입</a></li>
                            <li><a href="${pageContext.request.contextPath}/member/account/login">로그인</a></li>                      
<!--                             <li><a href="#blog">Blog</a></li>                     -->
<!--                             <li><a href="#contact">Contact</a></li>   -->
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>  


            </nav>


            <!--Home Sections-->

            <section id="hello" class="home bg-mega">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="main_home">
                            <div class="home_text">
                                <h1 class="text-white">GONGDORI STUDY CAFE <br /> WELCOME!</h1>
                            </div>
 
                            <div class="home_btns m-top-40">
<!--                         <a href="" class="btn btn-primary m-top-20">GET STARTED</a> -->
                                <a href="" class="btn btn-primary m-top-20">공도리 시작하기</a>
                            </div>
 
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->



            <!--Service Section-->
            <section id="service" class="service">
                <div class="container">
                    <div class="row">
                        <div class="main_service roomy-100">
                            <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                                <div class="head_title text-center">
                                    <h2>OUR SERVICES</h2>
                                    <div class="separator_auto"></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, 
                                        sed diam nonummy nibh euismod nostrud exerci tation ullamcorper 
                                        suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="service_item">
                                    <i class="icofont icofont-light-bulb"></i>
                                    <h6 class="m-top-30">BRANDING</h6>
                                    <div class="separator_small"></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, 
                                        sed diam nonummy nibh euismod tincidunt ut laoreet dolore 
                                        magna aliquam erat volutpat. </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="service_item">
                                    <i class="icofont icofont-imac"></i>
                                    <h6 class="m-top-30">BRANDING</h6>
                                    <div class="separator_small"></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, 
                                        sed diam nonummy nibh euismod tincidunt ut laoreet dolore 
                                        magna aliquam erat volutpat. </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="service_item">
                                    <i class="icofont icofont-video"></i>
                                    <h6 class="m-top-30">BRANDING</h6>
                                    <div class="separator_small"></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, 
                                        sed diam nonummy nibh euismod tincidunt ut laoreet dolore 
                                        magna aliquam erat volutpat. </p>
                                </div>
                            </div>
                        </div>
                    </div><!--End off row -->
                </div><!--End off container -->
            </section> <!--End off Featured section-->
            
            

            <!--Skill Sections-->
            <section id="skill" class="skill roomy-100">
                <div class="container">
                    <div class="row">
                        <div class="main_skill">
                            <div class="col-md-6">
                                <div class="skill_content wow fadeIn">
                                    <h2>Our skill</h2>
                                    <div class="separator_left"></div>

                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, 
                                        sed diam nonummy nibh euismod tincidunt ut laoreet dolore 
                                        magna aliquam erat volutpat. Ut wisi enim ad minim veniam, 
                                        quis nostrud exerci tation ullamcorper suscipit lobortis 
                                        nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor
                                        sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                                        euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                        Ut wisi enim ad minim veniam, quis nostrud exerci tation 
                                        ullamcorper suscipit lobortis nisl ut aliquip 
                                        ex ea commodo consequat. </p>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="skill_bar sm-m-top-50">    
                                    <div class="teamskillbar clearfix m-top-20" data-percent="80%">
                                        <h6>GRAPHIC DESIGN</h6>
                                        <div class="teamskillbar-bar"></div>
                                    </div> <!-- End Skill Bar -->

                                    <div class="teamskillbar clearfix m-top-50" data-percent="75%">
                                        <h6>TYPOGRAPHY</h6>
                                        <div class="teamskillbar-bar"></div>
                                    </div> <!-- End Skill Bar -->

                                    <div class="teamskillbar clearfix m-top-50" data-percent="90%">
                                        <h6>HTML / CSS</h6>
                                        <div class="teamskillbar-bar"></div>
                                    </div> <!-- End Skill Bar -->
                                </div>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
                <br />
                <br />
                <br />
                <hr />
                <br />
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <div class="skill_bottom_content text-center">
                            <div class="col-md-3">
                                <div class="skill_bottom_item">
                                    <h2 class="statistic-counter">3468</h2>
                                    <div class="separator_small"></div>
                                    <h5><em>Projects Finished</em></h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="skill_bottom_item">
                                    <h2 class="statistic-counter">4638</h2>
                                    <div class="separator_small"></div>
                                    <h5><em>Happy Clients</em></h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="skill_bottom_item">
                                    <h2 class="statistic-counter">3468</h2>
                                    <div class="separator_small"></div>
                                    <h5><em>Hours of work</em></h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="skill_bottom_item">
                                    <h2 class="statistic-counter">3468</h2>
                                    <div class="separator_small"></div>
                                    <h5><em>Cup of coffee</em></h5>
                                </div>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Skill section -->



            <!--Pricing Section-->
            <section id="pricing" class="pricing lightbg">
                <div class="container">
                    <div class="row">
                        <div class="main_pricing roomy-100">
                            <div class="col-md-8 col-md-offset-2 col-sm-12">
                                <div class="head_title text-center">
                                    <h2>OUR PRICING</h2>
                                    <div class="separator_auto"></div>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                                        sed diam nonummy nibh euismod tincidunt tation ullamcorper 
                                        suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-12">
                                <div class="pricing_item">
                                    <div class="pricing_head p-top-30 p-bottom-100 text-center">
                                        <h3 class="text-uppercase">STARTER</h3>
                                    </div>
                                    <div class="pricing_price_border text-center">
                                        <div class="pricing_price">
                                            <h3 class="text-white">$19</h3>
                                            <p class="text-white">per month</p>
                                        </div>
                                    </div>

                                    <div class="pricing_body bg-white p-top-110 p-bottom-60">
                                        <ul>
                                            <li><i class="fa fa-check-circle text-primary"></i> <span>10</span> user</li>
                                            <li class="disabled"><i class="fa fa-times-circle"></i> Unlimited Bandwidth</li>
                                            <li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>

                                        </ul>
                                        <div class="pricing_btn text-center m-top-40">
                                            <a href="" class="btn btn-primary">CHOOSE PLAN</a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-12">
                                <div class="pricing_item sm-m-top-30">
                                    <div class="pricing_top_border"></div>
                                    <div class="pricing_head p-top-30 p-bottom-100 text-center">
                                        <h3 class="text-uppercase">PREMIUM</h3>
                                    </div>
                                    <div class="pricing_price_border text-center">
                                        <div class="pricing_price">
                                            <h3 class="text-white">$39</h3>
                                            <p class="text-white">per month</p>
                                        </div>
                                    </div>

                                    <div class="pricing_body bg-white p-top-110 p-bottom-60">
                                        <ul>
                                            <li><i class="fa fa-check-circle text-primary"></i> <span>50</span> user</li>
                                            <li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
                                            <li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>
                                        </ul>
                                        <div class="pricing_btn text-center m-top-40">
                                            <a href="" class="btn btn-primary">CHOOSE PLAN</a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-12">
                                <div class="pricing_item sm-m-top-30">
                                    <div class="pricing_head p-top-30 p-bottom-100 text-center">
                                        <h3 class="text-uppercase">bUSINESS</h3>
                                    </div>
                                    <div class="pricing_price_border text-center">
                                        <div class="pricing_price">
                                            <h3 class="text-white">$99</h3>
                                            <p class="text-white">per month</p>
                                        </div>
                                    </div>

                                    <div class="pricing_body bg-white p-top-110 p-bottom-60">
                                        <ul>
                                            <li><i class="fa fa-check-circle text-primary"></i> Unlimited Users</li>
                                            <li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
                                            <li><i class="fa fa-check-circle text-primary"></i> Full Statistics</li>
                                        </ul>
                                        <div class="pricing_btn text-center m-top-40">
                                            <a href="" class="btn btn-primary">CHOOSE PLAN</a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-4 -->

                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Pricing section -->



            <!--client brand section-->
            <section id="cbrand" class="cbrand">
                <div class="container">
                    <div class="row">
                        <div class="main_cbrand text-center roomy-100">
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img src="assets/images/clients/1.jpg" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img src="assets/images/clients/2.jpg" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img class="" src="assets/images/clients/5.jpg" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img src="assets/images/clients/4.jpg" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img src="assets/images/clients/3.jpg" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="cbrand_item m-bottom-10">
                                    <a href=""><img src="assets/images/clients/1.jpg" alt="" /></a> 
                                </div>
                            </div>
                        </div>
                    </div><!-- End off row -->
                </div><!-- End off container -->
            </section><!-- End off Cbrand section -->




            <!-- scroll up-->
            <div class="scrollup">
                <a href="#"><i class="fa fa-chevron-up"></i></a>
            </div><!-- End off scroll up -->


            <footer id="footer" class="footer bg-black">
                <div class="container">
                    <div class="row">
                        <div class="main_footer text-center p-top-40 p-bottom-30">
                            <p class="wow fadeInRight" data-wow-duration="1s">
                                Made with 
                                <i class="fa fa-heart"></i>
                                by 
                                <a target="_blank" href="http://bootstrapthemes.co">Bootstrap Themes</a> 
                                2016. All Rights Reserved     
                            </p>
                             <p>
                             	KH 공도리  |  공동이사 : 정연재 김진영 김혜정 오한민  |  사업자 등록번호 : 100-41004-10
								<br>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F (T: 1544-9970 / F: 02-2163-8560)
								<br>COPYRIGHT KH 공도리 ALL RIGHTS RESERVED.
							</p>

                        </div>
                    </div>
                </div>
            </footer>




        </div>

            <!-- JS includes -->

            <script src="${pageContext.request.contextPath}/resources/m/js/vendor/jquery-1.11.2.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/vendor/bootstrap.min.js"></script>

            <script src="${pageContext.request.contextPath}/resources/m/js/jquery.magnific-popup.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/jquery.easing.1.3.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/slick.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/jquery.collapse.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/bootsnav.js"></script>


            <!-- paradise slider js -->


            <script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/gmaps.min.js"></script>

            <script>
                            function showmap() {
                                var mapOptions = {
                                    zoom: 8,
                                    scrollwheel: false,
                                    center: new google.maps.LatLng(-34.397, 150.644),
                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                };
                                var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
                                $('.mapheight').css('height', '350');
                                $('.maps_text h3').hide();
                            }

            </script>

            <script src="${pageContext.request.contextPath}/resources/m/js/plugins.js"></script>
            <script src="${pageContext.request.contextPath}/resources/m/js/main.js"></script>

    </body>
</html>
