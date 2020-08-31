<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마일리지 유형 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<style>
		.detail_result {
			color: red;
			font-size: small;
		}
		.table {
			text-align: center;
		}
		.jumbotron {
			padding: 2rem 2rem;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>
        $(function(){
            $(".point_detail").on("input",function(){
                var input = document.querySelector(".point_detail");
                var span = document.querySelector(".detail_result");
                
                var detail = input.value;
                
                if(!detail){
                	span.textContent = "";
                    return;
                }
                
                axios({
                    url: "${pageContext.request.contextPath}/test/point/regist?point_detail="+detail,
                    method:"get"
                }).then(function(response){
                    if(!response.data){
                         span.textContent = "사용 가능한 유형입니다";
                     } else {
                         span.textContent = "동일한 유형이 존재합니다";
                     }
                });
            });
            
            $(".link").click(function(e){
            	if(confirm("정말 삭제하시겠습니까?")){
            	} else {
            		e.preventDefault();
            		location.href = "${pageContext.request.contextPath}/admin/point/regist";       		
            	}
            });
            
            $("#order").change(function(){
            	document.querySelector(".list-form").submit();
            });
        });
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="jumbotron">
            <h3 class="text-center">마일리지 유형 등록</h3>
        </div>
        <!-- 마일리지 유형 등록 -->
        <div class="row">
            <div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
                <form action="regist" method="post" class="form">
                	<!-- 마일리지 유형 선택 -->
                    <div class="form-group">
                        <label>유형선택</label>
                        <select name="point_type" class="form-control">
                            <option>적립</option>
                            <option>차감</option>
                        </select>
                    </div>
                    <!-- 마일리지 상세내용 작성 -->
                    <div class="form-group">
                        <label>상세내용</label>
                        <input type="text" name="point_detail" placeholder="상세내용을 입력하세요" class="form-control point_detail">
                        <span class="detail_result"></span>
                    </div>
                    <!-- 마일리지 점수 입력 -->
                    <div class="form-group">
                        <label>마일리지</label>
                        <input type="text" name="point_score" placeholder="마일리지를 입력하세요" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">등록</button>
                </form>
            </div>
        </div>
        <br><br>
        <!-- 마일리지 유형 목록 -->
        <div class="row">
		    <div class="offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			    <table class="table table-sm table-hover">
			    	<thead class="thead-light">
			    		<tr>
			    			<!-- 유형별 정렬 방법 선택 -->
			    			<th align="center">
			    				<form action="list" method="post" class="list-form">
				    				<select class="form-control col-10" name="point_type" id="order">
				    					<option value="all">전체</option>
			                            <option ${param.point_type=="적립"?'selected':''}>적립</option>
			                            <option ${param.point_type=="차감"?'selected':''}>차감</option>
			                		</select>
			    				</form>
							</th>
			    			<th>상세내용</th>
			    			<th>점수</th>
			    			<th>비고</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    	<c:forEach items="${list}" var="pointDto">
			    		<tr>
			    			<td>${pointDto.point_type}</td>
			    			<td>${pointDto.point_detail}</td>
			    			<td>${pointDto.point_score}</td>
			    			<td>
			    			<a href="edit/${pointDto.point_no}">
			    				<button class="btn btn-primary">수정</button>
			    			</a>
							<a class="link" href="delete/${pointDto.point_no}">
			    				<button class="btn btn-primary del">삭제</button>
							</a>
			    			</td>
			    		</tr>
			    	</c:forEach>
			    	</tbody>
			    </table>
			</div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>