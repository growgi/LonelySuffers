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
		overflow:hidden;
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
		margin-right:50px;
		line-height:100px;
		color:rgb(51, 51, 51);
	}
	.map-wrapper{
		width: 1000px;
		
	}
	
	.scroll-wrapper{
		position:relative;
		float:right;
		width:300px;
		z-index: 2;
	}
	#scroll{
		position:absolute;
		top:0px;
		left:0px;
		overflow:hidden;
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
		width:1200px;
		height:600px;
	}
	#daterangepicker{
		margin-top:50px;
	}
	.headcount-wrap{
		width:1200px;
		height:800px;
		margin-top: 50px;
		overflow:hidden;
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
	.option-select{
		width:1200px;
		height:600px;
		margin-top:50px;
	}
	.rooms-wrap{
		width:1200px;
		background-color:beige;
		overflow:hidden;
	}
	.roomList{
		width:400px;
		height:500px;
		float:left;
	}
	.roomImage{
		width:398px;
		height:398px;
		border: 1px solid rgb(51, 51, 51);
	}
	.info-wrap{
		width:398px;
		height:98px;
		border: 1px solid rgb(51, 51, 51);
		border-top-style:none
	}
	.info-wrap>p{
		text-align:center;
		font-weight:800;
		color:rgb(51, 51, 51);
		margin-bottom:5px;
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
	.lessons-wrap{
		width:1200px;
		height:400px;
		background-color:red;
	}
	.lessonList{
		width:400px;
		height:500px;
		float:left;
	}
	.lessonImage{
		width:398px;
		height:398px;
		border: 1px solid rgb(51, 51, 51);
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
		margin-top:15px;
		margin-bottom:15px;
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
<script src="resources/js/MarkerClustering.js"></script>
<!-- daterangepicker -->
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<section class="section">
		<!-- 스크롤 메뉴 -->
				<div class="scroll-wrapper">  
       				 <div id="scroll">
       				 	<span class="money"><span class="stat-count">150000</span>원</span>
           				<img class="money-emoji" src="/resources/images/won.png">
           				<input type="text" id="current-page" value="1">
        			</div>  
				</div> 
		<div class="container">
			<!-- 키오스크 1페이지 -->
			<div class="content-wrapper">
				<div class="title-wrapper">
					<img src="/resources/images/wave.png">	
					<img src="/resources/images/palm-tree.png">
					<span class="title">어디로 떠나볼까요~?</span>
					<img src="/resources/images/palm-tree.png">
					<img src="/resources/images/wave.png">
					<div class="values-wrapper">
						
					</div>
				</div>
				
				<!-- 돋보기 모양으로 해보기 -->
				<div class="pages page1">
					<div class="map-wrapper">
					<div class="row">
						<div class="col-md-8">
							<div class="circle-wrap">
								<div class="circle" style="background-image:url(/resources/images/magnify.png)">
									<div class="map">
									<div id="map" style="width:580px;height:580px;border-radius:50%;"></div>
										</div>
									</div>
							</div>
						</div>
					</div>
					</div>
					<div class="btn-wrap" id="page1">
						<button class="page1-before" onClick="location.href='/'"><p>메인으로</p></button>
						<button class="page1-okay"><p>확정</p></button>
						<button class="page1-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 1페이지 종료 -->
				<!-- 키오스크 2페이지 -->
				<div class="pages page2">
					<div class="calendar-wrap">
						<div>
						<input type="text" id="daterangepicker" name="daterangepicker" readonly>
						</div>
						<div>
						<input type="text" id="travel-days" value="0박 0일"readonly>
						<!-- hidden으로 숨겨놓았다가 나중에 쓸 값 -->
						<input type="hidden" id="bookStartDate" value="" >
						<input type="hidden" id="bookEndDate" value="" >
						</div>
					</div>
					<div class="btn-wrap" id="page2">
						<button class="page2-before"><p>이전으로</p></button>
						<button class="page2-okay"><p>확정</p></button>
						<button class="page2-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 2페이지 종료 -->
				<!-- 키오스크 3페이지 -->
				<div class="pages page3">
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
					<div class="btn-wrap" id="page3">
						<button class="page3-before"><p>이전으로</p></button>
						<button class="page3-okay"><p>확정</p></button>
						<button class="page3-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 3페이지 종료 -->
				<!-- 키오스크 4페이지(숙소 옵션을 미리 선택) -->
				<div class="pages page4">
					<div class="option-select">
						<div class="barbecue">
							<div>
							<img src="/resources/images/barbecue.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="barbecue" value="barbecue">
								<label for="barbecue"></label>
								<div class="option-name"><p>바베큐</p></div>
							</div>
							<input type="hidden" id="barbecue-choice" value="0">
						</div>
						<div class="party">
							<div>
								<img src="/resources/images/party.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="party" value="party">
								<label for="party"></label>
								<div class="option-name"><p>파티</p></div>
							</div>
							<input type="hidden" id="party-choice" value="0">
						</div>
					</div>
					<div class="btn-wrap" id="page4">
						<button class="page4-before"><p>이전으로</p></button>
						<button class="page4-okay"><p>확정</p></button>
						<button class="page4-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 4페이지 종료 -->
				<!-- 키오스크 5페이지 숙소리스트 -->
				<div class="pages page5">
					<div class="rooms-wrap">
					
					</div>
					<div class="btn-wrap" id="page5">
						<button class="page5-before"><p>이전으로</p></button>
						<button class="page5-okay"><p>확정</p></button>
						<button class="page5-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 5페이지 숙소리스트 종료-->
				<!-- 키오스크 6페이지 -->
				<div class="pages page6">
					<div class="level-select">
					<!-- 중복선택이 가능하게 -->
						<div class="level1">
							<div>
							<img src="/resources/images/level1.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level1" value="1">
								<label for="level1"></label>
								<div class="level-name"><p>초급</p></div>
								<input type="text" id="level1-choice" value="0">
							</div>
						</div>
						<div class="level2">
							<div>
								<img src="/resources/images/level2.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level2" value="2">
								<label for="level2"></label>
								<div class="level-name"><p>중급</p></div>
								<input type="text" id="level2-choice" value="0">
							</div>
						</div>
						<div class="level3">
							<div>
							<img src="/resources/images/level3.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level3" value="3">
								<label for="level3"></label>
								<div class="level-name"><p>상급</p></div>
								<input type="text" id="level3-choice" value="0">
							</div>
						</div>
					</div>
					<div class="btn-wrap" id="page6">
						<button class="page6-before"><p>이전으로</p></button>
						<button class="page6-okay"><p>확정</p></button>
						<button class="page6-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 6페이지 종료-->
				<!-- 키오스크 7페이지 강습리스트 -->
				<div class="pages page7">
					<div class="lessons-wrap">
						
					</div>
					<div class="btn-wrap" id="page7">
						<button class="page7-before"><p>이전으로</p></button>
						<button class="page7-okay"><p>확정</p></button>
						<button class="page7-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 7페이지 강습리스트 종료-->
				<!-- 키오스크 8페이지 -->
				<div class="pages page8">
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
					<div class="btn-wrap" id="page8">
						<button class="page8-before"><p>이전으로</p></button>
						<button class="page8-okay"><p>확정</p></button>
						<button class="page8-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 8페이지 종료 -->
				<!-- 키오스크 9페이지 -->
				<div class="pages page9">
					<div class="last-page">
						<img src="/resources/images/shaka.png">
					</div>
					<div class="btn-wrap" id="page9">
						<button class="page9-before"><p>이전으로</p></button>
						<button class="page9-okay"><p>확정</p></button>
						<button class="page9-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 9페이지 종료 -->
			<!-- 기본 버튼랩 양식 
				<div class="btn-wrap">
					<button class="before"><p>이전으로</p></button>
					<button class="okay"><p>확정</p></button>
					<button class="pass"><p>넘어가기</p></button>
				</div>
			 -->
			
			</div><!-- content-wrapper 종료 -->
		</div>
	</section>
	</div>

<!-- 기본 .js 파일들 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<!-- <script src="resources/js/parallax.js"></script> -->
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>



<script>
//markers배열
var markers = [];

//네이버지도 스크립트
const map = new naver.maps.Map("map",{
	center : new naver.maps.LatLng(35.469676269413,127.65758671095),
	zoom : 6,
	maxZoom : 7,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});



$(document).ready(function(){
	var htmlMarker1 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-1.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker2 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-2.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker3 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-3.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker4 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-4.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker5 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-5.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    };

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

	var markerClustering = new MarkerClustering({
        minClusterSize: 2,
        maxZoom: 8,
        map: map,
        markers: markers,
        disableClickZoom: false,
        averageCenter: true, 
        gridSize: 120,
        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
        indexGenerator: [10, 100, 200, 500, 1000],
        stylingFunction: function(clusterMarker, count) {
            $(clusterMarker.getElement()).find('div:first-child').text(count);
       		 },
       	getCenter: function() {
       		
       		return this._clusterCenter;
       		},
       	 getClusterMember: function() {
       	    return this._clusterMember;
       	  }
       		 
 		 });
	console.log(markerClustering);
	var test1 = markerClustering.getCenter;
	console.log(test1());

	naver.maps.Event.addListener(map, "click", function(e){
		alert("클릭함");
		});
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
    //위로 넘겨줄 value값
    var startVal = start.format('YYYY-MM-DD');
    var endVal = end.format('YYYY-MM-DD');
    
    
    
    var date1 = new Date(start.format('YYYY-MM-DD'));
    var date2 = new Date(end.format('YYYY-MM-DD'));
    var result = date1.getInterval(date2);
    
    $("#travel-days").attr("value",result+"박"+(result+1)+"일");
    //bookStartDate와 bookEndDate
    $("#bookStartDate").attr("value",startVal);
    $("#bookEndDate").attr("value",endVal);
});

//daterangepicker에 placeholder 삽입
$("#daterangepicker").val('');
$("#daterangepicker").attr("placeholder","여행을 떠날 날짜를 골라주세요:)");

//날짜의 차이를 구하는 함수
Date.prototype.getInterval = function (otherDate) {
    var interval;
 
    if(this > otherDate)
        interval = this.getTime() - otherDate.getTime();
    else
        interval = otherDate.getTime() - this.getTime();
 
    return Math.floor(interval / (1000*60*60*24));
}

//고른 인원수에 따른 아이콘 추가
$("#headcount").on('change',function(){
	
	var value = this.value;
	$(".head-icon-wrap").empty();
	if(value>0){
		for(var i=0;i<value;i++){
			var url = '/resources/images/headcount.png';
			var image = new Image();
			image.src = url;
			$(".head-icon-wrap").append(image);
			$(".head-icon-wrap").children().css({"width": "300px", "height": "300px", "float": "left"});
		}
		 $("#whole-people").attr("value","총 "+value+"명 입니다");
		 $("#people-value").attr("value",value);
	}
});
//체크박스 선택시 테두리 변경
$('input[type=checkbox]').on('change',function(){
	 if ($(this).is(':checked')) {
		 $(this).parent().prev().children().css("border", "8px solid #3da9d4");
	 }else{
		 $(this).parent().prev().children().css("border", "none");
	 }
})
//체크박스 선택시 값 전달(바베큐 옵션)
$("#barbecue").on('click',function(){
	if($(this).prop('checked')){
		$("#barbecue-choice").attr("value",1);
	} else{
		$("#barbecue-choice").attr("value",0);
	}
});
//체크박스 선택시 값 전달(파티 옵션)
$("#party").on('click',function(){
	if($(this).prop('checked')){
		$("#party-choice").attr("value",1);
	} else{
		$("#party-choice").attr("value",0);
	}
})

//체크박스 선택시 값 전달(초급레벨)
$("#level1").on('click',function(){
	if($(this).prop('checked')){
		$("#level1-choice").attr("value",1);
	} else{
		$("#level1-choice").attr("value",0);
	}
});
//체크박스 선택시 값 전달(중급레벨)
$("#level2").on('click',function(){
	if($(this).prop('checked')){
		$("#level2-choice").attr("value",1);
	} else{
		$("#level2-choice").attr("value",0);
	}
})
//체크박스 선택시 값 전달(상급레벨)
$("#level3").on('click',function(){
	if($(this).prop('checked')){
		$("#level3-choice").attr("value",1);
	} else{
		$("#level3-choice").attr("value",0);
	}
})

//숙소 리스트를 가지고 오는 ajax
$.ajax({
	
})




//따라다니는 메뉴

$("document").ready(function() {  
    
    $(window).scroll(function()  
    {  
        $('#scroll').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});    
    });  
  
});  

//페이지별 버튼 동작
//page1 지역 선택
	$(".page1-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		$(".pages").hide();
		$(".page2").show();
		$(".title").text("언제 떠나실건가요~?")
		$("#current-page").attr("value",2);
	})
	$(".page1-pass").on('click',function(){
		alert("지역은 꼭 정해주셔야해요:)")
	})
//page2 날짜 선택
	$(".page2-before").on('click',function(){
		$(".pages").hide();
		$(".page1").show();
		$(".title").text("어디로 떠나볼까요~?")
		$("#current-page").attr("value",1);
	})
	$(".page2-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($("#travel-days").val().indexOf("0박") !== -1){
			alert("날짜는 꼭 정해주셔야해요:)")
		}else{
			$(".pages").hide();
			$(".page3").show();
			$(".title").text("몇 명이신가요~?");
			$("#current-page").attr("value",3);
		}
	});
	$(".page2-pass").on('click',function(){
		alert("날짜는 꼭 정해주셔야해요:)")
	})
//page3 인원수 선택
	$(".page3-before").on('click',function(){
		$(".pages").hide();
		$(".page2").show();
		$(".title").text("언제 떠나실건가요~?");
		$("#current-page").attr("value",2);
		
	})
	$(".page3-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($("#people-value").val() == ""){
			alert("인원수는 꼭 정해주셔야해요:)")
		}else{
			$(".pages").hide();
			$(".page4").show();
			$(".title").text("옵션을 골라주세요~!");
			$("#current-page").attr("value",4);
		}
	});
	$(".page3-pass").on('click',function(){
		alert("인원수는 꼭 정해주셔야해요:)")
	})
//page4 숙소옵션선택
	$(".page4-before").on('click',function(){
		$(".pages").hide();
		$(".page3").show();
		$(".title").text("옵션을 골라주세요~!")
		$("#current-page").attr("value",3);
	})
	$(".page4-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
			$(".pages").hide();
			$(".page5").show();
			$(".title").text("조건에 맞는 방 리스트예요~!")
		//숙소 리스트 ajax
			const result = $(".rooms-wrap");
			const bookStartDate = $("#bookStartDate").val();
			const bookEndDate = $("#bookEndDate").val();
			const roomCapa = $("#people-value").val();
			const houseBarbecue = $("#barbecue-choice").val();
			const houseParty = $("#party-choice").val();
			result.empty();
			$.ajax({
				url : "/roomList.do",
				type : "get",
				data : {bookStartDate : bookStartDate, bookEndDate : bookEndDate, roomCapa : roomCapa, houseBarbecue : houseBarbecue, houseParty : houseParty},
				dataType : "json",
				success : function(data){
					console.log(data);
					for(let i=0;i<data.length;i++){
						const div=$("<div class=roomList></div>");
						console.log(data[i].houseTitle);
						console.log(data[i].roomCapa+"명");
						console.log("바베큐값:"+data[i].houseBarbecuePrice+"원");
						console.log("ajax");
						
						const imageWrap = $("<div class=image-wrap></div>");
						imageWrap.append("<img class=roomImage src=resources/upload/house/" + data[i].housePhoto1 + " />");
						div.append(imageWrap);
						
						const infoWrap = $("<div class=info-wrap></div>");
						infoWrap.append("<p>"+data[i].houseTitle+"</p>");
						if(data[i].houseBarbecuePrice == 0 && data[i].housePartyPrice > 0){
							infoWrap.append("<p>"+data[i].roomCapa+"인실 "+"바베큐옵션(X),파티옵션(O)</p>");
						}else if(data[i].houseBarbecuePrice > 0 && data[i].housePartyPrice == 0){
							infoWrap.append("<p>"+data[i].roomCapa+"인실 "+"바베큐옵션(O),파티옵션(X)</p>");
						}else if(data[i].houseBarbecuePrice > 0 && data[i].housePartyPrice > 0){
							infoWrap.append("<p>"+data[i].roomCapa+"인실 "+"바베큐옵션(O),파티옵션(O)</p>");
						}else{
							infoWrap.append("<p>"+data[i].roomCapa+"인실 "+"바베큐옵션(X),파티옵션(X)</p>");
						}
						infoWrap.append("<p>기본 1박 : "+data[i].housePrice+"원</p>");
						div.append(infoWrap);
						
						result.append(div);
						//result.addClass('roomList')
					}
				},
					error : function(){
						console.log("숙소리스트 불러오기 에러");
					}
			});
			$("#current-page").attr("value",5);
	});
	$(".page4-pass").on('click',function(){
		
		var result = confirm("숙소 옵션은 필요없으신가요?");
		if(result == true){
			alert("옵션선택을 건너뜁니다");
			$(".pages").hide();
			$(".page6").show();
			$(".title").text("조건에 맞는 방 리스트예요~!");
			$("#current-page").attr("value",5);
		}else{
			alert("숙소를 골라주세요");
		}
	})
//page5 숙소리스트
	$(".page5-before").on('click',function(){
		$(".pages").hide();
		$(".page4").show();
		$(".title").text("조건에 맞는 방 리스트예요~!");
		$("#current-page").attr("value",4);
	})
	$(".page5-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($("#travel-days").val().indexOf("0박") !== -1){
			alert("날짜는 꼭 정해주셔야해요:)")
		}else{
			$(".pages").hide();
			$(".page6").show();
			$(".title").text("원하시는 강습레벨을 골라주세요");
			$("#current-page").attr("value",6);
		}
	});
	$(".page5-pass").on('click',function(){
		var result = confirm("숙소는 필요없으신가요?");
		if(result == true){
			alert("숙소선택을 건너뜁니다");
			$(".pages").hide();
			$(".page6").show();
			$(".title").text("원하시는 강습레벨을 골라주세요");
			$("#current-page").attr("value",6);
		}else{
			alert("숙소를 골라주세요");
		}
	})
//page6 레벨선택
	$(".page6-before").on('click',function(){
		$(".pages").hide();
		$(".page5").show();
		$(".title").text("조건에 맞는 방 리스트예요~!")
		$("#current-page").attr("value",5);
	})
	$(".page6-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
			$(".pages").hide();
			$(".page7").show();
			$(".title").text("조건에 맞는 강습 리스트예요~!")
		//숙소 리스트 ajax
			const result = $(".lessons-wrap");
			const bookStartDate = $("#bookStartDate").val();
			const bookEndDate = $("#bookEndDate").val();
			const lessonMaxNo = $("#people-value").val();
			const level1 = $("level1-choice").val();
			const level2 = $("level2-choice").val();
			const level3 = $("level3-choice").val();
			
			/*
			if($("level1-choice").val() == 1){
				const level1 = 1;
			}else{
				const level1 = 0;
			}
			if($("level2-choice").val() == 1){
				const level2 = 2;
			}else{
				const level2 = 0;
			}
			if($("level3-choice").val() == 1){
				const level3 = 3;
			}else{
				const level3 = 0;
			}
			*/
			result.empty();
			$.ajax({
				url : "/lessonList.do",
				type : "get",
				data : {lessonMaxNo : lessonMaxNo, level1 : level1, level2 : level2, level3 : level3},
				dataType : "json",
				success : function(data){
					console.log(data);
					for(let i=0;i<data.length;i++){
						const div=$("<div class=lessonList></div>");
						console.log(data[i].lessonTitle);
						console.log(data[i].lessonMaxNo+"명");
						
						console.log("레슨 ajax");
						
						const imageWrap = $("<div class=image-wrap></div>");
						imageWrap.append("<img class=lessonImage src=resources/upload/lesson/" + data[i].lessonInfoPic + " />");
						div.append(imageWrap);
						
						const infoWrap = $("<div class=info-wrap></div>");
						infoWrap.append("<p>"+data[i].lessonTitle+"</p>");
						if(data[i].lessonLevel == 1){
							infoWrap.append("<p>초급레벨 ("+data[i].lessonStartTime+"~"+data[i].lessonEndTime+")</p>");
						}else if(data[i].lessonLevel == 2){
							infoWrap.append("<p>중급레벨 ("+data[i].lessonStartTime+"~"+data[i].lessonEndTime+")</p>");
						}else if(data[i].lessonLevel == 3){
							infoWrap.append("<p>고급레벨 ("+data[i].lessonStartTime+"~"+data[i].lessonEndTime+")</p>");
						}
						infoWrap.append("<p>1인 가격 : "+data[i].lessonPrice+"원</p>");
						div.append(infoWrap);
						
						result.append(div);
					}
				},
					error : function(){
						console.log("레슨리스트 불러오기 에러");
					}
			});
			$("#current-page").attr("value",5);
	});
	$(".page6-pass").on('click',function(){
		alert("강습레벨은 꼭 정해주셔야해요:)")
	});
	
	
//뒤로가기 막기

// 스택 추가

history.pushState({page: 1}, null, location.href); 

// 뒤로가기 이벤트감지 -> 현재페이지로 이동

window.onpopstate = function() { 
	
	if($("#current-page").val() == 1){
		var result = confirm("이대로 나가시면 저장된 정보가 사라집니다 나가시겠습니까?");
		if(result == true){
			$(".page1-before").trigger("click");
		}else{
			alert("지역을 골라주세요");
		}
		
	}else if($("#current-page").val() == 2){
		  $(".page2-before").trigger("click");
	}else if($("#current-page").val() == 3){
		  $(".page3-before").trigger("click");
	}else if($("#current-page").val() == 4){
		  $(".page4-before").trigger("click");
	}else if($("#current-page").val() == 5){
		  $(".page5-before").trigger("click");
	};
	history.pushState(null, null, location.href); 
	//history.go(1);
	
}


</script>					
</body>
</html>