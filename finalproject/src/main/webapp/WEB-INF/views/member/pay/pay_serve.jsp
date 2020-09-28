<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<script
   src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- <link rel="stylesheet" -->
<!--    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!--    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!--    crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>


<script>
   $(function() {
	   
      //마일리지 금액 입력 시
      $(".use_point").on("input", function() {
            var totalPrice = $('.over-price').text(); // 결제할 금액
            var use_point = parseInt($(this).val()); // 입력 마일리지 값 읽어오기 
            
            var salePrice = parseInt(totalPrice) - use_point;
            
            var member_point = $(".use_all_point").data().point; //회원 보유 마일리지 값 
            var member_point2 = parseInt(member_point).toLocaleString(); //소수점 찍기
            
            $(".use_point").text(use_point); // 마일리지 할인 금액에 해당 값 설정
            $(".total_price").text(salePrice); // 최종 결제 금액에 할인금액 설정
    	  
            if(use_point > parseInt(member_point)){ // 입력 마일리지 > 보유 마일리지
               var use_point = 0;
               $(".use_point").val("");
               $(".use_point").text("");
               $(".total_price").text(totalPrice);
               
               alert("사용 가능 마일리지는 " + member_point2 + "P 입니다.");
            }
            
            if(use_point > totalPrice){ // 입력 마일리지 > 결제금액일 경우
               use_point = 0;
               $(".use_point").val("");
               $(".use_point").text("");
               $(".total_price").text(totalPrice);
               
               alert("마일리지는 총 결제금액을 초과하여 사용할 수 없습니다.");
            }
            
            if(isNaN(use_point)){
                use_point = 0;
                $(".use_point").val("");
                $(".use_point").text("");

                $(".total_price").text(totalPrice);
             }

            totalPrice = salePrice;
            
            // 카카오페이에 최종 결제금액+최종 할인금액 전송
            $(".total_amount").val(totalPrice);
            $(".sale_price").val(use_point);
            
      });

      // 마일리지 전액 사용 버튼 선택  
      $(".use_all_point").click(function() {
            
            // 총 결제금액 계산  
            var totalPrice = $('.over-price').text(); // 결제할 금액
            var point = $(this).data().point;
            
            // 적립금이 총 결제금액보다 많을 경우 
            if (totalPrice < point) {
               $(".use_point").val(totalPrice);
               $(".use_point").text(totalPrice);

               point = totalPrice;
               totalPrice = totalPrice - point;
            } 
            else { 
               $(".use_point").val(point);
               $(".use_point").text(point);

               totalPrice = totalPrice - point;
            }
            
            $(".total_price").text(totalPrice);

            // 카카오페이에 최종 결제금액 전송
            $(".total_amount").val(totalPrice);
            $(".sale_price").val(point);
      });      

   });

</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container {
   font-family: 'Noto Sans KR';
}

.normal{
   font-size:13px;  
   color:#4f4d48;
}

.red{
   color:red; 
}
.bold {
   font-weight: bold;
}
.date{
   color:#a6a6a6;
}

.margin20{
   margin-left:20px; 
}
.padding10 {
   padding-left: 10%;
}

.padding7 {
   padding-left: 7%;
}

.padding5 {
   padding-top: 5%;
}

.padding3 {
   padding-top: 3%;
}

.float_right {
   float: right;
}

.float_left {
   float: left;
}

.detail {
   padding-left: 5%;
   padding-right: 5%; 
   padding-top: 5%;
   color: #4f4d48;
}

.pay_way {
   padding-top: 3%;
   padding-left: 5%;
}

.use_design {
   width: 45%; 
   height: 50px;
   border: 1px solid #ebebeb;
   font-size: 17px;
   margin-left:20px; 
}

.subContainer {
   box-sizing: border-box;
   width: 60%;
   height: auto;
   padding-top: 1%;
   padding-bottom: 2%;
}

.result {
   box-sizing: border-box;
   background-color: #f7f7f7;
   width: 28%;  
   padding-left: 4%;
   padding-right: 4%;  
   padding-top:2%;
   padding-bottom:1%;
   position:fixed; 
   right: 17%;  
   top:13%; 
}

.licenseContainer {
   width: 80%;
   height: 10px;
}

.couponContainer{
   width:100%;   
   height: 30px;
/*    border: 1px solid red; */
}

.coupon{
   text-align: left;
   width: 100%; 
   padding:3%;
   font-size: 17px;
}

.font14{
   font-size:15px;
}

.licenseTime {
   text-align: left;
   width: 40%;
   padding-top: 1%;
   padding-left:2%;
   font-size: 17px;
}
 
.licensePrice {
   text-align: left;
   width: 60%;
   padding-top: 1%;
   font-size: 17px;
}

.infoContainer {
   width: 100%;
   font-size: 17px;
}

.info {
   padding-left: 15%;
}

.resultContainer {
   width: 100%;
   background-color: #f7f7f7;
   padding: 10%;
}

.resultType {
   text-align: left;
   width: 45%;
   padding-bottom: 3%;
   color: #999999;
   font-size: 17px;
}

.resultPrice {
   text-align: right;
   width: 50%;
   padding-bottom: 3%;
}

.resultFont {
   font-size: large;
   font-weight: bold;
}

.total_price {
   color: red;
   font-size: 30px;
}

.width50 {
   width: 60%;
}
</style>


<main>
   <section>
      <div class="container">
         <div class="row">
            <div class="main_service roomy-100">
               <div>
                  <!--  총 결제금액  -->
                  <div class="result float_right">

                     <!-- 결제 내역 -->
                     <table class="resultContainer">
                        <tr>
                           <td class="resultType">결제 금액</td>
                           <td class="resultPrice">
                           <span class="resultFont price">${payServeDto.license_his_pay}원</span>
                           </td>
                        </tr>
                        <tr>
                           <td class="resultType">쿠폰 할인</td>
                           <td class="resultPrice">(-) 
                           <span class="resultFont coupon_total"></span> <span>원</span>
                           </td>
                        </tr>
                        <tr>
                           <td class="resultType">마일리지 사용</td>
                           <td class="resultPrice">(-) 
                           <span class="resultFont use_point"></span> <span>원</span>
                           </td>
                        </tr>
                        <tr>
                           <td class="resultType">최종 결제 금액</td>
                           <td class="resultPrice">
                           <span class="resultFont total_price">${payServeDto.license_his_pay}</span> 
                           <span style="color: red">원</span></td>
                        </tr>
                     </table>
                     <hr style="margin-top: 35px;">

                     <!--  결제 정보 입력 -->
                     <div>
                        <h4 class="bold">결제정보입력</h4>
                        <div class="detail">결제 수단을 선택하신 후 구매하기 버튼을 클릭하세요.</div>
                        <div class="pay_way">
                           <input type="checkbox" checked> <Label>카카오페이</Label>&nbsp;&nbsp;&nbsp;

                           <input type="checkbox"> <Label>무통장입금</Label>
                        </div>
                     </div>
                     <hr style="margin-bottom: 10px;">

                     <div align="right">
                        <form action="serve_prepare" method="post">
                           <input type="hidden" name="sale_price" class="sale_price"> <!--  사용한 마일리지  -->
                           <input type="hidden" name="total_amount" class="total_amount"><!-- 총 결제금액 -->
                           <input type="hidden" name="license_no" class="license_no" value="1">
                           <input type="submit" value="구매하기" class="btn btn-primary">
                        </form>
                     </div>

                  </div>

                     <!-- 이용권 구매정보 -->
                     <div class="subContainer">
                        <h4 class="bold">추가 결제 정보</h4>

                        <div class="padding5">
                           <table class="infoContainer">
                              <tr>
                                 <td>지점명</td>
                                 <td class="info bold"><span>|</span> <span>${payServeDto.branch_name}</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td>추가 시간</td>
                                 <td class="info"><span>|</span> <span class="over-time bold">${overTime}</span><span>분</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td>추가 금액</td>
                                 <td class="info"><span>|</span> <span class="over-price bold">${payServeDto.license_his_pay}</span><span>원</span>
                                 </td>
                              </tr>
                           </table>
                        </div>
                     </div>
                     <br>
                     <hr align="left" class="width50 align_left">
                     
                     <!-- 마일리지 및 쿠폰 사용 -->
                     <div class="subContainer">
                        <h4 class="bold">마일리지사용</h4>
                        
                        <!--  마일리지 사용  -->
                        <div>
                           <div class="padding3">
                              <input type="text" class="use_point use_design" placeholder="0원"> 
                              <span> 
                                 <input type="button" class="use_all_point btn btn-primary" data-point="${payServeDto.member_point}" value="전액 사용">
                              </span>
                           </div>
                           <div class="margin20">
                              (사용 가능 마일리지 : <span style="color: red"><fmt:formatNumber value="${payServeDto.member_point}" pattern="#,###" />P</span> )
                           </div>
                        </div>
                     </div>
                     <br>
                     <hr align="left" class="width50 align-left" style="margin-top: 35px;">
                  
                  
                  <!--End off row -->
               <!--End off container -->
               </div>
            </div>
         </div>
      </div>

   </section> 
   <!--End off Featured section-->   
</main>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>