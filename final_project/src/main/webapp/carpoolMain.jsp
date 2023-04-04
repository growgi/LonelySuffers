<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers-Carpool Main</title>
<link rel="stylesheet" href="css/carpool/carpoolMain.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- section은 container의 바탕(배경색)을 담당합니다. -->
<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section transheader homepage parallax" style="background-image: url('capool-img/surftruck2.png'); opacity:0.7">
<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
<div class="title" style="padding-top: 100px; padding-left: 40px; color: #000;">
	<h2 style="color: black;">카풀</h2>
	<h3 style="color: black; font-weight: bold;">함께하면 더 즐거운 서핑!</h3>
</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<section class="section" style="padding-top: 50px; padding-bottom: 10px;" >
			<div class="container">
				<div class="row" style="border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;" >함께가요</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">마이카풀</p>
					</div>
					<div class="filter" style="float: right;">
						<span class="material-symbols-outlined">edit_note</span>
						<span class="material-symbols-outlined" style="display: inline-block; width: 50px; height: 30px;" >filter_alt</span>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->


		<!--출발일, 등록일 내림차순-->
		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container">
				<div class="row">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="col-md-2"><span class="material-symbols-outlined departDate">arrow_upward</span>출발일</div>
					<div class="col-md-2"><span class="material-symbols-outlined writeDate">arrow_upward</span>등록일</div>
				</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<section class="section" style="padding-top: 0px; padding-bottom: 0px; margin-left: 80px; ">
			<div class="container">
				<div class="row" style="background-color: red; border-radius: 20px; width: 900px; margin-left: 70px; padding-left: 20px; padding-top: 25px; padding-bottom: 70px; background-color: #ceedc7;">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="col-md-2"></div>
					<div class="onewayRound" style="margin-bottom:20px;">onewayRound</div><br>
					<div class="capacity" style="padding: 5px 10px; display: inline-block; float: left; ">1/2 명 모집</div>
					<div class="col-md-7">
						<div class="journey">
							<img src="capool-img/destination.png" style="height: 50px; width: 45px; margin-left: 50px; float: left;">
							<div class="location-wrapper" style="height: 50px; float: left; margin-left: 27px;">
								<div class="departRegion" style="float: left;">
									<div class="region" style="float: left">departureRegion</div>
									<div class="district" style="float:left">departDestrict</div>
								</div><br>
								<div class="arrivalRegion" style="float: left;">
									<div class="region" style="float: left">arrivalRegion</div>
									<div class="district" style="float:left">arrivalDestrict</div>
								</div><br>
								<div class="additional-info">
									<div class="boardStorage">#보드수납가능</div>
									<div class="driverMsg">#드라이버 할말</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<!--모달 -->
		<div class="container">
		  
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
			  <div class="modal-dialog">
			  
				<!-- Modal content-->
				<div class="modal-content">
				  <div class="modal-header" style="padding:5px 5px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				  </div>
				  <div class="modal-body" style="padding:5px 5px;">
					<form role="form">
					  <div class="form-group">
						<label for="usrname">출발</label>
						<input type="text" class="form-control" id="city" placeholder="시/도">
						<input type="text" class="form-control" id="city" placeholder="시/도">
						<div class="time-selection" id="am" onclick="selectTime('am')" onmouseover="mouseOver('am')" onmouseout="mouseOut('am')">오전</div>
						<div class="time-selection" id="pm" onclick="selectTime('pm')" onmouseover="mouseOver('pm')" onmouseout="mouseOut('pm')">오후</div>
						
					  </div>
					  <div class="form-group">
						<label for="usrname">도착</label>
						<input type="text" class="form-control" id="city" placeholder="시/도">
						<input type="text" class="form-control" id="minprice" placeholder="최저가">
						<input type="text" class="form-control" id="maxprice" placeholder="최고가">
					  </div>
					  <div class="check-box-wrap">
						<div class="check-box left">
							<input type="radio" id="one-way" name="trip-type" value="편도" style="display:none;" onclick="selectOneWay()"><label for="one-way"><span class="material-symbols-outlined">check</span>편도</label>
						</div>
						<div class="check-box right">
							<input type="radio" id="round-trip" name="trip-type" value="왕복" style="display:none;" onclick="selectRoundTrip()"><label for="round-trip"><span class="material-symbols-outlined">check</span>왕복</label><br>
						</div>
						<div class="check-box left">
							<input type="radio" id="recruiting" name="recruit" value="모집중" style="display:none;" onclick="recruiting()"><label for="recruiting"><span class="material-symbols-outlined">check</span>모집중</label>
						</div>
						<div class="check-box right">
							<input type="radio" id="closed" name="recruit" value="모집완료" style="display:none;" onclick="closed()"><label for="closed"><span class="material-symbols-outlined">check</span>모집완료</label>
						</div>
					  </div>
					
					  
						<button type="submit" class="btn btn-block">초기화</button>
						<button type="submit" class="btn btn-block">적용</button>
				  </div>
				  <div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>나가기</button>
				  </div>
				</div>
			  </div>
			</div> 
		  </div>
		<section class="section">
			<div class="container">


<!-- section ＞  container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">

			</div><!-- end container -->
		</section><!-- end section -->




		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	<script>
		$(document).ready(function(){
		  $(".filter").click(function(){
			$("#myModal").modal();
		  });
		});

	$(document).ready(function(){
		$("#myBtn").click(function(){
			$("#myModal").modal();
		});
		});
		function selectTime(time) {
					var selected = document.querySelector('.time-selection.selected');
					if (selected) {
						selected.classList.remove('selected');
					}
					document.getElementById(time).classList.add('selected');
					alert("선택된 시간: " + time);
				}

		function mouseOver(time) {
			var element = document.getElementById(time);
			if (!element.classList.contains('selected')) {
				element.style.backgroundColor = '#f2f2f2';
			}
		}

		function mouseOut(time) {
			var element = document.getElementById(time);
			if (!element.classList.contains('selected')) {
				element.style.backgroundColor = '';
			}
		}
</script>
		</script>

</body>
</html>


