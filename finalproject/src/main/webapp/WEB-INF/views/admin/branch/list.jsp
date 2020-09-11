<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">지점관리</a>
            </li>
            <li class="breadcrumb-item active">Tables</li>
          </ol>

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              	지점목록</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" id="dataTable"cellspacing="0" style="text-align: center;">
                  <thead>
                    <tr>
	                  <th>지점명</th>
                      <th>지역</th>
                      <th>지점 관리자</th>
                      <th>배치도 등록 유무</th>
                      <th>관리메뉴</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>지점명</th>
                      <th>지역</th>
                      <th>지점 관리자</th>
                      <th>배치도 등록 유무</th>
                      <th>관리메뉴</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach var="branch" items="${branch}">
                  	<tr>
                  		<td>${branch.branch_name}</td>
                  		<td>${branch.local_name}</td>
                  		<td>${branch.admin_name}</td>
                  		<td>
                  		<c:choose>
                  			<c:when test="${empty branch.branch_layout}">
                  				등록전
                  			</c:when>
                  			<c:otherwise>
                  				등록완료
                  			</c:otherwise>
                  		</c:choose>
                  		<td>
                  		<c:choose>
                  			<c:when test="${empty branch.branch_layout}">
			                  	<a href="${pageContext.request.contextPath}/admin/branch/layout_regist?branch_no=${branch.branch_no}">
			                  		<button class="btn btn-outline-secondary btn-sm">배치도등록</button>
			                  	</a>
			                  	<a href="${pageContext.request.contextPath}/admin/branch/member_list?branch_no=${branch.branch_no}">
	                  				<button class="btn btn-outline-secondary btn-sm">회원보기</button>
	                  			</a>
			                  	<a href="detail?branch_no=${branch.branch_no}">
				                	<button class="btn btn-outline-secondary btn-sm">상세보기</button>
			                  	</a>
                  			</c:when>
                  			<c:otherwise>
                  				<a href="${pageContext.request.contextPath}/admin/branch/member_list?branch_no=${branch.branch_no}">
	                  				<button class="btn btn-outline-secondary btn-sm">회원보기</button>
	                  			</a>
			                  	<input type="hidden" value="500" name="hi">
			                  	<a href="detail?branch_no=${branch.branch_no}">
				                	<button class="btn btn-outline-secondary btn-sm">상세보기</button>
			                  	</a>
                  			</c:otherwise>
                  		</c:choose>
	                  		
                  		</td>  
                  	</tr>
                  </c:forEach>
                  	
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>

          <p class="small text-center text-muted my-5">
            <em>More table examples coming soon...</em>
          </p>

        </div>



<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>