<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>

<c:choose>
	<c:when test="${not empty memberinfo}">
		<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<div class="row col-xs-12">
	<!-- 지점 ul을 감싸는 영역 -->
	<div class="ul-wrapper">
		<!-- 하나의 지점을 감싸는 box -->
		<div class="box">
			<!-- 사진띄울 곳(left) -->
			<!-- 지점 정보(right) -->
				<table class="table">
					<tbody>
						<tr>
							<th class="table-th">${noticeDto.notice_title}</th>
						</tr>
						<tr>
							<td style="font-size: 15px;">${noticeDto.notice_content}</td>
						</tr>
					</tbody>
				</table>
			
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>