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
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>이 페이지의 제목을 적어주세요 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section">
			<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					class가 row인 div 바로 아래에 적힌 글입니다.<br> 부모 div의 class가
					container이므로<br> container의 너비인 1300px을 사용합니다. container의 너비인
					1300px을 사용합니다. container의 너비인 1300px을 사용합니다. container의 너비인 1300px을
					사용합니다. container의 너비인 1300px을 사용합니다.
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<section class="section">
			<!-- 클래스를 container가 아니라 container-fluid로 주시면, 좌우 여백 공간까지 전부 사용합니다. -->
			<div class="container-fluid">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					class가 row인 div이며 바로 아래에 적힌 글입니다.<br> 부모 div의 class가
					container-fluid이므로<br> container가 아니라 container-fluid이므로 좌우 여백
					없이 화면 너비 크기 전체를 사용합니다. container가 아니라 container-fluid이므로 좌우 여백 없이
					화면 너비 크기 전체를 사용합니다. container가 아니라 container-fluid이므로 좌우 여백 없이 화면
					너비 크기 전체를 사용합니다.
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<section class="section">
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="col-md-8">
						class가 row인 div 안에,<br> class가 "col-md-숫자"인 div를 만드시면,
						세로(column)로 분할할 수 있습니다. 지금 이 글이 적혀 있는 div는 Grid크기가 8입니다.<br>
						Grid 12가 최대입니다. 여기서 8을 썼으므로, 아직 왼쪽에 4만큼의 공간이 있습니다.<br> 자세한
						설명은 Bootstrap의 Grid system 설명문 <a
							href="https://getbootstrap.com/docs/3.4/css/#grid-options"
							target="_blank">https://getbootstrap.com/docs/3.4/css/</a>을 참조하시면
						됩니다.
					</div>
					<div class="col-md-2">여기는 class가 col-md-2이므로, Grid크기가 2입니다.
						Grid 8짜리보다 너비가 1/4입니다.</div>
					<div class="col-md-2">여기는 class가 col-md-2이므로, Grid크기가 2입니다.</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->






		<section class="section">
			<div class="container">


				<!-- section ＞  container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">


				<div class="row">
					<!-- 이 안에 구현하시면 됩니다. -->
					이 div의 위 아래로,<br> class가 row인 hr태그가 있어서 <b>위아래로 공백이 더 넓게</b>
					생긴 것입니다.
				</div>
				<!-- end row -->

				<!-- section ＞ container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">

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

</body>
</html>