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
<title>Date Range Picker - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>

<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section">
			<div class="container">
				<div class="row">
						<p>오전에 퇴실하고 오후부터 다른 고객을 받아야 하므로, 고객들에게는 실제 퇴실일을 보여주고, DB에는 빈 방 계산이 편하도록 -1일해서 저장</p>
						<p>bookEnd의 value를 DB에 저장할 때는 moment(bookEnd.val()).subtract(1, 'days').format('YYYY-MM-DD')시켜서 -1일 된 값으로 저장<br>&nbsp;</p>
						<div class="col-md-3">숙박 시작일 선택용<br><input type="text" id="bookStart"></div>
						<div class="col-md-3">숙박 종료일 선택용<br><input type="text" id="bookEnd" placeholder="시작일을 먼저 선택"></div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {


// 이미 결제완료된 날짜들은 invalidDateRanges 변수에 넣음 
			var invalidDateRanges = [
				{ 'start': moment('2023-04-10'), 'end': moment('2023-04-14') },
				{ 'start': moment('2023-04-23'), 'end': moment('2023-04-27') },
				{ 'start': moment('2023-05-03'), 'end': moment('2023-05-07') },
				{ 'start': moment('2023-05-17'), 'end': moment('2023-05-20') }
			];


// 새 예약이 시작하는 날짜를 선택하는 date range picker 생성
			$('#bookStart').daterangepicker({
				locale: {
					format: "YYYY-MM-DD",
					fromLabel: "시작",
					toLabel: "종료"
			    },
			    alwaysShowCalendars: true,
				autoApply: true,
				singleDatePicker: true,
				showDropdowns: true,
				minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
				maxDate: moment().add(3, 'months'),	// 시작일은 3개월 이내에서 지정 가능
				isInvalidDate: function(date) {
					return invalidDateRanges.reduce(function(bool, range) {
						return bool || (date >= range.start && date <= range.end);
					}, false);
				}
			});
			$("#bookStart").val("");	// value 없는 상태로 생성 필요


// 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
			$("#bookStart").on("change", function(){
				const bookStartDate = $("#bookStart").val();	// 시작일을 minDate로 사용
				$('#bookEnd').val(bookStartDate);
	// maxDate는 시작일+3개월로 초기화 
				var maxLimit = moment(bookStartDate).add(3, 'months').format("YYYY-MM-DD");
	// bookStartDate로부터 가장 가까운 미래의 invalidDateRanges로 maxDate를 좁혀줌
				for(let i=invalidDateRanges.length-1; i>=0; i--){
					if(bookStartDate < invalidDateRanges[i].start.format("YYYY-MM-DD")){
						maxLimit = invalidDateRanges[i].start.format("YYYY-MM-DD");
					}
				}

				$('#bookEnd').daterangepicker({
					locale: {
						format: "YYYY-MM-DD",
						fromLabel: "시작",
						toLabel: "종료"
				    },
				    alwaysShowCalendars: true,
					autoApply: true,
					singleDatePicker: true,
					showDropdowns: true,
					minDate: bookStartDate,
					maxDate: maxLimit
				});

				$('#bookEnd').focus();
			});
		});
	</script>

</body>
</html>