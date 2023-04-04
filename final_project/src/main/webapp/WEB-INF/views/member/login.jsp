<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonly Suffers</title>
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
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
						<div class="main">
			<div class="content-top">
				<h1>Lonly Suffers</h1>
			</div>
			<div class="content-main">
				<div class="main-top">
					<form action="/login.do" method="post">
					<input type="text" name="memberId" id="memberId" required placeholder="아이디" ><br>
					<input type="password" name="memberPw" id="memberPw" required placeholder="비밀번호" ><br> 
					<input type="submit" value ="로그인">
					</form>
				</div>
			</div>
		</div>
		<div class="main-bottom">
				<a href="/findMemberId.do" id="findMemberId">아이디 찾기</a>
				<a href="/findMemberPw.do" id="findMemberPw">비밀번호 찾기</a>
				<a href="/joinMemberFrm.do" id="joinMember">회원가입</a>
			</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->






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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>