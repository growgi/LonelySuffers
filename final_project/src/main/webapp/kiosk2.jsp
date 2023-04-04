<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	
	#daterangepicker{
	width:596px;
	height:80px;
	font-size:30px;
	text-align:center;
	margin-left:300px;
	border: 2px solid;
	border-radius:15px;
	font-weight:800;
	}
	
	#travel-days{
	width:396px;
	height:60px;
	font-size:25px;
	text-align:center;
	margin-left:400px;
	margin-top: 80px;
	border: 2px solid;
	border-radius:10px;
	font-weight:800;
	}
	
	
	.content-wrapper{
		width:1200px;
	}
	.title-wrapper{
		width:1200px;
		margin: 0 auto;
		text-align:center;
	
	}
	.title-wrapper>img{
		width:70px;
		height:70px;
		vertical-align: text-bottom;
	}
	.title{
		text-align:center;
		font-size:50px;
		font-weight:bold;
		color:rgb(51, 51, 51);
		width:1000px;
		height:100px;
		line-height:300%;
	}
	.money-wrapper{
		width:1200px;
		height: 100px;
		overflow:hidden;
	}
	.money-emoji{
		width:50px;
		height:50px;
		margin-top:25px;
		margin-right:5px;
		float:right;
	}
	.money{
		font-size:30px;
		font-weight:400;
		float:right;
		margin-right:100px;
		line-height:100px;
	}
	.map-wrapper{
		width: 1000px;
		
	}
	.circle-wrap{
		width: 1100px;
		height: 1100px;
		margin-right:100px;
		padding-top:50px;
	}
	.circle{
		background-repeat: no-repeat;
		background-size: 930px 930px;
		margin-left: 30px;
	}
	.map{
		width:550px;
		height:1000px;
		margin-left: 285px;
		padding-top: 65px
	}
	.calendar-wrap{
		width:1100px;
		height:1000px;
	}
	
	
	.btn-wrap{
		width:1200px;
	}
	.btn-wrap>button{
		width:196px;
		height:60px;
		border-radius:5px;
		border: 2px solid #3da9d4;
		margin-left:145px;
		background-color:#fff;
	}
	.btn-wrap p{
		font-weight:600;
		font-size:20px;
		margin-top:15px;
		color:rgb(51, 51, 51);
	}
</style>
<!-- naver map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34"></script>
<!-- daterangepicker -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<section class="section">
		<div class="container">
			<!-- 키오스크 1페이지 -->
			<div class="content-wrapper">
				<div class="title-wrapper">
					<img src="/images/wave.png">	
					<img src="/images/palm-tree.png">
					<span class="title">어디로 떠나볼까요~?</span>
					<img src="/images/palm-tree.png">
					<img src="/images/wave.png">
				</div>
				<div class="money-wrapper">
					<span class="money stat-count">150000</span>
					<img class="money-emoji" src="/images/dollar1.png">
				</div>
				<!-- 돋보기 모양으로 해보기 -->
				<div class="page1">
					<div class="map-wrapper">
					<div class="row">
						<div class="col-md-8">
							<div class="circle-wrap">
								<div class="circle" style="background-image:url(/images/magnify.png)">
									<div class="map">
									<div id="map" style="width:580px;height:580px;border-radius:50%;"></div>
										</div>
									</div>
							</div>
						</div>
					</div>
					</div>
				</div>
				<!-- 키오스크 1페이지 종료 -->
				<!-- 키오스크 2페이지 -->
				<div class="page2">
					<div class="calendar-wrap">
						<div>
						<input type="text" id="daterangepicker" name="daterangepicker" readonly>
						</div>
						<div>
						<input type="text" id="travel-days" value="0박 0일"readonly>
						</div>
					</div>
				</div>
				<!-- 키오스크 2페이지 종료 -->
				<!-- 키오스크 3페이지 -->
				<div clas="page3">
					<div class="people-wrap">
						
					</div>
				</div>
			<div class="btn-wrap">
				<button class="before"><p>이전으로</p></button>
				<button class="okay"><p>확정</p></button>
				<button class="pass"><p>넘어가기</p></button>
			</div>
			</div><!-- content-wrapper 종료 -->
		</div>
	</section>
	</div>

<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- <script src="js/parallax.js"></script> -->
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>



<script>
//네이버지도 스크립트
const map = new naver.maps.Map("map",{
	center : new naver.maps.LatLng(35.469676269413,127.65758671095),
	zoom : 7,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});

//날짜의 차이를 구하는 함수
Date.prototype.getInterval = function (otherDate) {
    var interval;
 
    if(this > otherDate)
        interval = this.getTime() - otherDate.getTime();
    else
        interval = otherDate.getTime() - this.getTime();
 
    return Math.floor(interval / (1000*60*60*24));
}


$("#daterangepicker").daterangepicker({
    locale: {
    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
    "format": 'YYYY-MM-DD',     // 일시 노출 포맷
    "applyLabel": "확인",                    // 확인 버튼 텍스트
    "cancelLabel": "취소",                   // 취소 버튼 텍스트
    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]

    },
    showDropdowns: true,                     // 년월 수동 설정 여부
    minDate: moment(),
    maxDate: moment().add(365, 'days')
},function(start, end, label) {
    console.log(start.format('YYYYMMDD'), end.format('YYYYMMDD'));
    var startVal = start.format('YYYYMMDD');
    var endVal = end.format('YYYYMMDD');
    
    
    var date1 = new Date(start.format('YYYY-MM-DD'));
    var date2 = new Date(end.format('YYYY-MM-DD'));
    var result = date1.getInterval(date2);
    
    $("#travel-days").attr("value",result+"박"+(result+1)+"일");
});
 
$("#daterangepicker").on('show.daterangepicker', function (ev, picker) {
    $(".yearselect").css("float", "left");
    $(".monthselect").css("float", "right");
    $(".cancelBtn").css("float", "right");
});


$("#daterangepicker").val('');
$("#daterangepicker").attr("placeholder","여행을 떠날 날짜를 골라주세요:)");
/*
var applyBtn = document.querySelector(".applyBtn");
//var result = $("#daterangerpicker").val();

applyBtn.onclick=function(){
	console.log($("#daterangepicker").val());
	var result = $("#daterangerpicker").val();
	var startDate = result.substr(0,9);
	var endDate = result.substr(13,22);
	console.log(startDate);
	consol.log(endDate);
}
*/

	
	


</script>					
</body>
</html>