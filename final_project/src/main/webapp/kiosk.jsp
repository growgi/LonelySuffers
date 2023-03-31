<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.map-wrapper{
		width: 800px;
		margin: 0 auto;
		
	}

</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34"></script>
</head>
<body>
		<!-- 돋보기 모양으로 해보기 -->
		<div class="map-wrapper">
			<div class="col-md-8">
				<div id="map" style="width:800px;height:800px;border-radius:50%;"></div>
			</div>
		</div>




<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>					
</body>
</html>