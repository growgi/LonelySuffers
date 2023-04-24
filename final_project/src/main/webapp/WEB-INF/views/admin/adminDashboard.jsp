<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="resources/css/adminDashboard.css"></link>
<link rel="stylesheet" href="resources/css/adminCommon.css"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="dashboard-wrapper admin-content">
		<div>
			
			<div class="dashboard-1st">
				<div class="calendar-wrap" style="border: none;">
					<div style="padding: 0;">
						<table class="Calendar">
							<thead>
								<tr>
									<td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
									<td colspan="5">
										<span id="calYear"></span>년
										<span id="calMonth"></span>월
									</td>
									<td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
								</tr>
								<tr>
									<td>일</td>
									<td>월</td>
									<td>화</td>
									<td>수</td>
									<td>목</td>
									<td>금</td>
									<td>토</td>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div class="task-list">
					<div class="title-bold" style="margin-bottom: 20px">오늘의 할 일</div>
					<div class="default-task">
						<div>
							<span class="material-symbols-outlined">task_alt</span>
							<div class="bold-s">판매자 신청 회원 <span class="bold-s" style="color:#19A7CE">52</span>명</div>
						</div>
						<div>
							<span class="material-symbols-outlined">task_alt</span>
							<div class="bold-s">신규 상품 승인 <span class="bold-s" style="color:#19A7CE">14</span>건</div>
						</div>
						<div>
							<span class="material-symbols-outlined">task_alt</span>
							<div class="bold-s">1:1 문의 <span class="bold-s" style="color:#19A7CE">4</span>건</div>
						</div>
					</div>
				</div>
				<div class="sales-amount">
					<div class="total-sales-amount">
						<div class="title-bold">총 판매금액</div>
						<div class="bold-l"><span class="bold-l" style="color:#ecb534">123,000,000</span>원</div>
					</div>
					<div class="today-sales-amount">
						<div class="title-bold">오늘의 상품 판매금액</div>
						<div class="bold-l"><span class="bold-l" style="color:#19A7CE">200,000</span>원</div>
					</div>
					<div class="logo">
						<div class="waveEffect">
							<p class="waveEffectWord-back" style="font-family: 'Delicious Handrawn', cursive; color:#fff;">WhatSurf</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="dashboard-2nd">
				<div class="member-count">
					<div>
						<div class="title-bold">회원</div>
						<div class="material-symbols-outlined product-icon">group</div>
					</div>	
					<div class="bold-m">1,590</div>
				</div>
				<div class="lesson-count">
					<div>
						<div class="title-bold">강습</div>
						<div class="material-symbols-outlined product-icon">surfing</div>
					</div>	
					<div class="bold-m">40</div>
				</div>
				<div class="house-count">
					<div>
						<div class="title-bold">숙박</div>
						<div class="material-symbols-outlined product-icon">apartment</div>
					</div>
					<div class="bold-m">76</div>
				</div>
				<div class="carfool-count">
					<div>
						<div class="title-bold">카풀</div>
						<div class="material-symbols-outlined product-icon">directions_car</div>
					</div>
					<div class="bold-m">16</div>
				</div>
			</div>

			<div class="dashboard-3rd">
				<div class="visitant-graph">
					<div class="title-bold">방문자 현황</div>
					<div>
						<div id="curve_chart" style="width: 100%; height: 400px"></div>
					</div>
				</div>
				<div class="gender-graph">
					<div class="title-bold">회원 성별 비율</div>
					<div>
						<div id="donutchart" style="width: 500px; height: 400px;"></div>
					</div>
				</div>
			</div>

			<div class="dashboard-4th">
				<div class="new-product">
					<div class="title-bold">신규 상품</div>
					<table>
						<tr>
							<th>종류</th>
							<th>상품명</th>
							<th>판매자</th>
							<th>지역</th>
							<th>상품 상태</th>
						</tr>
						<tr>
							<td>강습</td>
							<td>개쉬운서핑...</td>
							<td>hong123</td>
							<td>제주</td>
							<td>판매중</td>
						</tr>
					</table>
					<a href="#" class="btn-l bc1">전체 상품 목록 보기</a>
				</div>
				<div class="new-member">
					<div class="title-bold">신규 회원</div>
					<div class="member-box">
						<div class="material-symbols-outlined member-img">account_circle</div>
						<div>
							<div><span style="font-weight:bold;">홍길동</span> | <span>user1</span></div>
							<div style="font-size: 14px;">hong123@naver.com</div>
						</div>
					</div>
					<a href="#" class="btn-l bc1">전체 회원 목록 보기</a>
				</div>
			</div>

			<div class="dashboard-5th">
				<div class="new-carpool">
					<div class="title-bold">신규 카풀 운전자</div>
					<div class="member-box">
						<div class="material-symbols-outlined member-img">account_circle</div>
						<div>
							<div><span style="font-weight:bold;">홍길동</span> | <span>user1</span></div>
							<div style="font-size: 14px;">hong123@naver.com</div>
						</div>
					</div>
					<a href="#" class="btn-l bc1">전체 카풀 게시글 목록 보기</a>
				</div>
				<div class="sales-amount-graph">
					<div class="title-bold">상품 판매금액 추이</div>
					<div>
						<div id="chart_div" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
			</div>

			<div class="dashboard-6th">
				<div class="admin-list">
					<div class="title-bold">관리자</div>
					<div class="admin-list-row">
						<div class="member-box">
							<div class="material-symbols-outlined member-img">admin_panel_settings</div>
							<div>
								<div><span style="font-weight:bold;">홍길동</span> | <span>user1</span></div>
								<div style="font-size: 14px;">hong123@naver.com</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
<script>
	/*메뉴 제목*/
	$(document).ready(function(){
		$(".top-menu-title").text("Dashboard");
	});

	/*달력*/
	window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

	let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date();     // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

	// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	function buildCalendar() {

		let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
		let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

		let tbody_Calendar = document.querySelector(".Calendar > tbody");
		document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
		document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

		while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
			tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
		}

		let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

		for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
			let nowColumn = nowRow.insertCell();        // 열 추가
		}

		for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

			let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


			let newDIV = document.createElement("p");
			newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
			nowColumn.appendChild(newDIV);

			if (nowDay.getDay() == 6) {                 // 토요일인 경우
				nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
			}

			if (nowDay < today) {                       // 지난날인 경우
				newDIV.className = "pastDay";
			}
			else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
				newDIV.className = "today";
				newDIV.onclick = function () { choiceDate(this); }
			}
			else {                                      // 미래인 경우
				newDIV.className = "futureDay";
				newDIV.onclick = function () { choiceDate(this); }
			}
		}
	}

	// 날짜 선택
	function choiceDate(newDIV) {
		if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
			document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
		}
		newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	}

	// 이전달 버튼 클릭
	function prevCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
		buildCalendar();    // 달력 다시 생성
	}
	// 다음달 버튼 클릭
	function nextCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
		buildCalendar();    // 달력 다시 생성
	}

	// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	function leftPad(value) {
		if (value < 10) {
			value = "0" + value;
			return value;
		}
		return value;
	}

	/*방문자수 현황*/
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart1() {
		var data = google.visualization.arrayToDataTable([
		['Date', '일간 방문수'],
		['1',  46],
		['2',  22],
		['3',  75],
		['4',  59],
		['5',  160],
		['6',  130],
		['7',  210]
		]);

		var options = {
		//title: 'Company Performance',
		curveType: 'function',
		legend: { position: 'bottom' },
		colors:['#19A7CE'],
		};

		var point = {visible: true}

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

		chart.draw(data, options);
	}

	/*남녀비율 chart*/
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart2);
	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
			['Gender', 'Ratio'],
			['남자', 50],
			['여자', 50]
		]);

		var options = {
			//title: 'My Daily Activities',
			pieHole: 0.4,
			colors:['#19A7CE','#ecb534']
		};

		var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
		chart.draw(data, options);
	}

	/*상품 판매금액 추이*/
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart3);

	function drawChart3() {
	var data = google.visualization.arrayToDataTable([
		['month', '강습', '숙박'],
		['1',  1000,      400],
		['2',  1170,      460],
		['3',  660,       1120],
		['4',  1030,      540]
	]);

	var options = {
		//title: 'Company Performance',
		hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
		vAxis: {minValue: 0},
		colors:['#ecb534','#19A7CE']
	};

	var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
	chart.draw(data, options);
	}
</script>
</html>