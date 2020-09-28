<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${not empty memberinfo}">
		<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<style>
nav.navbar.bootsnav.no-background.white .attr-nav>ul>li>a, nav.navbar.bootsnav.navbar-transparent.white .attr-nav>ul>li>a,
	nav.navbar.bootsnav.navbar-transparent.white ul.nav>li>a, nav.navbar.bootsnav.no-background.white ul.nav>li>a
	{
	color: black !important;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<style>
.inbox-tr:hover {
	cursor: pointer;
	background-color: lightgray;
}
.modal-backdrop {
	z-index: -1;
}
.hanmin-control {
	color: brown;
	width: 160px;
	float: right;
	height: 30px;
}
.head_title {
	margin-top: 65px;
	padding-bottom: 0px;
}
.main_service {
	height: 800px;
	padding-top: 120px;
}
.roomy-100 {
	padding-top: 120px;
	padding-bottom: 0;
}
.modal-content {
	height: 380px;
}
.button-noline {
	border: 0;
	outline: 0;
	background-color: rgba(47, 138, 241, 0);
}
.table-review {
	text-align: center;
	border-bottom: 0;
}
label, p {
	font-size: 12px;
	margin-right: 25px;
}
.content-td {
	background-color: #DDD;
}
.table>tbody>tr>td {
	padding: 25px;
}
.textarea {
	text-align: left;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "list?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
<div class="container">
	<div class="row review-wrap">
		<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
			<div class="">
				<div class="head_title text-center">
					<h2>공지사항</h2>
					<div class="separator_auto" style="width: 180px;"></div>
				</div>
				<!-- 옵션선택 끝 -->
				<table class="table table-review">
					<tbody class="body">
							<tr class="review-show">
								<td>
									<div style="font-weight: bold;">
										${noticeDto.notice_title}
									</div>
								</td>
							</tr>
							<tr class="review-show" style="text-align: left;">
								<td>
									${noticeDto.notice_content}
								</td>
							</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				<div class="hanmin-control"><a href="list">목록</a></div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>