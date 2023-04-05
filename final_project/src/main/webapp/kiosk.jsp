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
	
	.ui-datepicker {
  	width: 800px !important;
  	height: 828px;
  	margin: 0 auto;
  	left: 610px !important;
  	top: 200px !important;
 	font-size: 30px !important;
	}

	.ui-datepicker-title select{
	width: 250px !important;
	height: 60px !important;
	height: 3.0em;
	}
	.ui-datepicker-month{
	margin-left:20px !important;
	}
	.ui-state-default{
	height: 110px !important;
	}
	.ui-datepicker-calendar>tbody>tr>td{
	width:100px !important;
	height:100px !important;
	}
	.ui-icon{
	top:65% !important;
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
		width:1170px;
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
		height:500px;
	}
	
	
	.btn-wrap{
		width:1070px;
	}
	.btn-wrap>button{
		width:200px;
		height:60px;
		border-radius:5px;
		border: 1px solid #3da9d4;
		margin-left:150px;
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
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
						<input type="text" id="datepicker" name="datepicker">
					</div>
				</div>
			<!-- 키오스크 2페이지 종료 -->
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
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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

//datepicker api 스크립트

$(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
		   
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)      
       $("#datepicker").trigger('focus');
   });




</script>					
</body>
</html>