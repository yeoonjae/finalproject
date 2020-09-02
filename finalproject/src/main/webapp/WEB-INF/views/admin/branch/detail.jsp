<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<div id="content-wrapper">
<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fabric@3.6.3/dist/fabric.js"></script>

	<style>
		.table{
			text-align: center;
			width: 60%;
			align-content: center;
		}
		.table-wrapper{
			text-align: center;
		}
   		#c{
            background-color: grey;
        }

	</style>
	<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">지점</a></li>
				<li class="breadcrumb-item active">상세보기</li>
			</ol>
			<div class="table-wrapper container-form offset-sm-3">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="table-active" scope="col" colspan="2">${branchDto.branch_name}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">지점번호</th>
						<td>${branchDto.branch_no}</td>
					</tr>
					<tr>
						<th scope="row">지역</th>
						<td>${branchDto.local_name}</td>
					</tr>
					<tr>
						<th scope="row">지점 관리자</th>
						<td>${branchDto.admin_name}</td>
					</tr>
					<tr>
						<th scope="row">평수</th>
						<td>${branchDto.branch_size} 평</td>
					</tr>
					<tr>
						<th scope="row">스터디룸 수</th>
						<td>${branchDto.branch_room_cnt} 룸</td>
					</tr>
					<tr>
						<th scope="row">개인석 좌석수</th>
						<td>${branchDto.branch_seat_cnt} 석</td>
					</tr>
					<tr>
						<th scope="row">사물함 수</th>
						<td>${branchDto.branch_locker_cnt} 개</td>
					</tr>
					<tr>
						<th scope="row" colspan="2">배치도</th>
					</tr>
					<tr>
						<th scope="row" colspan="2"><p><canvas id="c" width="650" height="400" class="disabled"></canvas></th>
					</tr>
					<tr>
						<th scope="row" colspan="2">
							<button class="btn col-sm-2 btn-outline-secondary">수정</button>
							<a href="${pageContext.request.contextPath}/admin/branch/layout_regist?branch_no=${branchDto.branch_no}">
								<button class="btn col-sm-2 btn-outline-secondary">배치도 등록</button>	
							</a>
							<button class="btn col-sm-2 btn-outline-secondary">지점삭제</button>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
        var canvas = new fabric.Canvas('c');
//         canvas.loadFromJSON('${branchDto.branch_layout}');

        canvas.loadFromJSON('${branchDto.branch_layout}');
        for(var i=0;i<${branchDto.branch_layout}.objects.length;i++){
        	canvas.item(i).selectable = false;	
        }
        console.log(${branchDto.branch_layout}.objects);
     </script>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>