<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탑승자 페이지</title>
</head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers-Carpool Main</title>
<link rel="stylesheet" href="resources/css/carpool/carpoolMain.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section transheader homepage parallax"
			style="background-image: url('resources/images/carpool/surftruck2.png'); opacity: 0.7">
			<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="title"
						style="padding-top: 100px; padding-left: 40px; color: #000;">
						<h2 style="color: black;">카풀</h2>
						<h3 style="color: black; font-weight: bold;">함께하면 더 즐거운 서핑!</h3>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<section class="section"
			style="padding-top: 50px; padding-bottom: 10px;">
			<div class="container">
				<div class="row"
					style="border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="carpoolMain.do">전체보기</a>
						</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="driverPage.do">함께가요</a>
						</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="passengerPage.do">태워주세요</a>
						</p>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	
	<script>
	
	
	</script>	
		</body>
</html>