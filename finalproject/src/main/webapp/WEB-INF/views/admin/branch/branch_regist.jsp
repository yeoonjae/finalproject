<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div id="content-wrapper">
	
		<div class="container-fluid">
	
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">지점등록</li>
			</ol>
	
			<br><br>
			<form action="branch_regist" method="post">
				지역선택 : <select name="local_no">
					<c:forEach var="local" items="${local}">
						<option value="${local.local_no}">
							${local.local_name}
						</option>
					</c:forEach>
				</select><br><br>
				지점명 : <input type="text" name="branch_name"><br><br>
				지점 관리자 : <select name="admin_no">
					<c:forEach var="admin" items="${admin}">
						<option value="${admin_no}">
							${admin.admin_name}
						</option>
					</c:forEach>
				</select>
				평수 : <input type="number" name="branch_size"><br><br>
				스터디룸 개수 : <input type="number" name="branch_room_cnt"><br><br>
				개인석 개수  : <input type="number" name="branch_seat_cnt"><br><br>
				사물함 개수 : <input type="number" name="branch_locker_cnt"><br><br>
				
				<input type="submit" value="지점 등록">
			</form>
		</div>
		<br><br>
		</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>