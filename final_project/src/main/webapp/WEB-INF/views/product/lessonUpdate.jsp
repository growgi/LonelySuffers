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
<title>강습 상품 수정 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/product.css">
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<style>
input[type="number"], input[type="time"] {
	text-align: right;
}
.nav-item:hover {
	cursor: not-allowed;
}
.nav-link:hover {
	cursor: not-allowed;
}
</style>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<form action="/updateLesson.do" onsubmit="return triming();" method="post" enctype="multipart/form-data"><fieldset>
		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>강습 상품 수정</h2>
						<p class="lead">일부 내용만 수정하실 수 있습니다.<br>수정하실 수 없는 부분들은, 새 상품으로 재등록을 하셔야 합니다.</p>
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
						<div class="row" style="height: 450px; overflow: clip">
							<div>
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<div class="waveEffect" style="margin: 0 auto;">
										<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
										<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
									</div>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/lesson/${lesson.lessonInfoPic }" style="width: 100%;"></div>
						</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lesson.lessonStatus <= 0 }">
								<input type="file" class="form-control" name="lessonPhoto" accept=".jpg,.jpeg,.gif,.png,.webp">
							</c:when>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6 product-detail">
						<input type="hidden" name="lessonNo" value="${lesson.lessonNo }">
							<input type="hidden" name="lessonStatus" value="${lesson.lessonStatus }">
						<c:if test="${lesson.lessonStatus == -2 }">
							<input type="hidden" name="rejectComment" value="${lesson.rejectComment }">
						</c:if>
						<div class="row">
							<div class="col-md-7"><input type="text" name="lessonTeacher" value="${lesson.lessonTeacher }" maxlength="20" placeholder="한글 최대 6자" required> 강사</div>
							<div class="col-md-5" style="text-align: right;">정원: <input type="number" name="lessonMaxNo" value="${lesson.lessonMaxNo }" min="1" max="100" placeholder="1~100" required>명</div>
						</div>
							<hr>
							<div class="row">
							<c:choose>
								<c:when test="${lesson.lessonStatus < 0 }">
									<h1 style="padding-bottom: 40px;"><input style="font-size: 36px;" type="text" class="form-control input-lg" name="lessonTitle" value="${lesson.lessonTitle }" maxlength="60" placeholder="한글 최대 20자" required></h1>
								</c:when>
								<c:otherwise>
									<h1 style="padding-bottom: 40px;">${lesson.lessonTitle }</h1>
								</c:otherwise>
							</c:choose>
								<h3><input type="number" name="lessonPrice" min="0" max="10000000" step="100" value="${lesson.lessonPrice }" placeholder="최고 100만" required>원</h3>
								<div class="col-md-4">
								</div>
								<div class="col-md-8">
									<p style="text-align: left; font-size: 22px; font-weight: bold">
									<c:choose>
										<c:when test="${lesson.lessonStatus < 0 }">
											<select name="lessonLevel" class="form-control input-lg">
											<c:choose>
												<c:when test="${lesson.lessonLevel == 1}">
													<option value="1" selected>초급</option>
													<option value="2">중급</option>
													<option value="3">상급</option>
												</c:when>
												<c:when test="${lesson.lessonLevel == 2}">
													<option value="1">초급</option>
													<option value="2" selected>중급</option>
													<option value="3">상급</option>
												</c:when>
												<c:when test="${lesson.lessonLevel == 3}">
													<option value="1">초급</option>
													<option value="2">중급</option>
													<option value="3" selected>상급</option>
												</c:when>
											</c:choose>
											</select>
										</c:when>
										<c:otherwise>
											<span class="label label-primary">
											<c:choose>
												<c:when test="${lesson.lessonLevel == 1}">초급</c:when>
												<c:when test="${lesson.lessonLevel == 2}">중급</c:when>
												<c:when test="${lesson.lessonLevel == 3}">상급</c:when>
											</c:choose>
											</span>&nbsp;
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${lesson.lessonStatus <= 0 }">
											<input type="time" name="lessonStartTime" min="06:00" max="17:00" step="300" pattern="[0-9]{2}:[0-9]{2}" value="${lesson.getLessonStartTime5() }" required>
											~
											<input type="time" name="lessonEndTime" pattern="[0-9]{2}:[0-9]{2}" value="${lesson.getLessonEndTime5() }" readonly>  
										</c:when>
										<c:otherwise>
											<span class="label label-info">${lesson.lessonStartTime } ~ ${lesson.lessonEndTime }</span>
										</c:otherwise>
									</c:choose>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">지역 :</div>
								<div class="col-md-10">
								<c:choose>
									<c:when test="${lesson.lessonStatus < 0 }">
										<span id="lookupLessonCity" style="display: none;">${lesson.lessonCity }</span>
										<select name="lessonCity" class="form-control">
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
									</c:when>
									<c:otherwise>
										${lesson.lessonCity }
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						<div>
							<button type="submit" class="btn btn-danger" style="font-size: 18px; padding: 12px 40px;">상품 정보 수정</button>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





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
									<a class="nav-link">상품평</a>
								</li>
								<li class="nav-item">
									<a class="nav-link">상품문의</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade p-3 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
						<c:choose>
							<c:when test="${lesson.lessonStatus <= 0 }">
								<textarea id="summernote" name="lessonInfo" maxlength="3000">${lesson.lessonInfo}</textarea>
							</c:when>
							<c:otherwise>
								${lesson.getLessonInfoBr()}
							</c:otherwise>
						</c:choose>
							</div>
						</div>
					</div>
				</div><!-- end row -->
				<hr class="invis2">
				<button type="submit" class="btn btn-danger" style="font-size: 18px; padding: 12px 40px;">상품 정보 수정</button>
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->



	</fieldset></form>
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
	// 첨부된 이미지 업로드 전 미리보기
		$("[type=file]").on("change",function(){
			const attached = $(this);
			const reader = new FileReader();
			reader.onload = function(){
				attached.prev().children().eq(0).css("display", "none");
				attached.prev().children().eq(1).remove();
				attached.prev().append($("<img>").attr("src", reader.result).attr("width", "100%").attr("onclick", "getRidOf(this)"));
			}
			reader.readAsDataURL(attached[0].files[0]);
		});



	// 미리보기 이미지를 클릭하면, input의 value를 비움
		function getRidOf(obj){
			$(obj).prev().css("display", "block");
			$(obj).parent().next().val("");
			$(obj).remove();
		}



	// name이 lessonCity인 select 태그의 option에 selected 속성을 자동으로 부여
		$(document).ready(function(){
			const lessonCityVal = $("#lookupLessonCity").text();
			for(let i=0; i<$("[name=lessonCity]").children().length; i++){
				if(lessonCityVal== $("[name=lessonCity]").children().eq(i).val()){
					$("[name=lessonCity]").children().eq(i).attr("selected", true);
					break;
				}
			}
		});



	// status가 -2이면 alert로 rejectComment 노출
		$(document).ready(function(){
			if ( $("[name=rejectComment]").length > 0 ){
				alert("관리자의 반려사유:\n"+$("[name=rejectComment]").val());
			}
		});



	// 강습 소요시간 계산
		const lessonTimeLength = moment($("[name=lessonEndTime]").val(), "HH:mm").diff(moment($("[name=lessonStartTime]").val(), "HH:mm"), "minutes");
	// 시작 시각이 변경될 때마다 종료 시각 자동 입력 
		$("[name=lessonStartTime]").on("change", function(){
			const newEndTime = moment($("[name=lessonStartTime]").val(), "HH:mm").add(lessonTimeLength, "minutes").format("HH:mm");
			$("[name=lessonEndTime]").attr("value", newEndTime);
		});


	
	// summernote 불러오기
		$('#summernote').summernote({
			  width: 880,
			  height: 800,
			  minHeight: null,
			  maxHeight: null,
			  focus: false,
			  lang: "ko-KR",
				callbacks: {
					onImageUpload: function(files){
						uploadDescriptionImage(files[0], this);
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
		function uploadDescriptionImage(file, editor){
			
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



	// submit 시 동작되는 함수. 제목들을 trim 후 form action
		function triming(){
			if($("[name=lessonInfo]").val().length>0){
				if($(".note-editable").html().length < 12){
					alert("상품 설명을 작성하셔야 합니다.");
					return false;
				}
			}
			
			const trimedTeacher = $("[name=lessonTeacher]").val().trim().replace(/\s+/g," ");
			$("[name=lessonTeacher]").val(trimedTeacher);
			if($("[name=lessonTitle]").length>0){
				const trimedLessonTitle = $("[name=lessonTitle]").val().trim().replace(/\s+/g," ");
				$("[name=lessonTitle]").val(trimedLessonTitle);
			}
			return true;
		}
	</script>

</body>
</html>