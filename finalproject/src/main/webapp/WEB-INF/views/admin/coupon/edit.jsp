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
		.table {
			text-align: center;
		}
		.coupon_issue.red{
			color: red;
			font-weight: 900;
		}
		.coupon_issue.blue{
			color: blue;
			font-weight: 900;
		}
		.coupon_issue.navy{
			color: navy;
			font-weight: 900;
		}
		.btn-modal{
			/* background-color: transparent; */
			font-size: small;
		}
		.notice {
			font-size: small;
			color: red;
		}
		.notice2 {
			font-size: small;
		}
		.branch-notice {
			text-align: center;
		}
		.branch-count {
			font-weight: 900;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lightpick.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$('.modal').modal('hide');
			
			$(".btn-modal").click(function(){
				var coupon_name = $(this).parent().next().text();
				var group_no = $(this).data("group");
				axios({
					url: "${pageContext.request.contextPath}/test/coupon/branchList?group_no="+group_no,
					method: "get"
				}).then(function(response){
					$(".list-wrap").html("");
					// 지점 개수 출력
					$(".branch-count").text(response.data.length);
					// 리스트 출력
					$.each(response.data , function(i){
                       var str = '<tr><td>'+response.data[i].local_name+'</td><td>'+response.data[i].branch_name
                       				+'</td><td><button class="btn btn-sm btn-outline-secondary branch-delete" data-group="'+group_no
                       				+'" data-branch="'+response.data[i].branch_no+'">삭제</button></td></tr>';
                       $(".list-wrap").append(str);
                    });
                    $(".branch-delete").click(function(){
                 	   if(confirm("해당 지점의 쿠폰을 정말 삭제하시겠습니까?")){
	                  	   var branch_no = $(this).data("branch");
	                  	   $(this).parents("tr").hide();
	                  	   $(".branch-count").text($(".list-wrap").find("tr").length-1);
	                  	   axios({
	                  		   url: "${pageContext.request.contextPath}/test/coupon/delete?branch_no="+branch_no+"&group_no="+group_no,
	                  		   method: "get"
	                  	   }).then(function(response){
	                  		   alert("삭제가 완료되었습니다");
	                  		   if($.urlParam("order")){
	                  			   location.href = "${pageContext.request.contextPath}/admin/coupon/edit?order="+$.urlParam("order");	
	                  		   } else {
	                  			   location.href = "${pageContext.request.contextPath}/admin/coupon/edit";							
	                  		   }
	                  	   });
                 	   }
                    });
				});
				$('#list-modal').modal({backdrop:'static', show:'true'});
			});
			
			// 구분에 따라 글자 색상 설정
			$.each($(".coupon_issue"), function(i){
				var td = $(this).text();
				if(td=="유효"){
					$(this).addClass("red");
				} else if(td=="예정"){
					$(this).addClass("blue");
				} else {					
					$(this).addClass("navy");
				}
			});
			
			// 파라미터 조회
			$.urlParam = function(name) {
        	    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
        	                      .exec(window.location.href);
        	    if (results == null) {
        	         return 0;
        	    }
        	    return results[1] || 0;
        	}
			
			// 삭제 클릭 시
			$(".btn-delete").click(function(e){
				if($(this).data("issue")=='유효') {
					e.preventDefault();
					alert("기간이 만료되지 않은 쿠폰은 삭제할 수 없습니다");
				} else {
					if(confirm("정말 삭제 하시겠습니까?")){
	            	} else {
	            		e.preventDefault();
	            	}
				}
			});
			
			// 수정 클릭 시
			$(".btn-edit").click(function(e){
				if($(this).data("issue")=='만료') {
					e.preventDefault();
					alert("기간이 만료된 쿠폰은 수정할 수 없습니다");
				} else if($(this).data("issue")=='유효') {
					e.preventDefault();
					alert("이미 발급된 쿠폰은 수정할 수 없습니다");
				} else {
					var group_no = $(this).data("group");
					axios({
						url: "${pageContext.request.contextPath}/test/coupon/branchList?group_no="+group_no,
						method: "get"
					}).then(function(response){
						console.log(response.data);
						if(response.data.length == 1) {
							$(".branchName").val(response.data[0].branch_name);
						} else {
							var size = response.data.length - 1;
							$(".branchName").val(response.data[0].branch_name+" 외 "+size+"개 지점")
						}
					});
					var name = $(this).parent().prev().prev().prev().prev().text();
					var discount = $(this).parent().prev().prev().prev().text();
					var start = $(this).parent().prev().prev().children(".start-p").text();
					var finish = $(this).parent().prev().prev().children(".finish-p").text().substring(2, 12);
					
					$(".name").val(name);
					$(".discount").val(discount);
					$(".start").val(start);
					$(".finish").val(finish);
					
					$(".btn-save").attr("data-group", group_no);
					$("#edit-modal").modal("show");
				}
			});
			
			// 정렬 선택 시 
			$(".order").change(function(){
				var order = $(this).val();
					location.href = "${pageContext.request.contextPath}/admin/coupon/edit?order="+order;
			});
			
			// 쿠폰 수정 시
			$(".btn-save").click(function(){
				var group_no = $(this).data("group");
				var name = $(".name").val();
				var discount = $(".discount").val();
				var start = $(".start").val();
				var finish = $(".finish").val();
				axios({
					url:"${pageContext.request.contextPath}/test/coupon/edit?group_no="+group_no+
					"&coupon_name="+name+"&coupon_discount="+discount+"&coupon_start="+start+"&coupon_finish="+finish,
					method:"get"
				}).then(function(response){
					alert("수정이 완료되었습니다")
					if($.urlParam("order")){
						location.href = "${pageContext.request.contextPath}/admin/coupon/edit?order="+$.urlParam("order");						
					} else {
						location.href = "${pageContext.request.contextPath}/admin/coupon/edit";										
					}
				});
			});
			
		});
		$(window).on("load", function(){
	        // 등록 페이지에서 수정 버튼을 눌러서 올 경우 (파라미터에 번호가 있는 경우)
	        if($(".coupon_req_no").val()) {
        		$(".select-result").removeClass("on"); // 선택하라는 span 안보이게
        		$(".btn-edit").attr("disabled", false); // 버튼 비활성화
				// 읽기전용 비활성화
        		$(".coupon_req_name").attr("readonly", false);
            	$(".coupon_req_discount").attr("readonly", false);
            	$(".coupon_req_start").attr("readonly", false);
            	$(".coupon_req_finish").attr("readonly", false);
        	} 
	        
	        if($(".list-wrap").find("td").length == 0){
				$(".list-wrap").append("<tr>").append('<td colspan="6">승인 대기중인 쿠폰이 없습니다</td>');
	        }
	        
	        // datepicker
	        var options = {
	            //대상 지정
	            field: document.querySelector(".picker-start"),
	            
	            //두 번째 대상 지정
	            secondField: document.querySelector(".picker-finish"),
	            
	            //날짜 표시 형식 지정
	            format: 'YYYY-MM-DD',
	            
	            //한 화면에 표시될 달의 개수
	            numberOfMonths: 2,
	            
	            //시작일 지정
	            minDate:new Date(),//- 오늘부터 선택 가능
// 	            minDate:moment(new Date()).add(-90, 'days'),
	
	            //미래 날짜 선택불가
// 	            maxDate: moment().endOf('today'),
	            
	            //시작요일(1:월 ~ 7:일)
	            firstDay: 7,
	            
	            //선택 방향 제어
	            selectForward: true,
	            selectBackward: false,
	            
	            //주말 제외
	            disableWeekends:false,
	            
	            dropdowns:{
                    years:{
                        min:2020,
                        max:2030,
                    },
                    months:true,
	            },

	            
	            //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
	            onSelect:function(start, end) {
	                if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
	                var days = end.diff(start, 'days') + 1;
	                console.log(days);
	            }
	        };
	        var picker = new Lightpick(options);
	    });
	</script>
</head>
<body>
    <div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
          	<ol class="breadcrumb">
            	<li class="breadcrumb-item">
            		<a href="#">쿠폰 목록</a>
            	</li>
            	<li class="breadcrumb-item active">조회</li>
            </ol>
            <div class="row">
                <div class="offset-md-1 col-md-10 offset-sm-1 col-sm-10">
                <table class="table table-hover table-condensed" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>
                            	<select class="form-control form-inline order" name="order">
                            		<option value="">전체</option>
                            		<option value="start" ${param.order=="start"?'selected':''}>예정</option>
                            		<option value="ing" ${param.order=="ing"?'selected':''}>유효</option>
                            		<option value="finish" ${param.order=="finish"?'selected':''}>만료</option>
                            	</select>
                            </th>
                            <th>발급대상</th>
                            <th>쿠폰명</th>
                            <th>할인률(%)</th>
                            <th>기간</th>
                            <th>발급일</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${couponList}" var="couponDto">
                        <tr>
                        	<td class="coupon_issue">${couponDto.coupon_issue}</td>
                        	<c:choose>
	                        	<c:when test="${couponDto.coupon_category eq '전체'}">
	                        		<td>${couponDto.coupon_category}</td>
	                        	</c:when>
	                        	<c:otherwise>	                        	
		                         	<td>
		                         		<p>
		                         			${couponDto.coupon_category}
		                         		</p>
		                         		<button class="btn btn-sm btn-outline-secondary btn-modal" data-group="${couponDto.group_no}">지점확인</button>
		                         	</td>                        		
	                        	</c:otherwise>                        	
                        	</c:choose>
                            <td>${couponDto.coupon_name}</td>
                            <td>${couponDto.coupon_discount}</td>
                            <td>
                                <p class="start-p">${couponDto.coupon_start}</p>
                                <p class="finish-p">~ ${couponDto.coupon_finish}</p>
                            </td>
                            <td>${couponDto.coupon_date}</td>
                            <td>
                                <button class="btn btn-sm btn-primary btn-edit" data-group="${couponDto.group_no}"
                                data-issue="${couponDto.coupon_issue}">수정</button>
                                <span> / </span>
                                <a href="delete/${couponDto.group_no}">
                                    <button class="btn btn-sm btn-danger btn-delete" data-group="${couponDto.group_no}"
                                    data-issue="${couponDto.coupon_issue}">삭제</button>
                                </a>
                            </td>
                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
    <!-- 지점 리스트 모달 -->
    <div class="modal" id="list-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">발급 지점 목록</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                    <br>
                    	<div class="row">
                    		<div class="offset-sm-2 col-sm-8 offset-md-2 col-md-8">
                    			<p class="branch-notice">해당 쿠폰은 총 <span class="branch-count"></span>개의 지점에 발급되었습니다</p>
<!--                     			<label>쿠폰명</label> -->
<!--                     			<input class="form-control couponName" type="text" readonly> -->
                    		</div>
                    	</div>
                    	<br>
                        <div class="row">
                            <div class="offset-sm-2 col-sm-8 offset-md-2 col-md-8">
                                <table class="table table-hover" width="100%">
                        			<thead>
		                            	<tr>
			                                <th>지역명</th>
			                                <th>지점명</th>
			                                <th>비고</th>
		                            	</tr>
                        			</thead>
                        			<tbody class="list-wrap">
                        			</tbody>
                    			</table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">Close</button>
			    </div>
            </div>
        </div>
    </div>
    <div class="modal" id="edit-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">쿠폰 수정</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
                                <div class="form-group">
                                    <span class="notice2">* 지점 변경을 원하시면 <span class="notice">삭제 후 재등록</span> 해주시기 바랍니다 *</span>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <!-- 쿠폰 -->
                                    <label>발급 대상</label> <span class="notice">변경불가</span>
                                    <input class="form-control branchName" type="text" name="branch_name" readonly>
                                </div>
                                <div class="form-group">
                                    <label>쿠폰명</label>
                                    <input class="form-control name" type="text" name="coupon_name">
                                </div>
                                <div class="form-group">
                                    <label>할인률</label>
                                    <input class="form-control discount" type="number" name="coupon_discount">
                                </div>
                                <div class="form-group">
                                    <label>쿠폰 시작일</label>
                                    <input class="form-control start picker-start" type="text" name="coupon_start">
                                </div>
                                <div class="form-group">
                                    <label>쿠폰 종료일</label>
                                    <input class="form-control finish picker-finish" type="text" name="coupon_finish">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-primary btn-save">Edit</button>
			        <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Close</button>
			    </div>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>