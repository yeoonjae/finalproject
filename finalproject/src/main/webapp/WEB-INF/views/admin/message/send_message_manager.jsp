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
		var local = $(".local-list");
		var branch = $(".branch-list");
		var table = $(".receive-list-table");
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
	    		 var tag = "<tr><td colspan='3' class='name'>전체 회원</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
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
	    		 var tag = "<tr class='name-tr'><td colspan='3' class='name'>전체 지점장</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
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
	            			var tag = "<tr class='name-tr'><td>"+response.data.branch_name+
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
	    	
	    	//대상을 선택하는 구문
	    	//1. 기존에 선택된 사람들을 삭제
	    	//2. 새로운 대상을 추가
	    	$("#save").click(function(){
		    	$("input").remove("input[name=receiver_name]");
		    	$('.name').each(function() {
	    		    var receiver = $("#receiver");//받는사람 input칸
	    		    var sum = ($(".name").length)-1;
	    		    if($(".name").length > 1){//tr안에 있는 td의 클래스 이름이 name이다
	    		    	console.log($(this).text());
		    		    receiver.attr("value",$(this).text()+"외"+sum+"명");
		    		    $("<input>").attr("type","hidden").attr("value",$(this).text()).attr("name","receiver_name").insertAfter(receiver);
		    		    
	    		    }else if($(".name").length = 1){
	    		    	receiver.attr("value",$(this).text());
	    		    	$("<input>").attr("type","hidden").attr("value",$(this).text()).attr("name","receiver_name").insertAfter(receiver);
	    		    }
	    		 });
	    	});
	     })
     
		$(".outbox-tr").click(function(){
	    	$("#outbox-modal").modal('show');
	    	
	    	//모달
	    	var title = $(this).parents(".table").next().children().children().children().children(".outbox-title");
	    	var content = $(this).parents(".table").next().children().children().children().children(".outbox-content");
	    	var date = $(this).parents(".table").next().children().children().children().children(".outbox-date");
	    	var del = $(this).parents(".table").next().children().children().children().children().children(".outbox-delete");
	    	console.log(del);
	    	
	    	//테이블
	    	var inputContent = $(this).children().find(".outbox-content-input").val();//쪽지 내용
	    	var titleTd = $(this).children(".outbox-title-td").text();//쪽지 제목
	    	var dateTd = $(this).children(".outbox-date-td").text();//보낸 날짜
	    	var deleteInput = $(this).children().find(".outbox-no-input").val();
	    	
	    	//모달에 쪽지내용 넣기
	    	title.text(titleTd);
	    	content.text(inputContent);
	    	date.text(dateTd);
	    	del.val(deleteInput);
	    });
	    
	    $(".inbox-tr").click(function(){
	    	$("#inbox-modal").modal('show');
	    	
	    	//모달
	    	var title = $(this).parents(".table").next().children().children().children().children(".inbox-title");
	    	var content = $(this).parents(".table").next().children().children().children().children(".inbox-content");
	    	var date = $(this).parents(".table").next().children().children().children().children(".inbox-date");
	    	var del = $(this).parents(".table").next().children().children().children().children().children(".inbox-delete");
	    	
	    	//테이블
	    	var inputContent = $(this).children().find(".inbox-content-input").val();//쪽지 내용
	    	var titleTd = $(this).children(".inbox-title-td").text();//쪽지 제목
	    	var dateTd = $(this).children(".inbox-date-td").text();//보낸 날짜
	    	var deleteInput = $(this).children().find(".inbox-no-input").val();
	    	
	    	//모달에 쪽지내용 넣기
	    	title.text(titleTd);
	    	content.text(inputContent);
	    	date.text(dateTd);
	    	del.val(deleteInput);
	    });
	    
	});
	    
	
	
</script>

<div id="content-wrapper" style="padding-top: 60px;">
	<div class="container-fluid">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#home">받은 쪽지 보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#profile">보낸 쪽지</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#send-mail">쪽지 보내기</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade" id="home">
						<br>
						<p>
						<!-- 수신함 -->
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>보낸사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="inbox" items="${inbox}">
								<tr class="inbox-tr">
									<td class="inbox-title-td">${inbox.message_title}</td>
									<td class="inbox-name_td">${inbox.admin_name}</td>
									<td class="inbox-date-td">${inbox.message_manager_date}
										<input type="hidden" class="inbox-content-input" value="${inbox.message_content}">
										<input type="hidden" class="inbox-no-input" value="${inbox.message_manager_no}">
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<!-- 수신함 모달 -->
						<div class="modal" id="inbox-modal">
							<div class="modal-dialog">
							       <div class="modal-content">
							            <div class="modal-header">
							                <h5 class="modal-title inbox-title"></h5>
							                <h6 class="modal-title inbox-date"></h6>
							            </div>
							            <div class="modal-body">
							                <h6 class="modal-title inbox-content"></h6>  
							            </div>
							            <div class="modal-footer">
							                <form action="message_delete" method="post">
								                <input type="hidden" class="inbox-delete" name="message_manager_no">
								                <input type="submit" class="btn btn-outline-danger" value="삭제">
							            	</form>
							                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
							            </div>
							       </div>
							 </div>
						</div>
					</div>
					<div class="tab-pane fade" id="profile">
						<br>
						<p>
						<!-- 발신함 -->
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>받는사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="outbox" items="${outbox}">
								<tr class="outbox-tr">
									<td class="outbox-title-td">
									${outbox.message_title}
										<input type="hidden" class="outbox-content-input" value="${outbox.message_content}">
										<input type="hidden" class="outbox-no-input" value="${outbox.message_manager_no}">
									</td>
									
									<td>
									<c:choose>
										<c:when test="${outbox.admin_name eq '본사'}">
											전체 지점장
										</c:when>
										<c:otherwise>
											${outbox.admin_name}
										</c:otherwise>
									</c:choose>
									</td>
									<td class="outbox-date-td">${outbox.message_manager_date}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<!-- 받신함 모달 -->
						<div class="modal" id="outbox-modal">
							<div class="modal-dialog">
							       <div class="modal-content">
							            <div class="modal-header">
							                <h6 class="modal-title outbox-title"></h6>
							                <h6 class="modal-title outbox-date"></h6>
							            </div>
							            <div class="modal-body">
							                <h6 class="modal-title outbox-content"></h6>  
							            </div>
							            <div class="modal-footer">
							            <form action="message_delete" method="post">
							                <input type="hidden" class="outbox-delete" name="message_manager_no">
							                <input type="submit" class="btn btn-outline-danger" value="삭제">
							            </form>
							                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
							            </div>
							       </div>
							 </div>
						</div>
					</div>
					<div class="tab-pane fade show active send-form" id="send-mail">
						<br>
							<!-- 쪽지보내기 -->
							<form action="send_message_manager" method="post">
								<fieldset>
									<div class="form-group">
										<label for="exampleInputEmail1">보내는 사람</label>
										<!-- 발신인 -->
										<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="${admininfo.admin_name}" name="sender_name">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">받는 사람</label>
										<!-- 수신인 --> 
										<input type="text" class="form-control receive" id="receiver" autocomplete="off">
										
									</div>
									<div class="form-group">
										<label for="exampleSelect1">제목</label> 
										<input type="text" class="form-control" id="exampleInputEmail1" name="message_title" autocomplete="off">
									</div>
									<div class="form-group">
										<label for="exampleTextarea">쪽지 내용</label>
										<textarea class="form-control" id="exampleTextarea" rows="3" name="message_content" autocomplete="off"></textarea>
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
											        <select class="custom-select who">
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
											        <select class="local-list custom-select" name="loacl_no">
											        	<option value="">지역 검색</option>
											        </select>
											        <select class="branch-list custom-select" name="branch_no">
											        	<option value="">지점 검색</option>
											        </select>
											        <hr>
											        <table class="table receive-list-table" id="mytable">
											        	<thead>
											        		<tr>
											        			<th colspan="4">받는사람 목록</th>
											        		</tr>
											        		<tr>
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