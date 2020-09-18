<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			radius: 15%;
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
	</style>
	<script>
		$(function(){
			$(".modal").modal();
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
					<table class="table">
						<tbody>
							<tr class="review-show">
								<td style="text-align: center;">지점장</td>
							</tr>
							<tr class="review-content hidden">
								<td>비밀얘기지롱~~~~~~~~</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<!-- 글쓰기 버튼  -->
								<td style="text-align: right;">
									<button class="btn btn-sm btn-outline-danger">
										리뷰쓰기
									</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- 모달 -->
			<div class="modal" id="inbox-modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">리뷰작성</h5>
						</div>
						<form action="djelfh" method="post">
							<div class="modal-body">
								<input class="form-control" type="text" name="review_title" placeholder="리뷰 제목" style="width: 100%">
								<hr>
								<textarea class="form-control" id="exampleTextarea" rows="9" style="width: 100%" placeholder="내용"></textarea>
								<hr>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-danger" value="리뷰작성">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>


<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>