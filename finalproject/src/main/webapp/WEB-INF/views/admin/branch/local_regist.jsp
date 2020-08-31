<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="index.html">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">404 Error</li>
          </ol>

	<h1>지역등록 페이지</h1>
	<form action="local_regist" method="post">
		<input type="text" name="local_name">
		<input type="submit" value="지역등록">
	</form>
        </div>
        <!-- /.container-fluid -->
        
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>