<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
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
	.form-control{
		width: 160px;
		float: right;
		height: 30px;
		font-size: 13px;
	}
	.cnt{
		margin-top: 15px;
		height: 30px;
		margin-bottom: 16px;
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
		//수신함 모달띄우기
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
	    	
	    	axios({
				url:"${pageContext.request.contextPath}/test/message/update?message_manager_no="+deleteInput,
				method:"get"
			})
			.then(function(response){
				
			})  
	    	
	    	$(".close-btn").click(function(){
	 		   location.reload();
	 	   })
	    	
	    	var admin_no = $(".admin_no").val();
	    	
	    });
	});
</script>
<div id="content-wrapper" style="padding-top: 60px;">
	<div class="container-fluid">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active inbox-tab" href="${pageContext.request.contextPath}/admin/message/inbox">받은 쪽지 보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link outbox-tab" href="${pageContext.request.contextPath}/admin/message/outbox">보낸 쪽지</a>
					</li>
					<li class="nav-item">
					<a class="nav-link send-mail-tab" href="${pageContext.request.contextPath}/admin/message/send">쪽지 보내기</a></li>
				</ul>
				<div class="tab-content">
					<div class="inbox-tab">
					<!-- 페이지의 쪽지 개수 -->
						<div class="cnt">
							<select id="cntPerPage" name="sel" onchange="selChange()" class="form-control">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
								<option value="15"
									<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
							</select>
							<br><br><br>
						</div>
						<!-- 수신함 -->
						<table class="table">
							<thead>
								<tr>
									<th style="width:50%;">제목</th>
									<th>보낸사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="inbox" items="${inbox}">
								<tr class="inbox-tr">
									<c:choose>
										<c:when test="${inbox.message_manager_read eq 0}">
											<td class="inbox-title-td" style="font-weight:bold; text-align: left;">${inbox.message_title}</td>
										</c:when>
										<c:otherwise>
											<td class="inbox-title-td" style="color:gray; text-align: left;">${inbox.message_title}</td>
										</c:otherwise>
									</c:choose>
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
							            <div class="modal-body" style="height: 150px;">
							                <h6 class="modal-title inbox-content"></h6>  
							            </div>
							            <div class="modal-footer">
							                <form action="message_delete_inbox" method="post">
								                <input type="hidden" class="inbox-delete" name="message_manager_no">
								                <input type="hidden" class="nowPage" name="nowPage">
							                	<input type="hidden" class="cntPerPage" name="cntPerPage">
								                <input type="submit" class="btn btn-outline-danger" value="삭제">
							            	</form>
							                <button type="button" class="btn btn-outline-danger close-btn" data-dismiss="modal">닫기</button>
							            </div>
							       </div>
							 </div>
						</div>
						<!-- 페이지네이션 -->
						<div style="text-align: center; margin-bottom:50px;">	
						<c:if test="${paging.startPage != 1 }">
								<a href="${pageContext.request.contextPath}/admin/message/inbox?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
										<b >${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
										<a  href="${pageContext.request.contextPath}/admin/message/inbox?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
								<a  href="${pageContext.request.contextPath}/admin/message/inbox?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>