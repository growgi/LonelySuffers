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
	#headcount{
		width:596px;
		height:80px;
		font-size:30px;
		text-align:center;
		margin-left:300px;
		border: 2px solid;
		border-radius:15px;
		font-weight:800;
	}
	.headcount-wrap{
		width:1200px;
		height:900px;
		overflow:hidden;
	}
	#whole-people{
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
	.rooms-wrap{
		width:1200px;
		height:400px;
		background-color:red;
	}
	.level-select{
		width:1200px;
		overflow:hidden;
	}
	.level-select>div{
		width:400px;
		float:left;
	}
	.level-select img{
		width:300px;
		height:300px;
		margin-left:50px;

	}
	.boxes{
		margin-left:50px;
		margin-top:20px;
		overflow:hidden;
	}
	.level-name{
		float:left;
		margin-left:20px;
	}
	.level-name>p{
		font-size:24px;
		font-weight:bold;
		color:rgb(51, 51, 51);
	}
	input[type="checkbox"]{
        display: none;
      }
	input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
        float:left;
      }
	input[id="level1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="level2"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="level3"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
    .option-select{
		width:1200px;
		overflow:hidden;
	}
	.option-select>div{
		width:400px;
		float:left;
		margin-left: calc(400px/3);
	}  
    .option-select img{
		width:300px;
		height:300px;
		margin-left:50px;
	}
	.lessons-wrap{
		width:1200px;
		height:400px;
		background-color:red;
	}
	input[id="barbecue"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="party"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
    .option-name{
		float:left;
		margin-left:20px;
	}
	.option-name>p{
		font-size:24px;
		font-weight:bold;
		color:rgb(51, 51, 51);
	}
	.receipt-wrap li{
		list-style:none;
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
		font-weight: 600px;
		font-size:20px;
		margin-top:15px;
		color:rgb(51, 51, 51);
	}
</style>
<!-- naver map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34"></script>
<script src="js/MarkerClustering.js"></script>
<!-- daterangepicker -->
<link rel="stylesheet" type="text/css" href="css/daterangepicker.css">
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
				<div class="page3">
					<div class="headcount-wrap">
						<select id="headcount">
						  <option value="" disabled selected>몇 명이신가요?</option>
						  <option value="1">1명</option>
						  <option value="2">2명</option>
						  <option value="3">3명</option>
						  <option value="4">4명</option>
						  <option value="5">5명</option>
						  <option value="6">6명</option>
						  <option value="7">7명</option>
						  <option value="8">8명</option>
						</select>
					<input type="text" id="whole-people" value="총 0명 입니다"readonly>
					<!-- 진짜 총원 인원을 킵하고 있는 부분 -->
					<input type="hidden" id="people-value" value="">
						<div class="head-icon-wrap">
						</div>
				</div>
				<!-- 키오스크 3페이지 종료 -->
				<!-- 키오스크 4페이지(숙소 옵션을 미리 선택) -->
				<div class="page4">
					<div class="option-select">
						<div class="barbecue">
							<div>
							<img src="/images/barbecue.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="barbecue" value="barbecue">
								<label for="barbecue"></label>
								<div class="option-name"><p>바베큐</p></div>
							</div>
						</div>
						<div class="party">
							<div>
								<img src="/images/party.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="party" value="party">
								<label for="party"></label>
								<div class="option-name"><p>파티</p></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 키오스크 4페이지 종료 -->
				<!-- 키오스크 5페이지 숙소리스트 -->
				<div class="page5">
					<div class="rooms-wrap">
						
					</div>
				</div>
				<!-- 키오스크 5페이지 숙소리스트 종료-->
				<!-- 키오스크 6페이지 -->
				<div class="page6">
					<div class="level-select">
					<!-- 중복선택이 가능하게 -->
						<div class="level1">
							<div>
							<img src="/images/level1.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level1" value="1">
								<label for="level1"></label>
								<div class="level-name"><p>초급</p></div>
							</div>
						</div>
						<div class="level2">
							<div>
								<img src="/images/level2.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level2" value="2">
								<label for="level2"></label>
								<div class="level-name"><p>중급</p></div>
							</div>
						</div>
						<div class="level3">
							<div>
							<img src="/images/level3.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level3" value="3">
								<label for="level3"></label>
								<div class="level-name"><p>고급</p></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 키오스크 6페이지 종료-->
				<!-- 키오스크 7페이지 강습리스트 -->
				<div class="page7">
					<div class="lessons-wrap">
						
					</div>
				</div>
				<!-- 키오스크 7페이지 강습리스트 종료-->
				<!-- 키오스크 8페이지 -->
				<div class="page8">
					<div class="receipt-wrap">
						<form action="#">
							<fieldset>
								<legend>00님의 주문내역</legend>
									<ul>
										<li>숙소정보</li>
										<li>숙박소이름,호수</li>
										<li>숙박 날짜</li>
										<li>옵션</li>
										<li>가격</li>
									</ul>
									<ul>
										<li>강습정보</li>
										<li>강슴이름</li>
										<li>강습날짜</li>
										<li>강습시간</li>
										<li>인원</li>
										<li>가격</li>
									</ul>
									<p>총액</p>
							</fieldset>
						</form>
					</div>
					
				</div>
				<!-- 키오스크 8페이지 종료 -->
				<!-- 키오스크 9페이지 -->
				<div class="page9">
					<div class="last-page">
						<img src="/images/shaka.png">
					</div>
				</div>
				<!-- 키오스크 9페이지 종료 -->
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
<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>



<script>
//markers배열
var markers = [];
//네이버지도 스크립트
const map = new naver.maps.Map("map",{
	center : new naver.maps.LatLng(35.469676269413,127.65758671095),
	zoom : 7,
	maxZoom : 10,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});
//마커배열
var	markers = [];
//날짜의 차이를 구하는 함수
Date.prototype.getInterval = function (otherDate) {
    var interval;
 
    if(this > otherDate)
        interval = this.getTime() - otherDate.getTime();
    else
        interval = otherDate.getTime() - this.getTime();
 
    return Math.floor(interval / (1000*60*60*24));
}
/*
const marker = new naver.maps.Marker({
	position : new naver.maps.LatLng(37.971644,128.762234),
	map : map
})
*/

//지도 리스트 불러와서 마커생성
$(document).ready(function(){
	$.ajax({
		url : "/allAddress.do",
		type : "get",
		dataType : "json",
		success : function(data){
			for(let i=0;i<data.length;i++){
				const marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(data[i].houseLat,data[i].houseLng),
					map : map
					
				})
				 markers.push(marker);
			}
			
		}
	})
});
//네이버지도 마커클러스터
$(document).ready(function(){
	var htmlMarker1 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url((https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-1.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker2 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url((https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-2.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker3 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url((https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-3.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker4 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url((https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-4.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker5 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url((https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-5.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    };

	var markerClustering = new MarkerClustering({
        minClusterSize: 2,
        maxZoom: 8,
        map: map,
        markers: markers,
        disableClickZoom: false,
        gridSize: 120,
        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
        indexGenerator: [10, 100, 200, 500, 1000],
        stylingFunction: function(clusterMarker, count) {
            $(clusterMarker.getElement()).find('div:first-child').text(count);
        }
    });
	
});





//daterangepicker api
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
    maxDate: moment().add(12, 'months')
},function(start, end, label) {
    console.log(start.format('YYYYMMDD'), end.format('YYYYMMDD'));
    var startVal = start.format('YYYYMMDD');
    var endVal = end.format('YYYYMMDD');
    
    
    var date1 = new Date(start.format('YYYY-MM-DD'));
    var date2 = new Date(end.format('YYYY-MM-DD'));
    var result = date1.getInterval(date2);
    
    $("#travel-days").attr("value",result+"박"+(result+1)+"일");
});

//daterangepicker에 placeholder 삽입
$("#daterangepicker").val('');
$("#daterangepicker").attr("placeholder","여행을 떠날 날짜를 골라주세요:)");

/*
//드롭다운 메뉴 값 받아오기
var element = document.querySelector("#headcount");
var value = element.value;
*/

//고른 인원수에 따른 아이콘 추가
$("#headcount").on('change',function(){
	
	var value = this.value;
	$(".head-icon-wrap").empty();
	if(value>0){
		for(var i=0;i<value;i++){
			var url = '/images/headcount.png';
			var image = new Image();
			image.src = url;
			$(".head-icon-wrap").append(image);
			$(".head-icon-wrap").children().css({"width": "300px", "height": "300px", "float": "left"});
		}
		 $("#whole-people").attr("value","총 "+value+"명 입니다");
		 $("#people-value").attr("value",value);
	}
});
$('input[type=checkbox]').on('change',function(){
	 if ($(this).is(':checked')) {
		 $(this).parent().prev().children().css("border", "8px solid #3da9d4");
	 }else{
		 $(this).parent().prev().children().css("border", "none");
	 }
})
</script>					
</body>
</html>