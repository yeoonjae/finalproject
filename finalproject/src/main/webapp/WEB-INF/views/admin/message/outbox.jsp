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
	}
</style>
<script>
	//페이징 자바스크립트
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="outbox?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
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
		
		//현재페이지와 몇개씩 나오는지 받는 페이징 파라미터
		var nowPage = getUrlParameter('nowPage');
		var cntPerPage = getUrlParameter('cntPerPage');

		$(".outbox-tr").click(function(){
	    	$("#outbox-modal").modal('show');
	    	
	    	//삭제를 해도 해당 페이지가 뜨게끔 파라미터 첨부
			console.log("nowPage : "+nowPage+"cntPerPage : "+cntPerPage);
	    	$(".nowPage").attr("value",nowPage);
	    	$(".cntPerPage").attr("value",cntPerPage);
	    	
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
	    	
	    	$(".close-btn").click(function(){
	 		   location.reload();
	 	   })
	    });
	});
</script>
<div id="content-wrapper" style="padding-top: 60px;">
	<div class="container-fluid">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<c:choose>  
			        <c:when test="${admininfo.admin_auth eq '본사'}">
				     <ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active outbox-tab" href="${pageContext.request.contextPath}/admin/message/outbox">보낸 쪽지</a>
						</li>
						<li class="nav-item">
						<a class="nav-link send-mail-tab" href="${pageContext.request.contextPath}/admin/message/send">쪽지 보내기</a></li>
					</ul> 	 	
			        </c:when>
					<c:when test="${admininfo.admin_auth eq '지점'}">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link inbox-tab" href="${pageContext.request.contextPath}/admin/message/inbox">받은 쪽지 보기</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active outbox-tab" href="${pageContext.request.contextPath}/admin/message/outbox">보낸 쪽지</a>
						</li>
						<li class="nav-item">
						<a class="nav-link send-mail-tab"href="${pageContext.request.contextPath}/admin/message/send">쪽지 보내기</a></li>
					</ul>
			        </c:when>
        		</c:choose> 
				<div class="tab-content">
					<div class="outbox-tab">
					 <div class="cnt" >
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
					</div> <!-- 옵션선택 끝 -->
						<p>
						<!-- 발신함 -->
						<table class="table">
							<thead>
								<tr>
									<th style="width:50%;">제목</th>
									<th>받는사람</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="outbox" items="${outbox}">
								<tr class="outbox-tr">
									<td class="outbox-title-td" style="text-align: left;">
									${outbox.message_title}
										<input type="hidden" class="outbox-content-input" value="${outbox.message_content}">
										<c:choose>
											<c:when test="${admininfo.admin_auth eq '본사'}">
												<input type="hidden" class="outbox-no-input" value="${outbox.message_manager_no}">
											</c:when>
											<c:otherwise>
												<input type="hidden" class="outbox-no-input" value="${outbox.message_member_no}">
											</c:otherwise>
										</c:choose>
									</td>
									
									<td>
									<c:choose>
										<c:when test="${admininfo.admin_auth eq '본사'}">
											<c:choose>
												<c:when test="${outbox.admin_name eq '본사'}">
													전체 지점장
												</c:when>
												<c:otherwise>
													${outbox.admin_name}
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:when test="${admininfo.admin_auth eq '지점'}">
											<c:choose>
												<c:when test="${outbox.member_no eq '0'}">
													전체회원
												</c:when>
												<c:otherwise>
													${outbox.member_name}
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose>
									
									</td>
									<td class="outbox-date-td">
									<c:choose>
										<c:when test="${admininfo.admin_auth eq '본사'}">
											${outbox.message_manager_date}
										</c:when>
										<c:otherwise>
											${outbox.message_member_date}
										</c:otherwise>
									</c:choose>
									
									</td>
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
							            <div class="modal-body" style="height: 150px;">
							                <h6 class="modal-title outbox-content"></h6>  
							            </div>
							            <div class="modal-footer">
							            <form action="message_delete_outbox" method="post">
							                <input type="hidden" class="outbox-delete" name="message_manager_no">
							                <input type="hidden" class="nowPage" name="nowPage">
							                <input type="hidden" class="cntPerPage" name="cntPerPage">
							                <input type="submit" class="btn btn-outline-danger" value="삭제">
							            </form>
							                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
							            </div>
							       </div>
							 </div>
						</div>
						<!-- 페이지네이션 -->
						<div style="text-align: center;margin-bottom:50px;">	
						<c:if test="${paging.startPage != 1 }">
								<a href="${pageContext.request.contextPath}/admin/message/outbox?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
										<b >${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
										<a  href="${pageContext.request.contextPath}/admin/message/outbox?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
								<a  href="${pageContext.request.contextPath}/admin/message/outbox?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
						</c:if>
						</div>
						<br><br><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>