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
<title>숙박 상품 수정 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/product.css">
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<style>
.previewImg {
	width: 100%;
}
input[type="number"], input[type="time"] {
	text-align: right;
}
</style>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<form action="/updateHouse.do" method="post" enctype="multipart/form-data"><fieldset>
		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>숙박 상품 수정</h2>
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
						<c:when test="${house.houseStatus <= 0 }">
						<div class="row">
							<div class="col-md-6">
								<div style="width: 100%;">
								<c:choose>
									<c:when test="${house.housePhoto1 != null }">
									<img class="previewImg" src="resources/upload/house/${house.housePhoto1 }">
									</c:when>
									<c:otherwise>
									<p style="text-align: center;">사진1을<br>추가해<br>주십시오.</p>
									</c:otherwise>
								</c:choose>
								</div>
								<input type="file" name="newPhoto1" class="form-control" accept=".jpg,.jpeg,.gif,.png,.webp">
							</div>
							<div class="col-md-6">
								<div style="width: 100%;">
								<c:choose>
									<c:when test="${house.housePhoto2 != null }">
									<img class="previewImg" src="resources/upload/house/${house.housePhoto2 }">
									</c:when>
									<c:otherwise>
									<p style="text-align: center;">사진2를<br>추가할 수<br>있습니다.</p>
									</c:otherwise>
								</c:choose>
								</div>
								<input type="file" name="newPhoto2" class="form-control" accept=".jpg,.jpeg,.gif,.png,.webp">
							</div>
						</div>
						<hr class="invis2">
						<div class="row">
							<div class="col-md-6">
								<div style="width: 100%;">
								<c:choose>
									<c:when test="${house.housePhoto3 != null }">
									<img class="previewImg" src="resources/upload/house/${house.housePhoto3 }">
									</c:when>
									<c:otherwise>
									<p style="text-align: center;">사진3을<br>추가할 수<br>있습니다.</p>
									</c:otherwise>
								</c:choose>
								</div>
								<input type="file" name="newPhoto3" class="form-control" accept=".jpg,.jpeg,.gif,.png,.webp">
							</div>
							<div class="col-md-6">
								<div style="width: 100%;">
								<c:choose>
									<c:when test="${house.housePhoto4 != null }">
									<img class="previewImg" src="resources/upload/house/${house.housePhoto4 }">
									</c:when>
									<c:otherwise>
									<p style="text-align: center;">사진4를<br>추가할 수<br>있습니다.</p>
									</c:otherwise>
								</c:choose>
								</div>
								<input type="file" name="newPhoto4" class="form-control" accept=".jpg,.jpeg,.gif,.png,.webp">
							</div>
						</div>
						</c:when>
						<c:otherwise>
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
						<c:choose>
							<c:when test="${house.houseStatus < 0 }">
								<h1 style="padding-bottom: 40px;"><input style="font-size: 36px;" type="text" class="form-control input-lg" name="houseTitle" value="${house.houseTitle }" placeholder="한글 최대 20자" required></h1>
							</c:when>
							<c:otherwise>
								<h1 style="padding-bottom: 40px;">${house.houseTitle }</h1>
							</c:otherwise>
						</c:choose>
								<h3><input type="number" name="housePrice" min="0" max="10000000" step="100" value="${house.housePrice }" placeholder="최고 100만" required>원/1박</h3>
								<div class="col-md-9">
									<p style="text-indent: 10px;"><a href="#" data-toggle="tooltip" data-placement="right" title="주말(입실일 기준 금/토)에는 1.5배의 할증이 있습니다. 성수기(6월~8월)에는 1.2배의 할증이 추가로 붙습니다.">( ※ 비성수기 평일 기준 )</a></p>
								</div>
								<div class="col-md-3">
									<input type="hidden" name="roomCapa" value="${house.roomCapa }">
									<p style="text-align: left; font-size: 22px; font-weight: bold"><span class="label label-primary">${house.roomCapa }인실</span></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">주소지 :</div>
								<div class="col-md-10">
								<c:choose>
									<c:when test="${house.houseStatus < 0 }">
										<input type="text" class="form-control" name="houseAddress" value="${house.houseAddress }" required>
									</c:when>
									<c:otherwise>
										${house.houseAddress }
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
								<c:choose>
									<c:when test="${house.houseBarbecue == 1 }">
									<label><input type="checkbox" name="houseBarbecue" value="1" checked style="width: 25px; height: 25px; margin-left: -15px; vertical-align: bottom;"> 바베큐</label>
									<input type="number" name="houseBarbecuePrice" value="${house.houseBarbecuePrice }" min="0" max="10000000" step="100" placeholder="최고 100만" required>원
									</c:when>
									<c:otherwise>
									<label><input type="checkbox" name="houseBarbecue" value="1" style="width: 25px; height: 25px; margin-left: -15px; vertical-align: bottom;"> 바베큐</label>
									<input type="number" name="houseBarbecuePrice" value="${house.houseBarbecuePrice }" min="0" max="10000000" step="100" placeholder="최고 100만" required disabled>원
									</c:otherwise>
								</c:choose>
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
								<c:choose>
									<c:when test="${house.houseParty == 1 }">
									<label><input type="checkbox" name="houseParty" value="1" checked style="width: 25px; height: 25px; margin-left: -15px; vertical-align: bottom;"> 파티</label>
									<input type="number" name="housePartyPrice" value="${house.housePartyPrice }" min="0" max="10000000" step="100" placeholder="최고 100만" required>원
									</c:when>
									<c:otherwise>
									<label><input type="checkbox" name="houseParty" value="1" style="width: 25px; height: 25px; margin-left: -15px; vertical-align: bottom;"> 파티</label>
									<input type="number" name="housePartyPrice" value="${house.housePartyPrice }" min="0" max="10000000" step="100" placeholder="최고 100만" required disabled>원
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
							<c:when test="${house.houseStatus <= 0 }">
								<textarea class="form-control" rows="4" name="houseDescription" placeholder="한글 최대 1000자" required>${house.houseDescription}</textarea>
							</c:when>
							<c:otherwise>
								${house.getHouseDescriptionBr()}
							</c:otherwise>
						</c:choose>
							</div>
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
	</script>

</body>
</html>