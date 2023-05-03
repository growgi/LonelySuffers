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
<title>강습 상품 찾아보기 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/product.css">
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section">
			<div class="container">
				<div class="row" style="background-color: #f1f6f7; padding: 40px; border-radius: 15px;">
					<form action="/selectLessonsByCondition.do" onsubmit="return nullToDisabled();" method="post">
						<fieldset id="shownForm">
							<input type="hidden" name="reqPage" value="1">
							<input type="hidden" name="sortingOrder" value="0">
							<div class="row">
								<div class="col-md-4">
									지역 <select name="lessonCity" class="form-control" style="width: 80%;">
										<option>- 광역시/도 -</option>
								<c:choose>
									<c:when test="${condition.lessonCity == '강원' }">
										<option value="강원" selected>강원도</option>
									</c:when>
									<c:otherwise>
										<option value="강원">강원도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '경기' }">
										<option value="경기" selected>경기도</option>
									</c:when>
									<c:otherwise>
										<option value="경기">경기도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '경북' }">
										<option value="경북" selected>경상북도</option>
									</c:when>
									<c:otherwise>
										<option value="경북">경상북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '경남' }">
										<option value="경남" selected>경상남도</option>
									</c:when>
									<c:otherwise>
										<option value="경남">경상남도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '광주' }">
										<option value="광주" selected>광주광역시</option>
									</c:when>
									<c:otherwise>
										<option value="광주">광주광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '대구' }">
										<option value="대구" selected>대구광역시</option>
									</c:when>
									<c:otherwise>
										<option value="대구">대구광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '대전' }">
										<option value="대전" selected>대전광역시</option>
									</c:when>
									<c:otherwise>
										<option value="대전">대전광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '부산' }">
										<option value="부산" selected>부산광역시</option>
									</c:when>
									<c:otherwise>
										<option value="부산">부산광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '서울' }">
										<option value="서울" selected>서울특별시</option>
									</c:when>
									<c:otherwise>
										<option value="서울">서울특별시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '세종' }">
										<option value="세종" selected>세종특별자치시</option>
									</c:when>
									<c:otherwise>
										<option value="세종">세종특별자치시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '울산' }">
										<option value="울산" selected>울산광역시</option>
									</c:when>
									<c:otherwise>
										<option value="울산">울산광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '인천' }">
										<option value="인천" selected>인천광역시</option>
									</c:when>
									<c:otherwise>
										<option value="인천">인천광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '전북' }">
										<option value="전북" selected>전라북도</option>
									</c:when>
									<c:otherwise>
										<option value="전북">전라북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '전남' }">
										<option value="전남" selected>전라남도</option>
									</c:when>
									<c:otherwise>
										<option value="전남">전라남도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '제주' }">
										<option value="제주" selected>제주도</option>
									</c:when>
									<c:otherwise>
										<option value="제주">제주도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '충북' }">
										<option value="충북" selected>충청북도</option>
									</c:when>
									<c:otherwise>
										<option value="충북">충청북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonCity == '충남' }">
										<option value="충남" selected>충청남도</option>
									</c:when>
									<c:otherwise>
										<option value="충남">충청남도</option>
									</c:otherwise>
								</c:choose>
									</select>
									<br>1일당 
								<c:choose>
									<c:when test="${condition.lessonPriceMin != 0 }">
										<input type="number" name="lessonPriceMin" class="form-control" style="width: 30%;" min="0" max="10000000" step="100" value="${condition.lessonPriceMin}">
									</c:when>
									<c:otherwise>
										<input type="number" name="lessonPriceMin" class="form-control" style="width: 30%;" min="0" max="10000000" step="100">
									</c:otherwise>
								</c:choose>
										 ~ 
								<c:choose>
									<c:when test="${condition.lessonPriceMax != 0 }">
										<input type="number" name="lessonPriceMax" class="form-control" style="width: 30%;" min="0" max="10000000" step="100" value="${condition.lessonPriceMax}">
									</c:when>
									<c:otherwise>
										<input type="number" name="lessonPriceMax" class="form-control" style="width: 30%;" min="0" max="10000000" step="100">
									</c:otherwise>
								</c:choose>
									원
								</div>
								<div class="col-md-4">
									평점
								<c:choose>
									<c:when test="${condition.lessonScore != 0 }"> 
										<input type="number" name="lessonScore" class="form-control" style="width: 60%;" min="0" max="5" step="0.1" value="${condition.lessonScore}">
									</c:when>
									<c:otherwise>
										<input type="number" name="lessonScore" class="form-control" style="width: 60%;" min="0" max="5" step="0.1">
									</c:otherwise>
								</c:choose>
									점 이상
								</div>
								<div class="col-md-4">
									레벨 <select name="lessonLevel" class="form-control" style="width: 80%;">
										<option value="0">- 강습 레벨 -</option>
								<c:choose>
									<c:when test="${condition.lessonLevel == '1' }">
										<option value="1" selected>초급</option>
									</c:when>
									<c:otherwise>
										<option value="1">초급</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonLevel == '2' }">
										<option value="2" selected>중급</option>
									</c:when>
									<c:otherwise>
										<option value="2">중급</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.lessonLevel == '3' }">
										<option value="3" selected>상급</option>
									</c:when>
									<c:otherwise>
										<option value="3">상급</option>
									</c:otherwise>
								</c:choose>
									</select>
								</div>
								<input type="text" name="lessonTitle" class="form-control" style="width: 85%;" value="${condition.lessonTitle}" maxlength="60" placeholder="상품 제목으로 검색">
							<button id="newCondition" class="btn btn-info" style="vertical-align: bottom;" type="submit">검색</button>
							</div>
						</fieldset>
					</form>
				<!-- pagination의 버턴에 조건 싣어주기용 숨겨진 form -->
					<form action="/selectLessonsByCondition.do" onsubmit="return nullToDisabled2();" method="post">
						<fieldset id="hiddenForm" style="display: none;">
							<input type="number" name="reqPage" value="1">
							<input type="text" name="lessonTitle" value="${condition.lessonTitle}">
							<input type="text" name="lessonCity" value="${condition.lessonCity}">
							<input type="number" name="lessonPriceMin" value="${condition.lessonPriceMin}">원
							<input type="number" name="lessonPriceMax" value="${condition.lessonPriceMax}">원
							<input type="number" name="lessonScore" value="${condition.lessonScore}">점 이상
							<input type="number" name="lessonLevel" value="${condition.lessonLevel}">
							<input type="number" name="sortingOrder" value="${condition.sortingOrder}">
							<button id="previousCondition" type="submit">hidden submit button</button>
						</fieldset>
					</form>
				</div><!-- end row -->
			</div><!-- end container -->
			
			<hr class="invis2">
			
			<div class="container">
				<div class="row">
				<h4>조건을 만족하는 상품들이 총 ${totalCount}개 있습니다.</h4>
					<a href="javascript:getLessons(1, 1)">높은가격순</a> | <a href="javascript:getLessons(1, 2)">낮은가격순</a> | <a href="javascript:getLessons(1, 3)">높은평점순</a>
				<hr class="invis2">
				<c:forEach items="${list}" var="l">
					<div class="col-md-4 eachProduct" onclick="location.href='/lessonView.do?lessonNo=${l.lessonNo}'">
					<c:choose>
						<c:when test="${l.lessonInfoPic == null }">
						<div style="height: 220px; margin-bottom: 15px;">
							<div class="waveEffect" style="margin: 0 auto;">
								<p class="waveEffectWord-back" style="text-indent: 13px; line-height: 550%;">사진이 없습니다</p>
								<p class="waveEffectWord-front" style="text-indent: 13px; line-height: 550%;">사진이 없습니다</p>
							</div>
						</div>
						</c:when>
						<c:otherwise>
							<div style="height: 220px; overflow: clip; margin-bottom: 15px;"><img style="width: 100%;" src="resources/upload/lesson/${l.lessonInfoPic}"></div>
						</c:otherwise>
					</c:choose>
						<div class="row">
							<div class="col-md-9">
								<h5>[${l.lessonCity}] ${l.lessonTeacher} 강사</h5>
							</div>
						</div>
						<h4>${l.lessonTitle}</h4>
						<div class="row">
							<div class="col-md-5">
							<c:choose>
								<c:when test="${l.lessonScore > 0 }"> 
								<p style="font-size: 16px;">${l.lessonScore}점</p>
								</c:when>
								<c:otherwise>
								<p style="font-size: 16px;">평점 없음</p>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="col-md-4">
								<p><fmt:formatNumber value="${l.lessonPrice}" pattern="#,###" />원/1일</p>
							</div>
							<div class="col-md-3">
								<p style="text-align: right; font-size: 16px;"><span class="label label-primary">
								<c:choose>
									<c:when test="${l.lessonLevel == 1}">초급</c:when>
									<c:when test="${l.lessonLevel == 2}">중급</c:when>
									<c:when test="${l.lessonLevel == 3}">상급</c:when>
								</c:choose>
								</span></p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="row">
					${pageNavi}
				</div>
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



	<script type="text/javascript">
	// 눈에 보이는 form의 제출 버튼을 눌렀을 때, type이 number인 input들의 값이 비었으면 disabled 처리
	function nullToDisabled(){
		if($("[name=lessonPriceMin]").val()==""){
			$("[name=lessonPriceMin]").attr("disabled", true);
		}
		if($("[name=lessonPriceMax]").val()==""){
			$("[name=lessonPriceMax]").attr("disabled", true);
		}
		if($("[name=lessonScore]").val()==""){
			$("[name=lessonScore]").attr("disabled", true);
		}
		return true;
	}


	// 눈에 보이지 않는 form의 제출이 동작할 때, type이 number인 input들의 값이 비었으면 disabled 처리
	function nullToDisabled2(){
		if($("#hiddenForm > [name=lessonPriceMin]").val()==""){
			$("#hiddenForm > [name=lessonPriceMin]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=lessonPriceMax]").val()==""){
			$("#hiddenForm > [name=lessonPriceMax]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=lessonScore]").val()==""){
			$("#hiddenForm > [name=lessonScore]").attr("disabled", true);
		}
		return true;
	}


	// pagination의 li 태그인 버튼을 클릭했을 때 동작하는 함수
	function getLessons(reqPage, sortingOrder){
		$("[name=reqPage]").val(reqPage);
		$("[name=sortingOrder]").val(sortingOrder);
		$("#previousCondition").click();
	}
	</script>
</body>
</html>