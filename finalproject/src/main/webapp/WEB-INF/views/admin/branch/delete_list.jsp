<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
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
	                  <th>삭제된 지점명</th>
                      <th>삭제를 누른 본사 직원</th>
                      <th>삭제 진행일자</th>
                      <th>삭제 예정일자</th>
                      <th>상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="list" items="${list}">
	                  	<tr>
	                  		<td>${list.branch_name}</td>
	                  		<td>${list.admin_name}</td>
	                  		<td>${list.start_delete_date}</td>
	                  		<td>${list.finish_delete_date}</td>
	                  		<td>${list.delete_status }</td>
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
    