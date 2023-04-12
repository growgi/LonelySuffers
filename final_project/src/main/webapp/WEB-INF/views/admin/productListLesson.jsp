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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.list-top {
	border-bottom: 1px solid rgb(238, 238, 238);
}

/*별점*/
.height-100{
    height:100vh;
}

.card{
    width:380px;
    border:none;
    height:280px;
}

.ratings{
    margin-right:10px;
}

.ratings i{
    
    color:#cecece;
    font-size:32px;
}

.rating-color{
    color:#fbc634 !important;
}

.review-count{
    font-weight:400;
    margin-bottom:2px;
    font-size:24px !important;
}

.small-ratings i{
  color:#cecece;   
}

.review-stat{
    font-weight:300;
    font-size:18px;
    margin-bottom:2px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<form action="/adminSearchLesson.do" method="get"
					class="search-bar" name="search-product">
					<input type="hidden" name="jspPage" value="pl">
					<select name="lessonSearchType" class="search-type">
						<option value="n">강습명</option>
						<option value="s">판매자</option>
						<option value="le">강습레벨</option>
						<option value="lo">지역</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="lessonSearchKeyword"
						onkeyup="enterkey();"> <input type="submit"
						style="display: none;">
					<div class="search-icon">검색</div>
				</form>
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListLesson.do">강습</a>
						<a href="/productListHouse.do">숙박</a>
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
										<td>${l.lessonScore}

										</td>
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
		</div>
	</div>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
</body>
<script>


</script>
</html>