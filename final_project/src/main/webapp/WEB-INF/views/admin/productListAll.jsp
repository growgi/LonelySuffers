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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
/*별점*/
.rating-color{
    color:#fbc634 !important;
}
.small-ratings i{
  color:#cecece;   
}
th:last-child, td-last-child{
	width: 50px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListAll.do">전체</a>
						<a href="/productListLesson.do" style="background-color:#ecb534; color:#fff">강습</a>
						<a href="/productListHouse.do">숙박</a>
					</div>
					<div class="list-wrapper">
						<form action="/adminSearchProduct.do" method="get"
						class="search-bar" name="search-product">
						<select name="productSearchType" class="search-type">
							<option value="n">상품명</option>
							<option value="s">판매자</option>
							<option value="lo">지역</option>
						</select>
						<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
						<input
							type="text" placeholder="검색어를 입력하세요" name="productSearchKeyword"
							onkeyup="enterkey();"> <input type="submit"
							style="display: none;">
							<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div class="productList-top list-top">
							<div class="count">
								전체 상품 <span>${productCount }</span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="memberCheck"
										class="lesson-all-check chk"></th>
									<th>상품명</th>
									<th>판매자</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
								</tr>
								<c:if test="${productList eq null }">
								<tr>
									<td>
									    <div class="noInfo-wrapper">
									        <div>
									            <span class="material-symbols-outlined noInfo-icon">info</span>
									            <div class="noInfo-text">조회된 정보가 없습니다.</div>
									        </div>
									    </div>
								    </td>
								</tr>
								</c:if>
								<c:forEach items="${productList }" var="p">
                                	<tr>
										<td><input type="checkbox" name="memberCheck"
											class="lesson-check chk" value="${p.lessonNo }"></td>
										<td><a href="#">${p.lessonTitle }</a></td>
										<td>${p.writer }</td>
										<td>Level ${p.lessonLevel }</td>
										<td>${p.lessonCity }</td>
										<td>
										<c:choose>
										<c:when test="${p.lessonScore == 0 }">
									            <div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.lessonScore == 1 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.lessonScore == 2 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.lessonScore == 3 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.lessonScore == 4 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.lessonScore == 5 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									            </div>
										</c:when>
										</c:choose>
										</td>
										<td><c:choose>
												<c:when test="${p.lessonStatus == 1}">
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${p.lessonStatus == 0}">
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
													<input type="hidden" value="${p.lessonNo }">
												</div>
											</div></td>
									</tr>
                                	<tr>
										<td><input type="checkbox" name="houseCheck"
											class="house-check chk" value="${p.houseNo }"></td>
										<td><a href="#">${p.houseTitle }</a></td>
										<td>${p.writer }</td>
										<td>${p.houseCity }</td>
										<td>
										<c:choose>
										<c:when test="${p.houseScore == 0 }">
									            <div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.houseScore == 1 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.houseScore == 2 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.houseScore == 3 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.houseScore == 4 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.houseScore == 5 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									            </div>
										</c:when>
										</c:choose>
										</td>
										<td><c:choose>
												<c:when test="${p.houseStatus == 1}">
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${p.houseStatus == 0}">
													<select class="status-change">
														<option value="1">판매중</option>
														<option value="0" selected>판매중지</option>
													</select>
												</c:when>
											</c:choose></td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none">
												<div>
													<a href="#">상품 정보 수정</a>
													<div class="product-stop-selling">상품 판매 중지</div>
													<input type="hidden" value="${p.houseNo }">
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
									class="checkedUpdateLessonStatus btn-m bc1">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
</body>
<script>


</script>
</html>