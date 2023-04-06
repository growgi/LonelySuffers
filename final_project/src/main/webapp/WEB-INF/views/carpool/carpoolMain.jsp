<%@page import="kr.co.carpool.model.vo.Carpool"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers-Carpool Main</title>
<link rel="stylesheet" href="css/carpool/carpoolMain.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- <script src="/src/main/webapp/js/carpoolMain.js"></script> -->
	<script src="js/jquery.tablesorter.min.js"></script>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section transheader homepage parallax"
			style="background-image: url('capool-img/surftruck2.png'); opacity: 0.7">
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
							<a href="mycarpool.do"></a>전체보기
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
					<div class="menu" style="float: right;">
						<a href="/carpoolOfferForm.do"> <span
							class="material-symbols-outlined edit">edit_note</span>
						</a> <span class="material-symbols-outlined filter"
							style="display: inline-block; width: 50px; height: 30px;">filter_alt</span>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<!--
		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container">
				<div class="row">
	<!-- <td>안에서 디자인은 얼마든지 div와 row로 나눠서 할 수 있지만 td는 건들이면안됨!!!.. -->
		<section class="section" id="carpoolList"
			style="padding-top: 0px; padding-bottom: 0px; margin-left: 80px;">
			<div class="container">
				<div class="row">
					<table id="carpoolTable" class="tablesorter"
						style="border-radius: 20px; width: 900px; margin-left: 70px; padding-left: 20px; padding-top: 25px; padding-bottom: 70px; background-color: none; border: 3px solid #39B5E0;">
						<thead>
							<tr>
								<th><span class="material-symbols-outlined departDate"
									id="departureDate-sort">arrow_upward</span>출발일</th>
								<th><span class="material-symbols-outlined writeDate"
									id="regDate-sort">arrow_upward</span>등록일</th>
								<th data-sort-method='none'></th>
								<th data-sort-method='none'></th>
								<th data-sort-method='none'></th>
								<th data-sort-method='none'></th>
								<th data-sort-method='none'></th>
							</tr>
						</thead>
						<tbody>
							<!-- 얘네들이 반복돼야해!! Carpool list all -->
							<c:forEach items="${list }" var="c">
								<tr style="cursor: pointer;" onclick="location.href=/carpoolRequest.do?${c.carpoolNo}">
									<td>${c.departureDate }</td>
									<td><span display="none">${c.regDate }</span></td>
									<td data-sort-method='none'>
											<div class="row">${c.tripType }</div>
											<div class="row">${c.departureRegion }</div>
											<div class="row">${c.arrivalRegion }</div>
									</td>
									<td>
											<div class="row">&nbsp;</div>
											<div class="row">${c.departureDistrict }</div>
											<div class="row">${c.arrivalDistrict }</div>
									</td>
									<td data-sort-method='none'>${c.reserved}/${c.capacity }</td>
									<td data-sort-method='none'>${c.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- end row -->
				<br> <br>
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<!--모달 -->
		<div class="container">

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 5px 5px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" style="padding: 5px 5px;">
							<form action="/filterSearch.do" method="post">
								<div class="form-group">
									<label for="usrname">출발</label> <select class="form-control"
										name="departureRegion" id="city">
										<option value="" selected disabled>시/도</option>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="강원">강원</option>
										<option value="부산">부산</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
									</select> <input type="text" class="form-control"
										name="departureDistrict" id="city" placeholder="상세주소">
								</div>
								<div class="check-box-wrap" style="height: 60px;">
									<div class="check-box left">
										<input type="radio" id="am" name="departureTime" value="0"
											style="display: none;" onclick="timeAm()"><label
											for="am-time"><span class="material-symbols-outlined">check</span>오전</label>
									</div>
									<div class="check-box right">
										<input type="radio" id="pm" name="departureTime" value="1"
											style="display: none;" onclick="timePm()"><label
											for="pm-time"><span class="material-symbols-outlined">check</span>오후</label><br>
									</div>
								</div>
								<div class="form-group">
									<label for="usrname">도착</label> <select class="form-control"
										name="arrivalRegion" id="city">
										<option value="" selected disabled>시/도</option>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="강원">강원</option>
										<option value="부산">부산</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
									</select> <input type="text" class="form-control" name="arrivalDistrict"
										id="city" placeholder="상세주소">
									<div class="row">
										<div class="col-sm-6">
											<div class="input-group">
												<input type="text" class="form-control" id="minprice"
													name="minPrice" placeholder="최저가"> <span
													class="input-group-addon"
													style="background-color: none; border: none;">(원)</span>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-group">
												<input type="text" class="form-control" id="maxprice"
													name="maxPrice" placeholder="최고가"> <span
													class="input-group-addon"
													style="background-color: none; border: none;">(원)</span>
											</div>
										</div>
									</div>
								</div>
								<div class="check-box-wrap">
									<div class="check-box left">
										<input type="radio" id="one-way" name="onewayRound" value="1"
											style="display: none;" onclick="selectOneWay()"><label
											for="one-way"><span class="material-symbols-outlined">check</span>편도</label>
									</div>
									<div class="check-box right">
										<input type="radio" id="round-trip" name="onewayRound"
											value="2" style="display: none;" onclick="selectRoundTrip()"><label
											for="round-trip"><span
											class="material-symbols-outlined">check</span>왕복</label><br>
									</div>
									<div class="check-box left">
										<input type="radio" id="recruiting" name="closure" value="0"
											style="display: none;" onclick="recruiting()"><label
											for="recruiting"><span
											class="material-symbols-outlined">check</span>모집중</label>
									</div>
									<div class="check-box right">
										<input type="radio" id="closed" name="closure" value="1"
											style="display: none;" onclick="closed()"><label
											for="closed"><span class="material-symbols-outlined">check</span>모집완료</label>
									</div>
								</div>
								<hr>
								<div class="btn-pack" style="margin-left: 25px;">
									<button type="button" class="btn btn-block" id="reset-btn"
										style="width: 250px; height: 40px; border-radius: 10px; float: left; margin-right: 25px; background-color: #9f9f9f; color: white; font-weight: 900;">초기화</button>
									<button type="submit" class="btn btn-block" id="apply-btn"
										style="width: 250px; height: 40px; border-radius: 10px; background-color: #EA5455; color: white; font-weight: 900;">적용</button>
								</div>
								<br>
							</form>
							<div class="modal-footer">
								<button type="submit"
									class="btn btn-danger btn-default pull-left"
									data-dismiss="modal"
									style="font-size: 14px; text-align: center; width: 40px; border-radius: 10px; background-color: rgb(255, 174, 0); display: flex; justify-content: center; align-items: center;">
									<span class="glyphicon glyphicon-remove"></span>나가기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->

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





	<script>
		//출발일, 등록일 기준으로 table sort out기능
		table = document.getElementById('carpoolTable');
		new Tablesort(table);
		var refresh = new Tablesort(tableRefresh);
		var rowCount = tableRefresh.rows.length;
		var row = tableRefresh.insertRow(rowCount);
		var cellName = row.insertCell(0);
		cellName.innerHTML = 0;
		refresh.refresh();

		//리스트 5개씩 보이게 하기
/*
		//모달
		$(document).ready(function() {
			$(".filter").click(function() {
				$("#myModal").modal();
			});
		});

		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});

		// 초기화 버튼 클릭 시
		document.getElementById("reset-btn").addEventListener(
				"click",
				function() {
					// input 값 초기화
					document.querySelectorAll("input").forEach(function(input) {
						input.value = "";
					});
					// select 값 초기화
					document.querySelectorAll("select").forEach(
							function(select) {
								select.selectedIndex = 0;
								// 체크박스 초기화
								document.querySelectorAll("input[type=radio]")
										.forEach(function(radio) {
											radio.checked = false;
										});
							});
				});

		// 적용 버튼 클릭 시
		document
				.getElementById("apply-btn")
				.addEventListener(
						"click",
						function() {
							// 필터링 조건 추출
							const departureCity = document
									.getElementById("city").value;
							const arrivalCity = document
									.querySelectorAll("#city")[1].value;
							const minPrice = document
									.getElementById("minprice").value;
							const maxPrice = document
									.getElementById("maxprice").value;
							const tripType = document
									.querySelector('input[name="trip-type"]:checked').value;
							const recruitStatus = document
									.querySelector('input[name="recruit"]:checked').value;

							// 추출된 조건을 가지고 필터링 검색 실행
							// 여기에 실행할 코드 추가
						});
		*/
	</script>

</body>
</html>


