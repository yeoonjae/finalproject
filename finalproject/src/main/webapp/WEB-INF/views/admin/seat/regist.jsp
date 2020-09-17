<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>좌석 등록</title>
    <style>
        .cinema-seat:not(.empty){
            background-image: url("http://www.sysout.co.kr/file/image/285");
        }
        .cinema-seat.active{
            background-image: url("http://www.sysout.co.kr/file/image/283");
        }
        .cinema-seat.disabled{
            background-image: url("http://www.sysout.co.kr/file/image/284");
        }
        .form-control {
            margin-top: 5px;
        }
        .star {
            color: red;
        }
        p {
            font-size: smaller;
            margin-left: 10px;
        }
        .form-inline ~ input {
        	width: 80px;
        }
        .cinema-screen {
        	width: 30%;
        	padding: 0;
        	height: 30px;
        	margin-top: 10px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js@latest/cinema/hacademy-cinema.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js@latest/cinema/hacademy-cinema.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
    <script>
        // window.onload = function(){
        // };
        $(function(){
            
            var cinema = new Hacademy.Reservation(".cinema-wrap");
            
//             $('.cinema-wrap').hide();
            
            // 선택 버튼 또는 초기화 버튼을 누르면
            $('.btn-select, .btn-reset').click(function(){
                console.log("click");
                var rowsize = $("input[name=row]").val();
                var colsize = $("input[name=col]").val();
                console.log(rowsize, colsize);
                
                $('.cinema-wrap').empty();
//                 $('.cinema-wrap').show();

				$("<div>").addClass('cinema-screen').text('출입구').css("width", '30%')
	                .css('margin-top', '10px').css('height', '30px').css('padding', '0').appendTo(".cinema-wrap");
				
                $("<div>").addClass('cinema-seat-area').attr('data-rowsize', rowsize)
                    .attr('data-colsize', colsize).attr('data-mode', 'manager')
                    .attr('data-seatno', 'visible').appendTo(".cinema-wrap");
                    
                cinema = new Hacademy.Reservation(".cinema-wrap");
            });
            
            
            // 입구 생성 버튼을 누르면
            $('.btn-entrance').click(function(){
            	var rowsize = $("input[name=row]").val();
                var colsize = $("input[name=col]").val();
                
                $('.cinema-wrap').empty();
                var direction = $(this).data('direction');
                $(".entrance").val(direction);
                
                if(direction=='leftTop') {
                	$("<div>").addClass('cinema-screen').text('출입구').css("width", '30%')
	                .css('margin', '10px').css('height', '30px').css('padding', '0').appendTo(".cinema-wrap");
                } else if(direction=='centerTop') {
                	$("<div>").addClass('cinema-screen').text('출입구').css("width", '30%')
	                .css('margin-top', '10px').css('height', '30px').css('padding', '0').appendTo(".cinema-wrap");
                } else {
	                $("<div>").addClass('cinema-screen').text('출입구').css("width", '30%')
	                .css('margin', '10px').css('height', '30px').css('margin-left', '68%')
	                .css('padding', '0').appendTo(".cinema-wrap");
                }
                
                $("<div>").addClass('cinema-seat-area').attr('data-rowsize', rowsize)
                    .attr('data-colsize', colsize).attr('data-mode', 'manager')
                    .attr('data-seatno', 'visible').appendTo(".cinema-wrap");
                    
                cinema = new Hacademy.Reservation(".cinema-wrap");
            	
            });
            
            $('.btn-regist').click(function(e){
            	if(confirm("좌석을 등록 하시겠습니까?")){
            		$("form").submit();
            	} else {
            		e.preventDefault();
            	}
            });
        });
    </script>
</head>
<body>
    <div id="content-wrapper">
		<div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">좌석 관리</a>
                </li>
                <li class="breadcrumb-item active">등록</li>
            </ol>
            <div class="row">
	            <div class="offset-sm-2 col-sm-8 offset-md-2 col-md-8">
	                <div class="notice-wrap">
	                    <label>등록 방법</label>
	                    <p style="font-weight: 700;"><span class="star">*</span> 입구 위치를 먼저 선택해주세요</p>
	                    <p><span class="star">*</span> 개수 변경 : 줄 / 칸을 입력한 후 선택버튼 클릭</p>
	                    <p><span class="star">*</span> 좌석 회전 : 좌석 선택 후 마우스 우클릭</p>
	                    <p><span class="star">*</span> 좌석 삭제 : 좌석 선택 후 Delete 키</p>
	                    <p><span class="star">*</span> 공간 병합 : 좌석 선택 후 F2 키</p>
	                    <p><span class="star">*</span> 좌석 비활성화 : 좌석 선택 후 F3 키</p>
	                </div>
	                	<div class="row mr-3 ml-3">
                			<div class="row w-100">
		                		<div class="col-4">
		                			<div class="row d-flex justify-content-start">
		                				<label class="justify-content-start">입구 위치</label>
		                			</div>
			                        <div class="row">
			                        	<div class="col-4">
			                        		 <button class="form-control btn btn-sm btn-secondary btn-entrance" data-direction="leftTop">좌측</button>
			                        	</div>
			                        	<div class="col-4">
			                        		 <button class="form-control btn btn-sm btn-secondary btn-entrance" data-direction="centerTop">중앙</button>
			                        	</div>
			                        	<div class="col-4">
			                        		<button class="form-control btn btn-sm btn-secondary btn-entrance" data-direction="rightTop">우측</button>
			                        	</div>
			                        </div>
		                		</div>
			                    <div class="col-4">
			         				<div class="row">
			         					<div class="col-6">
			         						<label class="">줄</label>
					                        <input type="number" min="7" class="form-control size-input d-inline" name="row" value="7" placeholder="줄 수를 입력하세요">
			         					</div>
			         					<div class="col-6">
			         						<label class="">칸</label>
					                        <input type="number" min="7" max="20" class="form-control size-input d-inline" name="col" value="7" placeholder="칸 수를 입력하세요">
			         					</div>
			         				</div>
				                </div>
				                <div class="col-4 mt-4">
				                	<div class="row">
				                		<div class="col-4 mt-2">
				                			<button class="form-control btn-sm btn-outline-secondary btn-select">선택</button>
				                		</div>
				                		<div class="col-4 mt-2">
				                			<button type="button" class="form-control btn-sm btn-outline-secondary btn-reset">초기화</button>
				                		</div>
				                		<div class="col-4 mt-2">
				                			<button type="button" class="form-control btn-sm btn-primary btn-regist">등록</button>
				                		</div>
				                	</div>
				                </div>
			                </div>
	                </div>
	            </div>
			</div>
			<div class="row">
	            <div class="offset-sm-2 col-sm-8 offset-md-2 col-md-8">	
                <br>
                <form action="regist" method="post">
                    <div class="cinema-wrap" data-name="seat">
                    	<div class="cinema-screen" style="width: 30%; padding: 0; height: 30px; margin-top: 10px;">출입구</div>
                        <div class="cinema-seat-area" data-rowsize="7" data-colsize="7" data-mode="manager" data-seatno="visible" data-fill="auto">
                        </div>
                    </div>
                    <input type="hidden" name="entrance_location" class="entrance">
                </form>
                <br>
                </div>
        	</div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>