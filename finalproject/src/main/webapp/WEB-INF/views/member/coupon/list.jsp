<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

	<style>
		.hover-line:hover {
			color: black;
			background-color: #f5f5f5;
		}
		.btn{
			radius:15%;
		}
		 .gray2{
			background-color:#f5f5f5;
		}
		.form-control{
			width: 160px;
			float: right;
			height: 30px;
		}
		.head_title{
			padding-bottom: 0px;		
		}
		.main_service{
			height: 800px;
			padding-top: 120px;
			text-align: center;
		}
		.table2 {
			text-align: center;
		    line-height: 3;
		    border-top: 1px solid #ddd;
		    margin: 10px;
		}
		 .gray2{
			background-color:#f5f5f5;
		}
		.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
			vertical-align: middle;
			text-align: center;
		}
	</style>
	<script>
		//페이징 처리
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="list?nowPage=${paging.nowPage}&cntPerPage="+sel;
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
		});		
	
	</script>
	<!--  여기서부터 섹션이 나뉨 -->
      <section id="" class="">
		<div class="container">
			<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
				<div class="main_service roomy-100">		
				<br>			
                   <div class="head_title text-center">
                      <h2>쿠폰함</h2>
                      <div class="separator_auto" style="width: 180px;"></div>
                   </div>
                   <br>
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
						<table class="table table2 table-hover">
							<thead class="gray2">
								<tr>
									<th>No</th>
									<th style="width: 60%">쿠폰명</th>
									<th>할인율</th>
									<th style="width: 25%">기간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
									<tr class="hover-line">
										<td>
											<p>${list.coupon_no}</p>
										</td>
										<td style="font-weight:bold;">${list.coupon_name}</td>
										<td style="color:gray;">${list.coupon_discount}%</td>
										<td>
											<p style="margin: 2px;">
												${list.coupon_start}
											</p>
											<p>
												~ ${list.coupon_finish}											
											</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br><br><br>
						<!-- 페이지네이션 -->
						<div style="display: block; text-align: center;">	
						<c:if test="${paging.startPage != 1 }">
								<a class="page-link" href="${pageContext.request.contextPath}/member/coupon/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
										<b class="page-link">${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
										<a class="page-link" href="${pageContext.request.contextPath}/member/coupon/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
								<a class="page-link" href="${pageContext.request.contextPath}/member/coupon/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
						</c:if>
						</div>
				</div>
			</div>
		</div>
	</div>
	</section>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>