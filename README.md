<h1 align="center"> SPATIUM (스터디카페 프로그램)📚</h1>

> 초심 스터디카페, PLAN A, 르하임 스터디카페를 참고하여 만든 스터디카페 프로그램입니다 

> 개발 기간 : 2020-08-22 ~ 2020-09-21

<a href="http://www.sysout.co.kr/spatium/member/">🎈SPATIUM 회원 바로가기</a>

<a href="http://www.sysout.co.kr/spatium/admin/">🎈SPATIUM 관리자 바로가기</a>

## 🗂 목차
 - 프로젝트 소개
 - 프로젝트 설계 및 계획
 - 주요 기능 설명
 - 외부 라이브러리
 - 버전 변경 사항
 - 마치며
 - 추가
 
 ## 🌒 프로젝트 소개
 <P>
 독서실과 카페의 장점을 결합한 모델로 카공족(카페에서 공부하는 사람들)이 보편화 되면서 공부를 목적으로 하는 스터디 카페의 수요가 지속적으로 증가하고 있습니다.</p>
 <p>
 24시간 운영하는 무인 키오스크를 이용해 결제 및 좌석배정하는 시스템이 어떻게 이루어졌는지 궁금증을 품게 되었고 이는 곧 스터디 카페 프로그램을 구축하게 되었습니다.
 </p>
 
 - 사용자는 편리하게 상품 구입 및 좌석 선택 등 스터디 카페를 이용할 수 있다.
 - 관리자는 사용자의 모든것을 관리할 수 있으며 전체관리자, 본사관리자로 나뉘어 있다.

 ## 🌓 프로젝트 설계 및 계획
 
 - <a href="https://ovenapp.io/view/sayLAzWlIwaEqqxweHVtoHEYTm0mh45G/nqQLc">초기 설계 화면</a>

    - 우리 프로젝트는 Java를 기반으로 만들어진 스터디카페 프로그램입니다. 아파치톰캣을 사용해 서버를 구축했습니다. 
    - 데이터베이스는 oracle을 사용했습니다.

    - 정연재, 김진영, 김혜정, 오한민 총 네명이 프로젝트를 진행하였습니다.

## 🌕 주요기능 설명

<img src="https://github.com/duswo5310/finalproject/blob/master/images/user_main.png" width="500px">&nbsp;
<img src="https://github.com/duswo5310/finalproject/blob/master/images/chat.png" width="200px">

- 메인페이지

> 로그인을 한 사용자는 해당 지점의 남은 좌석 개수와 충전된 남은 시간을 확인할 수 있습니다. 

> 메인페이지의 우측 하단 곰돌이 모양을 누르면 오른쪽 사진과 같이 챗봇기능을 볼 수 있습니다.

> 잔여시간의 <충전하기>를 누르거나 위측 상단메뉴의 <상품충전>을 누르면 상품 구입창으로 넘어갑니다.

> 우측 상단의 <개인석>을 누르면 충전시간이 있을경우 바로 좌석 선택창으로 넘어가며, 충전시간이 없을 경우 상품결제창으로 넘어갑니다.

> 우측 상단의 <리뷰>를 누르면 해당지점의 리뷰목록으로 이동합니다.

<img src="https://github.com/duswo5310/finalproject/blob/master/images/user_review.png" width="400px">&nbsp;
<img src="https://github.com/duswo5310/finalproject/blob/master/images/review_regist.png" width="400px">

- 회원 리뷰 창

> 회원이 리뷰 창으로 들어갈 경우 해당 지점에 등록되어 있는 리뷰제목들을 볼 수 있습니다.

> 리뷰를 누를 시 상세보기를 볼 수 있으며 내가 작성한 글은 수정/삭제 할 수 있습니다.

> 내가 작성한 글이 아닐 경우에 😊/😡(공감/비공감)으로 참여가 가능합니다. (중복은 불가 / 공감 또는 비공감 중에 하나만 선택 가능)

> 리뷰작성이 가능하며 리뷰 작성은 이용권을 구매한 회원의 한해서만 작성이 가능합니다.
