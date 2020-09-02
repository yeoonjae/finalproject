<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>
<div id="content-wrapper">

	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">지점등록</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<br>
			<br>
			<form action="branch_regist" method="post">
				
					<fieldset>
						<legend>지점등록</legend><br>
						<div class="form-group">
							<label for="exampleInputEmail1">지점명</label> 
							<input type="text" class="form-control" placeholder="ex)당산 이레빌딩점" name="branch_name" required>
						</div>
						<div class="form-group">
							<label for="exampleSelect1">지역선택</label> 
							<select class="form-control" id="exampleSelect1" name="local_no">
								<c:forEach var="local" items="${local}">
									<option value="${local.local_no}">
										${local.local_name}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleSelect2">지점 관리자 선택</label> 
							<select class="form-control" id="exampleSelect2" required>
								<c:forEach var="local" items="${local}" >
									<option value="${local.local_no}">
										${local.local_name}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="branchSize">평수</label> 
							<input type="number" class="form-control" id="branchSize" name="branch_size" placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="branchStudy">스터디룸 수</label> <input
								type="number" class="form-control" id="branchStudy" name="branch_room_cnt"
								placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="branchSeat">개인석 좌석수</label> <input
								type="number" class="form-control" id="branchSeat" name="branch_seat_cnt"
								placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="branchLocker">사물함 수</label> <input
								type="number" class="form-control" id="branchLocker" name="branch_locker_cnt"
								placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="exampleInputFile">File input</label> <input
								type="file" class="form-control-file" id="exampleInputFile"
								aria-describedby="fileHelp"> <small id="fileHelp"
								class="form-text text-muted">This is some placeholder
								block-level help text for the above input. It's a bit lighter
								and easily wraps to a new line.</small>
						</div>
					</fieldset>
				<input class="btn col-sm-12 btn-outline-secondary" type="submit"
					value="지점 등록">
			</form>
		</div>
	</div>
	<br>
	<br>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>