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
<title>갤러리 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section transheader withnormalheader parallax" data-stellar-background-ratio="0.5" style="background-image: url('resources/upload/bg_02.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>갤러리</h2>
						<p class="lead">필터링하기 버튼을 눌러서 애니메이션 효과를 보세요.</p>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<section class="section">
			<div class="container">
				<div class="case-top clearfix">
					<div class="pull-left hidden-xs">
						<p>총 24개의 결과 중 1–9</p>
					</div>
					<!-- end col -->

					<div class="pull-right">
						<div class="dropdown portfolio-filter">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								필터링하기 <span class="fa fa-angle-down"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a class="active" href="#" data-filter="*">전체보기</a></li>
								<li><a class="" href="#" data-filter=".cat1">분류1</a></li>
								<li><a class="" href="#" data-filter=".cat2">분류2</a></li>
								<li><a class="" href="#" data-filter=".cat3">분류3</a></li>
								<li><a class="" href="#" data-filter=".cat4">분류4</a></li>
							</ul>
						</div>
						<!-- end dropdown -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<div class="portfolio row lightcasestudies withhover">
					<div class="pitem item-w1 item-h1 cat1">
						<div class="case-box">
							<img src="resources/upload/case_04.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat2">
						<div class="case-box">
							<img src="resources/upload/case_05.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat3">
						<div class="case-box">
							<img src="resources/upload/case_06.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat4">
						<div class="case-box">
							<img src="resources/upload/case_07.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat1">
						<div class="case-box">
							<img src="resources/upload/case_08.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat2">
						<div class="case-box">
							<img src="resources/upload/case_09.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat3">
						<div class="case-box">
							<img src="resources/upload/case_01.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat4">
						<div class="case-box">
							<img src="resources/upload/case_02.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="pitem item-w1 item-h1 cat1">
						<div class="case-box">
							<img src="resources/upload/case_03.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<div class="pagination-wrapper text-center row">
					<ul class="pagination clearfix col-md-12">
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
				<!-- ne dpagi -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/masonry.js"></script>
	<script src="resources/js/gallery_04.js"></script>

</body>
</html>