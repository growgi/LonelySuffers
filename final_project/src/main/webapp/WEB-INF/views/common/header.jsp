<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">




<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,600,700" rel="stylesheet">




<!-- 프레임워크에서 제공해준 CSS들은 임의 수정 금지 -->
<link rel="stylesheet" href="css/font-awesome.css">			<!--  font awesome CSS -->
<link rel="stylesheet" href="css/bootstrap.css">			<!-- 부트스트랩 제공 CSS -->
<link rel="stylesheet" href="css/animate.css">				<!-- 애니메이션 효과용 CSS -->
<link rel="stylesheet" href="css/carousel.css">				<!-- 캐러셀용 CSS -->	

<!-- 사용자 CSS 파일들 -->
<link rel="stylesheet" href="css/1_style.css">				<!-- 웹사이트 템플릿의 CSS -->
<!-- 사용자 CSS 파일들은 프레임워크 제공 CSS들보다 아래쪽에 있어야 합니다. -->




<!-- 화면 우측 하단 네비게이션 버튼 영역 시작 -->
<button onclick="scrollToTop()" id="toTopButton">Λ</button>
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
					<a class="navbar-brand" href="/">
						<div class="waveEffect">
							<p class="waveEffectWord-back">물결치는글자</p>
							<p class="waveEffectWord-front">물결치는글자</p>
						</div>
					</a>
<!-- 로고 영역 끝 -->

				</div>



<!-- 상단 메뉴바  영역 시작 -->
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="index.html">Home</a></li>
						<li class="dropdown yamm-fw hasmenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">드롭다운메뉴 <span class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu">
								<li>
									<div class="yamm-content">
										<div class="row">
											<div class="col-md-4">
												<ul>
													<li><a href="service-01.html">SEO Consultants</a></li>
													<li><a href="service-02.html">SEO Audits</a></li>
													<li><a href="service-03.html">SEO Packages & Plans</a></li>
													<li><a href="service-04.html">Web Copywriting</a></li>
													<li><a href="service-05.html">SEO Copywriting</a></li>
													<li><a href="service-06.html">Keyword Research</a></li>
													<li><a href="service-07.html">SEO Strategy</a></li>
													<li><a href="service-08.html">Website Design</a></li>
													<li><a href="service-09.html">Link Building Services</a></li>
												</ul>
											</div>
											<div class="col-md-4">
												<ul>
													<li><a href="page-services.html">All Services</a></li>
													<li><a href="page-pricing.html">Pricing & Plans</a></li>
													<li><a href="page-clients.html">Our Clients</a></li>
													<li><a href="page-testimonials.html">Testimonials</a></li>
													<li><a href="page-ebooks.html">Free E-Books</a></li>
													<li><a href="page-seo-analysis.html">SEO Analysis</a></li>
													<li><a href="case-studies.html">Case Studies</a></li>
													<li><a href="gallery.jsp">갤러리</a></li>
													<li><a href="case-studies-single.html">Case Studies Single</a></li>
												</ul>
											</div>
											<div class="col-md-4">
												<ul>
													<li><a href="blog.html">Blog & News</a></li>
													<li><a href="productDetail.jsp">상품페이지</a></li>
													<li><a href="blog-single.html">Single Blog</a></li>
													<li><a href="page.html">Default Page</a></li>
													<li><a href="page-fullwidth.html">Fullwidth Page</a></li>
													<li><a href="page-contact.html">Contact us</a></li>
													<li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
													<li><a href="page-faqs.html">FAQ's Page</a></li>
													<li><a href="page-not-found.html">404 Not Found</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
							</ul>
							</li>
						<li><a href="page-about.html">What is SEO?</a></li>
						<li><a href="case-studies.html">Case Studies</a></li>
						<li><a href="blog.html">Blog</a></li>
						<li><a href="page-contact.html">Contact</a></li>
						<li><a href="page-contact.html">Contact</a></li>
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
							<li><a href="/myPage.do">마이페이지</a></li>
						<li class="lastlink hidden-xs hidden-sm"><a class="btn btn-primary" href="/logout.do"> 로그아웃</a></li>
							</c:when>
							<c:otherwise>
							<li class="lastlink hidden-xs hidden-sm"><a class="btn btn-primary" href="/loginFrm.do"> 로그인</a></li>
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
</header>
<!-- 헤더 영역 끝 -->