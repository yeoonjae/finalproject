<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin.css" rel="stylesheet">

    <title>관리자 메인페이지</title>
    
  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="${pageContext.request.contextPath}/admin/">GONGDORI</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-primary" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <span class="badge badge-danger">9+</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
            <a class="dropdown-item" href="#">아안녕</a>
            <a class="dropdown-item" href="#">지녕</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-envelope fa-fw"></i>
            <span class="badge badge-danger">7</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#">Settings</a>
            <a class="dropdown-item" href="#">Activity Log</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>관리자</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">관리자 로그인 메뉴</h6>
            
         <c:set var="rootPath" value="${pageContext.request.contextPath}"></c:set>
	         	관리자 권한 : ${admininfo.admin_auth}
         <c:choose>  
         <c:when test="${admininfo.admin_auth eq '본사'}">
            		<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/logout">로그아웃</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/regist">계정등록</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/list">계정 리스트</a>         	 	
        </c:when>
		<c:when test="${admininfo.admin_auth eq '지점'}">
            		<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/logout">로그아웃</a>
            		<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/info?admin_no=${admininfo.admin_no}">계정정보/수정</a>
        </c:when>
		<c:otherwise>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/login">로그인</a>
					<a class="dropdown-item" href="#">비밀번호 찾기</a>	         	 		
		</c:otherwise>
        </c:choose>            
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="404.jsp">404 Page</a>
            <a class="dropdown-item" href="blank.jsp">Blank Page</a>
          </div>
        </li>        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>회원관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">회원 정보</h6>
            <a class="dropdown-item" href="#">전체 회원 보기</a>
            <a class="dropdown-item" href="#">회원 등록하기</a>
            <a class="dropdown-item" href="#">비밀번호 찾기</a>
            <div class="dropdown-divider"></div>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>지점관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">지점 관리</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/branch/local_regist">지역등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/branch/branch_regist">지점등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/branch/list">지점별 관리</a>
          </div>
        </li>        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>마일리지 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">유형 관리</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/point/regist">마일리지 등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/point/edit">마일리지 수정</a>
            <h6 class="dropdown-header">회원 관리</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/point/addRemove">마일리지 적립/소멸</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/point/his_list">마일리지 내역조회</a>
          </div>
        </li>
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>이용권관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">이용권관리 메뉴</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/license/license_regist">이용권 등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/license/license_list">이용권 수정/삭제</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="404.jsp">404 Page</a>
            <a class="dropdown-item" href="blank.jsp">Blank Page</a>
          </div>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>쿠폰 관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">본사 관리</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/regist">쿠폰 등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/edit">쿠폰 수정/삭제</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/list">목록 조회</a>
            <h6 class="dropdown-header">지점 관리</h6>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/request">쿠폰 등록 요청</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/req_edit">요청 수정/삭제</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/coupon/req_list">진행 목록</a>
          </div>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="charts.jsp">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tables.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
        </li>
      </ul>
