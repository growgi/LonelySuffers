<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<link rel="stylesheet" href="resources/css/main.css">
<style>
	.container>.section-title h3{
		font-weight:600;
	}
	.section-title>hr{
		margin:0 auto;
		margin-bottom:30px;
	}
	.section-title>.card{
		margin-top: 50px;
	}
	.reservation-box .reservation-btn{
		display: inline-block;
		cursor: pointer;
		width: 350px;
		font-size: 30px;
		font-weight: 600;
		color: #fff;
		border: 2px solid #fff;
		border-radius: 500px;
		box-sizing: border-box;
		padding: 25px 25px 25px 25px;
		background-color: rgb(255, 255, 255,0.2);
	}
	.reservation-box .reservation-btn:hover{
		background-color: #ffffff;
		color: #3ac5c8;
		border: 2px solid #3ac5c8;
		box-shadow: 0 0 10px #3ac5c8;
	}
</style>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	

		<section class="section transheader homepage parallax" data-stellar-background-ratio="0.5" style="background-image: url('resources/images/surfer-cluster.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="font-weight:600; padding:6px 0px; font-family: 'Delicious Handrawn', cursive;">Lonely Surfers</h2>
						<p class="lead" style="font-size: 16px;">같이 서핑해요!</p>
						<c:if test="${not empty errorMsg}">
						    <script>
						        alert("${errorMsg}");
						    </script>
						</c:if>
						<div class="reservation-box">
							<c:choose>
								<c:when test="${not empty sessionScope.m }">
								<a href="/kiosk.do" class="reservation-btn">예약하기</a>
								</c:when>
								<c:when test="${empty sessionScope.m }">
								<a href="#" class="reservation-btn" onclick="alert('예약을 하려면 로그인이 필요합니다.');">예약하기</a>
								</c:when>
							</c:choose>
							
						</div>
						<!-- <form class="calculateform">
							<div class="item-box">
								<div class="item-top form-inline">
									<div class="form-group">
										<div class="input-group2">
											<span class="input-addon"> <i class="fa fa-link"></i>
											</span> <input type="url" class="form-control" id="urladres"
												name="url" placeholder="검색하세요">
										</div>
									</div>
									<input type="submit" name="send" value="Search"
										class="btn btn-default" />
								</div>
							</div>
						</form> -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		


		<section class="section nopad">
			<div class="container-fluid">
				<div class="row text-center">
					<div class="col-md-3 col-sm-6 nopad first">
						<a href="/company.do">
							<div class="home-service c1">
								<i class="material-symbols-outlined">grade</i>
								<p>WhatSurf 소개</p>
							</div>
						</a>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad">
						<a href="/selectLessonsByCondition.do?reqPage=1">
							<div class="home-service c2">
								<i class="material-symbols-outlined">surfing</i>
								<p>강습</p>
							</div>
						</a>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad">
						<a href="/selectHousesByCondition.do?reqPage=1">
							<div class="home-service c3">
								<i class="material-symbols-outlined">apartment</i>
								<p>숙박</p>
							</div>
						</a>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad last">
						<a href="/carpoolMain.do">
							<div class="home-service c4">
								<i class="material-symbols-outlined">directions_car</i>
								<p>카풀</p>
							</div>
						</a>
						<!-- end home-service -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		<section class="section overfree">
			<div class="icon-center">
				<i class="fa fa-anchor"></i>
			</div>
			<div class="section-title text-center">
				<h3 style="font-weight: 600;">일기예보</h3>
				<hr>
				<jsp:include page="/weatherAPI.jsp" />
			</div>
		</section>
		

		<section class="section lb overfree">
			<div class="container">
				<div class="row wow fadeIn">
					<div class="col-md-6">
						<div class="design-title">
							<small style="font-weight: bold;">WhatSurf</small>
							<h3 style="font-size:50px; font-weight: 600; margin-top: 5px;">Lonely Surfers</h3>
							<p class="lead" style="font-weight: 400">대한민국 서퍼들에게 <br>서핑과 숙소, 즐길거리를 제공하는 소셜 플랫폼</p>

							<p>Lonely Surfers는 서핑 초심자, 숙련자 모두 사용할 수 있는 <br>서퍼들을 위한 소셜 통합 플랫폼을 구성하고 있습니다.<br> 
								서핑을 사랑하는 사람들이 모여서 서핑, 파티 등을 함께 즐기며 <br>친목을 도모할 수 있는 연결고리를 만들어내는 것을 목적으로 하고 있습니다.</p>

							<a href="/company.do" class="btn btn-transparent">WhatSurf 소개</a>

						</div>
						<!-- end website-design -->
					</div>
					<!-- end col -->

					<div class="col-md-6">
						<div class="post-media">
							<img src="resources/upload/main/surf1.jpg" alt="" class="img-responsive">
						</div>
						<!-- end media -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
		</section>
		
		<section class="section overfree">
			<div class="container">
				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-img">
							<img src="resources/upload/main/surf5.jpg" alt=""
								class="img-responsive wow fadeInLeft">
						</div>
					</div>

					<div class="col-md-6">
						<div class="feature-widget">
							<h3 class="ex-bold">초급부터 고급까지 <br>서핑 강습</h3>
							<p>서핑은 자전거 배우기와 같아서<br> 한번만 제대로 배우면 어느정도 휴식기에 들어가더라도 <br>다음에 다시 충분히 즐길 수 있습니다.
								<br><br>타 지역, 타 서핑교육 샵에서 강습 받은 분은 <br>Lonely Surfers 강습의 Level을 확인하시고, <br>원하는 강습을 신청하면 됩니다.
							</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-widget">
							<h3 class="ex-bold">다양한 숙박 시설</h3>
							<p>치열했던 일상에서 쉼표가 필요한 당신에게
								<br>스트레스를 날려버릴 서핑과 함께 편히 쉴 수 있는 공간을 제공합니다.
								<br><br>원하는 지역의 숙박 시설들을 둘러보시고 선택해주세요.</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->

					<div class="col-md-6">
						<div class="feature-img">
							<img src="resources/upload/main/hotel3.jpg" alt=""
								class="img-responsive wow fadeInRight">
						</div>
					</div>
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-img">
							<img src="resources/upload/main/car3.jpg" alt=""
								class="img-responsive wow fadeInUp">
						</div>
					</div>

					<div class="col-md-6">
						<div class="feature-widget">
							<h3 class="ex-bold">쉽고 편리한 카풀 서비스</h3>
							<p>카풀이란 <br>자동차 운행을 공유하여 한 명 이상의 사람이 자동차를 타고 이동하며 다른 사람이 직접 운전해야 할 필요성을 없애주는 것입니다.
								<br><br>카풀은 한 대의 차량을 더 많이 사용하게 함으로써 <br>연료비, 통행료, 운전 스트레스 등 각 개인의 여행 비용을 줄여줍니다. 
								 카풀은 운행을 공유함으로써 대기 오염, 탄소 배출, 도로 교통 <br>혼잡, 주차 공간 필요성을 감소시키기 때문에 더 환경 친화적이고 <br>지속 가능한 운행 방법입니다.
							</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
		</section>

		<section class="section overfree">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.2s">
							<i class="material-symbols-outlined alignleft" style="font-size: 40px;">surfing</i>
							<h3 class="bold">Lesson</h3>
							<a href="/selectLessonsByCondition.do?reqPage=1" class="btn btn-transparent">강습 페이지로 이동</a>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.4s">
							<i class="material-symbols-outlined alignleft" style="font-size: 40px;">apartment</i>
							<h3>Lodgment</h3>
							<a href="/selectHousesByCondition.do?reqPage=1" class="btn btn-transparent">숙박 페이지로 이동</a>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.6s">
							<i class="material-symbols-outlined alignleft" style="font-size: 40px;">directions_car</i>
							<h3>Carpool</h3>
							<a href="/carpoolMain.do" class="btn btn-transparent">카풀 페이지로 이동</a>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<hr class="invis1">

		<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<h3>Lonely Products</h3>
					<hr>
					<p class="lead">Lonely Surfers 회원들이 인정한 높은 평점의 상품들</p>
				</div>
				<!-- end section-title -->

				<div class="row clientv2">
					<c:forEach items="${lessonList}" var="l">
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="client-box">
								<a href="/lessonView.do?lessonNo=${l.lessonNo}"><img src="resources/upload/lesson/${l.lessonInfoPic }" alt=""
									class="img-responsive" style="width:200px; height:150px;"></a>
							</div>
						</div>
						<!-- end col -->
					</c:forEach>
<!-- 					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="resources/upload/client_02.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					end col

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="resources/upload/client_08.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					end col

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="resources/upload/client_04.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					end col -->
				</div>
				<!-- end row -->

				<div class="product-name-lesson" style="text-align: center; padding: 20px 10px;"><div class="btn btn-transparent">강습</div></div>

				<br><br><br>

				<div class="row clientv2">
					<c:forEach items="${houseList}" var="h">
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="client-box">
								<a href="/houseView.do?houseNo=${h.houseNo}"><img src="resources/upload/house/${h.housePhoto1 }" alt=""
									class="img-responsive" style="width:200px; height:150px; opacity: 0.6; margin: auto;"></a>
							</div>
						</div>
						<!-- end col -->
					</c:forEach>
				</div>
				<div class="product-name-house" style="text-align: center; padding: 20px 10px;"><div class="btn btn-transparent">숙박</div></div>

			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<section class="section bt">
			<div class="container" style=" width:1200px;">
				<div class="section-title text-center">
					<h3>Lonely Review</h3>
					<hr>
					<p class="lead">Lonely Surfers 회원들의 솔직한 후기들</p>
				</div>
				<!-- end section-title -->
				<div class="row" style="overflow:hidden;">
					<c:forEach items="${reviewList }" var="r">
					<div class="col-md-4 col-sm-6 col-xs-12" style="float:left">
						<div class="testimonial-wrapper" style="width:350px; height:400px;">
							<div class="testimonial-box" style="height:250px;">
								<small>${r.reviewWriter }</small>
								<h4>${r.reviewTitle }</h4>
								<p class="lead">${r.reviewContent }</p>
							</div>
							<!-- end testimonial-box -->
							<div class="img-circle material-symbols-outlined" style="color:#bdbdbd; font-size:56px; margin:20px 20px 0px 20px;">account_circle</div>
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->
					</c:forEach>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<h3>Surf Gallery</h3>
					<hr>
				</div>
				<!-- end section-title -->

				<div class="owl-carousel owl-theme lightcasestudies withhover">
					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf7.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf7.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf2.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf2.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf10.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf10.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
					
					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf9.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf9.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf11.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf11.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="resources/upload/main/surf12.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="resources/upload/main/surf12.jpg" data-fancybox style="padding:5px;"><span class="material-symbols-outlined">zoom_in</span></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
				</div>
			</div>
		</section>


		<section class="section">
				<div class="row callout bgcolor" style="background: linear-gradient(60deg, #64b3f4 0%, #c2e59c 100%); width: 90%; margin: 0 auto;">
					<div class="col-md-9">
						<p style="font-size:40px; font-weight:500; padding:6px 0px; font-family: 'Delicious Handrawn', cursive;">WhatSurf</p>
					</div>
					<div class="col-md-3">
						<div class="text-right">
							<div class="btn btn-transparent btn-light btn-lg" onclick="window.scrollTo({top:0,left:0,behavior:'smooth'});">TOP</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/owl.carousel.js"></script>

</body>
<script>
	function slideOn(){
		const slide = $(".transheader");
    
	}

	slideOn();

</script>
</html>