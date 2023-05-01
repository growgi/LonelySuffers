<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Lonely Surfers-Carpool Main</title>
<link rel="stylesheet" href="resources/css/carpool/carpoolMain.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
.category:hover a{
	font-size: 1.1em;
	font-weight: 800;
}
</style>	
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
					style="padding-left: 120px; padding-bottom: 20px; padding-right: 140px;border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="carpoolMain.do">전체보기</a>
						</p>
					</div>
					<div class="col-md-2">
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="/driverPage.do?driverNo=${sessionScope.m.memberNo }">태워드려요</a>
								</p>
							</c:when>
							<c:otherwise>
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="#" onclick="alert('로그인하고 이용해주세요.');">태워드려요</a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-2">
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="/passengerPage.do?memberNo=${sessionScope.m.memberNo }">태워주세요</a>
								</p>
							</c:when>
							<c:otherwise>
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="#" onclick="alert('로그인하고 이용해주세요.');">태워주세요</a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="menu" style="float: right;">
						<h3 style="color: #1A5F7A; text-shadow: 0 0 2px #fff; font-weight: 900;">탑승자 페이지</h3>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section" style="padding: 20px 0 20px 0;">
			<div class="container" style="margin-top: 10px; margin-bottom: 10px;">
				<div class="row">
					<div class="wrapper" style="border-radius: 20px;">
						<div
							style="display: inline-block; width: 45%; font-size: 20px; font-weight: 900;"><span id="passengerName"></span>님, 탑승 신청하신
							카풀 목록입니다. </div>
						<div>
							<c:forEach items="${list}" var="c">
								<hr>
								<div class="wrapper"
									style="background-color: #FDE2F3; border-radius: 30px; width: 800px; margin: 0 auto;">
									<div class="head-info"
										style="text-align: center; background-color: #E5BEEC; padding: 10px; border-top-left-radius: 20px; border-top-right-radius: 20px;">
										<div class="main-info"><span style="font-weight:900;">${c.driverName }</span>님이 제공하는 카풀입니다. <br>
											${c.tripType }, ${c.departureDate }(${c.returnTimeRange }) <br>
											${c.departureRegion }(${c.departureDistrict}) → ${c.arrivalRegion }(${c.arrivalDistrict})<br>
											탑승인원/모집인원 : ${c.reserved }/${c.capacity }명 <br>
										</div>
									</div>
										<table
											style="border-collapse: initial; border: 1px solid #FDE2F3;  border-top: 0; padding: 15px; width: 100%;">
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">이름</th>
												<td>${c.driverName }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">성별</th>
												<td>${c.maleFemale }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">전화번호</th>
												<td>${c.driverPhone }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">이메일</th>
												<td>${c.driverEmail }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">요청사항</th>
												<td>${c.driverMsg }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">보드수납</th>
												<td>${c.boardRoomCapacity }</td>
											</tr>
											
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">수락상태</th>
												<td class="matchResultMsg">
												<c:forEach items="${c.passengerList }" var="p">
													${p.matchResult }
												</c:forEach>
												
												
												</td>
											</tr>
										</table>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<hr>
			</div>
			<!-- end row -->
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


	<script>
	//header에서 hidden된 input으로 가져온 값.
	$("#passengerName").text($("[name=memberName]").val());
		
	</script>
</body>
</html>