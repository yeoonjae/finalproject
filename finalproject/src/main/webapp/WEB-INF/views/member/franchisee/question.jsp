<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

	<style>
		.inbox-tr:hover{
			cursor: pointer;
			background-color: lightgray;
		}
		.modal-backdrop{
			z-index: -1;
		}
		.btn{
			radius:15%;
		}
		.form-control{
			width: 160px;
			float: right;
			height: 30px;
		}
		.head_title{
			padding-bottom: 0px;		
		}
		.main_service{
			height: 800px;
			padding-top: 120px;
		}
	</style>
	<!--  여기서부터 섹션이 나뉨 -->
      <section id="" class="">
		<div class="container">
			<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
				<div class="main_service roomy-100">					
                   <div class="head_title text-center" style="margin-top: 120px;">
                      <h2>가맹문의</h2>
                      <div class="separator_auto" style="width: 180px;"></div>
                      <h2>010 - 4794 - 5310</h2>
                      <hr>
                      <h5>위의 번호로 문의 바랍니다.</h5>
                   </div>
				</div>
			</div>
		</div>
	</div>
	</section>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>