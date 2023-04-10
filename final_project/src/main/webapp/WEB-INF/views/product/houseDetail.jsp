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
<title>${house.houseTitle} - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>

<link rel="stylesheet" type="text/css" href="css/daterangepicker.css">

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>숙박 상품</h2>
						<p class="lead">
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
						<div>대표 사진 영역</div>
						<div>다중 사진 선택 칸</div>
					</div>
					<!-- end col -->



					<div class="col-md-7">
						<div>
							<input type="hidden" name="roomTitle" value="${house.roomTitle }">
							<p>${house.roomTitle }</p>
							<div class="row">
								<h1>${house.houseTitle }</h1>
								<input type="hidden" name="housePrice" value="${house.housePrice }">
								<h3>${house.housePrice }원/1박</h3>
								<div class="col-md-9">
									<p>비성수기, 평일 기준</p>
								</div>
								<div class="col-md-3">
									<input type="hidden" name="roomCapa" value="${house.roomCapa }">
									<p style="text-align: left;">${house.roomCapa }인실</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									판매량 ()숫자
								</div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>주소지 <span>${house.houseAddress }</span></p>
						</div>
						<div>
							<button>관심상품</button>
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
				<input type="submit" value="주문">
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
					<div class="col-md-9">
						<div class="row">
							<ul class="nav navbar-nav navbar-left">
								<li>상품설명</li>
								<li>상품평</li>
								<li>상품문의</li>
							</ul>
						</div>
						<div class="row">상품 설명 div</div>
						<div class="row">상품 평 div</div>
						<div class="row">상품 문의 div</div>
					</div>
					<div class="col-md-3">
					광고 등 배너 영역 column
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->





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
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>



	<script type="text/javascript">
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

						$("#bookStart").attr("disabled", false);
						$("#bookEnd").attr("disabled", false);

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
						$("#bookStart").attr("disabled", true);
						$("#bookEnd").val("");
						$("#bookEnd").attr("value", null);
						$("#bookEnd").attr("disabled", true);
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

	</script>

</body>
</html>