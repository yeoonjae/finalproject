<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
        .btn-wrap {
        	text-align: center;
        }
        .btn-edit {
        	margin-right: 5px;
        }
        .btn-list {
        	margin-left: 5px;
        }
    </style>
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js@latest/cinema/hacademy-cinema.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js@latest/cinema/hacademy-cinema.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
    <script>
   	    window.onload = function(){
   	    };
   	    $(function(){
   	       	if($('.entrance').val()=='leftTop'){
   	       		$('.cinema-screen').css("width", '30%').css('margin', '10px').css('height', '30px').css('padding', '0');    	    	   	       		
   	       	} else if($('.entrance').val()=='centerTop'){
   	       		$('.cinema-screen').css("width", '30%').css('margin-top', '10px').css('height', '30px').css('padding', '0');    	    	   	    	
    	    } else {
   	       		$('.cinema-screen').css("width", '30%').css('margin', '10px').css('height', '30px').css('margin-left', '68%').css('padding', '0');    	    	
    	    }
   	    	var cinema = new Hacademy.Reservation(".cinema-wrap");
   	    })
    </script>
</head>
<body>
    <div id="content-wrapper">
		<div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">좌석 관리</a>
                </li>
                <li class="breadcrumb-item active">상세보기</li>
            </ol>
            <div class="offset-sm-2 col-sm-8 offset-md-2 col-md-8">
            	<div class="form-inline">
                    <div class="form-wrap">
                        <label class="justify-content-start">지점명</label>
                        <input type="text"class="form-control" name="row" value="주용 스터디 카페" disabled>
                    </div>
                </div>
                <br>
                <input type="hidden" name="entrance" value="${entrance}" class="entrance">
                <div class="cinema-wrap" data-name="seat">
                	<div class="cinema-screen">출입구</div>
                    <div class="cinema-seat-area" data-rowsize="${rowsize}" data-colsize="${colsize}" data-seatno="visible" data-fill="manual">
                    	<c:forEach items="${list}" var="seatDto">
                    		<div class="cinema-seat" data-row="${seatDto.seat_row}" data-col="${seatDto.seat_col}" data-state="${seatDto.seat_type}"></div>
                    	</c:forEach>
                    </div>
                </div>
                <br><br>
                <div class="btn-wrap">
                    <button class="btn btn-sm btn-primary btn-edit">수정</button>
                    <button class="btn btn-sm btn-secondary btn-list">목록</button>
                </div>
                <br><br>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>