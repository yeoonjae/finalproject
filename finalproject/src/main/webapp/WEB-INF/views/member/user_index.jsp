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

<%-- <script src="${pageContext.request.contextPath}/resources/qr/jquery.min.js"></script> --%>

<script src="${pageContext.request.contextPath}/resources/qr/qrcode.js"></script>
<script>
   $(function(){
   
      // 모달창 띄우기
         $('#myModal').on('shown.bs.modal', function () {
              $('#myInput').focus()
         });

      //외출 버튼 클릭 시 
      $('#out').click(function() {
         document.getElementById("qrcode").innerText = "";
         // 큐알코드 생성
         var qrcode = new QRCode(document.getElementById("qrcode"), {
            text : "${sessionScope.memberinfo.member_no}",
            width : 110, //가로
            height : 110, //세로
            colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
            colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
            correctLevel : QRCode.CorrectLevel.H
         //qr코드 오류복원능력임 (L->M->Q->H)
         });
      });

         //퇴실 버튼 클릭 시 
         $('#end').click(function() {
            document.getElementById("qrcode").innerText = "";
            // 큐알코드 생성
            var qrcode = new QRCode(document.getElementById("qrcode"), {
               text : "${sessionScope.memberinfo.member_no}",
               width : 110, //가로 
               height : 110, //세로
               colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
               colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
               correctLevel : QRCode.CorrectLevel.H
            //qr코드 오류복원능력임 (L->M->Q->H)
            });   
      });

      // 챗봇 모달창 띄우기
      $('#myModal').on('shown.bs.modal', function() {
         $('#myInput').focus()
      });
      
      //챗봇 유형 선택
      $(".type1").click(chatbot);
      $(".type2").click(chatbot);
      $(".type3").click(chatbot);
      $(".type4").click(chatbot);
      $(".type5").click(chatbot);
      
      function chatbot(){
         var type_no = $(this).data().no;
         var chat_type = $(this).val();
         console.log(type_no);
         
         var str = '<div class="box my"><div class="innerBox"><div class="content">'
             +chat_type+
                  '</div></div></div>'
                  
         $(".chatList").append(str);
                  
         axios({
            url:"${pageContext.request.contextPath}/member/search?type_no="+type_no,
            method:"get"
         })
         .then(function(response){
            //console.log(response.data);      

            var box = document.createElement("div");
            box.classList.add("box");

            var imgBox = document.createElement("div");
            imgBox.classList.add("imgBox");
            
            var img = document.createElement('img');
            img.classList.add("chatimg");
            img.src = "${pageContext.request.contextPath}/resources/m/images/pp.png"; 
            box.appendChild(imgBox);
            imgBox.appendChild(img);
            
            var innerBox = document.createElement("div");
            innerBox.classList.add("innerBox");
            box.appendChild(innerBox);
            
            var name = document.createElement("div");
            name.classList.add("name");
            name = document.createTextNode('공도리봇');
            innerBox.appendChild(name);
            
            var content = document.createElement("div");
            content.classList.add("content");
            innerBox.appendChild(content);
            
            //서버에서 준 목록을 버튼으로 만들어서 출력
            for(var i=0; i < response.data.length; i++){
               
               var input = document.createElement("input");
               input.setAttribute("type","button");
               input.setAttribute("value",response.data[i].chat_q);
               input.setAttribute("class","btn btn-size");
               input.setAttribute("data-chat_no",response.data[i].chat_no);
               input.addEventListener("click",function(){
                  
                  var chat_no = $(this).data().chat_no;
                  var chat_q = $(this).val();
                  //console.log(chat_q);
                  var str = '<div class="box my"><div class="innerBox"><div class="content">'+chat_q+'</div></div></div>'                           
                  $(".chatList").append(str);
                     
                  axios({
                     url:"${pageContext.request.contextPath}/member/getDetail?chat_no="+chat_no,
                     method:"get"
                  }).then(function(response){
                     console.log(response.data[0].chat_a);
                     var chat_a = response.data[0].chat_a;

                     var box = document.createElement("div");
                     box.classList.add("box");

                     var imgBox = document.createElement("div");
                     imgBox.classList.add("imgBox");
                     
                     var img = document.createElement('img');
                     img.classList.add("chatimg");
                     img.src = "${pageContext.request.contextPath}/resources/m/images/pp.png"; 
                     box.appendChild(imgBox);
                     imgBox.appendChild(img);
                     
                     var innerBox = document.createElement("div");
                     innerBox.classList.add("innerBox");
                     box.appendChild(innerBox);
                     
                     var name = document.createElement("div");
                     name.classList.add("name");
                     name = document.createTextNode('공도리봇');
                     innerBox.appendChild(name);
                     
                     var content = document.createElement("div");
                     content.classList.add("content");
                     innerBox.appendChild(content);
                     content.textContent= chat_a;
                     
                     var chatList = document.querySelector(".chatList");
                     chatList.appendChild(box);
                     
                     var root = "${pageContext.request.contextPath}";

               });

            });
            content.appendChild(input);
            
            var chatList = document.querySelector(".chatList");
            chatList.appendChild(box);
            
            var root = "${pageContext.request.contextPath}";

         }
         
      });
      }
});
</script>
<style>
 *{
     box-sizing: border-box;
 }


.modal-backdrop {
   z-index:-1;
}

.start{
   background-color:#d1cab0; 
   height:auto;
}
.chatimg{
   width:30px;
   height:30px;
   border-radius: 50%;
}

.img{
   width:50px;
   height:50px;
   border-radius: 50%;
}

.box{
    display: flex;
    flex-direction: row;
    max-width: 70%;
   background-color:#d1cab0; 
   padding: 3%;
}

.box.my{
     margin-left: auto;
     flex-direction: row-reverse;
}
.content{
   background-color:white;
   height:auto;
   width:auto;
   padding:5%;
   border-radius: 0px 20px 20px 20px; 
}
.box.my .content{ 
   background-color:white;
   height:auto;
/*    text-align:right; */
   padding:5%;
   padding-left:7%;
   border-radius: 20px 20px 0px 20px;
}
/* .name{ */
/*    font-size:13px; */
/*    font-weight:bold; */
/*    color:black; */
/* /*    padding: 1%; */ */

/* } */

.box .my .imgBox{
    display: none;
}

.box .imgBox {
    width:50px;
}

.box.my .innerBox{
/*    width:200px; */
}
.box .innerBox{
     flex-grow: 0.3;  
}
.btn-size{
   width: 100%;
    margin-bottom: 5px;
}

.num{
   padding-top:5%;   
   font-size:16px;
   width:30%;      
} 

.use{
   padding-top:5%;   
   padding-left:20%; 
   font-size:16px;    
} 

.name{
   padding-left:2%;
   width:100%;  
   font-size:17px;  
}
table{
   text-align:center;
    width:90%;   
}

.margin{
   margin-left:7%;
}

.bold{
	font-weight:bold;
}

.float_l{
	 float:left; 
}

.width40{
	width:35%;
}

.width30{
	width:30%;
}

.width20{
	width:20%;
}
.width25{
	width:25%;
}

.width10{
	width:10%;
}
.left{
	text-align:left;
}

.noline{
         border: 0;
         outline: 0;
         background-color: rgba(47,138,241,0);
}
</style>

<section>
   <div class="container">
      <div class="row">
         <div class="roomy-100">
         
            <!--  user 메인 이미지  -->
            <div>
               <img
                  src="${pageContext.request.contextPath}/resources/m/images/background/study2.jpg"
                  width="100%" height="450px">
            </div>

            <br>
            <br>
 
   
            <!--  지점 좌석 정보  -->
            <div class="width40 float_l">
               <h6 class="name margin bold"> SPATIUM 혜정점 </h6>
               
               <div> 
                  <table class="bold"> 
                     <tr>
                        <td class="num">30/40</td>
                        <td class="num">0/1</td>
                        <td class="num">30/40</td>
                     </tr>
                     <tr>
                        <td class="num">개인석</td>
                        <td class="num">스터디룸</td>
                        <td class="num">사물함</td>
                     </tr>
                  </table>
               </div>        
            </div>
            
             

 <!--  지점 좌석 정보  -->
            <div class="width30 float_l">
               <h6 class="name margin bold"> 김혜정님의 잔여시간 <span><button class="btn">충전하기</button></span></h6> 
	          	<div class="use float_l">
	          		이용중인 상품이 없습니다. 
	          	</div>

            </div>        
   
          <!-- qr코드 생성 -->
            <div class=" float_l margin width20">
               <div>
                  <button type="button" id="out" class="btn">외출</button>
                  <button type="button" id="end" class="btn">퇴실</button>
               </div> 
               <br>
               <div id="qrcode"></div>
               <br>
            </div> 

            <!-- 챗봇 -->
            <div class="chatbox">
               <!-- Button trigger modal -->
               <button class="noline" data-toggle="modal" data-target="#myModal">
                <img class="img" src="${pageContext.request.contextPath}/resources/m/images/pp.png"></button>
               <!-- Modal -->
               <div class="modal" id="myModal" tabindex="-1" role="dialog"
                  aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                           <h4 class="modal-title" id="myModalLabel">공도리 챗봇</h4>
                           </div>
                           <!--  챗봇 시작하기 -->
                           <div class="modal-body">
                              <div class="start">                     
                                 <!-- 공도리봇 -->
                                 <div class="box">
                                    <!-- 이미지 박스 -->
                                    <div class="imgBox">
                                       <img class="chatimg" src="${pageContext.request.contextPath}/resources/m/images/pp.png">
                                    </div>   
                                    <!-- 내용 박스 -->
                                    <div class="innerBox">
                                       <div class="name">스파봇</div>
                                       <div class="content">
                                          	😊SPATIUM에 오신걸 환영합니다😊<br><br>
                                          저희 SPATIUM에 대하여 문의사항이 있으시다면 <br>
                                          스파봇을 이용해 주세요 ❕ ❗ <br><br>
                                          아래에서 원하시는 유형을 선택하시면<br>
                                          해당 유형의 답변을 확인하실 수 있답니당🧡<br><br>
                                          다들 스파티움과 함께 열공하고 <br>
                                          놀면서 돈벌어요🧡💛💚💙💜 <br><br>                              
                                          <input type="button" class="btn btn-size type1" value="결제 및 환불 관련" data-no="1">
                                          <input type="button" class="btn btn-size type2" value="예약 관련" data-no="2">
                                          <input type="button" class="btn btn-size type3" value="이용 관련" data-no="3">
                                          <input type="button" class="btn btn-size type4" value="쿠폰 관련" data-no="4">
                                          <input type="button" class="btn btn-size type4" value="마일리지 관련" data-no="5">
                                       </div>
                                       <br>
                                    </div>
                                 </div>   
                                 <div class="chatList">                                 
                                 </div>
                                 <!-- 나 -->
      <!--                             <div class="box my"> -->
      <!--                                 <div class="innerBox"> -->
      <!--                                     <div class="content"> -->
      <!--                                         결제 및 환불 관련  -->
      <!--                                     </div> -->
      <!--                                 </div>                                 -->
      <!--                             </div> -->
  
                              </div>
                           </div>
                           <div class="modal-footer">
                           <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>


         </div>
      </div>
   </div>
</section>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>