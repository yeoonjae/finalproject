<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	$(function() {
		$("input[name=local_name]")
				.on(
						"input",
						function() {
							var input = document
									.querySelector("input[name=local_name]");
							var span = document.querySelector(".name-span");
							var name = input.value;
							if (!name) {
								return;
							}
							axios(
									{
										url : "${pageContext.request.contextPath}/test/branch/local_name?local_name="
												+ name,
										method : "get"
									}).then(
									function(response) {
										var data = response.data;
										if (!data) {
											span.textContent = "등록 가능한 지역입니다";
											$(".name-span")
													.css("color", "blue").css(
															"font-size",
															"small");$
											$("input[type=submit]").prop(
													"disabled", false);
										} else {
											span.textContent = "이미 등록된 지역입니다";
											$(".name-span").css("color", "red")
													.css("font-size", "small");
											$("input[type=submit]").prop(
													"disabled", true);
										}
									})
						});

		$(".delete")
				.click(
						function() {
							var hidden = $(this).next("input");
							var local_no = hidden.val();
							if (!local_no) {
								return;
							}
							axios(
									{
										url : "${pageContext.request.contextPath}/test/branch/local_check?local_no="
												+ local_no,
										method : "get"
									})
									.then(
											function(response) {
												console.log(response.data);
												if (response.data) {//response.data가 true면
													if (confirm('삭제하시겠습니까?')) {
														location.href = "${pageContext.request.contextPath}/admin/branch/local_delete?local_no="
																+ local_no;
													} else {
														this.preventDefault();
													}
												} else {
													alert('지점이 존재합니다. 지점을 먼저 삭제해주세요');
												}

											})
						});
	});
</script>

<div id="content-wrapper">

	<div class="container-fluid">
		<div class="row">
			<div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">지역등록</a></li>
					<li class="breadcrumb-item active">한글 2글자로 등록해주세요. ex)경기,충남,서울</li>
				</ol>

				<br> <br>

				<div>
					<form action="local_regist" method="post">
						<label>지역명</label> <input class="form-control" type="text"
							name="local_name"> <span class="name-span"></span> <br>
						<input class="btn col-sm-12 btn-outline-secondary" type="submit"
							value="지역등록"> <br> <br>
						<!-- 지역 목록  -->
						<h6>등록된 지역</h6>
						<div class="list breadcrumb">
							<ul class="nav nav-pills">


								<c:forEach var="localDto" items="${list}">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" data-toggle="dropdown"
										href="#" role="button" aria-haspopup="true"
										aria-expanded="false">${localDto.local_name}</a>
										<div class="dropdown-menu" style="">
											<!-- 						          <a class="dropdown-item delete" onclick="if(!confirm('삭제하시겠습니까?')){return false;}">삭제</a> -->
											<a class="dropdown-item delete">삭제</a> <input class="no"
												type="hidden" value="${localDto.local_no}">
										</div></li>
								</c:forEach>

							</ul>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>