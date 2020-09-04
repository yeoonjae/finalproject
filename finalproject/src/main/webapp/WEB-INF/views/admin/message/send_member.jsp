<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
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
	        modal.modal();
	    })
	     $(".who").change(function(){
	    	 var local = $(".local-list");
	    	 var branch = $(".branch-list");
	    	 var select = $(this).val();
	    	 if(select==1){//전체 회원이면
	    		 axios({
	    			 url:"${pageContext.request.contextPath}/test/message/memberList",
	    			 method:"get"
	    		 }).then(function(response){
	    			 console.log(response.data);
	    			 var tag = "<tr><td colspan='3'>전체 회원</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
					 $(".receive-list-table").append(tag);
					 table.show();
					 $(".who").prop("disabled",true);
					 $(".remove-bnt").on("click",(function(){
				    		console.log("버튼눌림");
				    		$(this).parents("tr").remove();
				    		 $(".who").prop("disabled",false);
				    	}))
	    		 })
	    	 }
	    	 if(select==2){//전체 지점장
	    		 axios({
	    			 url:"${pageContext.request.contextPath}/test/message/branchAdmin",
	    			 method:"get"
	    		 }).then(function(response){
	    			 console.log(response.data);
	    			 var tag = "<tr><td colspan='3'>전체 지점장</td><td><button type='button' class='btn btn-outline-secondary remove-bnt'>삭제</button></td></tr>";
					 $(".receive-list-table").append(tag);
					 table.show();
					 $(".who").prop("disabled",true);
					 $(".remove-bnt").on("click",(function(){
				    		$(this).parents("tr").remove();
				    		$(".who").prop("disabled",false);
				    	}))
	    		 })
	    	 }
	    	if(select==3){//지점장 선택을 했을 경우
	    		 //지역 비동기로 불러오기
	    		 axios({
	            		url:"${pageContext.request.contextPath}/test/message/localList",
	            		method : "get"
	            	}).then(function(response){
            			var local = $(".local-list");
	            		$.each(response.data,function(i){
	            			$("<option>").attr("value",response.data[i].local_no).text(response.data[i].local_name).appendTo(local);
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
	            			$.each(response.data,function(i){
	            				$("<option>").attr("value",response.data[i].admin_no).text(response.data[i].branch_name).appendTo(branch);
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
	            			var tag = "<tr><td>"+response.data.branch_name+
				            			"</td><td>"+response.data.admin_auth+
				            			"</td><td>"+response.data.admin_name+
				            			"</td><td><button class='btn btn-outline-secondary remove-bnt' type='button'>삭제</button></td></tr>";
				            			
	            			table.append(tag);
	            			table.show();
	            			
					    	$(".remove-bnt").on("click",(function(){
					    		$(this).parents("tr").remove();
					    	}))
	            		})
	            	});
	            	
	    	 }else{
	    		 console.log("1");
	    	 }
	     })});
	    
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
						<table class="table">
							<thead>
								<tr>
									<th>보낸사람</th>
									<th>제목</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
							</tbody>
						</table>
						</p>
					</div>
					<div class="tab-pane fade" id="profile">
						<br>
						<p>
						<table class="table">
							<thead>
								<tr>
									<th>보낸사람</th>
									<th>제목</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
								<tr>
									<td>정연재</td>
									<td>안녕</td>
									<td>2020-07-28</td>
								</tr>
							</tbody>
						</table>
						</p>
					</div>
					<div class="tab-pane fade show active send-form" id="send-mail">
						<br>
						
						<form action="send_member">
							<fieldset>
								<div class="form-group">
									<label for="exampleInputEmail1">보내는 사람</label> 
									<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="dkdlek1237@naver.com">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">받는 사람</label> 
									<input type="email" class="form-control receive" id="exampleInputEmail1">
								</div>
								<div class="form-group">
									<label for="exampleSelect1">제목</label> 
									<input type="text" class="form-control" id="exampleInputEmail1">
								</div>
								<div class="form-group">
									<label for="exampleTextarea">쪽지 내용</label>
									<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
								</div>
								<button type="submit" class="btn btn-outline-secondary btn-block">쪽지 보내기</button>
								
								<!-- 모달 -->
								<div class="modal modal-main">
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
											          <option selected="">받는 사람 선택</option>
											          <option value="1">전체 회원</option>
											          <option value="2">전체 지점장</option>
											          <option value="3">지점장 검색</option>
											        </select>
											        <select class="local-list custom-select" name="loacl_no">
											        	<option value="">지역 검색</option>
											        </select>
											        <select class="branch-list custom-select" name="branch_no">
											        	<option value="">지점 검색</option>
											        </select>
											        <hr>
											        <table class="table receive-list-table">
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
												<button type="button" class="btn btn-primary">Save changes</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
	
							</fieldset>
								
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>