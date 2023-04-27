<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>회사소개 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>
<style>
.map-title>h2{
   text-align: center;
}
.map-title>h4{
   text-align: center;
   padding-top: 10px;
   padding-bottom: 10px;
}
.transport-way{
   width : 800px;
   padding-top : 10px;
   margin : 0 auto;
   border-top:1px solid #222;
   border-bottom:1px solid #222;
}

.transport-way>table>tbody>tr>th{
   width : 150px;
   padding-top:20px;
   padding-top:20px;
   padding-bottom:20px;
}
.addr{
   float: left;
}
.bus{
   float: left;
}

.subway{
   float: left;
}
#map{
   margin : 0 auto;
}




</style>


<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">회사소개</h2>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		<section class="section">
			<div class="container">
				<div class="row">
				<div class="page-content">
			      <div class="map-wrap">
			         <div class="map-title">
			            <h2>Lonely Surfers</h2>
			            <h4>서퍼가 꿈이라면 지금이 기회다!!!</h4>
			         </div>
			         <div class="transport-way">
			            <table>
			            	<tr>
			            		<th>Lonely Surfers란</th>
			            		<td>대한민국 서퍼들에게 서핑과 숙소, 즐길거리를 제공하는 소셜 플랫폼</td>
			            	</tr>
			            	<tr>
			            		<th><h2>오시는 길</h2></th>
			            	</tr>
			               <tr>
			                  <th class="addr">주소</th>
			                  <td>서울특별시 영등포구 선유동2로57 이레빌딩(구관)19F, 20F</td>
			               </tr>
			               <tr colspan="2" style="width: 100px;">
			                  <th class="bus">버스</th>
			                  <td class="bus-stop">선유고등학교 / (구)강서세무서
			                     <div class="bus-stop1"
			                        style="line-height: 30px; padding-bottom: 5px;">
			                        <img src="/resources/images/bluebus.jpg" style="padding-right: 5px;">7612
			                        <img src="/resources/images/redbus.jpg"
			                           style="padding-left: 10px; padding-right: 5px;">1000/1200/1300/1301/1302/1400/1500/1601/M6628/M6724
			                     </div> 당산역
			                     <div class="bus-stop2" style="line-height: 30px;">
			                        <img src="/resources/images/bluebus.jpg" style="padding-right: 5px;">602/760/5620/5714/6514/6623/6631
			                     </div>
			                  </td>
			               </tr>
			               <tr>
			                  <th class="subway">지하철</th>
			                  <td>지하철 2,9호선 당산역 12번 출구 400ms</td>
			               </tr>
			            </table>
			         </div>
			         <div id="map" style="width: 800px; height: 400px; margin-top: 20px;"></div>
			      </div>
			   </div>
			   <script type="text/javascript"
			      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aeb5277f30b71fe0fa8ba0caac43e667"></script>
			   <script>
			      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			      mapOption = {
			         center : new kakao.maps.LatLng(37.5338151, 126.8969784), // 지도의 중심좌표
			         level : 3
			      // 지도의 확대 레벨
			      };
			
			      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			      // 마커가 표시될 위치입니다 
			      var markerPosition = new kakao.maps.LatLng(37.5338151, 126.8969784);
			
			      // 마커를 생성합니다
			      var marker = new kakao.maps.Marker({
			         position : markerPosition
			      });
			
			      // 마커가 지도 위에 표시되도록 설정합니다
			      marker.setMap(map);
			   </script>
				
				
				
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>