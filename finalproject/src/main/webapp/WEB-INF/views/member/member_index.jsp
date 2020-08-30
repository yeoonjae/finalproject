<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GONGDORI</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/fontawesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto" rel="stylesheet">
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-light text-capitalize">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/member/imgs/logo.png" alt="#" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#show-menu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="show-menu">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#home">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">소개글</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#service">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#agency">지점 스토리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">가맹문의</a>
                        </li>
                        <li class="nav-item .search-container">
                            <a class="nav-link search" href="#"><i class="fas fa-search"></i></a>
                            <form>
                                <input type="search">
                            </form>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-user"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-heart"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <header id="home">
            <div class="overlay">
                <div class="container">
                    <div>
                        <h1><span>study cafe</span><br>행복한 자유를 누리는 삶</h1>
                        <p>“르하임(L’Chayim)”은 속박에서 벗어나
							행복한 자유를 누리는 삶’이란 뜻의 고대히브리어 입니다.
							르하임 스터디카페에서 준비하는 스터디의 성취를 통해
							행복한 자유를 누리는 삶을 응원합니다
						</p>
                        <button></button>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="about-us" id="about">
            <div class="small-container">
                <h2 class="text-center">Winter <span>Holiday</span></h2>
                <p class="text-center">as opposed to using 'Content here, content here', making it look lik</p>
                <div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-12 text-center">
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}/resources/member/imgs/img2.jpg">
                                    <h5 class="text-uppercase">Restaurants</h5>
                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}/resources/member/imgs/img1.jpg">
                                    <h5 class="text-uppercase">where to stay</h5>
                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}/resources/member/imgs/img4.jpg">
                                    <div>
                                        <h5 class="text-uppercase">Sightseeing</h5>
                                        <p>It is a long established fact that a reader will be distracted by the readable content of a page</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}/resources/member/imgs/img3.jpg">
                                    <h5 class="text-uppercase">shops and boutiques</h5>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12 text-right">
                                <h4 class="text-uppercase">Engoy <span>holiday</span></h4>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like</p>
                                <button class="text-center"><a href="#" class="text-capitalize">book now</a></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="first"></div>
                <div class="second"></div>
            </div>
        </div>
        
        <div class="services" id="service">
            <div class="container">
                <h2 class="text-capitalize">Enjoy <span>Resort</span></h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a o</p>
            </div>
            <div class="small-container">
                <div id="slideToNext" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="${pageContext.request.contextPath}/resources/member/imgs/pic4.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="${pageContext.request.contextPath}/resources/member/imgs/pic3.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="${pageContext.request.contextPath}/resources/member/imgs/pic2.jpg" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <a class="carousel-control-prev" href="#slideToNext" role="button" data-slide="prev">
                    <i class="fas fa-chevron-left fa-2x"></i>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#slideToNext" role="button" data-slide="next">
                    <i class="fas fa-chevron-right fa-2x"></i>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
            </div>
        </div>
        
        <div class="agency" id="agency">
            <div class="white-overlay">
                <div class="container">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/member/imgs/airplane.png">
                        <div>
                            <img src="${pageContext.request.contextPath}/resources/member/imgs/pic1.png">
                            <h2 class="text-center text-uppercase">Enjoy <br> All <br> World</h2>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/member/imgs/airplane.png">
                    </div>
                    <p class="text-center">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look likeIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as o</p>
                </div>
            </div>
        </div>
        
        <div class="statistics text-capitalize text-center font-weight-bold">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <i class="fas fa-umbrella-beach fa-3x"></i>
                        <h3>425</h3>
                        <p>Tourists</p>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <i class="fas fa-birthday-cake fa-3x"></i>
                        <h3>125</h3>
                        <p>years</p>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <i class="fa fa-home fa-3x"></i>
                        <h3>325</h3>
                        <p>cottages</p>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <i class="fas fa-glass-cheers fa-3x"></i>
                        <h3>120</h3>
                        <p>restaurants</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="contact" id="contact">
            <div class="violet-overlay">
                <div class="container">
                    <h2 class="text-center">Get in touch</h2>
                    <div class="contact-form">
                        <form>
                            <input type="text" placeholder="Name">
                            <input type="email" placeholder="Email">
                            <input type="text" placeholder="Phone">
                            <textarea placeholder="Message"></textarea>
                            <input type="submit" value="SEND">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <div class="container">
                <ul>
                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                    <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                </ul>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="item">
                            <h4 class="text-uppercase">Contact us</h4>
                            <p class="address">
                                123 Second Street Fifth <br>
                                Avenue,<br>
                                Manhattan, New York<br>
                                +987 654 3210
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="item">
                            <h4 class="text-uppercase">additional links</h4>
                            <ul>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Terms and conditions</a></li>
                                <li><a href="#">Privacy policy</a></li>
                                <li><a href="#">News</a></li>
                                <li><a href="#">Contact us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="item date">
                            <h4 class="text-uppercase">resent posts</h4>
                            <p><a href="#">01/03/2019</a></p>
                            <p><a href="#">08/05/2019</a></p>
                            <p><a href="#">01/03/2019</a></p>
                            <p><a href="#">08/05/2019</a></p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="item">
                            <h4 class="text-uppercase">newsletter</h4>
                            <form>
                                <input type="text" placeholder="Name">
                                <input type="email" placeholder="Email">
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright text-center">
                <p>Copyright 2019  Design by <a href="https://html.design">Free Html Templates</a></p>
            </div>
        </footer>
        
        <script src="${pageContext.request.contextPath}/resources/member/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/member/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                
                'use strict';
                
                var winH = $(window).height();
                
                $('header').height(winH);  
                
                $('header .container > div').css('top', (winH / 2) - ( $('header .container > div').height() / 2));
                
                $('.navbar ul li a.search').on('click', function (e) {
                    e.preventDefault();
                });
                $('.navbar a.search').on('click', function () {
                    $('.navbar form').fadeToggle();
                });
                
                $('.navbar ul.navbar-nav li a').on('click', function (e) {
                    
                    var getAttr = $(this).attr('href');
                    
                    e.preventDefault();
                    $('html').animate({scrollTop: $(getAttr).offset().top}, 1000);
                });
            })
        </script>
    </body>
</html>