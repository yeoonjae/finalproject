<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
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
<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fabric@3.6.3/dist/fabric.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<script>
		$(function(){
			$(".delete-img").click(function(){
				var branchImgNo = $(this).prev().val();
				if (confirm('해당 사진을 삭제하시겠습니까?')) {
					location.href = "${pageContext.request.contextPath}/admin/branch/deleteImg?branch_img_no="+ branchImgNo;
					location.reload();
				} else {
					this.preventDefault();
				}
			});
		});
	</script>
<div id="content-wrapper">
	<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">지점</a></li>
				<li class="breadcrumb-item active">상세보기</li>
			</ol>
			<div class="table-wrapper container-form offset-sm-3">
			<form action="edit" method="post" id="form" enctype="multipart/form-data">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="table-active" scope="col" colspan="2">${branchDto.branch_name}
							<input type="hidden" name="branch_name" value="${branchDto.branch_name}">
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">지점번호</th>
						<td><input type="hidden" name="branch_no" value="${branchDto.branch_no}">${branchDto.branch_no}</td>
					</tr>
					<tr>
						<th scope="row">지역</th>
						<td>
							<select class="form-control" id="exampleSelect1" name="local_no">
								<c:forEach var="local" items="${local}">
									<option value="${local.local_no}">
										${local.local_name}
									</option>
								</c:forEach>
							</select>
					</tr>
					<tr>
						<th scope="row">지점 관리자</th>
						<td>
							<input class="form-control disabled" type="text" value="${branchDto.admin_name}" readonly="readonly" required>
							<input type="hidden" name="admin_no" value="${branchDto.admin_no}">
						</td>
					</tr>
					<tr>
						<th scope="row">평수</th>
						<td><input class="form-control" type="text" name="branch_size" value="${branchDto.branch_size}"></td>
					</tr>
					<tr>
						<th scope="row">스터디룸 수</th>
						<td><input class="form-control" type="text" name="branch_room_cnt" value="${branchDto.branch_room_cnt}"></td>
					</tr>
					<tr>
						<th scope="row">개인석 좌석수</th>
						<td><input class="form-control" type="text" name="branch_seat_cnt" value="${branchDto.branch_seat_cnt}"></td>
					</tr>
					<tr>
						<th scope="row">사물함 수</th>
						<td><input class="form-control" type="text" name="branch_locker_cnt" value="${branchDto.branch_locker_cnt}"></td>
					</tr>
					<tr>
						<th colspan="2">사진</th>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;">
						<c:choose>
							<c:when test="${empty branchImg}">
								<h6>해당 지점에 사진이 없습니다. 등록해주세요</h6>
							</c:when>
							<c:otherwise>
								<c:forEach var="branchImg" items="${branchImg}">
										${branchImg.branch_img_name}(${branchImg.branch_img_size})
										<input type="hidden" class="branchImgNo" value="${branchImg.branch_img_no}">
<!-- 										<button type="button" class="btn btn-danger btn-sm viewImg" >사진보기</button> -->
										<button type="button" class="btn btn-danger btn-sm delete-img">삭제</button><br>
										
										<!-- 사진 모달 -->
										<div class="modal" id="inbox-modal">
											<div class="modal-dialog">
											       <div class="modal-content">
											            <div class="modal-body">
											                <h6 class="modal-title inbox-content"></h6>  
											            </div>
											            <div class="modal-footer">
											                <button type="button" class="btn btn-outline-danger close-btn" data-dismiss="modal">닫기</button>
											            </div>
											       </div>
											 </div>
										</div>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label for="exampleInputFile">사진 등록</label> 
							<input type="file" class="form-control-file" name="file" id="exampleInputFile" multiple accept=".jpg,.png,.gif">
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="2">배치도</th>
					</tr>
					<tr>
						<th scope="row" colspan="2">
							<input type="button"  class="btn btn-outline-secondary btn-sm" id="rect" value="사각형">	
							<input type="button" class="btn btn-outline-secondary btn-sm" id="noline" value="noline사각형">
							<input type="button" class="btn btn-outline-secondary btn-sm" id="circ" value="동그라미">
							<input type="button" class="btn btn-outline-secondary btn-sm" id="remove" value="지우기">
							<input type="button" class="btn btn-outline-secondary btn-sm" id="text" value="텍스트">
							<input type="text" id="text-input"><br>
							<input type="hidden" id="layout" name="branch_layout">
						</th>
					</tr>
					<tr>
						<th scope="row" colspan="2"><p><canvas id="c" width="650" height="400"></canvas></th>
					</tr>
					<tr>
						<th scope="row" colspan="2">
								<input type="submit" class="btn col-sm-2 btn-outline-secondary" id="edit" value="수정">
						</th>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</div>
<script>
        var canvas = new fabric.Canvas('c');
        	
        canvas.loadFromJSON('${branchDto.branch_layout}');

//         console.log(${branchDto.branch_layout}.objects);
        
        $("#rect").on("click", function(e) {
            rect = new fabric.Rect({
            left: 300,
            top: 40,
            width: 50,
            height: 50,    
            fill: 'antiquewhite',
            stroke: 'white',
            strokeWidth: 0.1,
                    });  
            canvas.add(rect);
        });
        $("#noline").on("click", function(e) {
            rect = new fabric.Rect({
            left: 300,
            top: 40,
            width: 50,
            height: 50,   
            fill: 'antiquewhite',
            stroke: 'white',
            strokeWidth: 0,
                    });  
            canvas.add(rect);
        });

        $("#circ").on("click", function(e) {
            rect = new fabric.Circle({
                left: 300,
                top: 40,
                radius: 50,     
                fill: 'transparent',
                stroke: 'white',
                strokeWidth: 3,
            });  
            canvas.add(rect);
        });

         $("#form").on("submit", function(e) {
          	e.preventDefault();//기본이벤트 방지 전송막고 추가작업수행
 			var layout = document.querySelector("#layout");
 			layout.value = JSON.stringify(canvas);	
 			this.submit();//this는 #form
         });

        $("#text").on("click", function(e) {
            var text = new fabric.Text($("#text-input").val(), {left: 100, top: 100 });
            text.set({
            	  fill: 'white'
            	});
            canvas.add(text);
            canvas.moveTo(text, 1);
        });
        
        $("#remove").on("click", function(e) {
            var obj = canvas.getActiveObject();
            canvas.remove(obj);
        });
        
</script>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>