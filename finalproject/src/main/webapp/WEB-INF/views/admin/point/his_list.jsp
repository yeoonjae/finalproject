<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
	<style>
		.list-result{
			display: none;
			color: red;
			font-size: medium;
		}
		.list-result.on {
			display: inline-block;
		}
		.span-wrap{
			text-align: center;
		}
		.detail-result.on {
			color: blue;
			font-size: small;
			display: inline-block;
		}
		.detail-result{
			display: none;
		}
		.his-type.red{
			color: red;
			font-weight: 600;
		}
		.his-type.blue{
			color: navy;
			font-weight: 600;
		}
		.table {
			text-align: center;
		}
		.btn-reselect {
			font-size: small;
			height: 38px;
		}
	</style>
    <script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
    <script>
        $(function(){
        	
        	if($(".his-list").find("td").length == 0){
        		$(".his-list").html("");
					$(".his-list").append("<tr>").append('<td colspan="4">검색 결과가 없습니다</td>');
        	}
        	
        	$.urlParam = function(name) {
        	    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
        	                      .exec(window.location.href);
        	    if (results == null) {
        	         return 0;
        	    }
        	    return results[1] || 0;
        	}
        	
        	if($.urlParam('member_no')){
        		$('.modal').modal('hide');
//         		console.log($.urlParam('member_no'));
        		$(".member_no").val($.urlParam('member_no'));
        		
        	} else {
        		// 모달 안사라지게
                $('#test-modal').modal({backdrop:'static'});
        	}
        	
        	// 회원 검색 선택 시
        	$(".btn-search").click(function(){
        		var member_name = $(".m_name").val();
        		var branch_no = $(".branch_no").val();
        		
        		axios({
        			url:"${pageContext.request.contextPath}/test/member/search?member_name="+member_name+"&branch_no="+branch_no,
        			method:"get"
        		}).then(function(response){
                	console.log(response.data);
                	var str;
                	
                	$(".list-table").html("");
                	if(response.data){
	                	$.each(response.data , function(i){
	                        var str = '<tr><td>' + response.data[i].branch_name + '</td><td>' 
	                        		+ response.data[i].member_name + '</td><td>' 
	                        		+ response.data[i].member_email 
	                        		+ '</td><td><button class="btn-primary btn-sm btn btn-select" data-dismiss="modal" data-name="' + response.data[i].member_name 
	                        		+'" data-email="'+response.data[i].member_email+'" data-no="'+ response.data[i].member_no +'">선택</button></td></tr>';
	    	               $(".list-table").append(str);
	    	               $(".list-table").find(".btn-select").click(function(){
	    	            	// 회원정보 input에 이름과 이메일 값 넣어주기
	    	            		$(".member_no").val($(this).data("no"));
		    	           		$(".member_name").val($(this).data("name"));
		    	           		$(".member_email").val($(this).data("email"));
		    	           		
	// 	    	           		// 읽기만 가능하게 변경
	// 	    	           		$(".member_name").prop("readonly", true);
	// 	    	           		$(".member_email").prop("readonly", true);
	    	               });
	                    });
	                	if($(".list-table").find("td").length == 0){
	                		$(".list-table").html("");
	 						$(".list-table").append("<tr>").append('<td colspan="4">검색 결과가 없습니다</td>');
	                	}
                	}
        		});
        		
        	});
        	
        	
        	
        	// 기간 버튼 선택 시
        	$(".btn-date").click(function(){
        		var date = $(this).data("date");
        		axios({
        			url:"${pageContext.request.contextPath}/test/date?date="+date,
        			method:"get"
        		}).then(function(response){
        			$("input[name=start]").val(response.data.start);
        			$("input[name=finish]").val(response.data.finish);
        		});
        	});
        	
        	// 리스트가 없을 경우 span 나오게
        	if(!$(".check").text()){
        		$(".his-list").addClass("on");
        	}
        	
        	// 검색 버튼 누를 경우 내역 리스트가 나오게
        	$(".btn-list").click(function(){
        		var str;
        		var member_no = $(".member_no").val();
        		var start = $(".start").val();
        		var finish = $(".finish").val();
        		
        		axios({
        			url:"${pageContext.request.contextPath}/test/point/list?member_no="+member_no+"&start="+start+"&finish="+finish,
        			method:"get"
        		}).then(function(response){
        			console.log(response.data);
        			
        			$(".his-list").html("");
        			
        			// 리스트 출력
        			$.each(response.data , function(i){
                        var str = '<tr><td>' + response.data[i].point_his_date.substring(0, 10) + '</td><td class="his-type">' 
                        				+ response.data[i].point_type + '</td><td class="his-detail">'
                        				+ response.data[i].point_detail +'<br><span class="detail-result" data-no="'+response.data[i].point_no+'">사유 : ' + response.data[i].point_his_detail + '</span></td><td>'
                        				+ response.data[i].point_his_score +'점</td></tr>';
    	               $(".his-list").append(str);
                    });
        			
        			// 관리자 적립이 아닐 경우 사유 안나오게
        			$.each($(".detail-result"), function(i){
        				var no = $(this).data("no");
	        			console.log(no);
        				if(no==1 || no==2){
        					$(this).addClass("on");
        				}
        			});
        			
        			// 적립은 네이비, 차감은 빨간 글씨로 나오게
        			$.each($(".his-type"), function(i){
        				var td = $(this).text();
        				if(td=="차감"){
        					$(this).addClass("red");
        				} else {
        					$(this).addClass("blue");
        				}
        			});
        			
        			if($(".his-list").find("td").length == 0){
                		$(".his-list").html("");
 						$(".his-list").append("<tr>").append('<td colspan="4">검색 결과가 없습니다</td>');
                	}
        			
        		});
        		
        	});
        	
        	// 회원 재선택시
        	$(".btn-reselect").click(function(){
        		$(location).attr("href", "${pageContext.request.contextPath}/admin/point/his_list");
        	});
        });
        
        window.onload = function(){
            var options = {
                //대상 지정
                field: document.querySelector(".picker-start"),
                
                //두 번째 대상 지정
                secondField: document.querySelector(".picker-end"),
                
                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',
                
                //한 화면에 표시될 달의 개수
                numberOfMonths: 2,
                
                //시작일 지정
                // minDate:new Date(),//- 오늘부터 선택 가능
                minDate:moment(new Date()).add(-3, 'month'),

                //미래 날짜 선택불가
                maxDate: moment().endOf('today'),
                
                //시작요일(1:월 ~ 7:일)
                firstDay: 7,
                
                //선택 방향 제어
                selectForward: true,
                
                //주말 제외
                disableWeekends:false,
                
                //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                onSelect:function(start, end) {
                    if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                    var days = end.diff(start, 'days') + 1;
                    console.log(days);
                }
            };
            var picker = new Lightpick(options);
        };
    </script>
    <style>
        .search-wrap {
            display: inline-block;
        }
    </style>
</head>
<body>
    <!-- 모달 -->
    <div class="modal" id="test-modal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">회원 검색</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                    	<div class="form-group">
                        	<!-- 지점 선택 -->
                            <div class="row">
                            	<div class="col-5">
                            	<c:choose>
                            		<c:when test="${admininfo.admin_auth eq '본사'}">
	                                	<select name="branch_no" class="form-control col-10 branch_no">
											<option value="0">지점전체</option>
											<c:forEach items="${branchList}" var="branchDto">
												<option value="${branchDto.branch_no}">${branchDto.branch_name}</option>
											</c:forEach>
										</select>
                            		</c:when>
                            		<c:otherwise>
	                                	<select name="branch_no" class="form-control branch_no col-10">
	                                		<option value="${branchList.branch_no}">${branchList.branch_name}</option>
										</select>                            			
                            		</c:otherwise>
                            	</c:choose>
                                </div>
                                <div class="col-7">
                                	<!-- 이름 검색 -->
                                    <input type="text" class="m_name form-control" name="member_name" placeholder="회원명을 입력하세요">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block btn-search">검색</button>
                    </div>
                </div>
                <!-- 회원 목록 -->
                <div class="modal-footer">
                    <table class="table table-bordered table-hover" width="100%">
                        <thead>
                            <tr>
                                <th>지점명</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody class="list-table">
                        </tbody>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <!-- 페이지 디자인 -->
    <div class="container-fluid">
    		<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">마일리지 내역</a>
            	</li>
            	<li class="breadcrumb-item active">조회</li>
         	</ol>
        <br>
        <div class="row">
            <div class="offset-md-2 col-md-8 offset-sm-2 col-sm-8 search-wrap">
                <div class="row">
                <!-- 회원정보 -->
                    <div class="col-4">
                        <label>회원명</label>
                        <input type="text" name="member_name" class="form-control member_name" value="${memberDto.member_name}" readonly>
                    </div>
                    <div class="col-6">
                        <label>이메일</label>
                        <input type="text" name="member_email" class="form-control member_email" value="${memberDto.member_email}" readonly>
                    </div>
                    <div class="col-2">
                    	<label style="color: white">재선택</label>
                    	<button class="btn btn-primary btn-block btn-reselect">재선택</button>
                    </div>
                </div>
                <br><hr><br>
                <!-- 마일리지 내역 목록 테이블  -->
                <input type="hidden" name="member_no" class="member_no">
                <div class="row">
                    <div class="col-4 btn-group">
                        <button class="btn btn-sm btn-primary btn-date" type="button" data-date="7">1주일</button>
                        <button class="btn btn-sm btn-primary btn-date" type="button" data-date="1">1개월</button>
                        <button class="btn btn-sm btn-primary btn-date" type="button" data-date="3">3개월</button>
                    </div>
                    <div class="col-3">
                        <input type="text" class="picker-start form-control start" name="start" placeholder="시작일을 선택해주세요">
                    </div>
                    <div class="col-3">
                        <input type="text" class="picker-end form-control finish" name="finish" placeholder="종료일을 선택해주세요">
                    </div>
                    <div class="col-2 btn-group">
                        <button class="btn btn-sm btn-primary btn-block btn-list">검색</button>
                    </div>
                </div>
            </div>
            <!-- 테이블 -->
            <div class="card-body offset-md-2 col-md-8 offset-sm-2 col-sm-8">
            <hr><br>
                <div class="table-responsive">
                    <table class="table table-hover" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <!-- 마일리지 내역 항목 -->
                                <th>날짜</th>
                                <th>유형</th>
                                <th>상세내용</th>
                                <th>마일리지</th>
                            </tr>
                        </thead>
                        <tbody class="his-list check">
                        </tbody>
                    </table>
                </div>
                <br><br><br><br>
                <div class="span-wrap">
                	<span class="list-result">최근 일주일 간의 내역이 존재하지 않습니다</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>