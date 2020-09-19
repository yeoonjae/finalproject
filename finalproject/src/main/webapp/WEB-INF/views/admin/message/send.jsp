<%@page import="com.kh.finalproject.entity.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<style>
.table {
	text-align: center;
}

.send-form {
	width: 70%;
	margin: auto;
}
.custom-select{
	margin-top: 10px;
}

.outbox-tr:hover{
	cursor: pointer;
	background-color: lightgray;
}
.inbox-tr:hover{
	cursor: pointer;
	background-color: lightgray;
}
</style>
<script>
	$(function(){
		//parameter받아오는 코드
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = window.location.search.substring(1),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');

		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		};
		var where = getUrlParameter('where');
		if(where == 'inbox'){//쪽지함을 클릭해서 들어왔을 때
			$(".send-mail-tab").removeClass('active').removeClass('show');
			$(".outbox-tab").removeClass('active').removeClass('show');
			$(".inbox-tab").addClass("active").addClass("show");
		}else if(where == 'outbox'){
			$(".send-mail-tab").removeClass('active').removeClass('show');
			$(".inbox-tab").removeClass('active').removeClass('show');
			$(".outbox-tab").addClass("active").addClass("show");
		}
		
		
		var local = $(".local-list");
		var branch = $(".branch-list");
		var table = $(".receive-list-table");
		var member = $(".member-list");
		member.hide();
		local.hide();
		branch.hide();
		table.hide();
	    var modal = $(".modal-main");
	    
	    $(".receive").click(function(){
			$("#send-modal").modal('show');
	    })
	    
	    
	    $(".who").change(function(){
	    	 var local = $(".local-list");
	    	 var branch = $(".branch-list");
	    	 var select = $(this).val();
	    	 if(select==1){//전체 회원이면
	    		 var tag = "<tr><td colspan='4' class='name'>전체 회원</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
				 $(".receive-list-table").append(tag);
				 table.show();
				 $(".who").prop("disabled",true);
				 $(".remove-bnt").on("click",(function(){
			    		$(this).parents("tr").remove();
			    		 $(".who").prop("disabled",false);
			    		 console.log("삭제후",table.children("tbody").children("tr").children("td").html());
			    	}))    		 
	    	 }
	    	 if(select==2){//전체 지점장
	    		 var tag = "<tr class='name-tr'><td colspan='4' class='name'>전체 지점장</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
				 $(".receive-list-table").append(tag);
				 table.show();
				 $(".who").prop("disabled",true);
				 $(".remove-bnt").on("click",(function(){
			    		$(this).parents("tr").remove();
			    		$(".who").prop("disabled",false);
			    	}))
	    	 }
	    	if(select==3){//지점장 선택을 했을 경우
	    		 //지역 비동기로 불러오기
	    		 axios({
	            		url:"${pageContext.request.contextPath}/test/message/localList",
	            		method : "get"
	            	}).then(function(response){
            			$("select").remove(".local-option");
            			var local = $(".local-list");
	            		$.each(response.data,function(i){
	            			$("<option>").attr("value",response.data[i].local_no).attr("class","local-option").text(response.data[i].local_name).appendTo(local);
	            		})
	            		local.show();
	            		$(".who").prop("disabled",true);	
	            	})
	            	
            		//지점 비동기로 불러와서 목록 출력
	            	local.on("change",(function(){
	            		var local_no = $(".local-list").val();
	            		
	            		
	            		axios({
	            			url:"${pageContext.request.contextPath}/test/message/branchList?local_no="+local_no,
	            			method : "get"
	            		})
	            		.then(function(response){
	            			$(".branch-option").remove();
	            			$.each(response.data,function(i){
	            				$("<option>").attr("value",response.data[i].admin_no).attr("class","branch-option").text(response.data[i].branch_name).appendTo(branch);
	            			})
	            			branch.show();
	            		})
	            		}))
	            	//지점 선택을 완료하면 테이블 표시하면서 목록 추가
	            	branch.change(function(){
	            		var admin_no = $(".branch-list").val();
	            		var table = $(".receive-list-table");
	            		axios({
	            			url:"${pageContext.request.contextPath}/test/message/adminInfo?admin_no="+admin_no,
	            			method:"get"
	            		})
	            		.then(function(response){
	            			console.log(response.data);
	            			var tag = "<tr class='name-tr'></td><td class='no'>"+response.data.admin_no+
	            						"</td><td>"+response.data.branch_name+
				            			"</td><td>"+response.data.admin_auth+
				            			"</td><td class='name'>"+response.data.admin_name+
				            			"</td><td><button class='btn btn-outline-secondary remove-bnt' type='button'>삭제</button></td></tr>";
	            			table.append(tag);
	            			table.show();
					    	$(".remove-bnt").on("click",(function(){
					    		$(this).parents("tr").remove();
					    	}))
	            		})
	            	});
	    	 }
	    	//회원 검색을 선택하면 --> 해당 지점 회원 이름 나옴
	    	if(select==4){
	    		var admin_no = $(".admin_no").val();
	    		$(".member-list").show();
// 	    		$(".who").prop("disabled",true);
	    		axios({
	    			url:"${pageContext.request.contextPath}/test/message/member?admin_no="+admin_no,
        			method:"get"
	    		})
	    		.then(function(response){
	    			console.log(response.data);
	    			$.each(response.data,function(i){
            			$("<option>").attr("value",response.data[i].member_no).attr("class","member-option").text(response.data[i].member_name).appendTo(member);
            		})
	    		})
	    		
	    	}
	    	
	    	//회원선택을 완료하면
	    	member.change(function(){
	    		$(".member-list").show();
	    		var member_no = $(".member-list").val();
        		var table = $(".receive-list-table");
        		var tag;
        		axios({
        			url:"${pageContext.request.contextPath}/test/message/memberInfo?member_no="+member_no,
        			method:"get"
        		}).then(function(response){
        			tag =  "<tr class='name-tr'><td class='no'>"+response.data.member_no+
        			"</td><td>"+response.data.branch_name+
        			"</td><td>회원</td><td class='name'>"+response.data.member_name+
        			"</td><td><button class='btn btn-outline-secondary remove-bnt' type='button'>삭제</button></td></tr>";
        			table.append(tag);
        			table.show();
        			//지우기 버튼을 누를 시 지워짐
			    	$(".remove-bnt").on("click",(function(){
			    		$(this).parents("tr").remove();
			    	}))
        		})
	    	});
	    	
	    	//대상을 선택하는 구문
	    	//1. 기존에 선택된 사람들을 삭제
	    	//2. 새로운 대상을 추가
	    	$("#save").click(function(){
		    	$("input").remove("input[name=receiver_name]");
		    	$('.name').each(function() {
		    		var all = "전체 회원";
	    		    var receiver = $("#receiver");//받는사람 input칸
	    		    var sum = ($(".name").length)-1;
	    		    if($(".name").length > 1){//tr안에 있는 td의 클래스 이름이 name이다
		    		    receiver.attr("value",$(this).text()+"외"+sum+"명");
		    		    $("<input>").attr("type","hidden").attr("value",$(this).parents("tr").children(".no").text()).attr("name","receiver_name").insertAfter(receiver);
		    		    
	    		    }else if($(".name").length = 1){
	    		    	if($(".name").text() == "전체 회원" || $(".name").text() == "전체 지점장"){
	    		    		receiver.attr("value",$(this).text());
		    		    	$("<input>").attr("type","hidden").attr("value",$(this).text()).attr("name","receiver_name").insertAfter(receiver);
	    		    	}else{
		    		    	receiver.attr("value",$(this).text());
		    		    	$("<input>").attr("type","hidden").attr("value",$(this).parents("tr").children(".no").text()).attr("name","receiver_name").insertAfter(receiver);
	    		    	}
	    		    }else if($(".name").length < 1){
	    		    	$("#receiver").attr("value","");
	    		    }
	    		 });
	    	});
	     })
	});
</script>

<div id="content-wrapper" style="padding-top: 60px;">
	<div class="container-fluid" style="margin-bottom: 60px;">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<c:choose>  
		        <c:when test="${admininfo.admin_auth eq '본사'}">
			     <ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link outbox-tab" href="${pageContext.request.contextPath}/admin/message/outbox">보낸 쪽지</a>
					</li>
					<li class="nav-item">
					<a class="nav-link active send-mail-tab" data-toggle="tab" href="#send-mail">쪽지 보내기</a></li>
				</ul> 	 	
		        </c:when>
				<c:when test="${admininfo.admin_auth eq '지점'}">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link inbox-tab" href="${pageContext.request.contextPath}/admin/message/inbox">받은 쪽지 보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link outbox-tab" href="${pageContext.request.contextPath}/admin/message/outbox">보낸 쪽지</a>
					</li>
					<li class="nav-item">
					<a class="nav-link active send-mail-tab" data-toggle="tab" href="#send-mail">쪽지 보내기</a></li>
				</ul>
		        </c:when>
        	</c:choose>   
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade show active send-form send-mail-tab" id="send-mail">
						<br>
							<!-- 쪽지보내기 -->
							<input class="admin_no" type="hidden" value="${admininfo.admin_no}">
							<form action="send" method="post">
								<fieldset>
									<div class="form-group">
										<label for="exampleInputEmail1">보내는 사람</label>
										<!-- 발신인 -->
										<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="${admininfo.admin_name}" name="sender_name">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">받는 사람</label>
										<!-- 수신인 --> 
										<input type="text" class="form-control receive" id="receiver" autocomplete="off" required="required">
										
									</div>
									<div class="form-group">
										<label for="exampleSelect1">제목</label> 
										<input type="text" class="form-control" id="exampleInputEmail1" name="message_title" autocomplete="off" required="required">
									</div>
									<div class="form-group">
										<label for="exampleTextarea">쪽지 내용</label>
										<textarea class="form-control" id="exampleTextarea" rows="3" name="message_content" autocomplete="off" required="required"></textarea>
									</div>
									<button type="submit" class="btn btn-outline-secondary btn-block">쪽지 보내기</button>
								</fieldset>
							</form>
								<!-- 쪽지 보내는 사람 모달 -->
							<div class="modal modal-main" id="send-modal"  aria-hidden="true" style="display: none; z-index: 1050;">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">쪽지 보내기</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
										        <select class="custom-select who" required="required">
										        <c:choose>
										        	<c:when test="${admininfo.admin_auth eq '본사'}">
											          <option selected="">받는 사람 선택</option>
											          <option value="2">전체 지점장</option>
											          <option value="3">지점장 검색</option>
										        	</c:when>
										        	<c:when test="${admininfo.admin_auth eq '지점'}">
										        	  <option selected="">받는 사람 선택</option>
											          <option value="1">해당 지점 전체 회원</option>
											          <option value="4">해당 지점 회원 검색</option>
										        	</c:when>
										        </c:choose>
										        </select>
										        <!-- 지역검색 -->
										        <select class="local-list custom-select" name="loacl_no">
										        	<option value="">지역 검색</option>
										        </select>
										        <!-- 지점선택 -->
										        <select class="branch-list custom-select" name="branch_no">
										        	<option value="">지점 검색</option>
										        </select>
										        <!-- 회원 선택 -->
										        <select class="member-list custom-select" name="member_no">
										        	<option value="">회원 검색</option>
										        </select>
										        <hr>
										        <!-- 선택한 목록 테이블 -->
										        <table class="table receive-list-table" id="mytable">
										        	<thead>
										        		<tr>
										        			<th colspan="5">받는사람 목록</th>
										        		</tr>
										        		<tr>
										        			<th>번호</th>
										        			<th>지점</th>
										        			<th>분류</th>
										        			<th>이름</th>
										        			<th>삭제</th>
										        		</tr>
										        	</thead>
										        	<tbody>
										        	</tbody>
										        </table>
										    </div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-secondary" id="save" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>