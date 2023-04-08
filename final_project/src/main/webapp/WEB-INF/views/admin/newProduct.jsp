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
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="newProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<form action="/adminSearchProduct.do" method="get"
					class="search-bar" name="search-product">
					<span class="material-symbols-outlined search-icon">search</span> 
					<input
						type="search" placeholder="상품명 또는 판매자로 검색" name="searchProduct">
				</form>
				<div class="table-content">
					<div class="product-choice">
						<div>강습</div>
						<div>숙박</div>
					</div>
					<div class="list-wrapper">
						<div class="newProduct-top list-top">
							<div class="count">
								강습 전체 상품 <span>${newLessonCount }</span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="lessonCheck"
										class="lesson-all-check chk"></th>
									<th>상품명</th>
									<th>판매자</th>
									<th>강습 레벨</th>
									<th>모집정원</th>
									<th>지역</th>
									<th></th>
									<th></th>
									<th>신청서</th>
									<th></th>
								</tr>
								<c:forEach items="${lessonList }" var="l">
									<tr>
										<td><input type="checkbox" name="lessonCheck"
											class="lesson-check chk check" value="${l.lessonNo }"></td>
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
										<td><a href="#">신청서 확인</a></td>
										<td><button class="approveProduct btn bc1">승인</button>
										<input type="hidden" value="${l.lessonNo }" name="productNo">
										<button class="returnProduct btn bc1">반려</button></td>
									</tr>
								</c:forEach>
							</table>
							<div></div>
						</div>
						<div class="list-bottom">
							<div>
								<button class="checkedApproveProduct btn bc1">선택 상품 승인</button>
								<button class="checkedReturnProduct btn bc1">선택 상품 반려</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="house-list" style="display: none;">
				<form action="/adminSearchProduct.do" method="get"
					class="search-bar" name="search-product">
					<span class="material-symbols-outlined search-icon">search</span> <input
						type="search" placeholder="상품명 또는 판매자로 검색" name="searchProduct">
				</form>
				<div class="table-content">
					<div class="product-choice">
						<div>강습</div>
						<div>숙박</div>
					</div>
					<div class="list-wrapper">
						<div class="newProduct-top list-top">
							<div class="count">
								숙박 전체 상품 <span>${newHouseCount }</span>
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
									<th></th>
									<th>신청서</th>
									<th></th>
								</tr>
								<c:forEach items="${houseList }" var="h">
									<tr>
										<td><input type="checkbox" name="houseCheck"
											class="house-check chk check" value="${h.houseNo }"></td>
										<td><a href="#">${h.houseTitle }</a></td>
										<td>${h.writer }</td>
										<td>${h.roomTitle }</td>
										<td>${h.houseCity }</td>
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
										<td><a href="#">신청서 확인</a></td>
										<td>
											<button class="approveProduct btn bc1">승인</button>
											<input type="hidden" value="${h.houseNo }" name="productNo">
											<button class="returnProduct btn bc1">반려</button>
										</td>
									</tr>
								</c:forEach>
							</table>
							<div></div>
						</div>
						<div class="list-bottom">
							<div>
								<button class="checkedApproveProduct btn bc1">선택 상품 승인</button>
								<button class="checkedReturnProduct btn bc1">선택 상품 반려</button>
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
		$(".top-menu-title").text("신규 상품 승인");
		$(".product-choice>div").first().click();
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

	/*승인*/
	//1개
	$(".approveProduct").on("click", function() {
		//상품 종류
		const productType = $(this).parents(".list-top").children("[type=hidden]").val();
		
		//클릭한 버튼 기준으로 해당 상품 번호
		const productNo = $(this).next().val();

		location.href = "/approveProduct.do?productType="+productType+"&productNo="+productNo;
	});

	//체크박스 선택상품
	$(".checkedApproveProduct").on("click", function() {
		//상품 종류
		const productType = $(this).parent().parent().parent().children(".list-top").children("[type=hidden]").val();
		
		console.log(productType);
		
		const check = $(".check:checked");

		if (check.length == 0) {
			alert("선택된 회원이 없습니다.");
			return;
		}

		//체크된 상품 번호 저장 배열
		const no = new Array();

		//체크된 체크박스 기준으로 해당 상품 번호를 찾아서 배열에 넣는 작업
		check.each(function(index, item) {
			//클릭한 버튼 기준으로 해당 상품 번호
			const productNo = $(item).val();
			console.log(productNo);
			no.push(productNo);
		});

		location.href = "/checkedApproveProduct.do?productType="+productType+"&no=" + no.join("/");
	});
	
	/*반려*/
	//1개
	$(".returnProduct").on("click", function() {
		//상품 종류
		const productType = $(this).parents(".list-top").children("[type=hidden]").val();
		
		console.log(productType);
		
		//클릭한 버튼 기준으로 해당 상품 번호
		const productNo = $(this).prev().val();

		location.href = "/returnProduct.do?productType="+productType+"&productNo="+productNo;
	});

	//체크박스 선택상품
	$(".checkedReturnProduct").on("click", function() {
		//상품 종류
		const productType = $(this).parent().parent().parent().children(".list-top").children("[type=hidden]").val();
		
		const check = $(".check:checked");

		if (check.length == 0) {
			alert("선택된 회원이 없습니다.");
			return;
		}

		//체크된 상품 번호 저장 배열
		const no = new Array();

		//체크된 체크박스 기준으로 해당 상품 번호를 찾아서 배열에 넣는 작업
		check.each(function(index, item) {
			//클릭한 버튼 기준으로 해당 상품 번호
			const productNo = $(item).val();
		});

		location.href = "/checkedReturnProduct.do?productType="+productType+"&no=" + no.join("/");
	});
	
</script>
</html>