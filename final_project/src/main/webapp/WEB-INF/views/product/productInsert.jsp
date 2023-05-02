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
<title>상품 등록 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<style>
.nav-item {
	background-color: #3ac5c8;
	text-align: center;
}
.nav-link { color: #ffffff; }
table {
	margin-top: 20px;
}
th, td {
	height: 40px;
}
th {
	text-indent: 80px;
}
input[type="number"], input[type="time"] {
	text-align: right;
}
</style>
<!-- 다음지도, 네이버지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34&submodules=geocoder" ></script>
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>상품 등록</h2>
						<p class="lead"></p>
					</div>
				</div>
			</div>
		</section>


		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="card mt-2 tab-card">
							<div class="row tab-card-header">
								<ul class="nav nav-tabs card-header-tabs">
									<li class="nav-item active" style="width: 460px;">
										<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">강습상품 등록</a>
									</li>
									<li class="nav-item" style="width: 460px;">
										<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">숙박상품 등록</a>
									</li>
								</ul>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade p-2 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
									<form action="/insertLesson.do" onsubmit="return checkLessonCity();" method="post" enctype="multipart/form-data">
										<fieldset>
											<table class="table-striped" id="lessonInsertForm">
												<tr>
													<th width=50%;>지역</th>
													<td width=50%;>
														<select name="lessonCity" class="form-control">
															<option selected disabled>- 광역시/도 -</option>
															<option value="강원">강원도</option>
															<option value="경기">경기도</option>
															<option value="경북">경상북도</option>
															<option value="경남">경상남도</option>
															<option value="광주">광주광역시</option>
															<option value="대구">대구광역시</option>
															<option value="대전">대전광역시</option>
															<option value="부산">부산광역시</option>
															<option value="서울">서울특별시</option>
															<option value="세종">세종특별자치시</option>
															<option value="울산">울산광역시</option>
															<option value="인천">인천광역시</option>
															<option value="전북">전라북도</option>
															<option value="전남">전라남도</option>
															<option value="제주">제주도</option>
															<option value="충북">충청북도</option>
															<option value="충남">충청남도</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>강습 수준</th>
													<td>
														<select name="lessonLevel" class="form-control">
															<option value="1">초급</option>
															<option value="2">중급</option>
															<option value="3">상급</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>상품 제목</th>
													<td><input type="text" class="form-control" name="lessonTitle" maxlength="60" placeholder="한글 최대 20자" required></td>
												</tr>
												<tr>
													<th>강사명</th>
													<td><input type="text" class="form-control" name="lessonTeacher" maxlength="20" placeholder="한글 최대 6자" required></td>
												</tr>
												<tr>
													<th>강습 소요시간 (분)</th>
													<td><input type="number" class="form-control" id="lessonTimeLength" name="lessonTimeLength" placeholder="최소 30분 ~ 최대 300분" min="30" max="300" step="5" required></td>
												</tr>
												<tr>
													<th>강습시작 시각<br><span class="help-block" style="font-size: 12px;">최소 오전 6시, 최대 오후 5시</span><span class="help-block" style="font-size: 12px;">다음 시작시각은 이전 강습의 종료시각+10분부터 가능</span></th>
													<td id="here"><div><input type="time" class="form-control" name="lessonStartTimes" min="06:00" max="17:00" step="300" pattern="[0-9]{2}:[0-9]{2}" required>
													<input type="hidden" name="lessonEndTimes"><button type="button" onclick="insertNextLesson(this)">추가</button></div></td>
												</tr>
												<tr>
													<th>상품 가격 (원)</th>
													<td><input type="number" class="form-control" name="lessonPrice" min="0" max="10000000" step="100" placeholder="최대 10000000원" required></td>
												</tr>
												<tr>
													<th>강습 정원 (명)</th>
													<td><input type="number" class="form-control" name="lessonMaxNo" min="1" max="100" placeholder="최대 100명" required></td>
												</tr>
												<tr>
													<th>상품 사진<br><span class="help-block" style="font-size: 12px;">미리보기 사진을 누르면 첨부가 취소됩니다.</span></th>
													<td><div style="width: 100%;"></div><input type="file" name="lessonPhoto" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
												</tr>
												<tr>
													<th colspan="2">상품 설명</th>
												</tr>
												<tr>
													<td colspan="2"><textarea id="summernoteL" name="lessonInfo" maxlength="3000"></textarea></td>
												</tr>
												<tr>
													<td colspan="2" style="text-align: center;"><button type="submit" class="btn btn-default">강습상품 등록 요청</button></td>
												</tr>
											</table>
										</fieldset>
									</form>
								</div>
								<div class="tab-pane fade p-2" id="two" role="tabpanel" aria-labelledby="two-tab">
									<form action="/insertHouse.do" onsubmit="return triming();" method="post" enctype="multipart/form-data">
										<fieldset>
											<table class="table-striped" id="houseInsertForm">
												<tr>
													<th width=50%;>주소</th>
													<td style="width=50%; overflow:hidden;">
													<input type="text" class="input-form form-control" maxlength="60" name="houseAddress"id="address" style="width : 340px; float : left;"readonly>
													<button type="button" onclick="searchAddr();" style="float : left; margin-left : 8px;">주소 찾기</button>
													<input type="hidden" name="houseLat" value="">
													<input type="hidden" name="houseLng" value="">
													</td>
												</tr>
												<tr>
													<th>숙박소 이름</th>
													<td><input type="text" class="form-control" name="roomTitle" maxlength="60" placeholder="한글 최대 20자" required></td>
												</tr>
												<tr>
													<th>객실 정원 (명)</th>
													<td><input type="number" class="form-control" name="roomCapa" min="1" max="20" step="1" placeholder="최대 20명" required></td>
												</tr>
												<tr>
													<th>상품 제목</th>
													<td><input type="text" class="form-control" name="houseTitle" maxlength="60" placeholder="한글 최대 20자" required></td>
												</tr>
												<tr>
													<th>상품 가격 (원)</th>
													<td><input type="number" class="form-control" name="housePrice" min="0" max="10000000" step="100" placeholder="최대 10000000원" required></td>
												</tr>
												<tr>
													<th><label><input type="checkbox" name="houseBarbecue" value="1" style="width: 25px; height: 25px; margin-left: -75px; vertical-align: bottom;"> 바베큐</label></th>
													<td><input type="number" class="form-control" name="houseBarbecuePrice" min="0" max="10000000" step="100" placeholder="최대 10000000원" required disabled></td>
												</tr>
												<tr>
													<th><label><input type="checkbox" name="houseParty" value="1" style="width: 25px; height: 25px; margin-left: -75px; vertical-align: bottom;"> 파티</label></th>
													<td><input type="number" class="form-control" name="housePartyPrice" min="0" max="10000000" step="100" placeholder="최대 10000000원" required disabled></td>
												</tr>
												<tr>
													<th>상품 사진<br><span class="help-block" style="font-size: 12px;">미리보기 사진을 누르면 첨부가 취소됨.</span></th>
													<td><div style="width: 100%;"></div><input type="file" name="housePhoto" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
												</tr>
												<tr>
													<th>상품 사진2</th>
													<td><div style="width: 100%;"></div><input type="file" name="housePhoto" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
												</tr>
												<tr>
													<th>상품 사진3</th>
													<td><div style="width: 100%;"></div><input type="file" name="housePhoto" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
												</tr>
												<tr>
													<th>상품 사진4</th>
													<td><div style="width: 100%;"></div><input type="file" name="housePhoto" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
												</tr>
												<tr>
													<th colspan="2">상품 설명</th>
												</tr>
												<tr>
													<td colspan="2"><textarea id="summernoteH" name="houseDescription" maxlength="3000"></textarea></td>
												</tr>
												<tr>
													<td colspan="2" style="text-align: center;"><button type="submit" class="btn btn-default">숙박상품 등록 요청</button></td>
												</tr>
											</table>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div><!-- end col -->
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
	<script src="resources/js/moment.min.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

	<script type="text/javascript">
// 강습시간대 추가 함수
	function insertNextLesson(obj){	
		const period = Number($("[name=lessonTimeLength]").val());
		if(period < 30){
			alert("먼저 강습 소요시간을 정해야 합니다.");
		}else{
			const prevStart = $(obj).prev().prev().val();	// 이전 시간대의 시작시각 값
			const min = $(obj).prev().prev().attr("min");	// 이전 시간대 input의 min
		// 시작 시각 input의 value가 min ~ max 범위 안이면 수행
			if(moment(prevStart, "HH:mm").diff(moment(min, "HH:mm"), 'minutes')>=0 && moment("17:00", "HH:mm").diff(moment(prevStart, "HH:mm"), 'minutes')>=0){
			// 소요시간을 고정시켜야 하므로 readonly 처리
				$("#lessonTimeLength").prop("readonly", true);
			// 이전 시간대의 종료시각을 계산해서 hidden input의 value로 부여
				$(obj).prev().val(moment(prevStart, 'HH:mm').add(period, 'minutes').format('HH:mm'));

			// 추가된 시간대 input의 min = 이전 시간대 종료시각 + 10분  
				const nextMin = moment(prevStart, 'HH:mm').add(period + 10, 'minutes').format('HH:mm');

				const removeButton = $("<button>");
				removeButton.attr("type", "button");
				removeButton.attr("onclick", "removePrevLesson(this)");
				removeButton.text("제거");

				const addButton = $("<button>");
				addButton.attr("type", "button");
				addButton.attr("onclick", "insertNextLesson(this)");
				addButton.text("추가");

				const startInput = $("<input>");
				startInput.attr("type", "time");
				startInput.attr("class", "form-control");
				startInput.attr("name", "lessonStartTimes");
				startInput.attr("min", nextMin);
				startInput.attr("max", "17:00");
				startInput.attr("step", "300");
				startInput.attr("pattern", "[0-9]{2}:[0-9]{2}");
				startInput.attr("required", true);

				const endInput = $("<input>");
				endInput.attr("name", "lessonEndTimes");
				endInput.attr("type", "hidden");

				const wrapper = $("<div>");

			// 시간대 2개 이상을 더 추가할 여유가 남았으면, 추가 버튼과 제거 버튼을 달아줌
				if(moment("17:00", "HH:mm").diff(moment($(obj).prev().val(), "HH:mm"), 'minutes')>=period+10){
					wrapper.append(startInput).append(endInput).append(addButton).append(removeButton);
					$(obj).prev().prev().prop("readonly", true);
					$(obj).next().remove();
					$(obj).remove();
					$("#here").append(wrapper);
				}else{
				// 시간대 1개만 더 추가할 여유가 남았으면, 제거 버튼만 달아줌. 추가 버튼 자리에는 아무 동작도 없는 버튼을 숨겨서 삽입.
					if(moment("17:00", "HH:mm").diff(moment($(obj).prev().val(), "HH:mm"), 'minutes')>=10){
						wrapper.append(startInput).append(endInput).append($("<button>").attr("type", "button").css("display", "none")).append(removeButton);
						$(obj).prev().prev().prop("readonly", true);
						$(obj).next().remove();
						$(obj).remove();
						$("#here").append(wrapper);
				// 시간대를 더 이상 추가할 여유가 없는 경우
					}else{
						alert("시간대를 추가할 여유가 더 이상 남아있지 않습니다. 다음 시작시각이 오후 5시를 넘을 수 없습니다.");
					}
				}
		// 시작 시각 input의 value가 min ~ max 범위 밖일 때
			}else{
				alert("시작 시각을 올바르게 입력한 뒤, 추가 버튼을 눌러주십시오.");
			}
		}
	}


// 시간대 제거 버튼을 누르면 동작하는 함수
	function removePrevLesson(obj){
		const removeButton = $("<button>");
		removeButton.attr("type", "button");
		removeButton.attr("onclick", "removePrevLesson(this)");
		removeButton.text("제거");

		const addButton = $("<button>");
		addButton.attr("type", "button");
		addButton.attr("onclick", "insertNextLesson(this)");
		addButton.text("추가");

	// 이전 시간대의 readonly 속성을 지워줌
		$(obj).parent().prev().children().eq(0).prop("readonly", false);
	// min이 "06:00"이면, 가장 이른 시간대로 간주하고 제거 버튼을 달지 않음. 또한 소요시간의 readonly 속성을 지워줌
		if($(obj).parent().prev().children().eq(0).attr("min")=="06:00"){
			$(obj).parent().prev().append(addButton);
			$("#lessonTimeLength").prop("readonly", false);
	// 가장 이른 시간대가 아니면, 추가 버튼과 제거 버튼을 둘 다 달아줌
		}else{
			$(obj).parent().prev().append(addButton).append(removeButton);
		}
	// 원하는 시간대 제거
		$(obj).parent().remove();
	}



// 신규 강습 등록 submit 시 동작되는 함수
	function checkLessonCity(){
		const trimedTitle = $("[name=lessonTitle]").val().trim().replace(/\s+/g," ");
		$("[name=lessonTitle]").val(trimedTitle);
		const trimedTeacher = $("[name=lessonTeacher]").val().trim().replace(/\s+/g," ");
		$("[name=lessonTeacher]").val(trimedTeacher);
	// 강습 지역 input(name=lessonCity)이 선택되지 않았으면 form 제출을 막음
		if( $("[name=lessonCity]").val() == null ){
			alert('지역을 선택해주십시오.');
			return false;
		}else{
	// 마지막 종료시각을 계산해서 value로 부여하고 submit
			const period = Number($("[name=lessonTimeLength]").val());
			const lastStartTime = $("[name=lessonStartTimes]").last().val();
			const lastEndTime = $("[name=lessonEndTimes]").last();
			lastEndTime.val(moment(lastStartTime, 'HH:mm').add(period, 'minutes').format('HH:mm'));
			return true;
		}
	}



// 신규 숙박 등록 submit 시 동작되는 함수. 제목들을 trim 후 form action
	function triming(){
		const trimedRoomTitle = $("[name=roomTitle]").val().trim().replace(/\s+/g," ");
		$("[name=roomTitle]").val(trimedRoomTitle);
		const trimedHouseTitle = $("[name=houseTitle]").val().trim().replace(/\s+/g," ");
		$("[name=houseTitle]").val(trimedHouseTitle);
		return true;
	}



// 첨부된 이미지 업로드 전 미리보기
	$("[type=file]").on("change",function(){
		const attached = $(this);
		const reader = new FileReader();
		reader.onload = function(){
			attached.prev().empty();
			attached.prev().append($("<img>").attr("src", reader.result).attr("width", "90%").attr("onclick", "getRidOf(this)"));
		}
		reader.readAsDataURL(attached[0].files[0]);
	});



// 미리보기 이미지를 클릭하면, input의 value를 비움
	function getRidOf(obj){
		$(obj).parent().next().val("");
		$(obj).remove();
	}



// 바베큐 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseBarbecue]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=houseBarbecuePrice]").prop("disabled", false);
		}else{
			$("[name=houseBarbecuePrice]").prop("disabled", true);
		}
	});

// 파티 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseParty]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=housePartyPrice]").prop("disabled", false);
		}else{
			$("[name=housePartyPrice]").prop("disabled", true);
		}
	});


// summernote 불러오기
	$('#summernoteL').summernote({
		  width: 880,
		  height: 800,
		  minHeight: null,
		  maxHeight: null,
		  focus: false,
		  lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
					uploadLessonDescriptionImage(files[0], this);
				}
			},
		  placeholder: '한글 기준 최대 1000자',
		  toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			    ['height', ['height']],
			    ['view', ['help']]
			  ]
	});
	
	$('#summernoteH').summernote({
		  width: 880,
		  height: 800,
		  minHeight: null,
		  maxHeight: null,
		  focus: false,
		  lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
					uploadHouseDescriptionImage(files[0], this);
				}
			},
		  placeholder: '한글 기준 최대 1000자',
		  toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			    ['height', ['height']],
			    ['view', ['help']]
			  ]
	});
	
	
// summernote 편집기로 본문에 사진을 첨부시키는 함수
	function uploadLessonDescriptionImage(file, editor){
		
		const form = new FormData();
		form.append("file", file);
		$.ajax({
			url: "/attachLessonDescriptionImage.do",
			type: "post",
			data: form,
			dataType : "json",
			processData: false,	//파일 전송을 위해서 기본값인 String 형태 전송을 제거
			contentType: false,	//파일 전송을 위해서 enctype 속성의 기본값을 제거
			enctype : "multipart/form-data",
			success: function(data){
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
	
// summernote 편집기로 본문에 사진을 첨부시키는 함수
	function uploadHouseDescriptionImage(file, editor){
		
		const form = new FormData();
		form.append("file", file);
		$.ajax({
			url: "/attachHouseDescriptionImage.do",
			type: "post",
			data: form,
			dataType : "json",
			processData: false,	//파일 전송을 위해서 기본값인 String 형태 전송을 제거
			contentType: false,	//파일 전송을 위해서 enctype 속성의 기본값을 제거
			enctype : "multipart/form-data",
			success: function(data){
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
	
	
//다음지도로 주소 찾기
		function searchAddr(){
		   new daum.Postcode({
		       oncomplete: function(data) {
		    	   $("#address").val(data.address);
		           loadMap();
		       }
		   }).open();
		};

//네이버지도 위경도 추출
		function loadMap(){
			const addr = $("#address").val();
			naver.maps.Service.geocode({
				address : addr
			},function(status, response){
				if(status === naver.maps.Service.Status.ERROR){ //type까지 일치하는지 보려고 자바스크립트는 1=="1"하면 true가 나오기 때문에 type까지 보려면 1==="1"로 해야한다
					return alert("조회 에러");
				}
				const lng = response.result.items[1].point.x;//경도
				const lat = response.result.items[1].point.y;//위도
				$("[name=houseLng]").attr("value",lng);
				$("[name=houseLat]").attr("value",lat);
			});
		}
	</script>
</body>
</html>
