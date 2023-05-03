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
<title>숙박 상품 찾아보기 - Lonely Surfers</title>
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
					<form action="/selectHousesByCondition.do" onsubmit="return nullToDisabled();" method="post">
						<fieldset id="shownForm">
							<input type="hidden" name="reqPage" value="1">
							<input type="hidden" name="sortingOrder" value="0">
							<div class="row">
								<div class="col-md-4">
									지역 <select name="houseCity" class="form-control" style="width: 80%;">
										<option>- 광역시/도 -</option>
								<c:choose>
									<c:when test="${condition.houseCity == '강원' }">
										<option value="강원" selected>강원도</option>
									</c:when>
									<c:otherwise>
										<option value="강원">강원도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '경기' }">
										<option value="경기" selected>경기도</option>
									</c:when>
									<c:otherwise>
										<option value="경기">경기도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '경북' }">
										<option value="경북" selected>경상북도</option>
									</c:when>
									<c:otherwise>
										<option value="경북">경상북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '경남' }">
										<option value="경남" selected>경상남도</option>
									</c:when>
									<c:otherwise>
										<option value="경남">경상남도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '광주' }">
										<option value="광주" selected>광주광역시</option>
									</c:when>
									<c:otherwise>
										<option value="광주">광주광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '대구' }">
										<option value="대구" selected>대구광역시</option>
									</c:when>
									<c:otherwise>
										<option value="대구">대구광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '대전' }">
										<option value="대전" selected>대전광역시</option>
									</c:when>
									<c:otherwise>
										<option value="대전">대전광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '부산' }">
										<option value="부산" selected>부산광역시</option>
									</c:when>
									<c:otherwise>
										<option value="부산">부산광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '서울' }">
										<option value="서울" selected>서울특별시</option>
									</c:when>
									<c:otherwise>
										<option value="서울">서울특별시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '세종' }">
										<option value="세종" selected>세종특별자치시</option>
									</c:when>
									<c:otherwise>
										<option value="세종">세종특별자치시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '울산' }">
										<option value="울산" selected>울산광역시</option>
									</c:when>
									<c:otherwise>
										<option value="울산">울산광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '인천' }">
										<option value="인천" selected>인천광역시</option>
									</c:when>
									<c:otherwise>
										<option value="인천">인천광역시</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '전북' }">
										<option value="전북" selected>전라북도</option>
									</c:when>
									<c:otherwise>
										<option value="전북">전라북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '전남' }">
										<option value="전남" selected>전라남도</option>
									</c:when>
									<c:otherwise>
										<option value="전남">전라남도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '제주' }">
										<option value="제주" selected>제주도</option>
									</c:when>
									<c:otherwise>
										<option value="제주">제주도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '충북' }">
										<option value="충북" selected>충청북도</option>
									</c:when>
									<c:otherwise>
										<option value="충북">충청북도</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${condition.houseCity == '충남' }">
										<option value="충남" selected>충청남도</option>
									</c:when>
									<c:otherwise>
										<option value="충남">충청남도</option>
									</c:otherwise>
								</c:choose>
									</select>
									<br>1박당 
								<c:choose>
									<c:when test="${condition.housePriceMin != 0 }">
										<input type="number" name="housePriceMin" class="form-control" style="width: 30%;" min="0" max="10000000" step="100" value="${condition.housePriceMin}">
									</c:when>
									<c:otherwise>
										<input type="number" name="housePriceMin" class="form-control" style="width: 30%;" min="0" max="10000000" step="100">
									</c:otherwise>
								</c:choose>
										 ~ 
								<c:choose>
									<c:when test="${condition.housePriceMax != 0 }">
										<input type="number" name="housePriceMax" class="form-control" style="width: 30%;" min="0" max="10000000" step="100" value="${condition.housePriceMax}">
									</c:when>
									<c:otherwise>
										<input type="number" name="housePriceMax" class="form-control" style="width: 30%;" min="0" max="10000000" step="100">
									</c:otherwise>
								</c:choose>
									원
										<br>숙박소 이름 <input type="text" name="roomTitle" class="form-control" style="width: 60%;" value="${condition.roomTitle}" maxlength="60" placeholder="숙박업소 이름">
								</div>
								<div class="col-md-4">
									인원 
								<c:choose>
									<c:when test="${condition.roomCapaMin != 0 }">
										<input type="number" name="roomCapaMin" class="form-control" style="width: 35%;" min="1" max="20" step="1" value="${condition.roomCapaMin}">
									</c:when>
									<c:otherwise>
										<input type="number" name="roomCapaMin" class="form-control" style="width: 35%;" min="1" max="20" step="1">
									</c:otherwise>
								</c:choose>
									 ~ 
								<c:choose>
									<c:when test="${condition.roomCapaMax != 0 }">
										<input type="number" name="roomCapaMax" class="form-control" style="width: 35%;" min="1" max="20" step="1" value="${condition.roomCapaMax}">
									</c:when>
									<c:otherwise>
										<input type="number" name="roomCapaMax" class="form-control" style="width: 35%;" min="1" max="20" step="1">
									</c:otherwise>
								</c:choose>
									명
									<br>평점
								<c:choose>
									<c:when test="${condition.houseScore != 0 }"> 
										<input type="number" name="houseScore" class="form-control" style="width: 60%;" min="0" max="5" step="0.1" value="${condition.houseScore}">
									</c:when>
									<c:otherwise>
										<input type="number" name="houseScore" class="form-control" style="width: 60%;" min="0" max="5" step="0.1">
									</c:otherwise>
								</c:choose>
									점 이상
								</div>
								<div class="col-md-4">
									<label>
								<c:choose>
									<c:when test="${condition.houseBarbecue == 1 }">
										<input type="checkbox" name="houseBarbecue" value="1" style="width: 25px; height: 25px; vertical-align: bottom;" checked>
									</c:when>
									<c:otherwise>
										<input type="checkbox" name="houseBarbecue" value="1" style="width: 25px; height: 25px; vertical-align: bottom;">
									</c:otherwise>
								</c:choose>
									 <span style="margin-bottom: 20px;"> 바베큐 가능</span></label>
									<label>
								<c:choose>
									<c:when test="${condition.houseParty == 1 }">
										<input type="checkbox" name="houseParty" value="1" style="width: 25px; height: 25px; vertical-align: bottom;" checked>
									</c:when>
									<c:otherwise>
										<input type="checkbox" name="houseParty" value="1" style="width: 25px; height: 25px; vertical-align: bottom;">
									</c:otherwise>
								</c:choose>
									 <span style="margin-bottom: 20px;"> 파티 가능</span></label>
								</div>
								<input type="text" name="houseTitle" class="form-control" style="width: 85%;" value="${condition.houseTitle}" maxlength="60" placeholder="상품 제목으로 검색">
							<button id="newCondition" class="btn btn-info" style="vertical-align: bottom;" type="submit">검색</button>
							</div>
						</fieldset>
					</form>
				<!-- pagination의 버턴에 조건 싣어주기용 숨겨진 form -->
					<form action="/selectHousesByCondition.do" onsubmit="return nullToDisabled2();" method="post">
						<fieldset id="hiddenForm" style="display: none;">
							<input type="number" name="reqPage" value="1">
							<input type="text" name="houseTitle" value="${condition.houseTitle}">
							<input type="text" name="houseCity" value="${condition.houseCity}">
							<input type="text" name="roomTitle" value="${condition.roomTitle}">
							<input type="number" name="roomCapaMin" value="${condition.roomCapaMin}">명
							<input type="number" name="roomCapaMax" value="${condition.roomCapaMax}">명
							<input type="number" name="housePriceMin" value="${condition.housePriceMin}">원
							<input type="number" name="housePriceMax" value="${condition.housePriceMax}">원
							<input type="number" name="houseScore" value="${condition.houseScore}">점 이상
							<input type="number" name="houseBarbecue" value="${condition.houseBarbecue}">
							<input type="number" name="houseParty" value="${condition.houseParty}">
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
					<a href="javascript:getHouses(1, 1)">높은가격순</a> | <a href="javascript:getHouses(1, 2)">낮은가격순</a> | <a href="javascript:getHouses(1, 3)">높은평점순</a>
				<hr class="invis2">
				<c:forEach items="${list}" var="h">
					<div class="col-md-4 eachProduct" onclick="location.href='/houseView.do?houseNo=${h.houseNo}'">
					<c:choose>
						<c:when test="${h.housePhoto1 == null }">
						<div style="height: 220px; margin-bottom: 15px;">
							<div class="waveEffect" style="margin: 0 auto;">
								<p class="waveEffectWord-back" style="text-indent: 13px; line-height: 550%;">사진이 없습니다</p>
								<p class="waveEffectWord-front" style="text-indent: 13px; line-height: 550%;">사진이 없습니다</p>
							</div>
						</div>
						</c:when>
						<c:otherwise>
							<div style="height: 220px; overflow: clip; margin-bottom: 15px;"><img style="width: 100%;" src="resources/upload/house/${h.housePhoto1}"></div>
						</c:otherwise>
					</c:choose>
						<div class="row">
							<div class="col-md-9">
								<h5>[${h.houseCity}] ${h.roomTitle}</h5>
							</div>
							<div class="col-md-3 optionIcons">
								<c:if test="${h.houseBarbecue == 1}">
									<img src="/resources/images/barbecue.png">
								</c:if>
								<c:if test="${h.houseParty == 1}">
									<img src="/resources/images/party.png">
								</c:if>
							</div>
						</div>
						<h4>${h.houseTitle}</h4>
						<div class="row">
							<div class="col-md-5">
							<c:choose>
								<c:when test="${h.houseScore > 0 }"> 
								<p style="font-size: 16px;">${h.houseScore}점</p>
								</c:when>
								<c:otherwise>
								<p style="font-size: 16px;">평점 없음</p>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="col-md-4">
								<p><fmt:formatNumber value="${h.housePrice}" pattern="#,###" />원/1박</p>
							</div>
							<div class="col-md-3">
								<p style="text-align: right; font-size: 16px;"><span class="label label-primary">${h.roomCapa}인실</span></p>
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
		if($("[name=roomCapaMin]").val()==""){
			$("[name=roomCapaMin]").attr("disabled", true);
		}
		if($("[name=roomCapaMax]").val()==""){
			$("[name=roomCapaMax]").attr("disabled", true);
		}
		if($("[name=housePriceMin]").val()==""){
			$("[name=housePriceMin]").attr("disabled", true);
		}
		if($("[name=housePriceMax]").val()==""){
			$("[name=housePriceMax]").attr("disabled", true);
		}
		if($("[name=houseScore]").val()==""){
			$("[name=houseScore]").attr("disabled", true);
		}
		return true;
	}


	// 눈에 보이지 않는 form의 제출이 동작할 때, type이 number인 input들의 값이 비었으면 disabled 처리
	function nullToDisabled2(){
		if($("#hiddenForm > [name=roomCapaMin]").val()==""){
			$("#hiddenForm > [name=roomCapaMin]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=roomCapaMax]").val()==""){
			$("#hiddenForm > [name=roomCapaMax]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=housePriceMin]").val()==""){
			$("#hiddenForm > [name=housePriceMin]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=housePriceMax]").val()==""){
			$("#hiddenForm > [name=housePriceMax]").attr("disabled", true);
		}
		if($("#hiddenForm > [name=houseScore]").val()==""){
			$("#hiddenForm > [name=houseScore]").attr("disabled", true);
		}
		return true;
	}


	// pagination의 li 태그인 버튼을 클릭했을 때 동작하는 함수
	function getHouses(reqPage, sortingOrder){
		$("[name=reqPage]").val(reqPage);
		$("[name=sortingOrder]").val(sortingOrder);
		$("#previousCondition").click();
	}
	</script>
</body>
</html>