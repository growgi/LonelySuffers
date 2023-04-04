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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34"></script>
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<section class="section">
		<div class="container">
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
			<div class="btn-wrap">
				<button class="before"><p>이전으로</p></button>
				<button class="okay"><p>확정</p></button>
				<button class="pass"><p>넘어가기</p></button>
			</div>
		</div>
	</section>
	</div>

<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>

<script>

const map = new naver.maps.Map("map",{
	center : new naver.maps.LatLng(35.469676269413,127.65758671095),
	zoom : 7,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});

</script>					
</body>
</html>