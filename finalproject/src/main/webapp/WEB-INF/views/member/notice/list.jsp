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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/lightpick.css">
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
.hover-line:hover {
	color: black;
	background-color: #f5f5f5;
}

.btn {
	radius: 15%;
}

.gray2 {
	background-color: #f5f5f5;
}

.form-control {
	width: 160px;
	float: right;
}

.head_title {
	padding-bottom: 0px;
}

.main_service {
	height: 800px;
	padding-top: 120px;
}

.table2 {
	text-align: center;
	line-height: 3;
	border-top: 1px solid #ddd;
	margin: 0;
}

.gray2 {
	background-color: #f5f5f5;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	vertical-align: middle;
	text-align: center;
}

.btn-list, .btn-date {
	vertical-align: middle;
	text-align: center;
	font-size: small;
	width: 75px;
	height: 35px;
	padding: 0.5rem;
}

.start, .finish {
	width: 28%;
	height: 35px;
	display: inline-block;
}

.start, .finish {
	margin-left: 10px;
	margin-right: 10px;
}

.inline-wrap {
	text-align: center;
	display: inline-block;
}

.btn-list {
	margin-left: 15px;
}

.detail-result {
	color: silver;
	font-size: x-small;
	display: inline-block;
}

.his-type.red {
	color: #ab9c78;
	font-weight: 600;
}

.his-type {
	color: gray;
	font-weight: 600;
}

.target:hover>.his-score, .target:hover>.his-detail {
	font-weight: 600;
}

.fontD {
	font-family: '나눔바른고딕';
	font-size: 40px;
}

.bold {
	font-weight: bold;
}

.brown {
	color: #b59e79;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "list?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
<body>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<br>
					<br>
					<br>
					<div>
						<div class="fontD bold brown" style="margin-bottom: 10px;">공지사항</div>
					</div>
					<div class="">
						<select id="cntPerPage" name="sel" onchange="selChange()" class="form-control brown">
							<option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select> <br> <br> <br>
					</div>
					<!-- 옵션선택 끝 -->
					<table class="table table2 brown" width="auto">
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td>
										<div style="font-weight: bold; text-align: left;">
											<a href="content?notice_no=${list.notice_no}">${list.notice_title}</a>
										</div> <br>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
					<!-- 페이지네이션 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${pageContext.request.contextPath}/member/notice/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="${pageContext.request.contextPath}/member/notice/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="${pageContext.request.contextPath}/member/notice/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>