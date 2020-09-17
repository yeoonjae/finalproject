<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.box{
		overflow: hidden;
	    padding: 40px 50px;
	    border: 1px solid #ccc;
	    border-top: none;
	    border-top: 3px solid black;
	}
	.franchisee-list{
		float: right;
    	width: 59.44%;
	}
	.table-th{
		width: 81px;
		
	}
	.page-link {
		text-decoration: none;
		font-size: 23px;
	}
	.form-control{
		width: 280px;
		float: right;
	}
	.head_title {
		padding-bottom: 30px;
	}
	.main_service{
		padding-top: 80px;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
			<section id="hello" class="home bg-mega">
                <div class="overlay"></div>
                <div class="container" style="height: 400px;">
                    <div class="row">
                        <div class="main_home_3">
 							<div class="home_text">
                                <h1 class="text-white">지점 스토리</h1>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
            
            <section id="service" class="service">
                <div class="container">
                    <div class="row">
                        <div class="main_service roomy-100">
                            <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                                <div class="head_title text-center">
                                    <h2>공도리 스터디카페 지점 안내</h2>
                                    <div class="separator_auto" style="width: 400px;"></div>
                                </div>
                            </div>
							<div class="row col-xs-12">
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
							</div> <!-- 옵션선택 끝 -->
                            <!-- 전체 감싸는 영역 -->
							<div class="row col-xs-12">
								<!-- 지점 ul을 감싸는 영역 -->
								<br>
								<div class="ul-wrapper">
									<ul>
									<c:forEach var="branchList" items="${list}">
										<li>
											<!-- 하나의 지점을 감싸는 box -->
											<div class="box">
												<!-- 사진띄울 곳(left) -->
												<div style="float: left;">
													<c:choose>
														<c:when test="${not empty branchList.branch_img_no}">
															<img src="${pageContext.request.contextPath}/admin/branch/imagedownload_one/${branchList.branch_no}" style="height: 210px; width: 312px;">
														</c:when>
														<c:otherwise>
															<img src = "https://placeimg.com/312/210/animal">
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 지점 정보(right) -->
												<div class="franchisee-list">
													<h3 style="font-size: 23px;">${branchList.branch_name}</h3>
													 <table class="table">
						                            	<tbody>
						                            		<tr>
						                            			<th class="table-th">주소</th>
						                            			<td style="font-size: 15px;">[${branchList.local_name}] ${branchList.branch_basic_addr} ${branchList.branch_detail_addr}</td>
						                            		</tr>
						                            		<tr>
						                            			<th class="table-th">전화번호</th>
						                            			<td style="font-size: 15px;">${branchList.branch_phone}</td>
						                            		</tr>
						                            		<tr>
						                            			<th class="table-th">영업시간</th>
						                            			<td style="font-size: 15px;">24시간 영업</td>
						                            		</tr>
						                            	</tbody>
						                            </table>
						                            <div style="float: right;">
						                            	<a href="${pageContext.request.contextPath}/member/franchisee/detail?branch_no=${branchList.branch_no}">
						                            		<button class="btn btn-outline-secondary">매장정보 상세보기</button>
						                            	</a>
						                            </div>
												</div>
											</div>
											<br><br>
										</li>
									</c:forEach>
									</ul>
								</div>
								<!-- 페이지네이션 -->
								<div style="display: block; text-align: center;">	
								<c:if test="${paging.startPage != 1 }">
										<a class="page-link" href="${pageContext.request.contextPath}/member/franchisee/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
												<b class="page-link">${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
												<a class="page-link" href="${pageContext.request.contextPath}/member/franchisee/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
										<a class="page-link" href="${pageContext.request.contextPath}/member/franchisee/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
								</c:if>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>