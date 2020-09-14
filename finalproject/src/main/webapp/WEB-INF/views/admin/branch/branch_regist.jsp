<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
			$(".branch-name").on("blur",function(){
				var input = document.querySelector(".branch-name");
				var span = document.querySelector(".name-span");
				
				var name = input.value;
				if(!name){
					return;
				}
				
				axios({
					url: "${pageContext.request.contextPath}/test/branch/branch_name?branch_name="+name,
					method: "get"
				}).then(function(response){
					var data = response.data;
					if(!data){
						span.textContent = "사용 가능한 지점명입니다";
						$(".name-span").css("color","blue").css("font-size","small");
						$("input[type=submit]").prop("disabled",false);
					}else{
						span.textContent = "동일한 지점명이 있습니다";
						$(".name-span").css("color","red").css("font-size","small");
						$("input[type=submit]").prop("disabled",true);
					}
				})
			});
		});
</script>
<div id="content-wrapper">

	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/">지점관리</a></li>
			<li class="breadcrumb-item">지점등록</li>
		</ol>
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<br>
			<br>
			<form action="branch_regist" method="post" enctype="multipart/form-data">
				
					<fieldset>
						<legend>지점등록</legend><br>
						<div class="form-group">
							<label for="exampleInputEmail1">지점명</label> 
							<input type="text" class="form-control branch-name" placeholder="ex)당산 이레빌딩점" name="branch_name" required>
							<span class="name-span"></span>
						</div>
						<div class="form-group">
							<label for="exampleSelect1">지역선택</label> 
							<select class="form-control" id="exampleSelect1" name="local_no" required>
								<option value="">지역 선택</option>
								<c:forEach var="local" items="${local}">
									<option value="${local.local_no}">
										${local.local_name}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleSelect2">지점 관리자 선택</label> 
							<select class="form-control" id="exampleSelect2" required name="admin_no">
								<option value="">지점장 선택</option>
								<c:forEach var="admin" items="${admin}" >
									<option value="${admin.admin_no}">
										${admin.admin_name}
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
							<label for="exampleInputFile">사진 등록</label> 
							<input type="file" class="form-control-file" name="file" id="exampleInputFile" multiple accept=".jpg,.png,.gif">
						</div>
					</fieldset>
				<input class="btn col-sm-12 btn-outline-secondary btn-block" type="submit"
					value="지점 등록">
			</form>
		</div>
	</div>
	<br>
	<br>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>