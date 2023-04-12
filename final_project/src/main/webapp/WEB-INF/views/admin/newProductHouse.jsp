<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="newProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="house-list">
				<form action="/adminSearchHouse.do" method="get"
					id="frm" class="search-bar" name="search-product">
					<select name="houseSearchType" class="search-type">
						<option value="n">상품명</option>
						<option value="s">판매자</option>
						<option value="rt">숙박소 이름</option>
						<option value="lo">지역</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="houseSearchKeyword"
						onkeyup="enterkey();"> 
					<input type="submit" value="검색" class="search-icon">
				</form>
				<div class="table-content">
					<div class="product-choice">
						<a href="/newProductLesson.do">강습</a>
						<a href="/newProductHouse.do">숙박</a>
					</div>
					<div class="list-wrapper">
						<div id="houseResult"></div>
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
								<c:if test="${h.houseStatus == -1 }">
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
								</c:if>
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
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminNewProduct.js"></script>
</body>
<script>

</script>
</html>