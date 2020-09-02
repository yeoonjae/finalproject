<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Tables</li>
          </ol>

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Data Table Example</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
	                      <th>지점명</th>
                      <th>지역</th>
                      <th>지점 관리자</th>
                      <th>평수</th>
                      <th>스터디룸 수</th>
                      <th>개인석 수</th>
                      <th>사물함 개수</th>
                      <th>배치도 등록 유무</th>
                      <th>관리메뉴</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>지점명</th>
                      <th>지역</th>
                      <th>지점 관리자</th>
                      <th>평수</th>
                      <th>스터디룸 수</th>
                      <th>개인석 수</th>
                      <th>사물함 개수</th>
                      <th>배치도 등록 유무</th>
                      <th>관리메뉴</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach var="branch" items="${branch}">
                  	<tr>
                  		<td>${branch.branch_name}</td>
                  		<td>${branch.local_no}</td>
                  		<td>${branch.admin_no}</td>
                  		<td>${branch.branch_size}</td>
                  		<td>${branch.branch_room_cnt}</td>
                  		<td>${branch.branch_seat_cnt}</td>
                  		<td>${branch.branch_locker_cnt}</td>
                  		<td>${branch.branch_layout}</td>
                  		<td>
                  			<button>회원보기</button>
                  			<a href="${pageContext.request.contextPath}/admin/branch/layout_regist"><button>배치도등록</button></a>
                  			<button>수정</button>
                  		</td>  
                  	</tr>
                  </c:forEach>
                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  	                  	<tr>
                		<td>부천 중동점</td>
                  		<td>경기</td>
                  		<td>정연재</td>
                  		<td>68평</td>
                  		<td>2 룸</td>
                  		<td>90석</td>
                  		<td>유</td>
                  		<td>등록전</td>
                  		<td>
                  			<button>회원보기</button>
                  			<button>배치도등록</button>
                  			<button>수정</button>
                  		</td>                  		
                  	</tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>

          <p class="small text-center text-muted my-5">
            <em>More table examples coming soon...</em>
          </p>

        </div>



<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>