<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.map-wrapper{
		width: 1000px;
		margin: 0 auto;
	}
	.circle-wrap{
		width: 1200px;
		height: 1200px;
	}
	.circle{
		background-repeat: no-repeat;
		background-size: 930px 930px;
	}
	.map{
		width:550px;
		height:1000px;
		margin-left: 285px;
		padding-top: 65px
	}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34"></script>
</head>
<body>
		<!-- 돋보기 모양으로 해보기 -->
		<div class="map-wrapper">
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




<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>					
</body>
</html>