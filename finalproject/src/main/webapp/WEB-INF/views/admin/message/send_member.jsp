<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<style>
	.table{
		text-align: center;
	}
	.send-form{
		width:70%;
		margin: auto;
	}
</style>
<script>
	$(function(){
		$(".")
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
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#send-mail">쪽지 보내기</a>
				  </li>
				</ul>
				<div id="myTabContent" class="tab-content">
				  <div class="tab-pane fade" id="home">
				  <br>
				  	<p><table class="table">
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
				  <p><table class="table">
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
				  	
				  	<form action="send_member" >
					  <fieldset>
						   <div class="form-group">
						     <label for="exampleInputEmail1">보내는 사람</label>
						     <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="dkdlek1237@naver.com">
						   </div>
						   <div class="form-group">
						     <label for="exampleInputPassword1">받는 사람</label>
						     <input type="email" class="form-control" id="exampleInputEmail1">
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
						</fieldset>
						 <button class="btn btn-primary" 
                        data-toggle="modal" data-target="#test-modal">눌러라!</button>						
					</form>
            </div>
         </div>
      </div>
   </div>

		<div class="modal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Modal body text goes here.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary">Save changes</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>