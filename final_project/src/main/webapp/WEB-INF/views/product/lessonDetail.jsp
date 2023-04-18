<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>${lesson.lessonTitle} - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<style>
.product-detail>div{
	margin-top:20px;
	margin-bottom:20px;
}
.nav-item { background-color: #3ac5c8;}
.nav-link { color: #ffffff; }
</style>
</head>


<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>강습 상품</h2>
						<p class="lead">
						<input type="hidden" name="lessonStatus" value="${lesson.lessonStatus }">
						<c:if test="${lesson.lessonStatus == 0}">판매 중지된 상품입니다.
						</c:if>
						</p>
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
					<div class="col-md-5">
						<c:choose>
						<c:when test="${lesson.lessonInfoPic == null }">
						<div class="row" style="height: 450px;">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="waveEffect" style="margin: 0 auto;">
									<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
									<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/lesson/${lesson.lessonInfoPic }" style="width: 100%;"></div>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6 product-detail">
							<p>${lesson.lessonTeacher } 강사</p>
							<hr>
							<div class="row">
								<h1 style="padding-bottom: 40px;">${lesson.lessonTitle }</h1>
								<input type="hidden" name="lessonPrice" value="${lesson.lessonPrice }">
								<h3><span style="font-size: 36px; font-weight: bold;"><fmt:formatNumber value="${lesson.lessonPrice }" pattern="#,###" /></span>원</h3>
								<div class="col-md-6">
								</div>
								<div class="col-md-6">
									<input type="hidden" name="lessonLevel" value="${lesson.lessonMaxNo }">
									<p style="text-align: left; font-size: 22px; font-weight: bold"><span class="label label-primary">
									<c:choose>
										<c:when test="${lesson.lessonLevel == 1}">초급</c:when>
										<c:when test="${lesson.lessonLevel == 2}">중급</c:when>
										<c:when test="${lesson.lessonLevel == 3}">상급</c:when>
									</c:choose>
									</span>&nbsp;
									<span class="label label-info">${lesson.lessonStartTime } ~ ${lesson.lessonEndTime }</span></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									판매량 ()숫자
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>지역 <span>${lesson.lessonCity }</span></p>
						<div>
							<button onclick="goWishList()">관심상품</button>
							<button type="button" data-toggle="modal" data-target="#bookingModal" id="goBooking">예약하기</button>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




<!-- 예약 진행용 Modal -->
  <div class="modal fade bd-example-modal-lg" id="bookingModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div id="bookingArea" class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약하기</h4>
        </div>
        <div class="modal-body">
        <form action="/orderLesson.do" onsubmit="return checkOrder();" method="post">
        	<fieldset>
				<input type="hidden" name="lessonNo" value="${lesson.lessonNo }">
				<select name="lessonPeople">
<!-- 미리 받은 인원 수에 따라 선택지 제한걸도록 작성해야됨 -->
					<option>인원 수를 먼저 선택해주세요.</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
					<option value="7">7명</option>
					<option value="8">8명</option>
				</select>
<!-- 미리 받은 인원 수에 따라 선택지 제한걸도록 작성해야됨 -->
        		<div class="row">
						<input type="text" name="lessonBookDate" id="bookStart" placeholder="강습일" required disabled>
        		</div>
				<input type="hidden" name="lessonBookPrice">
				<button type="submit">주문</button>
        	</fieldset>
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>




<!-- 상품 정보 표시 시작 -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 card mt-3 tab-card">
						<div class="row tab-card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item active">
									<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">상품설명</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">상품평</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="Three" aria-selected="false">상품문의</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade p-3 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
								${lesson.lessonInfo }</div>
							<div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab">
								상품 평 div</div>
							<div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab">
								상품 문의 div</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-body" style="height: 600px; overflow: clip">광고 등 배너 영역<br>높이 600px을 넘는 사진은 종횡비는 고정하되 아래쪽을 잘라서 출력됨</div>
						</div>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->





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
	//url로부터 lessonNo값 알아내기
		const ltrim = /^\S{0,}lessonNo=/;
		const currentUrl = window.location.href;
		const needRtrim = currentUrl.replace(ltrim, "");
		const rtrim = /[&]\S{0,}$/;
		const lessonNoFromUrl = needRtrim.replace(rtrim, "");
	//url로부터 lessonNo 도출 끝

		const lessonPeopleMax = $("[name=lessonMaxNo]").val();
console.log("★ 강습 정원 "+ lessonPeopleMax+"명 ★");

	// 예약하기 modal 띄우면 실행되는 함수 시작
	$("#goBooking").on("click", function(){
		$("[name=lessonPeople]").on("change", function(){
			const lessonCapa = lessonPeopleMax - $("[name=lessonPeople]").val();
console.log($("[name=lessonPeople]").val() +"명을 예약하려고 함");
console.log("강습정원 - 지금 예약할 인원 수 = " + lessonCapa +"(필요한 남은 자리 수)");
		// 이미 결제완료 인원 된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax
			if($("[name=lessonPeople]").val()>=1){
				$.ajax({
					url : "/bookOneLesson.do",
					data: {lessonNo : lessonNoFromUrl},
					dataType : "json",
					success : function(List){
						let invalidDateRanges = [];
						for(let i=0; i<List.length; i++){
console.log(List[i].lessonBookDate +"에는 결제완료 상태의 인원이 이미 "+ List[i].lessonPeople +"명 있음");
							if(List[i].lessonPeople > lessonCapa){
console.log("남은 자리가 "+ $("[name=lessonPeople]").val() +"이 안 되므로 "+ List[i].lessonBookDate +"는 막음");
							invalidDateRanges[i] = { 'start': moment(List[i].lessonBookDate), 'end': moment(List[i].lessonBookDate) };}
						}

					// 선택된 인원 수 바뀔 때마다 날짜 관련 데이터들 모두 초기화
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookStart").prop("disabled", false);

					// 예약일을 선택하는 date range picker 생성
						$('#bookStart').daterangepicker({
						    parentEl: "#bookingArea .modal-body",
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
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);	// value 없는 상태로 생성 필요
					},
					error : function(){
						console.log("인원 수를 먼저 선택해주세요에 focus됨");
						$(".daterangepicker").remove();
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookStart").prop("disabled", true);
					}
				});
			}else{
				$("#bookStart").val("");
				$("#bookStart").attr("value", null);
				$("#bookStart").prop("disabled", true);
			}
		});
	});
	// 예약하기 modal 띄우면 실행되는 함수 끝


	// input에 값이 없으면 form 제출을 막는 함수
	function checkOrder(){
		if ( $("[name=lessonBookDate]").val() == "" ) {
			alert('강습일을 선택해주십시오.');
			return false;
		}
		fullPrice();
		return true;
	}


	// lessonBookPrice를 계산하는 함수
	const onePersonPrice = $("[name=lessonPrice]").val();
	function fullPrice(){
		return Number(onePersonPrice) * Number($("[name=lessonPeople]").val());
	}


	// 나의 관심상품
	function goWishList(){
		const lessonNo = $("[name=lessonNo]").val();
		const lessonStatus = $("[name=lessonStatus]").val();
			if(lessonStatus==1){
				$.ajax({
					url : "/insertWishList.do",
					data: {house_no : 0, lesson_no : lessonNo},
					dataType : "text",
					success : function(message){
						alert(message);
					},
					error : function(){
						alert("알 수 없는 오류가 발생했습니다.");
					}
				});
			}else{
				alert("판매중인 상품이 아닙니다.");
			}
	}

	</script>

</body>
</html>