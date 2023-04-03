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
<title>상품 페이지 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>숙박 상품</h2>
						<p class="lead">판매 중지 제품은 여기에 판매중지 설명을 대신 기입</p>
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
				<div class="row">
					<div class="col-md-5">
						<div>대표 사진 영역</div>
						<div>다중 사진 선택 칸</div>
					</div>
					<!-- end col -->



					<div class="col-md-7">
						<div>
							<p>(숙박소 이름)</p>
							<div class="row">
								<h1>(상품 제목)</h1>
								<h3>(가격) 원/1일</h3>
								<div class="col-md-9">
									<p>비성수기, 평일 기준</p>
								</div>
								<div class="col-md-3">
									<p style="text-align: left;">()인실</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									판매량 ()숫자
								</div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>주소지</p>
						</div>
						<div>
							<button>관심상품</button>
							<button>예약하기</button>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




<!-- 상품 정보 표시 시작 -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<ul class="nav navbar-nav navbar-left">
								<li>상품설명</li>
								<li>상품평</li>
								<li>상품문의</li>
							</ul>
						</div>
						<div class="row">상품 설명 div</div>
						<div class="row">상품 평 div</div>
						<div class="row">상품 문의 div</div>
					</div>
					<div class="col-md-3">
					광고 등 배너 영역 column
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->





		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>