   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
