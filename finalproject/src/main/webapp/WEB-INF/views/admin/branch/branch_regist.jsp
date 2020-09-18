<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//우편번호 찾기 및 주소 입력 자바스크립트
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=branch_post]").value = data.zonecode;
                document.querySelector("input[name=branch_basic_addr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=branch_detail_addr]").focus();
            }
        }).open();
    }

	$(function() {
			//지점명이 사용가능한지 확인하는 비동기 
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
						
						<!-- 주소 입력 -->
						<div class="form-group">
							<label>주소 입력</label><br>
							<input type="number" class="form-control" id="branchPost" name="branch_post" placeholder="숫자만 적어주세요" required style="display: inline; width: 170px;">
							<input onclick="findAddress();" type="button" value="우편번호 찾기" style="display: inline;">
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="branch_basic_addr" placeholder="기본주소" required>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="branch_detail_addr" placeholder="상세주소" required>
						</div>
						
						<!-- 전화번호 입력 -->
						<div class="form-group">
							<label for="branchPhone">전화번호</label> 
							<input class="form-control" type="number" id="branchPhone" name="branch_phone" placeholder="숫자만 적어주세요" required>
						</div>
						
						<!-- 지점 내부 정보 입력 -->
						<div class="form-group">
							<label for="branchSize">평수</label> 
							<input type="number" class="form-control" id="branchSize" name="branch_size" placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="branchStudy">스터디룸 수</label> 
							<input type="number" class="form-control" id="branchStudy" name="branch_room_cnt" placeholder="숫자만 적어주세요" required>
						</div>
						<div class="form-group">
							<label for="branchSeat">개인석 좌석수</label> 
							<input type="number" class="form-control" id="branchSeat" name="branch_seat_cnt" placeholder="숫자만 적어주세요" required>
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
				<input class="btn col-sm-12 btn-outline-secondary btn-block" type="submit" value="지점 등록">
			</form>
		</div>
	</div>
	<br>
	<br>
</div>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>