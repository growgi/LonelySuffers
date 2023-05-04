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
</body>
</html>
