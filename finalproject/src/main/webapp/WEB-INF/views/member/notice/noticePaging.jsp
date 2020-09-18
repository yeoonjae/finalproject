<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
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

.btn {
	radius: 15%;
}

.form-control {
	width: 160px;
	float: right;
	height: 30px;
}

.head_title {
	padding-bottom: 0px;
}

.main_service {
	height: 800px;
	padding-top: 120px;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "noticeList?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<!--  여기서부터 섹션이 나뉨 -->
<section id="" class="">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
				<div class="main_service roomy-100">
					<div class="head_title text-center">
						<h2>공지사항</h2>
						<div class="separator_auto" style="width: 180px;"></div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th style="width: 70%;">제목</th>
							</tr>
						</thead>
						<div id="outter">
							<div style="float: right;">
								<select id="cntPerPage" name="sel" onchange="selChange()">
									<option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
									<option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
									<option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
									<option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
								</select>
							</div>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr class="inbox-tr">
									<td class="inbox-title-td" style="color: gray;"><a
											href="content?notice_no=${list.notice_no}"> ${list.notice_title}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a href="/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>