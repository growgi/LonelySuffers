<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
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
							<div class="bold-s">판매자 신청 회원 <span class="bold-s" style="color:#19A7CE">${dInfo.sellerAppCount }</span>명</div>
						</div>
						<div>
							<span class="material-symbols-outlined">task_alt</span>
							<div class="bold-s">신규 상품 승인 <span class="bold-s" style="color:#19A7CE">${dInfo.newProductCount }</span>건</div>
						</div>
						<div>
							<span class="material-symbols-outlined">task_alt</span>
							<div class="bold-s">1:1 문의 <span class="bold-s" style="color:#19A7CE">${dInfo.newAdminChatCount }</span>건</div>
						</div>
					</div>
				</div>
				<div class="sales-amount">
					<div class="total-sales-amount">
						<div class="title-bold">총 판매금액</div>
						<div class="bold-l"><span class="bold-l" style="color:#ecb534"><fmt:formatNumber value="${dInfo.totalSalesAmount }" pattern="#,###" /></span>원</div>
					</div>
					<div class="today-sales-amount">
						<div class="title-bold">오늘의 상품 판매금액</div>
						<div class="bold-l"><span class="bold-l" style="color:#19A7CE"><fmt:formatNumber value="${dInfo.todaySalesAmount }" pattern="#,###" /></span>원</div>
					</div>
					<div class="logo">
						<div class="waveEffect">
							<p class="waveEffectWord-back" style="font-family: 'Delicious Handrawn', cursive; color:#fff;">WhatSurf</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="dashboard-2nd">
				<a href="/memberList.do?reqPage=1" class="member-count">
					<div>
						<div class="title-bold">회원</div>
						<div class="material-symbols-outlined product-icon">group</div>
					</div>	
					<div class="bold-m">${dInfo.memberCount }</div>
				</a>
				<a href="/productListLesson.do?reqPage=1" class="lesson-count">
					<div>
						<div class="title-bold">강습</div>
						<div class="material-symbols-outlined product-icon">surfing</div>
					</div>	
					<div class="bold-m">${dInfo.lessonCount }</div>
				</a>
				<a href="/productListHouse.do?reqPage=1" class="house-count">
					<div>
						<div class="title-bold">숙박</div>
						<div class="material-symbols-outlined product-icon">apartment</div>
					</div>
					<div class="bold-m">${dInfo.houseCount }</div>
				</a>
				<a href="/carpoolList.do?reqPage=1" class="carfool-count">
					<div>
						<div class="title-bold">카풀</div>
						<div class="material-symbols-outlined product-icon">directions_car</div>
					</div>
					<div class="bold-m">${dInfo.carpoolRecruitingCount }</div>
				</a>
			</div>

			<div class="dashboard-3rd">
				<div class="visitant-graph">
					<div class="title-bold">방문자 수 현황</div>
					<div class="visitant-val" style="display:none">
 						<%-- <div class="todayCount">${sessionScope.todayCount}</div>
						<div class="totalCount">${sessionScope.totalCount}</div> --%>						
						<c:forEach items="${sessionScope.weekCountList}" var="w">
							<div class="visitantDate">${w.visitantDate }</div>
							<div class="dayTotal">${w.dayTotal}</div>
						 </c:forEach>
					</div>
					<div>
						<div style="width: 100%; height: 100%;">
							<!--차트가 그려질 부분-->
							<canvas id="visitantGraph"></canvas>
						</div>
						<!-- <div id="curve_chart" style="width: 100%; height: 400px;"></div> -->
					</div>
				</div>
				<div class="gender-graph">
					<div class="title-bold">회원 성별 비율</div>
					<div style="display:none">
						<div class="manRatio">${dInfo.genderRatio[0].manRatio}</div>
						<div class="womanRatio">${dInfo.genderRatio[0].womanRatio}</div>
					</div>
					<div>
						<div style="width: 90%; height: 90%; margin: 0 auto;">
							<!--차트가 그려질 부분-->
							<canvas id="myChart"></canvas>
						</div>
						<!-- <div id="donutchart" style="width: 500px; height: 400px;"></div> -->
					</div>
				</div>
			</div>

			<div class="dashboard-4th">
				<div class="new-product">
					<div class="title-bold">신규 상품</div>
					<table>
						<tr>
							<th>종류</th>
							<th style="width:40%;">상품명</th>
							<th>판매자</th>
							<th>지역</th>
							<th>상품 상태</th>
						</tr>
						<c:forEach items="${dInfo.newProductList }" var="p">
						<tr>
							<td>${p.productType }</td>
							<td>${p.productTitle }</td>
							<td>${p.productWriter}</td>
							<td>${p.productCity}</td>
							<td style="color:#19A7CE; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
							<c:choose>
								<c:when test="${p.productStatus == 1}">
									판매중
								</c:when>
								<c:when test="${p.productStatus == 0}">
									판매중지
								</c:when>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
					<a href="/productListAll.do?reqPage=1" class="btn-l bc1" style="width: 97%;">전체 상품 목록 보기</a>
				</div>
				<div class="new-member">
					<div class="title-bold">신규 회원</div>
					<c:forEach items="${dInfo.newMemberList }" var="m">
					<div class="member-box">
						<div class="material-symbols-outlined member-img" style="color:#bdbdbd;">account_circle</div>
						<div>
							<div><span style="font-weight:bold;">${m.memberName }</span> | <span>${m.memberId }</span></div>
							<div style="font-size: 14px;">${m.memberEmail }</div>
						</div>
					</div>
					</c:forEach>
					<a href="/memberList.do?reqPage=1" class="btn-l bc1" style="width:91%;">전체 회원 목록 보기</a>
				</div>
			</div>

			<div class="dashboard-5th">
				<div class="new-carpool">
					<div class="title-bold">신규 카풀 운전자</div>
					<c:forEach items="${dInfo.newCarpoolDriverList }" var="c">
					<div class="member-box">
						<div class="material-symbols-outlined member-img" style="color:#bdbdbd;">account_circle</div>
						<div>
							<div><span style="font-weight:bold;">${c.memberName }</span> | <span>${c.memberId }</span></div>
							<div style="font-size: 14px;">${c.memberEmail }</div>
						</div>
					</div>
					</c:forEach>
					<a href="/carpoolList.do?reqPage=1" class="btn-l bc1" style="width:91%;">전체 카풀 게시글 목록 보기</a>
				</div>
				<div class="sales-amount-graph">
					<div class="title-bold">상품 판매금액 추이</div>
					<div class="sales-amount-val" style="display:none">
					<c:forEach items="${dInfo.lessonSalesAmountList }" var="l">
						<div class="lesson-month">${l.month }</div>
						<div class="lesson-sales">${l.sales }</div>
					</c:forEach>
					<hr>
					<c:forEach items="${dInfo.houseSalesAmountList }" var="h">
						<div class="house-month">${h.month }</div>
						<div class="house-sales">${h.sales }</div>
					</c:forEach>
					<hr>
					<c:forEach items="${dInfo.allSalesAmountList }" var="a">
						<div class="all-month">${a.month }</div>
						<div class="all-sales">${a.sales }</div>
					</c:forEach>
					</div>
					<div>
						<div style="width: 100%; height: 100%;">
							<!--차트가 그려질 부분-->
							<canvas id="salesAmountGraph"></canvas>
						</div>
						<!-- <div id="chart_div" style="width: 100%; height: 350px;"></div> -->
					</div>
				</div>
			</div>

			<div class="dashboard-6th">
				<div class="admin-list">
					<div class="title-bold">관리자</div>
					<div class="admin-list-row" style="overflow: hidden;">
						<c:forEach items="${dInfo.adminList }" var="ad">
						<div class="member-box" style="width:235px; margin-right:50px; float: left;">
							<div class="material-symbols-outlined member-img" style="color:#888888;">admin_panel_settings</div>
							<div>
								<div><span style="font-weight:bold;">${ad.memberName }</span> | <span>${ad.memberId }</span></div>
								<div style="font-size: 14px;">${ad.memberEmail }</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<!-- <div class="surf-img">
					<img src="/resources/upload/main/surf22.jpg">
				</div> -->
			</div>
		</div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</body>
<script>
	/*메뉴 제목*/
	$(document).ready(function(){
		$(".top-menu-title").text("Dashboard");
		$(".menu-detail-title").eq(0).addClass("active-menu-click");
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

	/*방문자수 현황 chart*/
	const visitantDateArr = new Array();
	$(".visitantDate").each(function(index,item){
		visitantDateArr.push($(item).text());
	});
	
	//console.log(visitantDateArr);
	
	const dayTotalArr = new Array();
	$(".dayTotal").each(function(index,item){
		dayTotalArr.push($(item).text());
	});
	
	//console.log(dayTotalArr);
	var context = document
  .getElementById('visitantGraph')
  .getContext('2d');

var visitantGraph = new Chart(context, {
  type: 'line', // 차트의 형태
  data: { // 차트에 들어갈 데이터
    labels: [
      //x 축
      visitantDateArr[0],visitantDateArr[1],visitantDateArr[2],visitantDateArr[3],visitantDateArr[4],visitantDateArr[5],visitantDateArr[6]
    ],
    datasets: [
      { //데이터
        label: 'visitant graph', //차트 제목
        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
        data: [
          dayTotalArr[0],dayTotalArr[1],dayTotalArr[2],dayTotalArr[3],dayTotalArr[4],dayTotalArr[5],dayTotalArr[6] //x축 label에 대응되는 데이터 값***
        ],
        backgroundColor: [
          //색상
          'rgba(255,117,117,0.3)'
        ],
        borderColor: [
          //경계선 색상
          'rgba(255,117,117,1)'
        ],
        borderWidth: 1, //경계선 굵기
        cubicInterpolationMode: 'monotone',
        tension: 0.4
      }
    ]
  }
});
	// var context = document
    //         .getElementById('visitantGraph')
    //         .getContext('2d');
	// var visitantGraph = new Chart(context, {
	// 	type: 'line', // 차트의 형태
	// 	data: { // 차트에 들어갈 데이터
	// 		labels: [
	// 			//x 축
	// 			visitantDateArr[0],visitantDateArr[1],visitantDateArr[2],visitantDateArr[3],visitantDateArr[4],visitantDateArr[5],visitantDateArr[6]
	// 		],
	// 		datasets: [
	// 			{ //데이터
	// 				label: 'visitant graph', //차트 제목
	// 				fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	// 				data: [
	// 					dayTotalArr[0],dayTotalArr[1],dayTotalArr[2],dayTotalArr[3],dayTotalArr[4],dayTotalArr[5],dayTotalArr[6] //x축 label에 대응되는 데이터 값***
	// 				],
	// 				backgroundColor: [
	// 					//색상
	// 					'rgba(255,117,117,0.3)'
	// 				],
	// 				borderColor: [
	// 					//경계선 색상
	// 					'rgba(255,117,117,1)'
	// 				],
	// 				borderWidth: 1, //경계선 굵기
	// 				cubicInterpolationMode: 'monotone',
	// 				tension: 0.4
	// 			}
	// 		]
	// 	}
	// });
        
	
	/*남녀비율 chart*/
	const manRatio = $(".manRatio").text();
	const womanRatio = $(".womanRatio").text();
	var context = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(context, {
		type: 'doughnut', // 차트의 형태
		data: { // 차트에 들어갈 데이터
			labels: [
				//x 축
				'남자','여자'
			],
			datasets: [
				{ //데이터
					label: 'gender ratio', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						manRatio,womanRatio //x축 label에 대응되는 데이터 값***
					],
					backgroundColor: [
						//색상
						'rgba(255,117,117,0.3)',
						'rgba(25,167,206,0.3)'
					],
					borderColor: [
						//경계선 색상
						'rgba(255,117,117,1)',
						'rgba(25,167,206,1)'
					],
					borderWidth: 1 //경계선 굵기
				}
				
			]
		},
		options: {
			scales: {
				yAxes: [
					{
						ticks: {
							beginAtZero: true
						}
					}
				]
			}
		}
	});

	/*상품 판매금액 추이 chart*/
	//날짜
	const lessonMonthArr = new Array();
	$(".lesson-month").each(function(index,item){
		lessonMonthArr.push($(item).text());
	});
	
	console.log("lessonMonthArr:"+lessonMonthArr);
	
	const houseMonthArr = new Array();
	$(".house-month").each(function(index,item){
		houseMonthArr.push($(item).text());
	});
	
	console.log("houseMonthArr:"+houseMonthArr);
	
	const allMonthArr = new Array();
	$(".all-month").each(function(index,item){
		allMonthArr.push($(item).text());
	});
	
	console.log("allMonthArr:"+allMonthArr);
	
	//강습 판매금액
	const lessonArr = new Array();
	$(".lesson-sales").each(function(index,item){
		lessonArr.push($(item).text());
	});
	
	console.log("lessonArr:"+lessonArr);
	
	//숙박 판매금액
	const houseArr = new Array();
	$(".house-sales").each(function(index,item){
		houseArr.push($(item).text());
	});
	
	console.log("houseArr:"+houseArr);
	
	//강습+숙박 판매금액
	const allArr = new Array();
	$(".all-sales").each(function(index,item){
		allArr.push($(item).text());
	});
	
	console.log("allArr:"+allArr);
	
	var context = document
            .getElementById('salesAmountGraph')
            .getContext('2d');
	var salesAmountGraph = new Chart(context, {
		type: 'bar', // 차트의 형태
		data: { // 차트에 들어갈 데이터
			labels: [
				//x 축
				'3','4','5'
			],
			datasets: [
				{ //데이터
					label: '강습', //차트 제목
					fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						lessonArr[0], lessonArr[1], lessonArr[2], lessonArr[3], lessonArr[4], lessonArr[5]//x축 label에 대응되는 데이터 값***
					],
					backgroundColor: [
						//색상
						'rgba(25,167,206,0.3)',
						'rgba(25,167,206,0.3)',
						'rgba(25,167,206,0.3)',
						'rgba(25,167,206,0.3)',
						'rgba(25,167,206,0.3)',
						'rgba(25,167,206,0.3)'
					],
					borderColor: [
						//경계선 색상
						'rgba(25,167,206,1)',
						'rgba(25,167,206,1)',
						'rgba(25,167,206,1)',
						'rgba(25,167,206,1)',
						'rgba(25,167,206,1)',
						'rgba(25,167,206,1)'
					],
					borderWidth: 1 //경계선 굵기
				},
				{ //데이터
					label: '숙박', //차트 제목
					fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						houseArr[0], houseArr[1], houseArr[2], houseArr[3], houseArr[4], houseArr[5] //x축 label에 대응되는 데이터 값***
					],
					backgroundColor: [
						//색상
						'rgba(255,168,168,0.3)',
						'rgba(255,168,168,0.3)',
						'rgba(255,168,168,0.3)',
						'rgba(255,168,168,0.3)',
						'rgba(255,168,168,0.3)',
						'rgba(255,168,168,0.3)'

					],
					borderColor: [
						//경계선 색상
						'rgba(255,168,168,1)',
						'rgba(255,168,168,1)',
						'rgba(255,168,168,1)',
						'rgba(255,168,168,1)',
						'rgba(255,168,168,1)',
						'rgba(255,168,168,1)'

					],
					borderWidth: 1 //경계선 굵기
				},
				{ //데이터
					label: '강습+숙박', //차트 제목
					fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						0, allArr[0], allArr[1], allArr[2], allArr[3], allArr[4], allArr[5] //x축 label에 대응되는 데이터 값***
					],
					backgroundColor: [
						//색상
						'rgba(236,181,52,0.3)',
						'rgba(236,181,52,0.3)',
						'rgba(236,181,52,0.3)',
						'rgba(236,181,52,0.3)',
						'rgba(236,181,52,0.3)',
						'rgba(236,181,52,0.3)'
					],
					borderColor: [
						//경계선 색상
						'rgba(236,181,52,1)',
						'rgba(236,181,52,1)',
						'rgba(236,181,52,1)',
						'rgba(236,181,52,1)',
						'rgba(236,181,52,1)',
						'rgba(236,181,52,1)'
					],
					borderWidth: 1 //경계선 굵기
				}
			]
		},
		options: {
			scales: {
				yAxes: [
					{
						ticks: {
							beginAtZero: true
						}
					}
				]
			}
		}
	});
</script>
</html>