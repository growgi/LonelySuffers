<%@page import="kr.co.carpool.model.vo.Carpool"%>
<%@page import="kr.co.carpool.model.vo.Passenger"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운전자 페이지</title>
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
							<a href="driverPage.do">태워드려요</a>
						</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="passengerPage.do">태워주세요</a>
						</p>
					</div>
					<div class="menu" style="float: right;">
					<h3 style="color: #1A5F7A; text-shadow: 0 0 2px #fff; font-weight: 900;">운전자 페이지</h3>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
		
		<section class="section" style="padding: 20px 0 20px 0;">
			<div class="container" style="margin-top:10px; margin-bottom: 10px;">
				<div class="row" >
					<div class="headline"> 
						<div style="display:inline-block; width:45%; font-size:20px; font-weight:900;">태워주세요 신청을 보내온 회원들입니다.</div>
							<div class="">
							<c:forEach items="${list}" var="c">
							<hr>
							<div class="wrapper" style="background-color: #E5FDD1; border-radius:10px;">
								<div class="head-info">
									<h3>${c.departureDate } ${c.returnTimeRange }</h3>
									<p>모집인원 : ${c.capacity }명</p>
									<p>탑승인원  : ${c.reserved }명</p>
								</div>
								<c:forEach items="${c.passengerList }" var='p'>
								<div class="passenger-info">
									아이디 : ${p.passengerId }
								 	성별 : ${p.passengerMaFe }
								 	이름 : ${p.passengerName }
								 	전화번호 : ${p.passengerPhone }
								 	이메일 : ${p.passengerEmail }
								 	요청일 : ${p.requestDate }
								</div>
								<div class="passenger-mng">
									<div class="status">수락상태 :
										<c:choose>
											<c:when test="${p.matchStatus }==1">
												매칭을 거부하셨습니다.
											</c:when>
											<c:when test="${p.matchStatus }==2">
												매칭을 수락하셨습니다.
											</c:when>
											<c:otherwise>
												수락 혹은 거절을 선택해주세요.
											</c:otherwise>
										</c:choose>
									</div>
										<c:choose>
											<c:when test="${p.matchStatus }==1">
											 	
											</c:when>
											<c:when test="${p.matchStatus }==2">
												<button type="button" class="btn btn-warning changemind">수락취소</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-success accept">수락</button>
												<button type="button" class="btn btn-danger reject">거절</button>
											</c:otherwise>
										</c:choose>
							</div>
								</c:forEach>
								
								
								
								<div class="buttons">
									<button type="button" class="btn btn-lg btn-danger nomore" data-bs-toggle="popover" data-bs-title="확인해주세요." 
									data-bs-content="이 버튼을 누르면 해당 건은 마감처리되어 더 이상 신청을 받을 수 없습니다">마감</button>
									<button type="button" class="btn btn-lg btn-danger cancel" data-bs-toggle="popover" data-bs-title="확인해주세요." 
									data-bs-content="해당 건의 카풀을 취소하시면 탑승자들에게 탑승불가 알림이 가고 이 건은 사라집니다.">카풀취소</button>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					</div>
				<hr>
				
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
		
		
		
		
		
		
		
		
		
		
		
		
		
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