<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	<style>
		.inbox-tr:hover {
			cursor: pointer;
			background-color: lightgray;
		}
		
		.modal-backdrop {
			z-index: -1;
		}
		
		.btn {
		  display: inline-block;
		  font-weight: 400;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: middle;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  border: 1px solid transparent;
		  padding: 0.375rem 0.75rem;
		  font-size: 1rem;
		  line-height: 1.5;
		  border-radius: 0.25rem;
		  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}
		
		.form-control {
			width: 160px;
			float: right;
			height: 30px;
		}
		
		.head_title {
			margin-top:65px;
			padding-bottom: 0px;
		}
		.main_service {
			height: 800px;
			padding-top: 120px;
		}
		.roomy-100{
			padding-top: 120px;
			padding-bottom: 0;
		}
		.review-wrap{
			margin-bottom: 180px;
		}
		.modal-content{
			height: 380px;
		}
		.btn{
			margin-top: 20px;
		}
		.button-noline{
			border: 0;
			outline: 0;
			background-color: rgba(47,138,241,0);
		}
		.table-review{
			text-align: center;
			border-bottom: 0;
		}
		label,p {
			font-size: 10px;
			margin-right: 25px;
		}
		.content-td{
			background-color: #DDD;
		}
		.table>tbody>tr>td{
			padding: 25px;
		}
		.textarea{
			text-align: left;
		}
	</style>
	<script>
	//페이징 처리
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="message?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
		$(function(){
			//글쓰기 버튼 클릭 시 모달 뜨게끔
			$(".review-write").click(function(){
				//이용권 결제 내역이 있는지 확인
				var member_no = $(".member_no").val();
				axios({
            		url:"${pageContext.request.contextPath}/test/review/license_check?member_no="+member_no,
            		method : "get"
            	}).then(function(response){
            		var data = response.data;
            		if(data.length==0){
            			alert("지점 이용 후 리뷰작성이 가능합니다.");
            		}else{
						$(".review-write-modal").modal('show');
            		}
            	})
			});
			
			//글 수정 버튼을 누를 시
			$(".edit-btn").click(function(){
				//for문 안에 있는 값들
				var title = $(this).parents(".content-tag").children(".title-tag").val();
				var no = $(this).parents(".content-tag").children(".no-tag").val();
				var content = $(this).parents(".content-tag").children(".content-div").text();
			
				//모달에 넣기
				$(".edit-title-modal").val(title);
				$(".edit-content-modal").val(content);
				$(".edit-no-modal").val(no);
				
				//수정 모달 띄우기
				$(".review-edit-modal").modal();
			});
			
			//review를 클릭할 시 내용이 보이게
			$(".review-show").click(function(){
				var reviewContent = $(this).next(".review-content");
				if(reviewContent.hasClass("hidden")){
					reviewContent.removeClass("hidden");
				}else{
					reviewContent.addClass("hidden");
				}
			});
			
			//삭제를 누를 시 삭제
			$(".delete-btn").click(function(){
				var review_no = $(this).parents(".content-tag").children(".no-tag").val();
				if(confirm('삭제하시겠습니까?')){
					console.log("삭제 하겠음");
					location.href = "${pageContext.request.contextPath}/member/review/delete?review_no="+review_no;
				}else{
					console.log("삭제안하겠음");
					event.preventDefault();
				}
			});
			
			//공감 버튼 누를 시 좋아요 올라감
			$(".smile-btn").click(function(){
				var review_no = $(this).parents(".content-tag").children(".no-tag").val();
				//회원이 누른적이 있는지 조회하는 비동기
				axios({
            		url:"${pageContext.request.contextPath}/test/review/check_overlap?review_no="+review_no,
            		method : "get"
            	}).then(function(response){
            		console.log(response.data);
					if(response.data == 0){
						axios({
		            		url:"${pageContext.request.contextPath}/test/review/like_regist?review_no="+review_no,
		            		method : "get"
		            	}).then(function(){
		            		alert("참여완료");
		            	})
					}else{
						alert("이미 참여했습니다.");
					}            		
            	})
			});
			
			//비공감 버튼 누를 시 좋아요 올라감
			$(".hate-btn").click(function(){
				var review_no = $(this).parents(".content-tag").children(".no-tag").val();
				//회원이 누른적이 있는지 조회하는 비동기
				axios({
            		url:"${pageContext.request.contextPath}/test/review/check_overlap?review_no="+review_no,
            		method : "get"
            	}).then(function(response){
            		console.log(response.data);
					if(response.data == 0){
						axios({
		            		url:"${pageContext.request.contextPath}/test/review/hate_regist?review_no="+review_no,
		            		method : "get"
		            	}).then(function(){
		            		alert("참여완료");
		            	})
					}else{
						alert("이미 참여했습니다.");
					}            		
            	})
				
			});
			
			//수정 폼 전송 이벤트(강사추가)
// 			$(".edit-form").submit(function(e){
// 				e.preventDefault();
				
// 				console.log(decodeURIComponent($(this).serialize()))
// 			});
		});
		
	</script>
<!--  여기서부터 섹션이 나뉨 -->
	<section>
		<div class="container">
			<div class="row">
				<div class="roomy-100">
					<div>
						<img src="${pageContext.request.contextPath}/resources/m/images/background/study2.jpg" width="100%" height="300px;">
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="service" class="service">
	<!--  여기서부터 섹션이 나뉨 -->
	<div class="container">
		<div class="row review-wrap">
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
				<div class="">	
				<div class="head_title text-center">
						<h2>리뷰</h2>
						<div class="separator_auto" style="width: 180px;"></div>
					</div>	
					<div class="">
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
					<table class="table table-review">
						<tbody class="body">
							<c:forEach var="list" items="${list}">
								<tr class="review-show">
									<td>
										<input type="hidden" class="member_no" value="${list.member_no}">
										<div style="font-weight: bold; text-align: left;">${list.review_title}</div><br>
										<span style="float: left; margin-right: 25px;">
										<fmt:parseDate value="${list.review_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
										 (${list.member_name})</span>
										 <p class="viewAgreeCount" style="float: right;">
										 	공감(${list.like_count}) 비공감(${list.hate_count})
										 </p>
										 <input type="hidden" class="for-count-review-no" value="${list.review_no}">
										 <input type="hidden" class="date-tag" value="${list.review_date}">
									</td>
								</tr>
								<tr class="review-content hidden">
									<td class="content-tag" style="background-color: #DDD;">
										<input type="hidden" class="title-tag" value="${list.review_title}">
										<input type="hidden" class="no-tag" value="${list.review_no}">
										<div class="content-div">${list.review_content}</div>
										<br><br>
										<c:choose>
											<c:when test="${list.member_no eq memberinfo.member_no}">
												<button class="btn btn-warning btn-sm edit-btn">수정</button>
												<button class="btn btn-danger btn-sm delete-btn">삭제</button>
											</c:when>
											<c:otherwise>
												<button class="button-noline smile-btn">
													<img id = "smile" src="${pageContext.request.contextPath}/resources/m/images/smileimg.png" width="24px" height="20px">
												</button>
												<label for="smile">공감</label>
												<button class="button-noline hate-btn">
													<img id="sad" src="${pageContext.request.contextPath}/resources/m/images/noagree.png" width="24px" height="20px">
												</button>
												<label for="sad">비공감</label>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<!-- 글쓰기 버튼  -->
								<td style="text-align: right;">
									<button class="btn btn-sm btn-danger review-write">
										리뷰쓰기
									</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- 리뷰작성 모달 -->
			<div class="modal review-write-modal" id="write-modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">리뷰작성</h5>
						</div>
						<form action="regist" method="post">
							<div class="modal-body">
								<input class="form-control" type="text" name="review_title" placeholder="리뷰 제목" style="width: 100%">
								<hr>
								<textarea class="form-control" id="exampleTextarea" rows="9" style="width: 100%" placeholder="내용" name="review_content"></textarea>
								<hr>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-danger review-regist" value="리뷰작성">
								<input type="button" class="btn btn-danger cancel-btn" data-dismiss="modal" value="취소">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 리뷰수정 모달 -->
			<form class="edit-form" action="edit" method="post">
			<div class="modal review-edit-modal" id="edit-modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">리뷰수정</h5>
						</div>
							<div class="modal-body">
								<input class="form-control edit-title-modal" type="text" name="review_title" style="width: 100%">
								<input type="hidden" name="review_no" class="edit-no-modal">
								<hr>
								<textarea class="form-control edit-content-modal" id="exampleTextarea" rows="9" style="width: 100%" name="review_content">
								</textarea>
								<hr>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-warning btn-sm edit-btn2" value="수정">
								<input type="button" class="btn btn-danger cancel-btn" data-dismiss="modal" value="취소">
							</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	</section>


<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>