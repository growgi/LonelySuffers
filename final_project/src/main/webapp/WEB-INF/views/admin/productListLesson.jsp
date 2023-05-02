<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
	<!-- Modal -->
	<div id="changeStatusProduct-modal" class="modal-bg" style="z-index:1; display:none;">
		<div class="modal-wrap">
			<div class="modal-head">
			<h2>선택 상품 상태 변경</h2>
			<span class="material-icons close-icon modal-close">close</span>
			</div>
			<div class="modal-content">
				<div class="waveEffect" style="border:none;">
					<p class="waveEffectWord-back page-name">Lonely Surfers</p>
				</div>
				<p>선택한 상품(들)의 상태를 변경하시겠습니까?</p>
			</div>
			<div class="modal-foot">
			<button class="checkedUpdateProductStatus-btn2 btn-m bc4 btn-pill">확인</button>
			<button class="btn-m bc5 modal-close btn-pill">취소</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListAll.do?reqPage=1">전체</a>
						<a href="/productListLesson.do?reqPage=1" style="background-color:#ecb534; color:#fff">강습</a>
						<a href="/productListHouse.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
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
							<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div class="productList-top list-top">
							<div class="count">
								강습 전체 상품 <span>${lessonCount }</span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="memberCheck"
										class="lesson-all-check chk"></th>
									<th style="display:none"></th>
									<th>사진</th>
									<th style="width:300px;">강습명</th>
									<th>판매자</th>
									<th>강습 레벨</th>
									<th>모집정원</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
								</tr>
								<c:choose>
								<c:when test="${empty lessonList }">
								<tr>
									<td colspan="10">
									    <div class="noInfo-wrapper">
									        <div>
									            <span class="material-symbols-outlined noInfo-icon">info</span>
									            <div class="noInfo-text">조회된 정보가 없습니다.</div>
									        </div>
									    </div>
								    </td>
								</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${lessonList }" var="l">
								  <c:if test="${l.lessonStatus >= 0 }">
									<tr>
										<td><input type="checkbox" name="memberCheck"
											class="lesson-check product-check chk" value="${l.lessonNo }"></td>
										<td style="display:none;">강습</td>
										<td>
										<c:choose>
	                                		<c:when test="${l.lessonInfoPic eq null}">
	                                			<div class="material-symbols-outlined no-pic">quiz</div>
	                                		</c:when>
	                                		<c:otherwise>
			                                	<img src="resources/upload/lesson/${l.lessonInfoPic }">
                                			</c:otherwise>
                                		</c:choose>
										</td>
										<td><a href="/lessonView.do?lessonNo=${l.lessonNo }">${l.lessonTitle }</a></td>
										<td>${l.writer }</td>
										<td>${l.lessonLevel }</td>
										<td><span>${l.lessonMaxNo }</span>명</td>
										<td>${l.lessonCity }</td>
										<td>
										<c:choose>
										<c:when test="${l.lessonScore < 1 }">
									            <div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 1 && l.lessonScore < 2}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 2 && l.lessonScore < 3}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 3 && l.lessonScore < 4}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 4 && l.lessonScore < 5}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 5 }">
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
													<a href="/lessonUpdate.do?lessonNo=${l.lessonNo }" class="update-detail">상품 정보 수정</a>
													<div class="product-stop-selling-btn">상품 판매 중지</div>
													<div class="product-stop-selling" style="display:none;">상품 판매 중지</div>
													<input type="hidden" value="${l.lessonNo }">
												</div>
											</div></td>
									</tr>
								  </c:if>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</table>
							<div id="pageNavi">
								${pageNavi }
							</div>
						</div>
						<div class="list-bottom">
							<div>
								<input type="submit" value="선택 상품 상태 변경"
									class="checkedUpdateProductStatus-btn btn-m bc1" target="#changeStatusProduct-modal">
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
	/*검색 결과에 count 출력 삭제*/
	$(function(){
	    if($('.hidden-input').val()==1) {
	        $(".count").hide();
	    } else {
	        $(".count").show();
	    }
	});
</script>
</html>