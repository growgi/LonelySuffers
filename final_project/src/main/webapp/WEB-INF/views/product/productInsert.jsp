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
<title>상품 등록 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<style>
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
						<h2>상품 등록</h2>
						<p class="lead"></p>
					</div>
				</div>
			</div>
		</section>


		<section class="section">
			<div class="container">
				<div class="row">
					<div class="card mt-2 tab-card">
						<div class="row tab-card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item active">
									<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">강습</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">숙박</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade p-2 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
								<form action="/insertLesson.do" onsubmit="return calcEndTime();" method="post">
									<fieldset>
										<table id="lessonInsertForm">
											<tr>
												<th>지역</th>
												<td>
													<select name="lessonCity">
														<option selected disabled>- 광역시/도 -</option>
														<option value="강원도">강원도</option>
														<option value="경기도">경기도</option>
														<option value="경상북도">경상북도</option>
														<option value="경상남도">경상남도</option>
														<option value="광주">광주</option>
														<option value="대구">대구</option>
														<option value="대전">대전</option>
														<option value="부산">부산</option>
														<option value="서울">서울</option>
														<option value="세종">세종</option>
														<option value="울산">울산</option>
														<option value="인천">인천</option>
														<option value="전라북도">전라북도</option>
														<option value="전라남도">전라남도</option>
														<option value="제주도">제주도</option>
														<option value="충청북도">충청북도</option>
														<option value="충청남도">충청남도</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>강습 레벨</th>
												<td><input type="text" name="lessonNameLevel" placeholder="예 초급반, 중급자 등 (한글 최대 20자)" required></td>
											</tr>
											<tr>
												<th>상품 제목</th>
												<td><input type="text" name="lessonTitle" placeholder="한글 최대 20자" required></td>
											</tr>
											<tr>
												<th>강사명</th>
												<td><input type="text" name="lessonTeacher" required></td>
											</tr>
											<tr>
												<th>강습시작 시각</th>
												<td><input type="time" name="lessonStartTime" min="06:00" max="17:00" step="300" pattern="[0-9]{2}:[0-9]{2}" required></td>
											</tr>
											<tr>
												<th>강습 시간</th>
												<td><input type="number" name="lessonTimeLength" min="30" max="300" step="5" required>분
												<input type="hidden" name="lessonEndTime"></td>
											</tr>
											<tr>
												<th>상품 가격</th>
												<td><input type="number" name="lessonPrice" min="0" max="10000000" step="100" required>원</td>
											</tr>
											<tr>
												<th>강습 정원</th>
												<td><input type="number" name="lessonMaxNo" min="1" max="100" required>명</td>
											</tr>
											<tr>
												<th>상품 사진</th>
												<td><input type="file" name="lessonInfoPic" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
											</tr>
											<tr>
												<th>상품 설명</th>
												<td><textarea name="lessonInfo" placeholder="한글 최대 1000자" required></textarea></td>
											</tr>
											<tr>
												<td colspan="2"><button type="submit">강습 상품 등록 요청</button></td>
											</tr>
										</table>
									</fieldset>
								</form>
							</div>
							<div class="tab-pane fade p-2" id="two" role="tabpanel" aria-labelledby="two-tab">
								<form action="/insertHouse.do" method="post">
									<fieldset>
										<table id="houseInsertForm">
											<tr>
												<th>주소</th>
												<td><button>주소 입력 api로 작성</button></td>
											</tr>
											<tr>
												<th>숙박소 이름</th>
												<td><input type="text" name="roomTitle" required></td>
											</tr>
											<tr>
												<th>객실 정원</th>
												<td><input type="number" name="roomCapa" min="1" max="20" step="1" required>명</td>
											</tr>
											<tr>
												<th>상품 제목</th>
												<td><input type="text" name="houseTitle" placeholder="한글 최대 20자" required></td>
											</tr>
											<tr>
												<th>상품 가격</th>
												<td><input type="number" name="housePrice" min="0" max="10000000" step="100" required>원</td>
											</tr>
											<tr>
												<th>바베큐</th>
												<td><input type="checkbox" name="houseBarbecue" value="1" style="width: 25px; height: 25px; margin-left: 20px;"></td>
											</tr>
											<tr>
												<th>바베큐 가격</th>
												<td><input type="number" name="houseBarbecuePrice" min="0" max="10000000" step="100" required disabled>원</td>
											</tr>
											<tr>
												<th>파티</th>
												<td><input type="checkbox" name="houseParty" value="1" style="width: 25px; height: 25px; margin-left: 20px;"></td>
											</tr>
											<tr>
												<th>파티 가격</th>
												<td><input type="number" name="housePartyPrice" min="0" max="10000000" step="100" required disabled>원</td>
											</tr>
											<tr>
												<th>상품 대표사진</th>
												<td><input type="file" name="housePhoto1" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
											</tr>
											<tr>
												<th>상품 사진2</th>
												<td><input type="file" name="housePhoto2" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
											</tr>
											<tr>
												<th>상품 사진3</th>
												<td><input type="file" name="housePhoto3" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
											</tr>
											<tr>
												<th>상품 사진4</th>
												<td><input type="file" name="housePhoto4" accept=".jpg,.jpeg,.gif,.png,.webp"></td>
											</tr>
											<tr>
												<th>상품 설명</th>
												<td><textarea name="houseDescription" placeholder="한글 최대 1000자"></textarea></td>
											</tr>
											<tr>
												<td colspan="2"><button type="submit">숙박 상품 등록 요청</button></td>
											</tr>
										</table>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
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

	<script type="text/javascript">
// 바베큐 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseBarbecue]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=houseBarbecuePrice]").attr("disabled", false);
		}else{
			$("[name=houseBarbecuePrice]").attr("disabled", true);
		}
	});

// 파티 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseParty]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=housePartyPrice]").attr("disabled", false);
		}else{
			$("[name=housePartyPrice]").attr("disabled", true);
		}
	});



// 강습 종료 시각을 구해내는 함수
	function calcEndTime(){
		const startTime = $("[name=lessonStartTime]").val();
		const period = $("[name=lessonTimeLength]").val();
		$("[name=lessonEndTime]").val(moment(startTime, 'HH:mm').add(period, 'minutes').format('HH:mm'));
		return true;
	}


	</script>
</body>
</html>