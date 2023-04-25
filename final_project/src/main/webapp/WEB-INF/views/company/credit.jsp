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
<title>후기 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<style>
.quotes {
	display: none;
	font-size: 64px;
	text-align: center;
}
</style>
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>후기</h2>
						<p class="lead"></p>
					</div>
				</div>
			</div>
		</section>

		<section class="section">
			<div class="container">
				<hr class="invis1">
				<div class="row">
  					<p class="quotes">- 후기 -</p>
  					<p class="quotes">술 한잔 마셨습니다...</p>
  					<p class="quotes">버그가 있을 수도 있습니다.</p>
  					<p class="quotes">하지만 론리서퍼스 하나는 기억해주세요.</p>
  					<p class="quotes">밤낮으로 고민하고 코딩했습니다...</p>
  					<p class="quotes">저희의 진심이 느껴지길 바랍니다.</p>
  					<p class="quotes">고맙습니다...</p>
  					<p class="quotes">- 론리서퍼스 드림- </p>
				</div><!-- end row -->
				<hr class="invis1">
			</div><!-- end container -->
		</section><!-- end section -->



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	<script type="text/javascript">
	$(document).ready(function(){
		var quotes = $(".quotes");
		var quoteIndex = -1;

		function showNextQuote() {
			++quoteIndex;
			if(quoteIndex < (quotes.length - 1)){
				quotes.eq(quoteIndex % quotes.length).fadeIn(1500).delay(500).fadeOut(1500, showNextQuote);
	    	}else{
	      		quotes.eq(quoteIndex).fadeIn(3000);
	    	}
	  	}

		showNextQuote();
	});
	</script>

</body>
</html>