<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Site Icons -->

<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="resources/images/apple-touch-icon.png">




<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,600,700" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Delicious+Handrawn&display=swap" rel="stylesheet">




<!-- 프레임워크에서 제공해준 CSS들은 임의 수정 금지 -->
<link rel="stylesheet" href="resources/css/font-awesome.css">         <!-- font awesome CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.css">            <!-- 부트스트랩 제공 CSS -->
<link rel="stylesheet" href="resources/css/animate.css">            <!-- 애니메이션 효과용 CSS -->
<link rel="stylesheet" href="resources/css/carousel.css">            <!-- 캐러셀용 CSS -->  

<!-- 사용자 CSS 파일들 -->
<link rel="stylesheet" href="resources/css/1_style.css">            <!-- 웹사이트 템플릿의 CSS -->
<!-- 사용자 CSS 파일들은 프레임워크 제공 CSS들보다 아래쪽에 있어야 합니다. -->




<!-- 화면 우측 하단 네비게이션 버튼 영역 시작 -->
<button onclick="scrollToTop()" id="toTopButton" style="background-color:white;"><img alt="gallery" src="/resources/images/up-arrow.png" style="width: 40px; height: 40px;"></button>
<!-- 화면 우측 하단 네비게이션 버튼 영역 끝 -->



<!-- 헤더 영역 시작. 화면이 스크롤되어도 항상 위에 따라다니는 것들 -->
<header class="header site-header">
   <div class="container">
      <nav class="navbar navbar-default yamm">
         <div class="container-fluid">
            <div class="navbar-header">



<!-- 모바일 디자인에서만 보이는 메뉴열기 버튼 -->
               <button type="button" class="navbar-toggle collapsed"
                  data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                  aria-controls="navbar">
                  <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
               </button>



<!-- 로고 영역 시작 -->
               <a class="navbar-brand" href="/main.do">
                  <div class="waveEffect">
                     <p class="waveEffectWord-back" style="font-family: 'Delicious Handrawn', cursive; !important; font-size:50px; ">Lonely Surfers</p>
                     <p class="waveEffectWord-front" style="font-family:'Delicious Handrawn', cursive; !important;  font-size:50px; ">Lonely Surfers</p>
                  </div>
               </a>
<!-- 로고 영역 끝 -->

            </div>



<!-- 상단 메뉴바  영역 시작 -->
            <div id="navbar" class="navbar-collapse collapse">
               <ul class="nav navbar-nav navbar-right">
                  <li class="active"><a href="/main.do"><img alt="main" src="/resources/images/home.png" style="width: 30px; height: 30px;">홈</a></li>
                  <li class="dropdown yamm-fw hasmenu" style="position:relative;"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  <img alt="main" src="/resources/images/surfersurfer.png" style="width: 30px; height: 30px;">
                  상품 <span class="fa fa-angle-down"></span></a>
                     <ul class="dropdown-menu" style="left:0;">
                        <li>
                           <div class="yamm-content">
                              <div class="row">
                                 <div class="col-md-1">
                                    <ul>
                                       <li><a href="service-01.html"></a></li>
                                       <li><a href="service-02.html"></a></li>
                                       <li><a href="service-03.html"></a></li>
                                    </ul>
                                 </div>
                                 <div class="col-md-4" >
                                    <ul>
                                    <li><a href="/wishList.do">관심상품</a></li>
                                       <li><a href="/selectLessonsByCondition.do?reqPage=1">강습 상품 검색</a></li>
                                       <li><a href="/selectHousesByCondition.do?reqPage=1">숙박 상품 검색</a></li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                        </li>
                     </ul></li>
                     <li>
                  </li>
                  <li>
                    <a href="/carpoolMain.do">
                      <img alt="main" src="/resources/images/carpool.png" style="width: 25px; height: 25px;">
                      <span style="line-height: 25px; vertical-align: middle;">카풀해요</span>
                    </a>
                  </li>
                  <li>
                    <a href="/faqListKind.do?categoryNo=1&reqPage=1">
                      <img alt="main" src="/resources/images/faq.png" style="width: 25px; height: 25px;">
                      <span style="line-height: 25px; vertical-align: middle;">FAQ</span>
                    </a>
                  </li>
                  <li>
                    <a href="/noticeList.do?reqPage=1">
                      <img alt="main" src="/resources/images/notification-bell.png" style="width: 25px; height: 25px;">
                      <span style="line-height: 25px; vertical-align: middle;">공지사항</span>
                    </a>
                  </li>
                  <c:choose>
                     <c:when test="${not empty sessionScope.m }">
                     <input type="hidden" class="hiddenMemberGrade" value="${sessionScope.m.memberGrade }">
                     <input type="hidden" name="memberName" value="${sessionScope.m.memberName }">
                     <c:choose>
                        <c:when test="${sessionScope.m.memberGrade ==1}">
                  <li>
                     <a href="/dashboard.do">
                     <span style="line-height: 25px; vertical-align: middle;">관리자페이지</span></a>
                  </li>                       
                        </c:when>
                        <c:otherwise>
                  <li>
                    <a href="/myPage.do?reqPage=1&tabNo=0">
                      <img alt="mypage" src="/resources/images/mypage.png" style="width: 25px; height: 25px;">
                      <span style="line-height: 25px; vertical-align: middle;">마이페이지</span>
                    </a>
                  </li>
                        </c:otherwise>
                     </c:choose>
                    
                  <li class="lastlink hidden-xs hidden-sm"><a class="btn btn-primary logout" style="padding-left:30px;"><input type="hidden" name="chatMemberId" value="${sessionScope.m.memberId }"> 로그아웃</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="lastlink hidden-xs hidden-sm"><a class="btn btn-primary" href="/loginFrm.do">
                        <img alt="login" src="/resources/images/login(1).png" style="width:25px; length:25px; margin-right:5px;">로그인</a></li>
                     </c:otherwise>
                  </c:choose>
                       
               </ul>
            </div>
<!-- 상단 메뉴바  영역 끝 -->


         </div>
         <!--/.container-fluid -->
      </nav>
      <!-- end nav -->
   </div>
   <!-- end container -->
   <script src="resources/js/jquery.min.js"></script>
   <script src="/resources/js/chat.js"></script>
</header>
<!-- 헤더 영역 끝 --> 