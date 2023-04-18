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
<title>${house.houseTitle} - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<style>
.clickToLarger {
	width: 80px;
	height: 80px;
}
.clickToLarger:hover { cursor: pointer; }
.onViewing { border: 4px solid #3ac5c8; }
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
						<h2>숙박 상품</h2>
						<p class="lead">
						<input type="hidden" name="houseStatus" value="${house.houseStatus }">
						<c:if test="${house.houseStatus == 0}">판매 중지된 상품입니다.
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
						<c:when test="${house.housePhoto1 == null }">
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
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/house/${house.housePhoto1 }" style="width: 100%;"></div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
							<ul class="pagination" style="text-align: center;">
								<li style="margin: 5px;"><img class="clickToLarger onViewing" src="resources/upload/house/${house.housePhoto1 }"></li>
								<c:if test="${house.housePhoto2 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto2 }"></li>
								</c:if>
								<c:if test="${house.housePhoto3 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto3 }"></li>
								</c:if>
								<c:if test="${house.housePhoto4 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto4 }"></li>
								</c:if>
							</ul>
							</div>
						</div>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6 product-detail">
							<input type="hidden" name="houseNo" value="${house.houseNo }">
							<input type="hidden" name="roomTitle" value="${house.roomTitle }">
							<p>${house.roomTitle }</p>
							<hr>
							<div class="row">
								<h1 style="padding-bottom: 40px;">${house.houseTitle }</h1>
								<input type="hidden" name="housePrice" value="${house.housePrice }">
								<h3><span style="font-size: 36px; font-weight: bold;"><fmt:formatNumber value="${house.housePrice }" pattern="#,###" /></span>원/1박</h3>
								<div class="col-md-9">
									<p style="text-indent: 10px;"><a href="#" data-toggle="tooltip" data-placement="right" title="주말(입실일 기준 금/토)에는 1.5배의 할증이 있습니다. 성수기(6월~8월)에는 1.2배의 할증이 추가로 붙습니다.">( ※ 비성수기 평일 기준 )</a></p>
								</div>
								<div class="col-md-3">
									<input type="hidden" name="roomCapa" value="${house.roomCapa }">
									<p style="text-align: left; font-size: 22px; font-weight: bold"><span class="label label-primary">${house.roomCapa }인실</span></p>
								</div>
							</div>
							<div class="row" style="margin-top: 30px;">
								<div class="col-md-3">
									판매량 ()숫자
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>주소지 <span>${house.houseAddress }</span></p>
						<div>
							<button onclick="goWishList()">관심상품</button>
							<button type="button" data-toggle="modal" data-target="#bookingModal" id="goBooking">예약하기</button>
						</div>
						<c:if test="${sessionScope.m.memberGrade == 2}">
						<div>
							<a class="btn btn-default" href="/roomManage.do?houseNo=${house.houseNo}">객실 관리</a>
						</div>
						</c:if>
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
        <form action="/orderRoom.do" onsubmit="return checkOrder();" method="post">
        	<fieldset>
				<input type="hidden" name="houseNo" value="${house.houseNo }">
				<select name="roomNo"></select>
        		<div class="row">
	        		<div class="col-md-4">
						<input type="text" name="bookStartDate" id="bookStart" placeholder="숙박 시작일" required disabled>
					</div>
        			<div class="col-md-2"></div>
        			<div class="col-md-4">
						<input type="text" name="bookEndDate" id="bookEnd" placeholder="숙박 퇴실일" required disabled>
					</div>
        		</div>
	        	<div class="row">
		        	<c:if test="${house.houseBarbecue eq 1}">
						<input type="hidden" name="houseBarbecuePrice" value="${house.houseBarbecuePrice }">
    		    		<input type="checkbox" name="optionDetail" id="houseBarbecue" value="바베큐 ${house.houseBarbecuePrice }원">
        				<label for="houseBarbecue">바베큐 ${house.houseBarbecuePrice }원</label>
        			</c:if>
        			<c:if test="${house.houseParty eq 1}">
						<input type="hidden" name="housePartyPrice" value="${house.housePartyPrice }">
        				<input type="checkbox" name="optionDetail" id="houseParty" value="파티 ${house.housePartyPrice }원">
		        		<label for="houseParty">파티 ${house.housePartyPrice }원</label>
    		    	</c:if>
        		</div>
				<input type="hidden" name="roomBookPrice">
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
								${house.houseDescription}</div>
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
	// 부트스트랩 tooltip
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();   
	});


	$(function(){
		$(".clickToLarger").click(function () {
			$(".clickToLarger").removeClass("onViewing");
			$(this).addClass("onViewing");
			$(".bigThumbnailImage").attr("src",$(this).attr("src"));
		});

	})


	// (숙박업소 & 인원 수) 조건에 맞는 객실들을 받는 ajax
		const roomTitleVal = $("[name=roomTitle]").val();
		const roomCapaVal = $("[name=roomCapa]").val();
		$.ajax({
				url : "/availableRooms.do",
				data: {roomTitle : roomTitleVal, roomCapa : roomCapaVal},
				dataType : "json",
				success : function(List){
					$("[name=roomNo]").empty();
					$("[name=roomNo]").append($("<option>").text("객실을 먼저 선택해주세요"));
					for(let i=0; i<List.length; i++){
						const option = $("<option>");
						option.val(List[i].roomNo);
						option.text(List[i].roomName);
						$("[name=roomNo]").append(option);
	    			}
				}
		});


	// 예약하기 modal 띄우면 실행되는 함수 시작
		$("#goBooking").on("click", function(){
			$("[name=roomNo]").on("change", function(){
			// 이미 결제완료된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax 
				$.ajax({
					url : "/bookOneRoom.do",
					data: {roomNo : $(this).val()},
					dataType : "json",
					success : function(List){
						let invalidDateRanges = [];
						for(let i=0; i<List.length; i++){
							invalidDateRanges[i] = { 'start': moment(List[i].bookStartDate), 'end': moment(List[i].bookEndDate) };
	    				}

					// 선택된 객실 바뀔 때마다 날짜 관련 데이터들 모두 초기화
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookEnd").val("");
						$("#bookEnd").attr("value", null);

						$("#bookStart").prop("disabled", false);
						$("#bookEnd").prop("disabled", false);

						// 객실예약의 시작일을 선택하는 date range picker 생성
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

						// 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
							$("#bookStart").on("change", function(){
								const bookStartDate = $("#bookStart").val();	// 시작일+1을 minDate로 사용할 예정
							// maxDate는 시작일+3개월로 초기화 
								var maxLimit = moment(bookStartDate).add(3, 'months').format("YYYY-MM-DD");
							// bookStartDate로부터 가장 가까운 미래의 invalidDateRanges로 maxDate를 좁혀줌
								for(let i=invalidDateRanges.length-1; i>=0; i--){
									if(bookStartDate < invalidDateRanges[i].start.format("YYYY-MM-DD")){
										maxLimit = invalidDateRanges[i].start.format("YYYY-MM-DD");
									}
								}

								$('#bookEnd').daterangepicker({
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
									minDate: moment($("#bookStart").val()).add(1, 'days'),
									maxDate: maxLimit
								});
								$("#bookEnd").val("");
								$("#bookEnd").attr("value", null);	// value 없는 상태로 생성시킴
							});

						},
				// 드롭다운 input이 특정 객실일이 아니라, "객실을 먼저 선택해주세요"에 focus 되었을 때 처리를  ajax error에서 처리함 
					error : function(){
						console.log("객실을 먼저 선택해주세요에 focus됨");
						$(".daterangepicker").remove();
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookStart").prop("disabled", true);
						$("#bookEnd").val("");
						$("#bookEnd").attr("value", null);
						$("#bookEnd").prop("disabled", true);
					}
				});
			});
		});
	// 예약하기 modal 띄우면 실행되는 함수 끝


	// input에 값이 없으면 form 제출을 막는 함수
	function checkOrder(){
		if ( $("[name=bookStartDate]").val() == "" || $("[name=bookEndDate]").val() == "" ) {
			alert('시작일과 퇴실일을 선택해주십시오.');
			return false;
		}
		fullPrice();
		return true;
	}


	// roomBookPrice를 계산하는 함수
	const onedayPrice = $("[name=housePrice]").val();
	function fullPrice(){
		let result = 0;
		let days = moment($("#bookEnd").val()).diff(moment($("#bookStart").val()), 'days');
		for(let i=0; i<days; i++){
			let adjustment = 1;
			if(moment($("#bookStart").val()).add(i, 'days').format('M')>=6 && moment($("#bookStart").val()).add(i, 'days').format('M')<=8){
				console.log("6~8월은 성수기 할증으로 요금이 1.2배가 됩니다.");
				adjustment *= 1.2;
			}
			if(moment($("#bookStart").val()).add(i, 'days').isoWeekday() == 5 || moment($("#bookStart").val()).add(i, 'days').isoWeekday() == 6){
				console.log("주말은 할증으로 요금이 1.5배가 됩니다.");
				adjustment *= 1.5;
			}
			result += onedayPrice * adjustment;
			console.log((i+1)+"일째까지 누계 "+result+"원");
		}
		if($("#houseBarbecue").prop("checked")){
			result += Number($("[name=houseBarbecuePrice]").val());
		}
		if($("#houseParty").prop("checked")){
			result += Number($("[name=housePartyPrice]").val());
		}
		console.log("옵션을 포함한 총 요금은 "+result+"원으로 계산되었습니다.");
		$("[name=roomBookPrice]").val(result);
	}


	// 나의 관심상품
	function goWishList(){
		const houseNo = $("[name=houseNo]").val();
		const houseStatus = $("[name=houseStatus]").val();
			if(houseStatus==1){
				$.ajax({
					url : "/insertWishList.do",
					data: {house_no : houseNo, lesson_no : 0},
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