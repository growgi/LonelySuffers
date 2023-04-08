<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/adminTable.css"></link>
<style>
.list-top {
	border-bottom: 1px solid rgb(238, 238, 238);
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<form action="/adminSearchLesson.do" method="get"
					class="search-bar" name="search-product">
					<select name="searchType" class="search-type">
						<option value="n">강습명</option>
						<option value="s">판매자</option>
						<option value="le">강습레벨</option>
						<option value="lo">지역</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="searchLesson"
						onkeyup="enterkey();"> <input type="submit"
						style="display: none;">
					<div class="search-icon">검색</div>
				</form>
				<div class="table-content">
					<div class="product-choice">
						<div>강습</div>
						<div>숙박</div>
					</div>
					<div class="list-wrapper">
						<div class="productList-top list-top">
							<div class="count">
								강습 전체 상품 <span>${lessonCount }</span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="memberCheck"
										class="lesson-all-check chk"></th>
									<th>강습명</th>
									<th>판매자</th>
									<th>강습 레벨</th>
									<th>모집정원</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
									<th></th>
								</tr>
								<c:forEach items="${lessonList }" var="l">
									<tr>
										<td><input type="checkbox" name="memberCheck"
											class="lesson-check chk" value="${l.lessonNo }"></td>
										<td><a href="#">${l.lessonTitle }</a></td>
										<td>${l.writer }</td>
										<td>${l.lessonNameLevel }</td>
										<td><span>${l.lessonMaxNo }</span>명</td>
										<td>${l.lessonCity }</td>
										<td></td>
										<td><c:choose>
												<c:when test="${l.lessonStatus == 1}">
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${l.lessonStatus == 0}">
													<select class="status-change">
														<option value="1">판매중</option>
														<option value="0" selected>판매중지</option>
													</select>
												</c:when>
											</c:choose></td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none" onblur="">
												<div>
													<a href="#" class="update-detail">상품 정보 수정</a>
													<div class="product-stop-selling">상품 판매 중지</div>
													<input type="hidden" value="${l.lessonNo }">
												</div>
											</div></td>
									</tr>
								</c:forEach>
							</table>
							<div></div>
						</div>
						<div class="list-bottom">
							<div>
								<input type="submit" value="선택 상품 상태 변경"
									class="checkedUpdateLessonStatus btn bc1">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="house-list">
				<form action="/adminSearchHouse.do" method="get"
					class="search-bar" name="search-product">
					<select name="searchType" class="search-type">
						<option value="n">상품명</option>
						<option value="s">판매자</option>
						<option value="le">숙박소 이름</option>
						<option value="lo">지역</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="searchLesson"
						onkeyup="enterkey();"> <input type="submit"
						style="display: none;">
					<div class="search-icon">검색</div>
				</form>
				<div class="table-content">
					<div class="product-choice">
						<div>강습</div>
						<div>숙박</div>
					</div>
					<div class="list-wrapper">
						<div class="productList-top list-top">
							<div class="count">
								숙박 전체 상품 <span>${houseCount }</span>
							</div>
							<input type="hidden" value="2" class="house-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="houseCheck"
										class="house-all-check chk"></th>
									<th>상품명</th>
									<th>판매자</th>
									<th>숙박소 이름</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
									<th></th>
								</tr>
								<c:forEach items="${houseList }" var="h">
									<tr>
										<td><input type="checkbox" name="houseCheck"
											class="house-check chk" value="${h.houseNo }"></td>
										<td><a href="#">${h.houseTitle }</a></td>
										<td>${h.writer }</td>
										<td>${h.roomTitle }</td>
										<td>${h.houseCity }</td>
										<td></td>
										<td><c:choose>
												<c:when test="${h.houseStatus == 1}">
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${h.houseStatus == 0}">
													<select class="status-change">
														<option value="1">판매중</option>
														<option value="0" selected>판매중지</option>
													</select>
												</c:when>
											</c:choose></td>
										<td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none">
												<div>
													<a href="#">상품 정보 수정</a>
													<div class="product-stop-selling">상품 판매 중지</div>
													<input type="hidden" value="${h.houseNo }">
												</div>
											</div></td>
									</tr>
								</c:forEach>
							</table>
							<div></div>
						</div>
						<div class="list-bottom">
							<div>
								<button class="checkedUpdateHouseStatus btn bc1">선택 상품 상태 변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/admin.js"></script>
</body>
<script>
	/*메뉴 제목*/
	$(document).ready(function() {
		$(".top-menu-title").text("등록된 상품 관리");
		$(".product-choice>div").first().click();
	});

	$(".more-detail").on("click", function() {
		$(this).next().fadeToggle();

		//다른 화면 클릭하면 list-detail-box 사라짐 -> 구현하기
	});

	/*강습 체크박스 전체 선택*/
	$(".lesson-all-check").on("click", function() {
		if ($(".lesson-all-check").is(":checked")) {
			$(".lesson-check").prop("checked", true)
		} else {
			$(".lesson-check").prop("checked", false)
		}
	});

	/*숙박 체크박스 전체 선택*/
	$(".house-all-check").on("click", function() {
		if ($(".house-all-check").is(":checked")) {
			$(".house-check").prop("checked", true)
		} else {
			$(".house-check").prop("checked", false)
		}
	});

	/*강습 상품 상태 변경*/
	//체크박스 선택상품
	$(".checkedUpdateLessonStatus").on(
			"click",
			function() {
				const check = $(".lesson-check:checked");

				if (check.length == 0) {
					alert("선택된 상품이 없습니다.");
					return;
				}

				//체크된 상품 번호 저장 배열
				const no = new Array();

				//체크된 상품 상태 저장 배열
				const status = new Array();

				//체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
				check.each(function(index, item) {
					const lNo = $(item).val();
					no.push(lNo);

					const lStatus = $(item).parent().parent().find('select')
							.val();
					status.push(lStatus);

				});

				location.href = "/checkedUpdateLessonStatus.do?no="
						+ no.join("/") + "&status=" + status.join("/");
			});

	/*숙박 상품 상태 변경*/
	//체크박스 선택상품
	$(".checkedUpdateHouseStatus").on(
			"click",
			function() {
				const check = $(".house-check:checked");

				if (check.length == 0) {
					alert("선택된 상품이 없습니다.");
					return;
				}

				//체크된 상품 번호 저장 배열
				const no = new Array();

				//체크된 상품 상태 저장 배열
				const status = new Array();

				//체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
				check.each(function(index, item) {
					const hNo = $(item).val();
					no.push(hNo);

					const hStatus = $(item).parent().parent().find('select')
							.val();
					status.push(hStatus);

				});

				location.href = "/checkedUpdateHouseStatus.do?no="
						+ no.join("/") + "&status=" + status.join("/");
			});

	/*상품 판매 중지*/
	$(".product-stop-selling").on(
			"click",
			function() {
				const productType = $(this).parents(".list-top").children(
						"[type=hidden]").val();
				const no = $(this).next().val();

				location.href = "/productStopSelling.do?no=" + no
						+ "&productType=" + productType;
			});

	$(".")
</script>
</html>